function start_shot()
	thisEntity:SetContextThink( "shot_1", shot_1, 0.5 )
	thisEntity:SetContextThink( "shot_2", shot_2, 1.5 )
	thisEntity:SetContextThink( "shot_3", shot_3, 0.5 )
	thisEntity:SetContextThink( "shot_4", shot_4, 0.5 )
	thisEntity:SetContextThink( "shot_5", shot_5, 0.8 )
	thisEntity:SetContextThink( "shot_6", shot_6, 0.5 )
	thisEntity:SetContextThink( "shot_7", shot_7, 0.5 ) --oneshotfast
	thisEntity:SetContextThink( "shot_8", shot_8, 0.5 )
	thisEntity:SetContextThink( "shot_9", shot_9, 0.5 )
	thisEntity:SetContextThink( "shot_10", shot_10, 1.0 )
	thisEntity:SetContextThink( "shot_11", shot_11, 1.0 )
	thisEntity:SetContextThink( "shot_12", shot_12, 1.0 )
	thisEntity:SetContextThink( "shot_13", shot_13, 1.0 )
	thisEntity:SetContextThink( "shot_14", shot_14, 0.5 ) --oneshotfast
	thisEntity:SetContextThink( "shot_15", shot_15, 0.5 ) --oneshotfast
	thisEntity:SetContextThink( "shot_16", shot_16, 0.7)
	thisEntity:SetContextThink( "shot_17", shot_17, 1.0)
	thisEntity:SetContextThink( "shot_18", shot_18, 1.1)
	thisEntity:SetContextThink( "shot_19", shot_19, 1.1)
	thisEntity:SetContextThink( "shot_20", shot_20, 1.1)
	
	for nPlayerID = 0, DOTA_MAX_TEAM_PLAYERS-1 do
		if PlayerResource:GetTeam( nPlayerID ) == DOTA_TEAM_GOODGUYS then
			if PlayerResource:HasSelectedHero( nPlayerID ) then
				local hero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
				if not hero:IsAlive() then
					hero:RespawnHero(false, false)
				end
				hero:SetHealth( hero:GetMaxHealth() )
				hero:SetMana( hero:GetMaxMana() )
				hero:AddNewModifier( hero, nil, "modifier_tutorial_disable_healing", {} )
			end
		end
	end
end

trap_1_shots = 3
trap_2_shots = 2
trap_3_shots = 3
trap_4_shots = 2
trap_5_shots = 1
trap_6_shots = 3
trap_7_shots = 1
trap_8_shots = 4
trap_9_shots = 2
trap_10_shots = 3
trap_11_shots = 1
trap_12_shots = 1
trap_13_shots = 1
trap_14_shots = 1
trap_15_shots = 1
trap_16_shots = 3
trap_17_shots = 2
trap_18_shots = 2
trap_19_shots = 3
trap_20_shots = 2

--------------------------------------------------------------------------------------------------------------

_G.All_traps = true

--------------------------------------------------------------------------------------------------------------

function DisableAllTrap()
	_G.All_traps = false
	for nPlayerID = 0, DOTA_MAX_TEAM_PLAYERS-1 do
		if PlayerResource:GetTeam( nPlayerID ) == DOTA_TEAM_GOODGUYS then
			if PlayerResource:HasSelectedHero( nPlayerID ) then
				local hero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
				hero:RemoveModifierByName("modifier_tutorial_disable_healing")
			end
		end
	end
	for i = 1, 20 do
		Rules:clear(1, i.."_venom_trap_npc")
		Rules:clear(1, i.."_venom_trap_target")
	end	
end

--------------------------------------------------------------------------------------------------------------

function shot_1()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_1_shots > 0 then
		trap_1_shots = trap_1_shots - 1
		local npc = Entities:FindByName( nil, "1_venom_trap_npc" )
		local target = Entities:FindByName( nil, "1_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("auto_shot")
			local model = "1_venom_trap_model"
			DoEntFire( model, "SetAnimation", "bark_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return 0.4
	else
	trap_1_shots = 3
		return 1
	end	
end

--------------------------------------------------------------------------------------------------------------

function shot_2()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_2_shots > 0 then
		trap_2_shots = trap_2_shots - 1
		local npc = Entities:FindByName( nil, "2_venom_trap_npc" )
		local target = Entities:FindByName( nil, "2_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("auto_shot")
			local model = "2_venom_trap_model"
			DoEntFire( model, "SetAnimation", "bark_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return 0.6
	else
	trap_2_shots = 2
		return 1
	end	
end

--------------------------------------------------------------------------------------------------------------

function shot_3()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_3_shots > 0 then
		trap_3_shots = trap_3_shots - 1
		local npc = Entities:FindByName( nil, "3_venom_trap_npc" )
		local target = Entities:FindByName( nil, "3_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("auto_shot")
			local model = "3_venom_trap_model"
			DoEntFire( model, "SetAnimation", "bark_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return 0.8
	else
	trap_3_shots = 3
		return 1
	end	
end

--------------------------------------------------------------------------------------------------------------

function shot_4()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_4_shots > 0 then
		trap_4_shots = trap_4_shots - 1
		local npc = Entities:FindByName( nil, "4_venom_trap_npc" )
		local target = Entities:FindByName( nil, "4_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("auto_shot")
			local model = "4_venom_trap_model"
			DoEntFire( model, "SetAnimation", "bark_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return 0.6
	else
	trap_4_shots = 2
		return 1
	end	
end

--------------------------------------------------------------------------------------------------------------

function shot_5()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_5_shots > 0 then
		trap_5_shots = trap_3_shots - 1
		local npc = Entities:FindByName( nil, "5_venom_trap_npc" )
		local target = Entities:FindByName( nil, "5_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("auto_shot")
			local model = "5_venom_trap_model"
			DoEntFire( model, "SetAnimation", "bark_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return 0.8
	else
	trap_5_shots = 1
		return 1
	end	
end

-------------------------------------------------------------------------

function shot_6()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_6_shots > 0 then
		trap_6_shots = trap_6_shots - 1
		local npc = Entities:FindByName( nil, "6_venom_trap_npc" )
		local target = Entities:FindByName( nil, "6_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("auto_shot")
			local model = "6_venom_trap_model"
			DoEntFire( model, "SetAnimation", "bark_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return 0.4
	else
	trap_6_shots = 3
		return 1
	end	
end

-------------------------------------------------------------------------

function shot_7()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_7_shots > 0 then
		trap_7_shots = trap_7_shots - 1
		local npc = Entities:FindByName( nil, "7_venom_trap_npc" )
		local target = Entities:FindByName( nil, "7_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("arrow_shot")
			local model = "7_venom_trap_model"
			DoEntFire( model, "SetAnimation", "fang_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return 1
	else
	trap_7_shots = 1
		return 1
	end	
end

-------------------------------------------------------------------------

function shot_8()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_8_shots > 0 then
		trap_8_shots = trap_8_shots - 1
		local npc = Entities:FindByName( nil, "8_venom_trap_npc" )
		local target = Entities:FindByName( nil, "8_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("auto_shot")
			local model = "8_venom_trap_model"
			DoEntFire( model, "SetAnimation", "bark_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return RandomFloat(0.4, 1.0)
	else
	trap_8_shots = 4
		return 1.2
	end	
end

-------------------------------------------------------------------------

function shot_9()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_9_shots > 0 then
		trap_9_shots = trap_9_shots - 1
		local npc = Entities:FindByName( nil, "9_venom_trap_npc" )
		local target = Entities:FindByName( nil, "9_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("auto_shot")
			local model = "9_venom_trap_model"
			DoEntFire( model, "SetAnimation", "bark_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return 0.8
	else
	trap_9_shots = 2
		return 1.2
	end	
end

-------------------------------------------------------------------------

function shot_10()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_10_shots > 0 then
		trap_10_shots = trap_10_shots - 1
		local npc = Entities:FindByName( nil, "10_venom_trap_npc" )
		local target = Entities:FindByName( nil, "10_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("auto_shot")
			local model = "10_venom_trap_model"
			DoEntFire( model, "SetAnimation", "bark_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return 0.9
	else
	trap_10_shots = 3
		return 1.8
	end	
end

-------------------------------------------------------------------------

function shot_11()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_11_shots > 0 then
		trap_11_shots = trap_11_shots - 1
		local npc = Entities:FindByName( nil, "11_venom_trap_npc" )
		local target = Entities:FindByName( nil, "11_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("auto_shot")
			local model = "11_venom_trap_model"
			DoEntFire( model, "SetAnimation", "bark_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return 1
	else
	trap_11_shots = 1
		return 1
	end	
end

-------------------------------------------------------------------

function shot_12()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_12_shots > 0 then
		trap_12_shots = trap_12_shots - 1
		local npc = Entities:FindByName( nil, "12_venom_trap_npc" )
		local target = Entities:FindByName( nil, "12_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("auto_shot")
			local model = "12_venom_trap_model"
			DoEntFire( model, "SetAnimation", "bark_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return 1
	else
	trap_12_shots = 1
		return 1
	end	
end


-------------------------------------------------------------------

function shot_13()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_13_shots > 0 then
		trap_13_shots = trap_13_shots - 1
		local npc = Entities:FindByName( nil, "13_venom_trap_npc" )
		local target = Entities:FindByName( nil, "13_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("auto_shot")
			local model = "13_venom_trap_model"
			DoEntFire( model, "SetAnimation", "bark_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return 1
	else
	trap_13_shots = 1
		return 1
	end	
end

------------------------------------------------------------------------

function shot_14()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_14_shots > 0 then
		trap_14_shots = trap_14_shots - 1
		local npc = Entities:FindByName( nil, "14_venom_trap_npc" )
		local target = Entities:FindByName( nil, "14_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("arrow_shot")
			local model = "14_venom_trap_model"
			DoEntFire( model, "SetAnimation", "fang_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return 1.2
	else
	trap_14_shots = 1
		return 1.2
	end	
end


-----------------------------------------------------------------

function shot_15()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_15_shots > 0 then
		trap_15_shots = trap_15_shots - 1
		local npc = Entities:FindByName( nil, "15_venom_trap_npc" )
		local target = Entities:FindByName( nil, "15_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("arrow_shot")
			local model = "15_venom_trap_model"
			DoEntFire( model, "SetAnimation", "fang_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return 1
	else
	trap_15_shots = 1
		return 1
	end	
end

-------------------------------------------------------------------------

function shot_16()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_16_shots > 0 then
		trap_16_shots = trap_16_shots - 1
		local npc = Entities:FindByName( nil, "16_venom_trap_npc" )
		local target = Entities:FindByName( nil, "16_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("auto_shot")
			local model = "16_venom_trap_model"
			DoEntFire( model, "SetAnimation", "bark_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return RandomFloat(0.4, 1.0)
	else
	trap_16_shots = 3
		return 1.2
	end	
end

-------------------------------------------------------------------------

function shot_17()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_17_shots > 0 then
		trap_17_shots = trap_17_shots - 1
		local npc = Entities:FindByName( nil, "17_venom_trap_npc" )
		local target = Entities:FindByName( nil, "17_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("auto_shot")
			local model = "17_venom_trap_model"
			DoEntFire( model, "SetAnimation", "bark_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return RandomFloat(0.8, 1.2)
	else
	trap_17_shots = 2
		return 1.2
	end	
end

-------------------------------------------------------------------------

function shot_18()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_18_shots > 0 then
		trap_18_shots = trap_18_shots - 1
		local npc = Entities:FindByName( nil, "18_venom_trap_npc" )
		local target = Entities:FindByName( nil, "18_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("auto_shot")
			local model = "18_venom_trap_model"
			DoEntFire( model, "SetAnimation", "bark_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return RandomFloat(0.8, 1.0)
	else
	trap_18_shots = 2
		return 1.0
	end	
end

-------------------------------------------------------------------------

function shot_19()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_19_shots > 0 then
		trap_19_shots = trap_19_shots - 1
		local npc = Entities:FindByName( nil, "19_venom_trap_npc" )
		local target = Entities:FindByName( nil, "19_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("auto_shot")
			local model = "19_venom_trap_model"
			DoEntFire( model, "SetAnimation", "bark_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return 0.8
	else
	trap_19_shots = 3
		return 1.4
	end	
end

-------------------------------------------------------------------------

function shot_20()
	if not IsServer() then
		return
	end
	
	if All_traps == false then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if trap_20_shots > 0 then
		trap_20_shots = trap_20_shots - 1
		local npc = Entities:FindByName( nil, "20_venom_trap_npc" )
		local target = Entities:FindByName( nil, "20_venom_trap_target" )
		if npc ~= nil then
			local venomTrap = npc:FindAbilityByName("auto_shot")
			local model = "20_venom_trap_model"
			DoEntFire( model, "SetAnimation", "bark_attack", .4, self, self )
			npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		end
		return RandomFloat(0.8, 1.0)
	else
	trap_20_shots = 2
		return 1.0
	end	
end