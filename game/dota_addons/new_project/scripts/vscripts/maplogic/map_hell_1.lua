function MapLogic:map_hell_1()
    GameRules:GetGameModeEntity():SetFogOfWarDisabled(true)
    Timers:CreateTimer(2,function()
        for nPlayerID=0,DOTA_MAX_PLAYERS-1 do
            local hero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
            Timers:CreateTimer(0.03,function()
                if hero == nil then
                    return 0.03
                end
                hero:AddAbility("ability_location_hell1_burn")
            end)
        end    
    end)
    self.Hell1LadySpawnPoints = Entities:FindAllByName("Cave1LadySpawns")
    for num,ent in ipairs(self.Hell1LadySpawnPoints) do
        local unit = CreateUnitByName("npc_hell1_frost_lady", ent:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_GOODGUYS )
        UTIL_Remove(ent)
    end
    self.Cave1AllCreeps = {}
    Timers:CreateTimer(0.5,function()
        self.Cave1ClinkzCamps = Entities:FindAllByName("Cave1ClinkzCamps")
        local unit = CreateUnitByName("npc_hell1_clinkz", self.Cave1ClinkzCamps[RandomInt(1, 3)]:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
        table.insert( self.Cave1AllCreeps, unit )
        for num,ent in ipairs(self.Cave1ClinkzCamps) do
            for i=1,3 do
                local unit = CreateUnitByName("npc_hell1_clinkz", ent:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
                table.insert( self.Cave1AllCreeps, unit )
            end
            UTIL_Remove(ent)
        end
    end)
    Timers:CreateTimer(1.2,function()
        self.Cave1DruidCamps = Entities:FindAllByName("Cave1DruidCamps")
        for num,ent in ipairs(self.Cave1DruidCamps) do
            for i=1,2 do
                local unit1 = CreateUnitByName("npc_hell1_druid", ent:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
                local unit2 = CreateUnitByName("npc_hell1_druid_bear", ent:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
                table.insert( self.Cave1AllCreeps, unit1 )
                table.insert( self.Cave1AllCreeps, unit2 )
            end
            UTIL_Remove(ent)
        end
    end)
    Timers:CreateTimer(2,function()
        self.Cave1GolemCamps = Entities:FindAllByName("Cave1GolemCamps")
        for num,ent in ipairs(self.Cave1GolemCamps) do
            for i=1,2 do
                local unit1 = CreateUnitByName("npc_hell1_magma_golem", ent:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
                local unit2 = CreateUnitByName("npc_hell1_dragon", ent:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
                table.insert( self.Cave1AllCreeps, unit1 )
                table.insert( self.Cave1AllCreeps, unit2 )
            end
            UTIL_Remove(ent)
        end
    end)
	self.Listeners[1] = ListenToGameEvent("entity_killed", Dynamic_Wrap( self, 'OnEntityKilledHell1' ), self )
end

function MapLogic:OnEntityKilledHell1(data)
	local killedUnit = EntIndexToHScript( data.entindex_killed )
    self.Cave1AllCreeps = table.remove_item(self.Cave1AllCreeps, killedUnit)
    if #self.Cave1AllCreeps == 0 then
        Timers:CreateTimer(3, function()
            self:TPHome()
        end)
    end
end