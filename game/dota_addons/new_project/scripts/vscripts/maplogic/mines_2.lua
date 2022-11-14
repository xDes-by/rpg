if mines_2 == nil then
	mines_2 = class({})
end

function mines_2:Init()
	self.listen = ListenToGameEvent("entity_killed", Dynamic_Wrap( self, 'OnEntityKilled' ), self )
	mines_2:start_quest()
	mines_2:spawn_creeps()
end

function mines_2:start_quest()
	Timers:CreateTimer(3.5, function() --таймер для старта квеста после телепортации!
		local hRelay = Entities:FindByName( nil, "mines_2_logic" )
		hRelay:Trigger(nil,nil)	
		Quest:MapActivate('mines_2')
	end)
end

function mines_2:OnEntityKilled(keys)
	local KilledUnit = EntIndexToHScript( keys.entindex_killed )
	if KilledUnit:GetUnitName() == "npc_mines_2_cart" and KilledUnit:HasModifier("modifier_npc_mines_2_cart") then
		--ggwp
	end
	
	if KilledUnit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
		if KilledUnit:GetUnitName() == "npc_mines_2_boss" then
			Quest:UpdateCounter('mines_2', 2)
			StopListeningToGameEvent(self.listen_kill)
		end
	end	
end 

function quest_complite(keys)
	Quest:UpdateCounter('mines_2', 1)
	keys.activator:RemoveModifierByName("modifier_npc_mines_2_cart")
end

function mines_2:spawn_creeps()

local point = Entities:FindByName( nil, "path_mines1"):GetAbsOrigin()
local unit = CreateUnitByName("npc_mines_2_cart", point, true, nil, nil, DOTA_TEAM_GOODGUYS)

	local count = 0
	Timers:CreateTimer(0, function()
	if count < 29 then
		count = count + 1
		local point = Entities:FindByName( nil, "mines_2_creep_spawn_"..count):GetAbsOrigin()
		for i = 1, 4 do
			if i == 1 then 
				local unit = CreateUnitByName("npc_mines_2_creep_big_1", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
				Rules:unit_settings(unit, "creep", "big", 13, 219, 100)
				Rules:SetAbilityLevel(unit)
			elseif i == 2 then 	
				local unit = CreateUnitByName("npc_mines_2_creep_mini_1", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
				Rules:unit_settings(unit, "creep", "mini", 13, 219, 100)
				Rules:SetAbilityLevel(unit)
			else	
				local unit = CreateUnitByName("npc_mines_2_creep_mini_2", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
				Rules:unit_settings(unit, "creep", "mini", 13, 219, 100)
				Rules:SetAbilityLevel(unit)				
			end	
		end
		return 0.1
	else
		Rules:clear(count, "mines_2_creep_spawn_")
		return nil
		end
	end)
end

