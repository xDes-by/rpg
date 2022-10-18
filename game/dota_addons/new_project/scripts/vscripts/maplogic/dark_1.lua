if dark_1 == nil then
	dark_1 = class({})
end

function dark_1:Init()
	self.listen_kill = ListenToGameEvent("entity_killed", Dynamic_Wrap( self, 'OnEntityKilled' ), self )
	dark_1:spawn_cocons()
	dark_1:start_quest()
	self.count = 35
end

function dark_1:start_quest()
	Timers:CreateTimer(3.5, function() --таймер для старта квеста после телепортации!
		local hRelay = Entities:FindByName( nil, "dark_1_logic" )
		hRelay:Trigger(nil,nil)	
		Quest:MapActivate('dark_1')
	end)
end

function dark_1:OnEntityKilled(keys)
	local KilledUnit = EntIndexToHScript( keys.entindex_killed )
	if KilledUnit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
		if self.count > 0 then
			if KilledUnit:GetUnitName() == "npc_dark_tomb" then
				Quest:UpdateCounter('dark_1', 1)
				self.count = self.count - 1
			end
		else
			StopListeningToGameEvent(self.listen_kill)
		end
	end		
end 

function dark_1:spawn_cocons()
	for i = 1, 7 do
		local point = Entities:FindByName(nil, "dark_tomb_spawn_"..i):GetAbsOrigin()
		for i = 1, 5 do
			local angle = RandomInt(0, 360)
			local variance = RandomInt(-450, 450)
			local dy = math.sin(angle) * variance
			local dx = math.cos(angle) * variance
			local sp_point = Vector(point.x + dx, point.y + dy, point.z)
		
			local unit = CreateUnitByName("npc_dark_tomb", sp_point, true, nil, nil, DOTA_TEAM_BADGUYS)
			local angle = unit:GetAngles()
			local new_angle = RotateOrientation(angle, QAngle(0,RandomInt(0, 360),0))
			unit:SetAngles(new_angle[1], new_angle[2], new_angle[3])
		end	
	end
	Rules:clear(7, "dark_tomb_spawn_")
end

