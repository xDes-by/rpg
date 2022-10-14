function MapLogic:map_gaveyard_3()
    GameRules:GetGameModeEntity():SetFogOfWarDisabled(false)
    Timers:CreateTimer(0.03,function()
        GameRules:GetGameModeEntity():SetFogOfWarDisabled(true)
    end)
    self.Gaveyard3Items = {}
    for nPlayerID = 0, DOTA_MAX_TEAM_PLAYERS-1 do
        if PlayerResource:IsValidPlayerID(nPlayerID) then
            local hero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
            Timers:CreateTimer(0.03, function()
                if hero == nil then
                    return 0.03
                end
                local item = hero:AddItemByName("item_gaveyard_3_flask")
                MapLogic.Gaveyard3Items[hero] = item
            end)	
        end
    end
    local CampPoints = Entities:FindAllByName("gaveyard_3_patrool_point")
    local temp = {}
    print(#CampPoints)
    for num,ent in ipairs(CampPoints) do
        temp[num] = ent:GetAbsOrigin()
        UTIL_Remove(ent)
    end
    local CampPoints = temp
    local creeps = {"npc_gaveyard3_gohost_blue","npc_gaveyard3_gohost_red","npc_gaveyard3_spider"}
    self.Gaveyard3AllUnits = {}
    for _,pos in ipairs(CampPoints) do
        local unit = CreateUnitByName(table.random(creeps), pos, true, nil, nil, DOTA_TEAM_BADGUYS )
        table.insert( self.Gaveyard3AllUnits, unit )
    end
    local partool = table.shuffle(CampPoints)
    local same = true
    while same do
        for k,v in pairs(partool) do
            if CampPoints[k] == v then
                same = true
                partool = table.shuffle(CampPoints)
                break
            else
                same = false
            end
        end
    end
    Timers:CreateTimer(1,function()
        for i,unit in ipairs(self.Gaveyard3AllUnits) do
            unit:PatrolToPosition(partool[i])
        end
        self.Gaveyard3AllUnits = table.shuffle(self.Gaveyard3AllUnits)
        return 30
    end)
    self.FlaskUsed = 0
    self.Gaveyard3Soul = CreateUnitByName("npc_gaveyard3_soul", Entities:FindAllByName("gaveyard_3_soul")[1]:GetOrigin(), true, nil, nil, DOTA_TEAM_GOODGUYS )
    self.Gaveyard3Boss = CreateUnitByName("npc_boss_gaveyard3", Entities:FindAllByName("gaveyard_3_dog")[1]:GetOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
end

function MapLogic:Gaveyard3Flask()
    self.FlaskUsed = self.FlaskUsed + 1
    if self.FlaskUsed == #self.Gaveyard3Items then
        self.Gaveyard3Soul.CanMove = true
        local fullexp = 0
        for _,unit in pairs(self.Gaveyard3AllUnits) do
            fullexp = fullexp + unit:GetDeathXP()
            UTIL_Remove(unit)
        end
        local expforhero = fullexp/#self.Gaveyard3Items
        for hero,_ in pairs(self.Gaveyard3Items) do
            hero:AddExperience(expforhero, DOTA_ModifyXP_CreepKill,false,false)
        end
    end
end

function MapLogic:EndLocation()
    Timers:CreateTimer(3, function()
        self:TPHome()
    end)
end