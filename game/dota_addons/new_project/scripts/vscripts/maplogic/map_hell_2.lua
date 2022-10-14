function MapLogic:map_hell_2()
    GameRules:GetGameModeEntity():SetFogOfWarDisabled(false)
    GameRules:GetGameModeEntity():SetFogOfWarDisabled(true)
    self.Hell2AllUnits = {}
    self.Hell2Colums = {
        "npc_hell2_colume_shtorm",
        "npc_hell2_colume_fire",
        "npc_hell2_colume_cold",
        "npc_hell2_colume_wind",
        "npc_hell2_colume_earth",
        "npc_hell2_colume_soul",
    }
    for i=1,8 do
        local camp = Entities:FindAllByName("hell2_camp" .. i)[1]
        local pos = camp:GetOrigin()
        self:CreateCamp(pos)
        UTIL_Remove(camp)
        for _,ent in pairs(Entities:FindAllByName("hell2_camp" .. i .. "_clume")) do
            CreateUnitByName(table.random(self.Hell2Colums), ent:GetOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
            UTIL_Remove(ent)
        end
    end
    for _,ent in pairs(Entities:FindAllByName("hell2_boss_colume")) do
        CreateUnitByName(table.random(self.Hell2Colums), ent:GetOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
        UTIL_Remove(ent)
    end
	self.Listeners[1] = ListenToGameEvent("entity_killed", Dynamic_Wrap( self, 'OnEntityKilledHell2' ), self )
    local Point = Entities:FindByName(nil,"Hell2BossSpawnPoint")
    self.BossHell2 = CreateUnitByName("npc_boss_hell2", Point:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
    self.BossHell2:AddNewModifier(nil,nil,"modifier_boss_invelurable",nil)
end

function MapLogic:CreateCamp(position)
    if RandomInt(1, 2) == 2 then 
        for i=1,3 do
            local unit = CreateUnitByName("npc_hell2_forge", position, true, nil, nil, DOTA_TEAM_BADGUYS )
            table.insert( self.Hell2AllUnits, unit )
        end
    else
        for i=1,3 do
            local unit = CreateUnitByName("npc_hell2_golem", position, true, nil, nil, DOTA_TEAM_BADGUYS )
            table.insert( self.Hell2AllUnits, unit )
        end
    end
end

function MapLogic:OnEntityKilledHell2(data)
	local killedUnit = EntIndexToHScript( data.entindex_killed )
    self.Hell2AllUnits = table.remove_item(killedUnit)
    if #self.Hell2AllUnits == 0 then
        self.BossHell2:RemoveModifierByName("modifier_boss_invelurable")
    end
    if killedUnit == self.BossHell2 then
        Timers:CreateTimer(3, function()
            self:TPHome()
        end)
    end
end
