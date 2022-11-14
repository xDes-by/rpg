if dust_2 == nil then
	dust_2 = class({})
end

function dust_2:Init()
	self.listen = ListenToGameEvent("entity_killed", Dynamic_Wrap( self, 'OnEntityKilled' ), self )
	dust_2:spawn_cocons()
	dust_2:start_quest()
--	self.count = 55
end

function dust_2:start_quest()
	Timers:CreateTimer(3.5, function() --таймер для старта квеста после телепортации!
		local hRelay = Entities:FindByName( nil, "dust_2_logic" )
		hRelay:Trigger(nil,nil)	
		Quest:MapActivate('dust_2')
	end)
end

function dust_2:OnEntityKilled(keys)
	local KilledUnit = EntIndexToHScript( keys.entindex_killed )
	if KilledUnit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
	--	if self.count > 0 then
			if KilledUnit:GetUnitName() == "npc_dust_creep_egg" then
				Quest:UpdateCounter('dust_2', 1)
				self.count = self.count - 1
			end
	--	else
	
		if KilledUnit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
			if KilledUnit:GetUnitName() == "npc_dust_2_boss" then
				Quest:UpdateCounter('dust_2', 2)
				StopListeningToGameEvent(self.listen_kill)
			end
		end
		
		--	StopListeningToGameEvent(self.listen_kill)
	--	end
	end		
end 

function dust_2:spawn_cocons()
	for i = 1, 55 do
		local point = Entities:FindByName(nil, "cocon_point_"..i):GetAbsOrigin()
		local unit = CreateUnitByName("npc_dust_creep_egg", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		Rules:SetAbilityLevel(unit)
	end
	Rules:clear(55, "cocon_point_")
end

