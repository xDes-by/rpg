if mines_1 == nil then
	mines_1 = class({})
end

function mines_1:Init()
--	self.listen = ListenToGameEvent("entity_killed", Dynamic_Wrap( self, 'OnEntityKilled' ), self )
	mines_1:start_quest()
	mines_1:spawn_creeps()
	
	
	_G.buttons = {
	["mines_button_1"] = {30, false}, --time/active
	["mines_button_2"] = {30, false},
	["mines_button_3"] = {30, false},
	["mines_button_4"] = {30, false},
	["mines_button_5"] = {30, false},
	["mines_button_6"] = {30, false},
	}
end

function mines_1:start_quest()
	Timers:CreateTimer(3.5, function() --таймер для старта квеста после телепортации!
		local hRelay = Entities:FindByName( nil, "mines_1_logic" )
		hRelay:Trigger(nil,nil)	
		Quest:MapActivate('mines_1')
	end)
end

local buttonActive = true

function OnStartTouch(trigger)
	local triggerName = thisEntity:GetName()
	if not buttonActive then
		return
	end
	
	local hero = trigger.activator

	buttonActive = false
	local button = triggerName .. "_button"
	
	for k,v in pairs(_G.buttons) do
		if k == triggerName then
			if not hero:HasModifier("modifier_mines_hex") and v[2] == false then
				hero:AddNewModifier(hero, nil, "modifier_mines_hex", {})
				v[2] = true
			end
		end
	end	
	
	Timers:CreateTimer(1, function()
		if buttonActive == false and hero:HasModifier("modifier_mines_hex") then 
			for k,v in pairs(_G.buttons) do
				if k == triggerName then	
					DoEntFire( button, "SetAnimation", "ancient_trigger001_down", 0, self, self )
					DoEntFire( button, "SetAnimation", "ancient_trigger001_down_idle", .35, self, self )
					if v[1] > 0 then
						v[1] = v[1] - 1
						mines_1:spawn_button_creeps(triggerName)
						-- add tick sound
						return 1
					else
						Quest:UpdateCounter('mines_1', 1)
						--- add sound!
						hero:RemoveModifierByName("modifier_mines_hex")
						return nil
					end
				end
			end
		end
	end)
end

function OnEndTouch(trigger)
	local triggerName = thisEntity:GetName()
	buttonActive = false
	for k,v in pairs(_G.buttons) do
		if k == triggerName then
			if k == triggerName then
				if v[1] > 0 then
					buttonActive = true				
					local button = triggerName .. "_button"	
					DoEntFire( button, "SetAnimation", "ancient_trigger001_up", 0.5, self, self )
					DoEntFire( button, "SetAnimation", "ancient_trigger001_idle", 0.6, self, self )
				end
			end	
		end
	end	
end


function mines_1:spawn_button_creeps(name)
	local point = Entities:FindByName( nil, name.."_point"):GetAbsOrigin()
--for i = 1, 2 do
	local unit = CreateUnitByName("npc_mines_1_creep_mini_1", point + RandomVector( RandomInt( 50, 100 )), true, nil, nil, DOTA_TEAM_BADGUYS)
	Rules:unit_settings(unit, "creep", "mini", 13, 219, 100)
	Rules:SetAbilityLevel(unit)
--	end
end

function mines_1:spawn_creeps()
	local count = 0
	Timers:CreateTimer(0, function()
	if count < 13 then
		count = count + 1
		local point = Entities:FindByName( nil, "mines_1_creep_spawn_"..count):GetAbsOrigin()
		for i = 1, 4 do
			if i == 1 then 
				local unit = CreateUnitByName("npc_mines_1_creep_big_1", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
				Rules:unit_settings(unit, "creep", "big", 13, 219, 100)
				Rules:SetAbilityLevel(unit)
			elseif i == 2 then 	
				local unit = CreateUnitByName("npc_mines_1_creep_mini_1", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
				Rules:unit_settings(unit, "creep", "mini", 13, 219, 100)
				Rules:SetAbilityLevel(unit)
			else	
				local unit = CreateUnitByName("npc_mines_1_creep_mini_2", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
				Rules:unit_settings(unit, "creep", "mini", 13, 219, 100)
				Rules:SetAbilityLevel(unit)				
			end	
		end
		return 0.1
	else
		Rules:clear(count, "mines_1_creep_spawn_")
		return nil
		end
	end)
end

