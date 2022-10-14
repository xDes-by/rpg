function MapLogic:map_cave_1()
    GameRules:GetGameModeEntity():SetFogOfWarDisabled(false)
    self.cave1_move_point = {}
    for i=1,5 do
        local point = Entities:FindAllByName("cave1_mine"..i.."_moving_point")
        table.insert( self.cave1_move_point, point[1]:GetAbsOrigin() )
        UTIL_Remove(point)
    end
    self.cave1_ubstruction_point = {}
    for i=1,5 do
        local point = Entities:FindAllByName("cave1_mine"..i.."_blocker")
        table.insert( self.cave1_ubstruction_point, point[1]:GetAbsOrigin() )
        UTIL_Remove(point)
    end
    self.Minertable = {}
    for i=1,5 do
        local point = Entities:FindAllByName("cave1_mine"..i.."_position")
        local unit = CreateUnitByName("npc_cave1_miner", point[1]:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
        unit.CaveNumber = i
        table.insert( self.Minertable, unit )
        UTIL_Remove(point)
    end
    self.Cave1MainSpawnPoint = Entities:FindAllByName("cave1_mobs_spawn_points")[1]:GetAbsOrigin()
    self.cave1creeps = {"npc_cave1_creep_mele","npc_cave1_creep_range","npc_cave1_ursa","npc_cave1_mine","npc_cave1_lamp"}
    self.cave1bricks = 0
	self.Listeners[1] = ListenToGameEvent("dota_inventory_item_added", Dynamic_Wrap( self, 'FindBricks' ), self )
end

function MapLogic:Cave1StartCreepSpawning()
    Timers:CreateTimer("Cave1StartCreepSpawning", {
    useGameTime = true,
    endTime = 1,
    callback = function()
        CreateUnitByName(self.cave1creeps[RandomInt(1,5)], self.Cave1MainSpawnPoint, true, nil, nil, DOTA_TEAM_BADGUYS )
        return 1
    end})
end

function MapLogic:Cave1StopCreepSpawning()
    UTIL_Remove(MapLogic.cave1blocker)
    Timers:RemoveTimer("Cave1StartCreepSpawning")
    self.cave1bricks = self.cave1bricks + 1
    if self.cave1bricks == 3 then
        for _,unit in ipairs(self.Minertable) do
            UTIL_Remove(unit)
        end
    end
end

function MapLogic:FindBricks(data)
    local hHero = PlayerResource:GetSelectedHeroEntity( data.inventory_player_id )
    local count = {}
    for i=0,16 do
        local item = hHero:GetItemInSlot(i)
        if item and item:GetAbilityName() then
            table.insert( item, count )
        end
    end
    if #count == 3 then
        for _,item in ipairs(count) do
            item:GetOwner():RemoveItem(item)
        end  
        hHero:AddItemByName("")
    end     
end

function MapLogic:OnEntityKilledCave1(data)
	local killedUnit = EntIndexToHScript( data.entindex_killed )
    if killedUnit == self.BossCave1 then
        Timers:CreateTimer(3, function()
            self:TPHome()
        end)
    end
end
