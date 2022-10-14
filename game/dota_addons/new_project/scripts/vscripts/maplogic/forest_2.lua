if forest_2 == nil then
	forest_2 = class({})
end

function forest_2:Init()
	_G.wave_creeps = {}
	_G.forest_2_buttonActiveCount = 0
	_G.forest_2_start_quest_logic = false 
	self.listen = ListenToGameEvent("entity_killed", Dynamic_Wrap( self, 'OnEntityKilled' ), self )
	forest_2:spawn_boxes()
	forest_2:start_quest()
	self.quest_complite_counter = 0
end

function forest_2:OnEntityKilled(keys)
	local KilledUnit = EntIndexToHScript( keys.entindex_killed )
	local killerEntity = EntIndexToHScript( keys.entindex_attacker )
	if KilledUnit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
		for _, units in ipairs( wave_creeps ) do
			for i, hCreep in pairs( units[2] ) do
				if KilledUnit == hCreep then
					units[1] = units[1] - 1
					table.remove( units[2], i )
					print(units[1], "ОСТАЛОСЬ УБИТЬ КРИПОВ")
					print(#units[2], "КРИПОВ В ТАБЛИЦЕ")
					if units[1] == 0 then
						self.quest_complite_counter = self.quest_complite_counter + 1 
						Quest:UpdateCounter('forest_2', 1)
					end
					if self.quest_complite_counter == 5 then
						StopListeningToGameEvent(self.listen)
						Rules:clear(count, "2_forest_spawn_")
					end
				end
			end 
		end
	end
end 

function forest_2:start_quest()
	Timers:CreateTimer(3.5, function() --таймер для старта квеста после телепортации!
		local hRelay = Entities:FindByName( nil, "forest_2_logic" )
		hRelay:Trigger(nil,nil)	
		Quest:MapActivate('forest_2')
	end)
end

function forest_2:spawn_boxes()
	local point = Entities:FindByName( nil, "forest_2_point"):GetAbsOrigin()
	for i = 1, 4 - Rules:PlayersInGameCount() do
		local box = CreateUnitByName("npc_dota_crate", point + RandomVector( RandomInt( 50, 450 )), true, nil, nil, DOTA_TEAM_BADGUYS)
	end
end

local buttonActive = true

function OnStartTouch(trigger)
	if not _G.forest_2_start_quest_logic then
		local triggerName = thisEntity:GetName()
		if not buttonActive then
			return
		end

		buttonActive = false
		local button = triggerName .. "_button"
		_G.forest_2_buttonActiveCount = _G.forest_2_buttonActiveCount + 1 
		
		DoEntFire( button, "SetAnimation", "ancient_trigger001_down", 0, self, self )
		DoEntFire( button, "SetAnimation", "ancient_trigger001_down_idle", .35, self, self )

		local heroIndex = trigger.activator:GetEntityIndex()
		local heroHandle = EntIndexToHScript(heroIndex)
		
		if _G.forest_2_buttonActiveCount == 4 then --4
			_G.forest_2_start_quest_logic = true
			for _, i in pairs(Entities:FindAllByModel( "models/gameplay/breakingcrate_dest.vmdl")) do
				i:ForceKill(false)
			end			
			EmitGlobalSound("Dungeon.SmashCrateShort")
			EmitGlobalSound("underdraft_levelup_2")
			forest_2:spawn_creeps()
		end
	end
end

function OnEndTouch(trigger)
	local triggerName = thisEntity:GetName()
	local heroIndex = trigger.activator:GetEntityIndex()
	local heroHandle = EntIndexToHScript(heroIndex)
	buttonActive = true
	_G.forest_2_buttonActiveCount = _G.forest_2_buttonActiveCount - 1 
	
	local button = triggerName .. "_button"	
	DoEntFire( button, "SetAnimation", "ancient_trigger001_up", 0.5, self, self )
	DoEntFire( button, "SetAnimation", "ancient_trigger001_idle", 0.6, self, self )
end


function forest_2:spawn_creeps()
	local point = Entities:FindByName( nil, "forest_2_point"):GetAbsOrigin()
	local unit = CreateUnitByName("npc_forest_2_fontain", point, true, nil, nil, DOTA_TEAM_GOODGUYS)
	Rules:SetAbilityLevel(unit)

	for i = 1, 5 do
		wave_creeps[i] = {}
		wave_creeps[i][1] = 120
		wave_creeps[i][2] = {}
	end

	local wave_count = 1
	local creep_count = 0
	Timers:CreateTimer(0, function()
		print("Волна № "..wave_count)
		if wave_count < 6 then
			if creep_count < 15 then --15
				creep_count = creep_count + 1
				if creep_count % 5 ~= 0 then
					creep_name = forest_2_creeps[wave_count][1]
					creep_class = "mini"
				else
					creep_name = forest_2_creeps[wave_count][2]
					creep_class = "big"
				end
				for i = 1, 8 do
					local point = Entities:FindByName( nil, "2_forest_spawn_"..i):GetAbsOrigin()
					local unit = CreateUnitByName(creep_name, point, true, nil, nil, DOTA_TEAM_BADGUYS)
					Rules:unit_settings(unit, "creep", creep_class, 120, 480, 20 * wave_count)
					table.insert(wave_creeps[wave_count][2], unit)
				end	
				return 3
			else
				wave_count = wave_count + 1
				creep_count = 0
				return 20
			end
		else
			return nil
		end	
	end)
end
