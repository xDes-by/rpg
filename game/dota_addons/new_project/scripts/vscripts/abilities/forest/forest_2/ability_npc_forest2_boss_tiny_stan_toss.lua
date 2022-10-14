ability_npc_forest2_boss_tiny_stan_toss = class({})

LinkLuaModifier( "modifier_ability_npc_forest2_boss_tiny_stan","abilities/forest2/ability_npc_forest2_boss_tiny_stan_toss", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_forest2_boss_tiny_toss","abilities/forest2/ability_npc_forest2_boss_tiny_stan_toss", LUA_MODIFIER_MOTION_NONE )

function ability_npc_forest2_boss_tiny_stan_toss:OnSpellStart()
    if IsClient() then
        return
    end
	self.pos = AICore:WeakestEnemyHeroInRange( self:GetCaster(), 600 ):GetAbsOrigin()
    CreateModifierThinker(self:GetCaster(), self, "modifier_ability_npc_forest2_boss_tiny_stan", {duration = 1.2}, self.pos, self:GetCaster():GetTeamNumber(), false)
	self:GetCursorTarget():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_forest2_boss_tiny_toss", {})
end

modifier_ability_npc_forest2_boss_tiny_stan = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_ability_npc_forest2_boss_tiny_stan:IsHidden()
	return true
end

function modifier_ability_npc_forest2_boss_tiny_stan:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_ability_npc_forest2_boss_tiny_stan:OnCreated( kv )
	self.duration = 3
	self.radius = 350
	self.damageTable = {
		-- victim = target,
		attacker = self:GetCaster(),
		damage = damage,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self:GetAbility(), --Optional.
	}
	-- ApplyDamage(damageTable)
end

function modifier_ability_npc_forest2_boss_tiny_stan:OnDestroy()
	if not IsServer() then return end

	-- find enemies
	local enemies = FindUnitsInRadius(
		self:GetCaster():GetTeamNumber(),	-- int, your team number
		self:GetParent():GetAbsOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		self.radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
		0,	-- int, flag filter
		0,	-- int, order filter
		false	-- bool, can grow cache
	)

	for _,enemy in pairs(enemies) do
		-- stun
		enemy:AddNewModifier(
			self:GetCaster(), -- player source
			self:GetAbility(), -- ability source
			"modifier_stunned", -- modifier name
			{ duration = self.duration } -- kv
		)
	end

	-- play effects
	self:PlayEffects()

	UTIL_Remove( self:GetParent() )
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_ability_npc_forest2_boss_tiny_stan:PlayEffects()
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_leshrac/leshrac_split_earth.vpcf"
	local sound_cast = "Hero_Leshrac.Split_Earth"

	-- -- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetAbsOrigin() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( self.radius, 0, 0 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )

	-- Create Sound
	EmitSoundOnLocationWithCaster( self:GetParent():GetAbsOrigin(), sound_cast, self:GetCaster() )
end

modifier_ability_npc_forest2_boss_tiny_toss = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_ability_npc_forest2_boss_tiny_toss:IsHidden()
	return true
end

function modifier_ability_npc_forest2_boss_tiny_toss:IsDebuff()
	return self:GetCaster():GetTeamNumber()~=self:GetParent():GetTeamNumber()
end

function modifier_ability_npc_forest2_boss_tiny_toss:IsStunDebuff()
	return true
end

function modifier_ability_npc_forest2_boss_tiny_toss:IsPurgable()
	return true
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_ability_npc_forest2_boss_tiny_toss:OnCreated( kv )
	self.caster = self:GetCaster()
	self.parent = self:GetParent()

	if not IsServer() then return end
	local duration = 1
	local height = 850
	local origin = self:GetAbility().pos
	local direction = origin-self.parent:GetAbsOrigin()
	local distance = direction:Length2D()
	-- add arc modifier for vertical only
	self.arc = self.parent:AddNewModifier(
		self.caster, -- player source
		self:GetAbility(), -- ability source
		"modifier_generic_arc_lua", -- modifier name
		{
			target_x = origin.x,
			target_y = origin.y,
			duration = duration,
			distance = distance,
			height = height,
			speed = distance,
			fix_duration = false,
			isStun = true,
			activity = ACT_DOTA_FLAIL,
		} -- kv
	)
	self.arc:SetEndCallback(function( interrupted )
		-- destroy this modifier
		self:Destroy()

		-- not damage if interrupted
		if interrupted then return end

		-- play effects
		local sound_cast = "Ability.TossImpact"
		EmitSoundOn( sound_cast, self.parent )
	end)

	-- emit sound
	local sound_cast = "Ability.TossThrow"
	local sound_target = "Hero_Tiny.Toss.Target"
	EmitSoundOn( sound_cast, self.caster )
	EmitSoundOn( sound_target, self.parent )
end

function modifier_ability_npc_forest2_boss_tiny_toss:OnRefresh( kv )
	
end

function modifier_ability_npc_forest2_boss_tiny_toss:OnRemoved()
end

function modifier_ability_npc_forest2_boss_tiny_toss:OnDestroy()
	if not IsServer() then return end
	self:GetParent():RemoveHorizontalMotionController( self )
end

--------------------------------------------------------------------------------
-- Status Effects
function modifier_ability_npc_forest2_boss_tiny_toss:CheckState()
	local state = {
		[MODIFIER_STATE_STUNNED] = true,
	}

	return state
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_ability_npc_forest2_boss_tiny_toss:GetEffectName()
	return "particles/units/heroes/hero_tiny/tiny_toss_blur.vpcf"
end

function modifier_ability_npc_forest2_boss_tiny_toss:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

