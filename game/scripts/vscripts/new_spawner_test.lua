if not Spawner then
    require("libraries/data")
    _G.Spawner = class({})
    Spawner.BaseRespawnTime = 3
    Spawner.active_zones = {}
    Spawner.creep_pool = {}
    Spawner.zone_data = {}

    for zone_name,creep_params in pairs(_G.units_data) do
        Spawner.active_zones[zone_name] = 0--подсчитываем колличество героев в зоне
        Spawner.creep_pool[zone_name] = {}--пулл крипов для каждой зоны
        Spawner.zone_data[zone_name] = {}--параметры зоны, названия крипов, лимит крипов, и статы крипов
        Spawner.zone_data[zone_name].creesp_limit = 20 --можно будет потом для каждой зоны поменть, но пока так
        Spawner.zone_data[zone_name].all_creep_names = {}
        Spawner.zone_data[zone_name].creep_data = creep_params
        Spawner.zone_data[zone_name].RespawnTime = 3 --то что ты там говорил про уменьшение респавна
        for creep_name,_ in pairs(creep_params) do
            table.insert(Spawner.zone_data[zone_name].all_creep_names, creep_name)
        end
    end

    -- вроде он вообще не нужен, если в дропе будет все высчитваться
	-- ListenToGameEvent( "entity_killed", Dynamic_Wrap(Spawner, 'OnEntityKilled' ), Spawner)
end

--герой зашел в зону
function OnHeroInZone(data)
    if not thisEntity then return end
    if not data.activator then return end
    if not data.activator:IsHero() then return end
    if data.activator:GetUnitName() == "npc_dota_hero_wisp" then return end

	local hHero = data.activator
    local zone_name = thisEntity:GetName() --как-то переименовать или стрингсабить название чтобы отличить зону
    
    CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(hHero:GetPlayerOwnerID()), "ShowZoneEvent", {zone_name = zone_name})

    if Spawner.active_zones[zone_name] == 0 then
        Spawner.active_zones[zone_name] = 1
        if not thisEntity.spawn_think_active then
            thisEntity.spawn_think_active = true
            Spawner:StartSpawnZoneCreeps(thisEntity, zone_name)
        else
            local creep_pool = Spawner.creep_pool[zone_name]
            for _,unit in pairs(creep_pool) do
                if unit and not unit:IsNull() then
                    unit:RemoveModifierByName("modifier_hide_unit_and_remove")
                end
            end
        end

    else
        Spawner.active_zones[zone_name] = Spawner.active_zones[zone_name] + 1
    end

    --меняем время спавна в зависимости от героев внутри
    hHero.CurrentZoneName = zone_name--записываем в какой зоне находится герой, чтобы возродить его в ней
    hHero.LastRespawnChanged = hHero:GetRespawnMultiplier()
    Spawner.zone_data[zone_name].RespawnTime = Spawner.zone_data[zone_name].RespawnTime * hHero.LastRespawnChanged

    Timers:CreateTimer(FrameTime(),function()
        if not thisEntity:IsTouching(hHero) then
            OnOutOfZone(data)
            return
        end
        return FrameTime()
    end)
end

--герой вышел из зоны
function OnOutOfZone(data)
    local hHero = data.activator
    local zone_name = thisEntity:GetName()

    if Spawner.active_zones[zone_name] == 1 then
        Spawner.active_zones[zone_name] = 0
            
        Spawner:CountdownTillSoftRemove(zone_name)
    else
        Spawner.active_zones[zone_name] = Spawner.active_zones[zone_name] - 1
    end

    --меняем время спавна в зависимости от героев внутри
    hHero.CurrentZoneName = nil--записываем в какой зоне находится герой, чтобы возродить его в ней
    Spawner.zone_data[zone_name].RespawnTime = Spawner.zone_data[zone_name].RespawnTime / hHero.LastRespawnChanged
    hHero.LastRespawnChanged = nil
end

--запускаем на тригере синкер
function Spawner:StartSpawnZoneCreeps(trigger, zone_name)
    local creep_names = self.zone_data[zone_name].all_creep_names
    local creep_pool = self.creep_pool[zone_name]
    local creesp_limit = self.zone_data[zone_name].creesp_limit
    local respawn_time = self.zone_data[zone_name].RespawnTime
    --тут нужно будет получить границы тригера чтобы в нем спавнить крипов
    local bounds = trigger:GetBounds()
    local bounds_max = bounds.Mins + trigger:GetOrigin()
    local bounds_min = bounds.Maxs + trigger:GetOrigin()

    --для теста чтобы камерой не водить по всей зоне
    local bounds_max = trigger:GetOrigin() + Vector(200, 200, 0)
    local bounds_min = trigger:GetOrigin() + Vector(-200, -200, 0)

    trigger:SetContextThink(zone_name .. "_spawner_function", function()
        if self.active_zones[zone_name] == 0 then
            return 0.1
        end

        local random_position = GetRandomPositionSquare(bounds_min, bounds_max)

        if #creep_pool >= creesp_limit then
            for _,creep in pairs(creep_pool) do
                if creep and not creep:IsNull() and not creep:IsAlive() then
                    creep:RespawnUnit()
                    FindClearSpaceForUnit(creep, random_position, true)
                    break
                end
            end
        else
            local random_creep_name = creep_names[RandomInt(1, #creep_names)]
            local unit = self:CreateUnit(random_creep_name, random_position, zone_name)
            unit.ZoneName = zone_name--сохраняем названеи зоны чтобы получить в будуюем
            table.insert(creep_pool, unit)
        end

        return respawn_time or self.BaseRespawnTime
    end, 2)
end

--если из зоны вышли все герои накидываем на крипа модификатор который скрывает его
--если в зону не вернется ни 1 игрок через 30 сек модификатор удалит крипа
--если герой вернется в зону все модификаторы уничтожатся и зона продолжит функционировать как обычно
function Spawner:CountdownTillSoftRemove(zone_name)
    print("CountdownTillSoftRemove")
    local creep_pool = self.creep_pool[zone_name]
    local counter = 1

    Timers:CreateTimer(FrameTime(),function()
        if self.active_zones[zone_name] ~= 0 then
            return
        end

        local unit = creep_pool[counter]
        if unit and not unit:IsNull() and unit:IsAlive() then
            counter = counter + 1
            unit:AddNewModifier(unit, nil, "modifier_hide_unit_and_remove", {duration = 30, zone_name = zone_name})
        end
        return 0.2
    end)
end

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

function Spawner:CreateUnit(creep_name, random_position, zone_name)

    local stats = self.zone_data[zone_name].creep_data[creep_name]
    local unit = CreateUnitByName(creep_name, random_position, true, nil, nil, DOTA_TEAM_NEUTRALS)

    unit:SetBaseDamageMin(stats.damage_min)
	unit:SetBaseDamageMax(stats.damage_max)
	unit:SetMaxHealth(stats.health)
	unit:SetBaseMaxHealth(stats.health)
	unit:SetHealth(stats.health)
	unit:CreatureLevelUp(stats.level - 1)
    unit:SetOriginalModel(stats.model)
    unit:SetModel(stats.model)

    --броня юнита, там модификатор
	--unit:AddNewModifier(unit, nil, "modifier_unit_armor", {}):SetStackCount(stats.defense)
    return unit
end