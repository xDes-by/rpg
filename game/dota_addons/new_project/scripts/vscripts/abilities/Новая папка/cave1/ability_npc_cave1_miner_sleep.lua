ability_npc_cave1_miner_sleep = class({})

LinkLuaModifier( "modidfier_ability_npc_cave1_miner_sleep","abilities/cave1/ability_npc_cave1_miner_sleep", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modidfier_ability_npc_cave1_miner_sleep_effect","abilities/cave1/ability_npc_cave1_miner_sleep", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modidfier_ability_npc_cave1_miner_sleep_phantom_ubstruction","abilities/cave1/ability_npc_cave1_miner_sleep", LUA_MODIFIER_MOTION_NONE )
modidfier_ability_npc_cave1_miner_sleep_phantom_ubstruction = class({})

function ability_npc_cave1_miner_sleep:GetIntrinsicModifierName()
	return "modidfier_ability_npc_cave1_miner_sleep"
end

modidfier_ability_npc_cave1_miner_sleep = class({})

function modidfier_ability_npc_cave1_miner_sleep:IsHidden()
    return true
end

function modidfier_ability_npc_cave1_miner_sleep:IsPurgable()
    return false
end

function modidfier_ability_npc_cave1_miner_sleep:CheckState()
	return {
		[MODIFIER_STATE_COMMAND_RESTRICTED] = true
	}
end

function modidfier_ability_npc_cave1_miner_sleep:OnCreated()
	if IsClient() then
		return
	end
	self:GetCaster():StartGesture(ACT_DOTA_FLAIL)
end

function modidfier_ability_npc_cave1_miner_sleep:DeclareFunctions()
    return {
       	MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE
    }
end

function modidfier_ability_npc_cave1_miner_sleep:GetEffectName()
	return "particles/generic_gameplay/generic_sleep.vpcf"
end

function modidfier_ability_npc_cave1_miner_sleep:GetEffectAttachType()
	return PATTACH_OVERHEAD_FOLLOW
end

function modidfier_ability_npc_cave1_miner_sleep:GetModifierIncomingDamage_Percentage(data)
	return -100
end

-- Aura template
function modidfier_ability_npc_cave1_miner_sleep:IsAura()
	return true
end

function modidfier_ability_npc_cave1_miner_sleep:GetModifierAura()
	return "modidfier_ability_npc_cave1_miner_sleep_effect"
end

function modidfier_ability_npc_cave1_miner_sleep:GetAuraRadius()
	return 200
end

function modidfier_ability_npc_cave1_miner_sleep:GetAuraDuration()
	return 0.5
end

function modidfier_ability_npc_cave1_miner_sleep:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modidfier_ability_npc_cave1_miner_sleep:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modidfier_ability_npc_cave1_miner_sleep:GetAuraSearchFlags()
	return DOTA_UNIT_TARGET_FLAG_NONE
end

modidfier_ability_npc_cave1_miner_sleep_effect = class({})

function modidfier_ability_npc_cave1_miner_sleep_effect:IsHidden()
	return true
end

function modidfier_ability_npc_cave1_miner_sleep_effect:OnCreated()
	if IsClient() then
		return
	end
	self:GetCaster():RemoveGesture(ACT_DOTA_FLAIL)
	local ubstruction = MapLogic.cave1_ubstruction_point[self:GetCaster().CaveNumber]
	MapLogic.cave1blocker = CreateModifierThinker(
		self:GetCaster(), -- player source
		self:GetAbility(), -- ability source
		"modidfier_ability_npc_cave1_miner_sleep_phantom_ubstruction", -- modifier name
		{}, -- kv
		ubstruction,
		self:GetCaster():GetTeamNumber(),
		true
	)
	MapLogic.cave1blocker:SetHullRadius( 200 )
	MapLogic:Cave1StartCreepSpawning()
	local particle_cast = "particles/units/heroes/hero_treant/treant_bramble_root.vpcf"
	self.effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( self.effect_cast, 0, ubstruction )
	ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( 200, 200, 200 ) )

	local TargetPoint = MapLogic.cave1_move_point[self:GetCaster().CaveNumber]
	local caster = self:GetCaster()
	local ability = self:GetAbility()
	for nPlayerID=0,DOTA_MAX_PLAYERS-1 do
		local hHero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
		Timers:CreateTimer(0.03,function()
			if hero == nil then
				return 0.03
			end
			if hHero ~= self:GetParent() then
				local direction = hHero:GetAbsOrigin() - TargetPoint
				local distance = direction:Length2D()
				hHero:AddNewModifier(
				caster, -- player source
				ability, -- ability source
				"modifier_generic_arc_lua", -- modifier name
				{
					target_x = TargetPoint.x,
					target_y = TargetPoint.y,
					duration = 1,
					distance = distance,
					height = 850,
					speed = distance,
					fix_duration = false,
					isStun = true,
					activity = ACT_DOTA_FLAIL,
				}) -- kv
			end
		end)
	end
	self:GetCaster():RemoveModifierByName("modidfier_ability_npc_cave1_miner_sleep")
end
