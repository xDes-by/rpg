function MapLogic:map_cave_2()
    GameRules:GetGameModeEntity():SetFogOfWarDisabled(false)
    self.Cave2MovePoints = {}
    for i=0,41 do
        local ent = Entities:FindAllByName("cave2_cart_path"..i)[1]
        table.insert( self.Cave2MovePoints, ent:GetAbsOrigin() )
        UTIL_Remove(ent)
    end
    CreateUnitByName("npc_cave2_cart", Entities:FindAllByName("cave2_cart_spawn_position")[1]:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_GOODGUYS )
    self.BossCave2 = CreateUnitByName("npc_boss_cave2", Entities:FindAllByName("Cave2BossSpawnPoint")[1]:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
    self.BossCave2:AddNewModifier(nil,nil,"modifier_boss_invelurable",nil)
    self.Cave2Monsters = {"npc_cave2_zomby","npc_cave2_grevil","npc_cave2_grevil_gold"}
end

function MapLogic:Cave2SpawnEnemies(TableID)
    if TableID < 40 then
        CreateUnitByName(self.Cave2Monsters[RandomInt(1,3)], self.Cave2MovePoints[TableID], true, nil, nil, DOTA_TEAM_BADGUYS )
        if RandomInt(1,15) == 1 then
            CreateUnitByName("npc_cave2_digger", self.Cave2MovePoints[TableID], true, nil, nil, DOTA_TEAM_BADGUYS )
        end
    end
end

function MapLogic:Cave2End()
    Timers:CreateTimer(3, function()
        self:TPHome()
    end)
end