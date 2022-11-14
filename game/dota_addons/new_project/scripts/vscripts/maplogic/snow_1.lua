if snow_1 == nil then
	snow_1 = class({})
end

function snow_1:Init()
	self.listen = ListenToGameEvent("entity_killed", Dynamic_Wrap( self, 'OnEntityKilled' ), self )
	snow_1:spawn_creeps()
	snow_1:spawn_mini_boss()
	snow_1:start_quest()
	self.count = 4
end

function snow_1:start_quest()
	Timers:CreateTimer(3.5, function() --таймер для старта квеста после телепортации!
		local hRelay = Entities:FindByName( nil, "snow_1_logic" )
		hRelay:Trigger(nil,nil)	
		Quest:MapActivate('snow_1')
	end)
end

function snow_1:OnEntityKilled(keys)
	local KilledUnit = EntIndexToHScript( keys.entindex_killed )
	if KilledUnit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
		if self.count > 0 then
			if string.find(KilledUnit:GetUnitName(), "npc_snow_mini_boss_") then
				Quest:UpdateCounter('snow_1', 1)
				self.count = self.count - 1
			end
		else
			StopListeningToGameEvent(self.listen_kill)
		end
	end		
end 

function snow_1:spawn_creeps()
	local count = 0
	Timers:CreateTimer(0, function()
	if count < 16 then
		count = count + 1
		local point = Entities:FindByName( nil, "snow_1_creep_spawn_"..count):GetAbsOrigin()
		for i = 1, 4 do
			if i == 1 then 
				local unit = CreateUnitByName("npc_snow_1_creep_big_1", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
				Rules:unit_settings(unit, "creep", "big", 8, 24, 100)
				Rules:SetAbilityLevel(unit)
			elseif i == 2 then 	
				local unit = CreateUnitByName("npc_snow_1_creep_mini_1", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
				Rules:unit_settings(unit, "creep", "mini", 8, 24, 100)
				Rules:SetAbilityLevel(unit)
			else	
				local unit = CreateUnitByName("npc_snow_1_creep_mini_2", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
				Rules:unit_settings(unit, "creep", "mini", 8, 24, 100)
				Rules:SetAbilityLevel(unit)				
			end	
		end
		return 0.1
	else
		Rules:clear(count, "snow_1_creep_spawn_")
		return nil
		end
	end)
end

function snow_1:spawn_mini_boss()
	local count = 0
	Timers:CreateTimer(0, function()
	if count < 4 then
		count = count + 1
		local point = Entities:FindByName( nil, "snow_1_boss_point_"..count):GetAbsOrigin()
		local unit = CreateUnitByName("npc_snow_mini_boss_"..count, point, true, nil, nil, DOTA_TEAM_BADGUYS)
		Rules:unit_settings(unit, "mini_boss", "big", 0, 0, 50)
		Rules:SetAbilityLevel(unit)
		return 0.1
	else
		Rules:clear(count, "snow_1_boss_point_")
		return nil
		end
	end)
end