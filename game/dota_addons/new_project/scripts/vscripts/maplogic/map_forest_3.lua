--старт локи
function MapLogic:map_forest_3()
    self.Forest3Items = {}
    GameRules:GetGameModeEntity():SetFogOfWarDisabled(false)
    GameRules:SetTimeOfDay(0.75)
    for nPlayerID = 0, DOTA_MAX_TEAM_PLAYERS-1 do
        if PlayerResource:IsValidPlayerID(nPlayerID) then
            local hero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
            Timers:CreateTimer(0.03, function()
                if hero == nil then
                    return 0.03
                end
                local item = hero:AddItemByName("item_forest3_quelling_blade")
                table.insert( MapLogic.Forest3Items, item )
            end)	
        end
    end
    self.TreePoints = {}
    self.CampPoints = {}
    self.Forest3TreesDestroyed = 0
    for i=1,9 do
        table.insert( self.TreePoints, Entities:FindAllByName("Forest3TreeSpawnPoint" .. i)[1] ) 
        table.insert( self.CampPoints, Entities:FindAllByName("Forest3SpawnCampPoint" .. i)[1])
        UTIL_Remove(ent)
    end
    for num,ent in ipairs(self.TreePoints) do
        local unit = CreateTempTreeWithModel(ent:GetAbsOrigin(), 99999, "maps/journey_assets/props/trees/journey_maple/journey_maple02_inspector.vmdl")
        unit.CampForCeeps = self.CampPoints[num]:GetOrigin()
        UTIL_Remove(self.CampPoints[num])
        unit.IsTreeInfect = true
        UTIL_Remove(ent)
    end
	self.Listeners[1] = ListenToGameEvent("entity_killed", Dynamic_Wrap( self, 'OnEntityKilledForest3' ), self )
    --self.Listeners[2] = ListenToGameEvent("npc_spawned", Dynamic_Wrap( self, 'SpawnCreepControllerForest3' ), self )
    
    self.TreantsSpawned = {}
    local Point = Entities:FindAllByName("Forest3BossSpawnPoint")
    self.BossForest3 = CreateUnitByName("npc_boss_forest3", Point[1]:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
    self.BossForest3:AddNewModifier(nil,nil,"modifier_boss_invelurable",nil)
end

function MapLogic:SpawnTreantsForest3(count, position)
    for number = 1, count do
        local unit = CreateUnitByName("npc_forest3_treant_small", position, true, nil, nil, DOTA_TEAM_BADGUYS )
        table.insert( MapLogic.TreantsSpawned, unit )
    end
    local unit = CreateUnitByName("npc_forest3_treant_big", position, true, nil, nil, DOTA_TEAM_BADGUYS )
    table.insert( MapLogic.TreantsSpawned, unit )
end

function MapLogic:tree_treeantment_end()
    GameRules:GetGameModeEntity():ClearExecuteOrderFilter()
    self.BossForest3:RemoveModifierByName("modifier_boss_invelurable")
    for _,item in pairs(self.Forest3Items) do
        UTIL_Remove(item)
    end
    local pos = self.BossForest3:GetAbsOrigin()
    for _,unit in pairs(self.TreantsSpawned) do
        if not unit:IsNull() then
            unit:SetBaseMoveSpeed(700)
            unit:MoveToPositionAggressive(pos)
        end
    end
end

function MapLogic:OnEntityKilledForest3(data)
	local killedUnit = EntIndexToHScript( data.entindex_killed )
	local killer = EntIndexToHScript( data.entindex_attacker )
    for num,unit in ipairs(self.TreantsSpawned) do
        if unit == killedUnit then
            table.remove( self.TreantsSpawned, num )
            break
        end
    end
    if self.BossForest3 == killedUnit then
        for _,unit in pairs(self.TreantsSpawned) do
            if not unit:IsNull() then
                UTIL_Remove(unit)
            end
        end
        Timers:CreateTimer(3, function()
            self:TPHome()
        end)
    end
end