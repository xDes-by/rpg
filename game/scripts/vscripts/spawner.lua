if not Spawner then
	Spawner = class({})
end

local creeps_table = {
    ["npc_custom_creep_1"] = {gold = 5, exp = 25, hp = 30, armor = 0, min_damage = 1, max_damage = 3, resist = 2},
    ["npc_custom_creep_2"] = {gold = 10, exp = 27},
    ["npc_custom_creep_3"] = {gold = 30, exp = 32},
    ["npc_custom_creep_4"] = {gold = 80, exp = 41},
    ["npc_custom_creep_5"] = {gold = 200, exp = 54},
    ["npc_custom_creep_6"] = {gold = 500, exp = 71},
    ["npc_custom_creep_7"] = {gold = 1000, exp = 91},
    ["npc_custom_creep_8"] = {gold = 2000, exp = 115}, 
    ["npc_custom_creep_9"] = {gold = 4000, exp = 143},   
}

local units_data = {
	
}

function Spawner:Init()
	-- _G.Creeps_table = {}
	ListenToGameEvent( "entity_killed", Dynamic_Wrap(self, 'OnEntityKilled' ), self)
	-- for i = 1, 8 do
		-- local ent = Entities:FindByName( nil, "lorencia_spider_spawn")
		-- ent:SetThink("SpawnCreeps", self, "Spawner", 1)--_G.spawn_interval+1)
	-- end
	Spawner:SpawnCreeps()
	Spawner:SpawnNPC()
end

function Spawner:OnEntityKilled( keys )
    local killed_unit = EntIndexToHScript( keys.entindex_killed )
    local killer = EntIndexToHScript( keys.entindex_attacker )
	local creep_name = killed_unit:GetUnitName()
	if creeps_table[creep_name] then
		local heroes = FindUnitsInRadius(killer:GetTeamNumber(), killed_unit:GetAbsOrigin(), nil, 800, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NOT_CREEP_HERO + DOTA_UNIT_TARGET_FLAG_NOT_ILLUSIONS + DOTA_UNIT_TARGET_FLAG_INVULNERABLE + DOTA_UNIT_TARGET_FLAG_OUT_OF_WORLD, FIND_ANY_ORDER, false ) 
		local num_heroes = #heroes
        if num_heroes > 0 then
            local gold = creeps_table[creep_name].gold / num_heroes
            local exp = creeps_table[creep_name].exp / num_heroes
            
            for _, hero in ipairs(heroes) do
                hero:ModifyGold(gold, true, 0)
                SendOverheadEventMessage(hero, OVERHEAD_ALERT_GOLD, hero, gold, nil)
                hero:AddExperience(exp, DOTA_ModifyXP_Unspecified, false, false)
            end
        end
	end
end

function Spawner:SpawnCreeps()
	count_first = 0
	Timers:CreateTimer(0, function()
		if count_first < 14 then
			count_first = count_first + 1
			local point = Entities:FindByName( nil, "lorencia_spawn_"..count_first):GetAbsOrigin()
			for i = 0, 5 do
				local unit = CreateUnitByName("npc_custom_creep_1", point + RandomVector( RandomInt(50, 250)), true, nil, nil, DOTA_TEAM_BADGUYS)
				Spawner:unit_settings(unit, "npc_custom_creep_1")
			end
			return 0.1
		else
			return nil
		end
	end)
end

function Spawner:unit_settings(unit, unitname)
	unit:AddNewModifier(unit, nil, "modifier_unit_on_death", {posX = unit:GetAbsOrigin().x, posY = unit:GetAbsOrigin().y, posZ = unit:GetAbsOrigin().z, name = unitname})
	
	unit:SetBaseDamageMin(creeps_table[unitname].min_damage)
	unit:SetBaseDamageMax(creeps_table[unitname].max_damage)
	unit:SetMaxHealth(creeps_table[unitname].hp)
	unit:SetBaseMaxHealth(creeps_table[unitname].hp)
	unit:SetHealth(creeps_table[unitname].hp)
	unit:SetPhysicalArmorBaseValue(creeps_table[unitname].armor)
	unit:SetBaseMagicalResistanceValue(creeps_table[unitname].resist)
end

function Spawner:SpawnNPC(unit, unitname)
	for i = 1, 5 do -- кол-во нпс на карте (-1)
		local point = Entities:FindByName( nil, "npc_point_"..i):GetOrigin()
		local npc = CreateUnitByName("npc_dota_custom_npc", point, false, nil, nil, DOTA_TEAM_GOODGUYS)
		npc:AddNewModifier(npc, nil, "modifier_blacksmith_meepo", {})
		-- npc:SetAngles(0,0,0)
	end
end



-- ////////////////////////////////////

-- Creep 1: 25 XP
-- Creep 2: 27 XP
-- Creep 3: 32 XP
-- Creep 4: 41 XP
-- Creep 5: 54 XP
-- Creep 6: 71 XP
-- Creep 7: 91 XP
-- Creep 8: 115 XP
-- Creep 9: 143 XP
-- Creep 10: 175 XP
-- Creep 11: 210 XP
-- Creep 12: 249 XP
-- Creep 13: 291 XP
-- Creep 14: 337 XP
-- Creep 15: 387 XP
-- Creep 16: 441 XP
-- Creep 17: 499 XP
-- Creep 18: 560 XP
-- Creep 19: 625 XP
-- Creep 20: 693 XP
-- Creep 21: 765 XP
-- Creep 22: 841 XP
-- Creep 23: 921 XP
-- Creep 24: 1004 XP
-- Creep 25: 1091 XP
-- Creep 26: 1182 XP
-- Creep 27: 1276 XP
-- Creep 28: 1375 XP
-- Creep 29: 1476 XP
-- Creep 30: 1582 XP
-- Creep 31: 1691 XP
-- Creep 32: 1804 XP
-- Creep 33: 1921 XP
-- Creep 34: 2041 XP
-- Creep 35: 2165 XP
-- Creep 36: 2293 XP
-- Creep 37: 2425 XP
-- Creep 38: 2560 XP
-- Creep 39: 2699 XP
-- Creep 40: 2841 XP
-- Creep 41: 2987 XP
-- Creep 42: 3137 XP
-- Creep 43: 3291 XP
-- Creep 44: 3449 XP
-- Creep 45: 3610 XP
-- Creep 46: 3775 XP
-- Creep 47: 3943 XP
-- Creep 48: 4115 XP
-- Creep 49: 4291 XP
-- Creep 50: 4471 XP
-- Creep 51: 4654 XP
-- Creep 52: 4841 XP
-- Creep 53: 5032 XP
-- Creep 54: 5226 XP
-- Creep 55: 5425 XP
-- Creep 56: 5626 XP
-- Creep 57: 5832 XP
-- Creep 58: 6041 XP
-- Creep 59: 6254 XP
-- Creep 60: 6471 XP