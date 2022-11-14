if jungle_1 == nil then
	jungle_1 = class({})
end

function jungle_1:Init()
	self.listen_kill = ListenToGameEvent("entity_killed", Dynamic_Wrap( self, 'OnEntityKilled' ), self )
	self:start_quest()
	self:spawn_creeps()
end

function jungle_1:start_quest()
	Timers:CreateTimer(3.5, function() --таймер для старта квеста после телепортации!
		local hRelay = Entities:FindByName( nil, "jungle_1_logic" )
		hRelay:Trigger(nil,nil)	
		Quest:MapActivate('jungle_1')
	end)
end

function jungle_1:OnEntityKilled(keys)
	local KilledUnit = EntIndexToHScript( keys.entindex_killed )
	if KilledUnit:GetUnitName() == "npc_jungle_dragon" and KilledUnit:HasModifier("modifier_jungle_dragon") then
		--ggwp
	end
	
	if KilledUnit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
		if KilledUnit:GetUnitName() == "npc_jungle_1_boss" then
			Quest:UpdateCounter('jungle_1', 2)
			StopListeningToGameEvent(self.listen_kill)
		end
	end	
end 

function jungle_1:spawn_creeps()
	Timers:CreateTimer(5, function()
	local point = Entities:FindByName( nil, "jungle_point"):GetAbsOrigin()
	local unit = CreateUnitByName("npc_jungle_dragon", point, true, nil, nil, DOTA_TEAM_GOODGUYS)
	unit:SetBaseDamageMin(10 * Events.round)
	unit:SetBaseDamageMax(10 * Events.round)
	unit:SetMaxHealth(2000 * Events.round)
	unit:SetBaseMaxHealth(2000 * Events.round)
	unit:SetHealth(2000 * Events.round)
	
	Rules:SetAbilityLevel(unit)
	local point = Entities:FindByName( nil, "path1") 				
		if point then	
			unit:SetInitialGoalEntity(point)
			unit:AddNewModifier(unit, nil, "modifier_jungle_dragon", nil)
			-- unit:AddNewModifier(unit, nil, "modifier_phased", nil)
		end	
	end)

	local count = 0
	Timers:CreateTimer(0, function()
	if count < 39 then
		count = count + 1
		local point = Entities:FindByName( nil, "jungle_1_creep_spawn_"..count):GetAbsOrigin()
			for i = 1, 5 do
				if i == 1 then 
					local unit = CreateUnitByName("npc_jungle_creep_big_1", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
					Rules:unit_settings(unit, "creep", "big", 78, 117, 100)
					Rules:SetAbilityLevel(unit)
				elseif i == 2 then
					local unit = CreateUnitByName("npc_jungle_creep_big_2", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
					Rules:unit_settings(unit, "creep", "big", 78, 117, 100)
					Rules:SetAbilityLevel(unit)
				else
					local unit = CreateUnitByName("npc_jungle_creep_mini_1", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
					Rules:unit_settings(unit, "creep", "mini", 78, 117, 100)
					Rules:SetAbilityLevel(unit)
				end	
			end
		return 0.1
	else
		Rules:clear(count, "jungle_1_creep_spawn_")
		return nil
		end
	end)
end

function quest_complite(keys)
	Quest:UpdateCounter('jungle_1', 1)
	keys.activator:RemoveModifierByName("modifier_jungle_dragon")
end

-------------------------------------------------------------------------------------------------