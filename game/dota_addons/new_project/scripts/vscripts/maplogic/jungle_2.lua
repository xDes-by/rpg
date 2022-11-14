if jungle_2 == nil then
	jungle_2 = class({})
end

function jungle_2:Init()
	jungle_2:spawn_totem()
	jungle_2:start_quest()
	jungle_2:spawn_creeps()
	_G.jungle_2.count = 0
end

function jungle_2:start_quest()
	Timers:CreateTimer(3.5, function() --таймер для старта квеста после телепортации!
		local hRelay = Entities:FindByName( nil, "jungle_2_logic" )
		hRelay:Trigger(nil,nil)	
		Quest:MapActivate('jungle_2')
	end)
end

function jungle_2:spawn_totem()
	for i = 1, 7 do
		local point = Entities:FindByName(nil, "jungle_2_totem_"..i):GetAbsOrigin()
		local unit = CreateUnitByName("npc_jangle_totem", point, true, nil, nil, DOTA_TEAM_GOODGUYS)
	end
	Rules:clear(7, "jungle_2_totem_")
end	
			
function jungle_2:spawn_creeps()
	local count = 0
	Timers:CreateTimer(0, function()
	if count < 36 then
		count = count + 1
		local point = Entities:FindByName( nil, "jungle_2_creep_spawn_"..count):GetAbsOrigin() 
			for i = 1, 4 do
				if i ~= 1 then 
					local unit = CreateUnitByName("npc_jungle_2_creep_mini_1", point + RandomVector( RandomInt(-300, 350)), true, nil, nil, DOTA_TEAM_BADGUYS)
					Rules:unit_settings(unit, "creep", "mini", 36, 108, 100)
					Rules:SetAbilityLevel(unit)
				else 
					if count % 2 == 0 then
						local unit = CreateUnitByName("npc_jungle_2_creep_big_1", point + RandomVector( RandomInt(-300, 350)), true, nil, nil, DOTA_TEAM_BADGUYS)
						Rules:unit_settings(unit, "creep", "big", 36, 108, 100)
						Rules:SetAbilityLevel(unit)
					else
						local unit = CreateUnitByName("npc_jungle_2_creep_big_2", point + RandomVector( RandomInt(-300, 350)), true, nil, nil, DOTA_TEAM_BADGUYS)
						Rules:unit_settings(unit, "creep", "big", 36, 108, 100)
						Rules:SetAbilityLevel(unit)
					end
				end	
			end
		return 0.1
	else
		Rules:clear(count, "jungle_2_creep_spawn_")
		return nil
	end
	end)
end