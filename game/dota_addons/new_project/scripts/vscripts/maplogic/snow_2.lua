if snow_2 == nil then
	snow_2 = class({})
end

function snow_2:Init()
	self.listen = ListenToGameEvent("entity_killed", Dynamic_Wrap( self, 'OnEntityKilled' ), self )
	snow_2:spawn_creeps()
	snow_2:spawn_fire()
	snow_2:start_quest()
	self.count = 92
end

function snow_2:start_quest()
	Timers:CreateTimer(3.5, function() --таймер для старта квеста после телепортации!
		local hRelay = Entities:FindByName( nil, "snow_2_logic" )
		hRelay:Trigger(nil,nil)	
		Quest:MapActivate('snow_2')
	end)
end

function snow_2:OnEntityKilled(keys)
	local KilledUnit = EntIndexToHScript( keys.entindex_killed )
	if KilledUnit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
		if string.find(KilledUnit:GetUnitName(), "npc_snow_2_creep_") then
			if self.count > 0 then
				Quest:UpdateCounter('snow_2', 1)
				self.count = self.count - 1
			end
		end
		if KilledUnit:GetUnitName() == "npc_snow_2_boss" then
			Quest:UpdateCounter('snow_2', 2)
			StopListeningToGameEvent(self.listen_kill)
		end
	end		
end 

function snow_2:spawn_creeps()
	local count = 0
	Timers:CreateTimer(0, function()
	if count < 23 then
		count = count + 1
		local point = Entities:FindByName( nil, "snow_2_creep_spawn_"..count):GetAbsOrigin()
		for i = 1, 5 do
			if i == 1 then 
				local unit = CreateUnitByName("npc_snow_2_creep_big_1", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
				Rules:unit_settings(unit, "creep", "big", 69, 23, 100)
				Rules:SetAbilityLevel(unit)
			elseif i == 2 then 	
				local unit = CreateUnitByName("npc_snow_2_creep_mini_1", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
				Rules:unit_settings(unit, "creep", "mini", 69, 23, 100)
				Rules:SetAbilityLevel(unit)
			else	
				local unit = CreateUnitByName("npc_snow_2_creep_mini_2", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
				Rules:unit_settings(unit, "creep", "mini", 69, 23, 100)
				Rules:SetAbilityLevel(unit)				
			end	
		end
		return 0.1
	else
		Rules:clear(count, "snow_2_creep_spawn_")
		return nil
		end
	end)
end

function snow_2:spawn_fire()
	local count = 0
	Timers:CreateTimer(0, function()
	if count < 10 then
		count = count + 1
		local point = Entities:FindByName( nil, "snow_2_fire_point_"..count):GetAbsOrigin()
		local unit = CreateUnitByName("npc_snow_2_fire", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		unit:AddNewModifier(unit, nil, "modifier_camp", {})
		
		local unit = CreateUnitByName("npc_snow_2_crystal", point + RandomVector( RandomInt( 50, 250 )), true, nil, nil, DOTA_TEAM_BADGUYS)
		Rules:unit_settings(unit, "creep", "mini", 0, 0, 100)
		return 0.1
	else
		Rules:clear(count, "snow_2_fire_point_")
		return nil
		end
	end)
end