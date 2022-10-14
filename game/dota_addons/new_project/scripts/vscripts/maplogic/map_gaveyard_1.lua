function MapLogic:map_gaveyard_1()
    GameRules:GetGameModeEntity():SetFogOfWarDisabled(false)
    self.OriginCamp1 = Entities:FindAllByName("Camp1Gaveyard1Spawnpoints")
    self.OriginCamp2 = Entities:FindAllByName("Camp2Gaveyard1Spawnpoints")
    self.OriginCamp3 = Entities:FindAllByName("Camp3Gaveyard1Spawnpoints")
    self.OriginCamp4 = Entities:FindAllByName("Camp4Gaveyard1Spawnpoints")
	Timers:CreateTimer(1,function()
        for i=1,4 do 
            for num,ent in ipairs(self["OriginCamp"..i]) do
                self["OriginCamp"..i][num] = ent:GetAbsOrigin()
                UTIL_Remove(ent)
            end
        end 
    end)
    self.TombsCounter = 4
    local TombSpawn = Entities:FindAllByName("TombGaveyard1Spawnpoint")
    for i=1,4 do
        local unit = CreateUnitByName("npc_tomb_graveyard", TombSpawn[i]:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
        unit.IsTomb = true
        unit.Number = i
    end
    for num,ent in ipairs(TombSpawn) do
		UTIL_Remove(ent)
    end
    self.Gaveyard1Units = {}
    local Point = Entities:FindByName(nil,"Gaveyard3BossSpawnPoint")
    self.BossGaveyard1 = CreateUnitByName("npc_boss_gaveyard1", Point:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
    self.BossGaveyard1:AddNewModifier(nil,nil,"modifier_boss_invelurable",nil)
end

function MapLogic:SpawnSkelets(CampNumber,count)
	Timers:CreateTimer(1,function()
        count = count - 1 
        local unit1 = CreateUnitByName("npc_gaveyard1_kostyan", table.random(self["OriginCamp" .. CampNumber]), true, nil, nil, DOTA_TEAM_BADGUYS )
        table.insert( self.Gaveyard1Units, unit1 )
        if Zoomby() then
            local unit2 = CreateUnitByName("npc_gaveyard1_zomby", table.random(self["OriginCamp" .. CampNumber]), true, nil, nil, DOTA_TEAM_BADGUYS )
            table.insert( self.Gaveyard1Units, unit2 )
        end
        if count == 0 then 
            return
        end
        return 1.5
    end)
end

function MapLogic:TombKill()
    self.TombsCounter = self.TombsCounter - 1
    if self.TombsCounter == 0 then
        self.BossGaveyard1:RemoveModifierByName("modifier_boss_invelurable")
    end
end

function Zoomby()
    if RandomInt(1,100) <= 5 then
        return true
    else
        return false
    end
end

function MapLogic:ClearGaveyard1()
    for _,ent in ipairs(self.Gaveyard1Units) do
        UTIL_Remove(ent)
    end
end
    
