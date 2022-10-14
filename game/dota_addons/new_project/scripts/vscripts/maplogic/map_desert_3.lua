function MapLogic:map_desert_3()
    GameRules:GetGameModeEntity():SetFogOfWarDisabled(false)
    Timers:CreateTimer(0.03,function()
        GameRules:GetGameModeEntity():SetFogOfWarDisabled(true)
    end)
    self.Boss1Desert3 = CreateUnitByName("npc_desert3_boss1", Entities:FindAllByName("desert3_boss1")[1]:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
    self.Boss2Desert3 = CreateUnitByName("npc_desert3_boss2", Entities:FindAllByName("desert3_boss2")[1]:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
    self.Boss3Desert3 = CreateUnitByName("npc_desert3_boss3", Entities:FindAllByName("desert3_boss3")[1]:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
	self.Listeners[1] = ListenToGameEvent("entity_killed", Dynamic_Wrap( self, 'OnEntityKilledDesert3' ), self )
    self.Desert3BossKilled = 0
end

function MapLogic:OnEntityKilledDesert3(data)
	local killedUnit = EntIndexToHScript( data.entindex_killed )
    if killedUnit == self.Boss1Desert3 then
        self.Desert3BossKilled = self.Desert3BossKilled + 1
    end
    if killedUnit == self.Boss2Desert3 then
        self.Desert3BossKilled = self.Desert3BossKilled + 1
    end
    if killedUnit == self.Boss2Desert3 then
        self.Desert3BossKilled = self.Desert3BossKilled + 1
    end
    if self.Desert3BossKilled == 3 then
        Timers:CreateTimer(3, function()
            self:TPHome()
        end)
    end
end