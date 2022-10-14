
LinkLuaModifier( "modifier_sand_shtorm_desert2", "modifiers/modifier_sand_shtorm_desert2", LUA_MODIFIER_MOTION_NONE )
function MapLogic:map_desert_2()
    GameRules:GetGameModeEntity():SetFogOfWarDisabled(false)
    Timers:CreateTimer(0.03,function()
        GameRules:GetGameModeEntity():SetFogOfWarDisabled(true)
    end)
    local sands = Entities:FindAllByName("desert2_sands")
    self.Deset2Sands = {}
    --for _,ent in pairs(sands) do
    --    local npc = CreateModifierThinker(nil, nil, "modifier_sand_shtorm_desert2", {}, ent:GetOrigin(), DOTA_TEAM_BADGUYS, false)
    --    table.insert( self.Deset2Sands, npc )
    --    UTIL_Remove(ent)
    --end
    self.Desert2CreepsName = {"npc_desert2_spider","npc_desert2_siege","npc_desert2_lizard","npc_desert2_king"}
    local camps = table.shuffle(Entities:FindAllByName("desert2_camp"))
    self.Desert2AllUnits = {}
    for _,ent in pairs(camps) do
        if #self.Desert2AllUnits < 60 then
            self:Desert2SpawnRandomCamp(RandomInt(2, 5), ent:GetOrigin())
        end
        UTIL_Remove(ent)
    end    
    self.Boss3Desert2 = CreateUnitByName("npc_desert2_boss", Entities:FindAllByName("desert2_boss_spawn")[1]:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
    self.Boss3Desert2:AddNewModifier(nil,nil,"modifier_boss_invelurable",nil)
	self.Listeners[1] = ListenToGameEvent("entity_killed", Dynamic_Wrap( self, 'OnEntityKilledDeser2' ), self )
end

function MapLogic:Desert2SpawnRandomCamp(count, position)
    if (#self.Desert2AllUnits + count) <= 60 then
        for i=1,count do
            local npc = CreateUnitByName(table.random(self.Desert2CreepsName), position, true, nil, nil, DOTA_TEAM_BADGUYS )
            table.insert( self.Desert2AllUnits, npc )
        end
    else
        local newcount = #self.Desert2AllUnits + count - 61
        for i=1,newcount do
            local npc = CreateUnitByName(table.random(self.Desert2CreepsName), position, true, nil, nil, DOTA_TEAM_BADGUYS )
            table.insert( self.Desert2AllUnits, npc )
        end       
    end
    print(#self.Desert2AllUnits)
end

function MapLogic:OnEntityKilledDeser2(data)
	local killedUnit = EntIndexToHScript( data.entindex_killed )
    for num,unit in ipairs(self.Desert2AllUnits) do
        if unit == killedUnit then
            table.remove( self.Desert2AllUnits, num )
            if #self.Desert2AllUnits == 0 then
                self.Boss3Desert2:RemoveModifierByName("modifier_boss_invelurable")
            end
            break
        end
    end
    if killedUnit == self.Boss3Desert2 then
        Timers:CreateTimer(3, function()
            self:TPHome()
        end)
    end
end