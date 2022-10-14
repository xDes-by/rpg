function MapLogic:map_gaveyard_2()
    GameRules:GetGameModeEntity():SetFogOfWarDisabled(false)
    GameRules:GetGameModeEntity():SetUnseenFogOfWarEnabled(true)
    self.Gaveyard2Items = {}
    for nPlayerID = 0, DOTA_MAX_TEAM_PLAYERS-1 do
        if PlayerResource:IsValidPlayerID(nPlayerID) then
            local hero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
            Timers:CreateTimer(0.03, function()
                if hero == nil then
                    return 0.03
                end
                hero.DayVision = hero:GetDayTimeVisionRange()
                hero.NightVision = hero:GetNightTimeVisionRange()
                hero:SetDayTimeVisionRange(300)
                hero:SetNightTimeVisionRange(300)
                local item = hero:AddItemByName("item_gaveyard_2_torch")
                table.insert( MapLogic.Gaveyard2Items, item )
            end)	
        end
    end
    self.CurrentTorch = 4
    self.Vever = {}
    local CampPoints = Entities:FindAllByName("Gaveyard2SpawnCamps")
    for num,ent in ipairs(CampPoints) do
        CampPoints[num] = ent:GetAbsOrigin()
        UTIL_Remove(ent)
    end 
    self.Gaveyard2Creeps = {}
    local creeps = {"npc_gaveyard2_familiar","npc_gaveyard2_golem","npc_gaveyard2_gohoul"}
    for _,Position in ipairs(CampPoints) do
        for _,crepname in ipairs(creeps) do
            local unit = CreateUnitByName(crepname, Position, true, nil, nil, DOTA_TEAM_BADGUYS )
            table.insert( self.Gaveyard2Creeps, unit)
        end
    end
    local tourch = Entities:FindAllByName("Gaveyard2TorchSpawnpoints")
    local TourchPoints = table.random_some(tourch, 4)
    for _,ent in ipairs(TourchPoints) do
        local unit = CreateUnitByName("npc_gaveyard2_torch", ent:GetOrigin(), true, nil, nil, DOTA_TEAM_GOODGUYS )
        unit:AddNewModifier(nil,nil,"modifier_selector",nil)
        unit.torch = true
    end
    for num,ent in ipairs(tourch) do
		UTIL_Remove(ent)
    end
    local Point = Entities:FindAllByName("Gaveyard2BossSpawnPoint")[1]:GetAbsOrigin()
    self.BossGaveyard2 = CreateUnitByName("npc_boss_gaveyard2", Point, true, nil, nil, DOTA_TEAM_BADGUYS )
    self.BossGaveyard2:AddNewModifier(nil,nil,"modifier_boss_invelurable",nil)
end

function MapLogic:Gaveyard2TorchLit()
    self.CurrentTorch = self.CurrentTorch - 1
    if self.CurrentTorch == 0 then
        for _,item in pairs(self.Gaveyard2Items) do
            UTIL_Remove(item)
        end
        self.BossGaveyard2:RemoveModifierByName("modifier_boss_invelurable")
        GameRules:GetGameModeEntity():SetUnseenFogOfWarEnabled(false)
        GameRules:GetGameModeEntity():SetFogOfWarDisabled(true)
        for _,veverid in ipairs(self.Vever) do
            RemoveFOWViewer(DOTA_TEAM_GOODGUYS, veverid)
        end
        for nPlayerID = 0, DOTA_MAX_TEAM_PLAYERS-1 do
            if PlayerResource:IsValidPlayerID(nPlayerID) then
                local hero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
                Timers:CreateTimer(0.03, function()
                    if hero == nil then
                        return 0.03
                    end
                    hero:SetDayTimeVisionRange(hero.DayVision)
                    hero:SetNightTimeVisionRange(hero.NightVision)
                end)	
            end
        end 
    end
end

function MapLogic:Gaveyard2Clear(data)
    for _,unit in pairs(self.Gaveyard2Creeps) do
        if not unit:IsNull() then
            UTIL_Remove(unit)
        end
    end
end