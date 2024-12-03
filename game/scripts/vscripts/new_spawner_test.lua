if not Spawner then
    local creeps_stats = require("config/creeps_stats")

    Spawner = class({})
    Spawner.BaseRespawnTime = 3
    Spawner.active_zones = {}
    Spawner.creep_pool = {}
    Spawner.zone_data = {}

    for zone_name,creep_params in pairs(creeps_stats) do
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
function Spawner:OnHeroInZone(trigger)
	local hHero = trigger.activator
    local zone_name = trigger:GetName() --как-то переименовать или стрингсабить название чтобы отличить зону

    if self.active_zones[zone_name] == 0 then
        self.active_zones[zone_name] = 1

        if not trigger[zone_name .. "_spawner_function"] then
            self:StartSpawnZoneCreeps(trigger, zone_name)
        else
            local creep_pool = self.creep_pool[zone_name]
            for _,unit in pairs(creep_pool) do
                unit:RemoveModifierByName("modifier_hide_unit_and_remove")
            end
        end

    else
        self.active_zones[zone_name] = self.active_zones[zone_name] + 1
    end

    --меняем время спавна в зависимости от героев внутри
    hHero.CurrentZoneName = zone_name--записываем в какой зоне находится герой, чтобы возродить его в ней
    hHero.LastRespawnChanged = hHero:GetRespawnMultiplier()
    self.zone_data[zone_name].RespawnTime = self.zone_data[zone_name].RespawnTime * hHero.LastRespawnChanged
end

--герой вышел из зоны
function Spawner:OnOutOfZone(trigger)
    local hHero = trigger.activator
    local zone_name = trigger:GetName()

    if self.active_zones[zone_name] == 1 then
        self.active_zones[zone_name] = 0
            
        self:CountdownTillSoftRemove(trigger, zone_name)
    else
        self.active_zones[zone_name] = self.active_zones[zone_name] - 1
    end

    --меняем время спавна в зависимости от героев внутри
    hHero.CurrentZoneName = nil--записываем в какой зоне находится герой, чтобы возродить его в ней
    self.zone_data[zone_name].RespawnTime = self.zone_data[zone_name].RespawnTime / hHero.LastRespawnChanged
    hHero.LastRespawnChanged = nil
end

--запускаем на тригере синкер
function Spawner:SpawnZoneCreeps(trigger, zone_name)
    local creep_names = self.zone_data[zone_name].all_creep_names
    local creep_pool = self.creep_pool[zone_name]
    local creesp_limit = self.zone_data[zone_name].creesp_limit
    local respawn_time = self.zone_data[zone_name].RespawnTime
    --тут нужно будет получить границы тригера чтобы в нем спавнить крипов
    -- local bounds = trigger:GetBounds()
    local bounds_max = Vector(0,0,0) --bounds.Mins
    local bounds_min = Vector(1000,1000,0)--bounds.Maxs

    trigger:SetContextThink(zone_name .. "_spawner_function", function()
        local random_position = GetRandomPositionSquare(bounds_min, bounds_max)

        if #creep_pool >= creesp_limit then
            for _,creep in pairs(creep_pool) do
                if not creep:IsAlive() then
                    creep:RespawnUnit()
                    FindClearSpaceForUnit(creep, random_position, true)
                    break
                end
            end
        else
            local random_creep_name = creep_names[RandomInt(1, #creep_names)]
            local unit = self:CreateUnit(random_creep_name, random_position)
            unit.ZoneName = zone_name--сохраняем названеи зоны чтобы получить в будуюем
            table.insert(creep_pool, unit)
        end

        return respawn_time or self.BaseRespawnTime
    end, 0)
end

--если из зоны вышли все герои накидываем на крипа модификатор который скрывает его
--если в зону не вернется ни 1 игрок через 30 сек модификатор удалит крипа
--если герой вернется в зону все модификаторы уничтожатся и зона продолжит функционировать как обычно
function Spawner:CountdownTillSoftRemove(zone_name)
    local creep_pool = self.creep_pool[zone_name]
    local counter = 1

    Timers:CreateTimer(FrameTime(),function()
        if self.active_zones[zone_name] ~= 0 then
            return
        end

        local unit = creep_pool[counter]
        if unit and unit:IsAlive() then
            counter = counter + 1
            unit:AddNewModifier(unit, nil, "modifier_hide_unit_and_remove", {duration = 30, zone_name = zone_name})
            return 0.2
        end
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

    --броня юнита, там модификатор
	--unit:AddNewModifier(unit, nil, "modifier_unit_armor", {}):SetStackCount(stats.defense)
    return unit
end