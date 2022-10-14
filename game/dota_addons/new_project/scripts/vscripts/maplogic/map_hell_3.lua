function MapLogic:map_hell_3()
    local point = Entities:FindAllByName("hell3_boss_spawn")[1]
    self.Hell3WaveNumber = 0
    Timers:CreateTimer(1,function()
        MapLogic.Hell3WaveNumber = MapLogic.Hell3WaveNumber + 1
        MapLogic["Hell3SpawnWawe" .. MapLogic.Hell3WaveNumber](MapLogic)
        return 20
    end)
    self.BossHell3 = CreateUnitByName("npc_boss_hell3", Point:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
end

function MapLogic:Hell3SpawnWawe1()
    
end
