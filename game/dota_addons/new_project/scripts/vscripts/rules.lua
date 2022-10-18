if Rules == nil then
	Rules = class({})
end

function Rules:Init()
	Rules:SpawnUnitTeleport()
	Rules:Dummy()
end

function Rules:SpawnUnitTeleport()
	self.dummy = CreateUnitByName("npc_select_zone_unit", Vector(-5376, 13445, 386), true, nil, nil, DOTA_TEAM_GOODGUYS )
	self.dummy:SetAngles(0, -90, 0)
	self.dummy:AddNewModifier(nil,nil,"modifier_selector",nil)
	self.dummy.pfxcount = 0
	self.dummy.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_marci/marci_unleash_stack.vpcf", PATTACH_OVERHEAD_FOLLOW, self.dummy)
	ParticleManager:SetParticleControl( self.dummy.pfx, 1, Vector( 0, self.dummy.pfxcount, 0 ) )

	local prt = ParticleManager:CreateParticle("particles/portal_select/portal_forest.vpcf", PATTACH_CUSTOMORIGIN, self.dummy)
	ParticleManager:SetParticleControlEnt(prt, 0, self.dummy, self.dummy:ScriptLookupAttachment("attach_portal"), "attach_portal", self.dummy:GetAbsOrigin(), true)
	ParticleManager:ReleaseParticleIndex(prt)
end

function Rules:PlayersInGameCount()	-- кол-во реальных игроков!
	count = 0
	for nPlayerID = 0, DOTA_MAX_PLAYERS - 1 do
		if PlayerResource:IsValidPlayer(nPlayerID) then
		local connectState = PlayerResource:GetConnectionState(nPlayerID)	
			if bot(nPlayerID) or connectState == DOTA_CONNECTION_STATE_ABANDONED or connectState == DOTA_CONNECTION_STATE_FAILED or connectState == DOTA_CONNECTION_STATE_UNKNOWN then print("player leave") else
				count = count + 1
			end
		end
	end
	return count
end

function bot(nPlayerID)
	return PlayerResource:GetSteamAccountID(nPlayerID) < 1000
end

function Rules:Dummy()
	local hDummy = CreateUnitByName( "npc_dota_hero_target_dummy", Vector(-5700, 13721, 279), true, nil, nil, DOTA_TEAM_BADGUYS)
	local angle = hDummy:GetAngles()
	local new_angle = RotateOrientation(angle, QAngle(0,60,0))
	hDummy:SetAngles(new_angle[1], new_angle[2], new_angle[3])
	
	hDummy:SetAbilityPoints( 0 )
	hDummy:Hold()
	hDummy:SetIdleAcquire( false )
	hDummy:SetAcquisitionRange( 0 )
end

damage = 10
health = 250
armor = 1
resist = 3
regen = 1

boss_damage = 100
boss_health = 15000
boss_armor = 10
boss_resist = 10
boss_regen = 5

function Rules:add_trap_reward()
	for nPlayerID = 0, DOTA_MAX_TEAM_PLAYERS-1 do
		if PlayerResource:HasSelectedHero( nPlayerID ) then
			local hero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
			hero:AddExperience(AddonGamemode.CreepExpZones[Events.round], DOTA_ModifyXP_Unspecified, false, false)
			hero:ModifyGold(AddonGamemode.CreepGoldZones[Events.round], true, 0 )
			SendOverheadEventMessage(hero, OVERHEAD_ALERT_GOLD, hero, gold, nil)
		end
	end
end

function Rules:unit_settings(unit, unit_type, unit_class, count_big, count_mini, scale_percent)	-- параметры юнитов (имя, тип(босс или крип), класс(мелкий или большой), кол-во больших на карте, кол-во мелких на карте, % от максимальных показателей)
	Rules:SetAbilityLevel(unit)
	if count_big ~= 0 and count_mini ~= 0 then
		exp_for_big_creep = AddonGamemode.CreepExpZones[Events.round] * 0.3 / count_big
		exp_for_mini_creep = AddonGamemode.CreepExpZones[Events.round] * 0.7 / count_mini
		gold_for_big_creep = AddonGamemode.CreepGoldZones[Events.round] * 0.3 / count_big
		gold_for_mini_creep = AddonGamemode.CreepGoldZones[Events.round] * 0.7 / count_mini
	else
		exp_for_big_creep = 0
		exp_for_mini_creep = 0
		gold_for_big_creep = 0
		gold_for_mini_creep = 0
	end

	if unit_type == "creep" then
		if unit_class == "mini" then
			unit:SetDeathXP(exp_for_mini_creep)
			unit:SetMinimumGoldBounty(gold_for_mini_creep)
			unit:SetMaximumGoldBounty(gold_for_mini_creep)
			mn = 1
		else
			unit:SetDeathXP(exp_for_big_creep)
			unit:SetMinimumGoldBounty(gold_for_big_creep)
			unit:SetMaximumGoldBounty(gold_for_big_creep)
			mn = 1.5
		end
		unit:SetBaseDamageMin(damage * mn * Events.round^1.5 * (scale_percent/100)) -- расчеты требуют настройки!
		unit:SetBaseDamageMax(damage * mn * Events.round^1.5 * (scale_percent/100))
		unit:SetPhysicalArmorBaseValue(armor * mn * Events.round^1.5 * (scale_percent/100))
		unit:SetBaseMagicalResistanceValue(resist * mn * Events.round^1.5 * (scale_percent/100))
		unit:SetMaxHealth(health * mn * Events.round^1.5 * (scale_percent/100))
		unit:SetBaseMaxHealth(health * mn * Events.round^1.5 * (scale_percent/100))
		unit:SetHealth(health * mn * Events.round^1.5 * (scale_percent/100))	
	end
	if unit_type == "boss" then
		unit:SetBaseDamageMin(boss_damage * Events.round^1.5 * (scale_percent/100))
		unit:SetBaseDamageMax(boss_damage * Events.round^1.5 * (scale_percent/100))
		unit:SetPhysicalArmorBaseValue(boss_armor * Events.round^1.5 * (scale_percent/100))
		unit:SetBaseMagicalResistanceValue(boss_resist * Events.round^1.5 * (scale_percent/100))
		unit:SetMaxHealth(boss_health * Events.round^1.5 * (scale_percent/100))
		unit:SetBaseMaxHealth(boss_health * Events.round^1.5 * (scale_percent/100))
		unit:SetHealth(boss_health * Events.round^1.5 * (scale_percent/100))	
	end
end

function Rules:SetAbilityLevel(unit)	-- прокачка абилок юнитов по уровню раунда
	for i = 0, unit:GetAbilityCount() - 1 do
		local ability = unit:GetAbilityByIndex(i)
		if ability and not ability:IsNull() then
			ability:SetLevel(Events.round)
		end
	end
end

function Rules:clear(count, name)	-- чистка карты от лишних ентити
	Timers:CreateTimer(5, function()
		for i = 1, count do
			local point = Entities:FindByName( nil, name..i)
			if point then
				UTIL_Remove( point )
			end
		end	
	end)
end