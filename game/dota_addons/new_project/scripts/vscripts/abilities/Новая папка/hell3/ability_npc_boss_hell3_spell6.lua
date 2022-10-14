ability_npc_boss_hell3_spell6 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_hell3_spell6","abilities/hell3/ability_npc_boss_hell3_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_hell3_spell6_doom","abilities/hell3/ability_npc_boss_hell3_spell6", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_hell3_spell6:GetChannelTime()
    return 12
end

function ability_npc_boss_hell3_spell6:OnSpellStart()
    self.mod = self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_hell3_spell6", {duration = self:GetSpecialValueFor("duration")})
end

function ability_npc_boss_hell3_spell6:OnChannelFinish(bInterrupted)
    self.mod:Destroy()
end

modifier_ability_npc_boss_hell3_spell6 = class({})
--Classifications template
function modifier_ability_npc_boss_hell3_spell6:IsHidden()
    return false
end

function modifier_ability_npc_boss_hell3_spell6:IsPurgable()
    return false
end

function modifier_ability_npc_boss_hell3_spell6:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_hell3_spell6:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_hell3_spell6:OnCreated()
    self.pos = self:GetCaster():GetOrigin()
    self.radius = self:GetAbility():GetSpecialValueFor("radius")
    self:StartIntervalThink(0.5)
    self:OnIntervalThink()
end

function modifier_ability_npc_boss_hell3_spell6:OnIntervalThink()
    local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self.pos, nil, self.radius, DOTA_UNIT_TARGET_TEAM_ENEMY,DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    if #enemies > 0 then
        table.random(enemies):AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_ability_npc_boss_hell3_spell6_doom", {duration = 2})
    end
end

function modifier_ability_npc_boss_hell3_spell6:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION_RATE,
        MODIFIER_PROPERTY_TRANSLATE_ACTIVITY_MODIFIERS,       
    }
end

function modifier_ability_npc_boss_hell3_spell6:GetOverrideAnimation()
    return ACT_DOTA_TAUNT
end

function modifier_ability_npc_boss_hell3_spell6:GetOverrideAnimationRate()
    return 0.5
end

function modifier_ability_npc_boss_hell3_spell6:GetActivityTranslationModifiers()
    return "doom_2021_taunt"
end

modifier_ability_npc_boss_hell3_spell6_doom = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_ability_npc_boss_hell3_spell6_doom:IsHidden()
	return false
end

function modifier_ability_npc_boss_hell3_spell6_doom:IsDebuff()
	return true
end

function modifier_ability_npc_boss_hell3_spell6_doom:IsStunDebuff()
	return false
end

function modifier_ability_npc_boss_hell3_spell6_doom:IsPurgable()
	return false
end

function modifier_ability_npc_boss_hell3_spell6_doom:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_ability_npc_boss_hell3_spell6_doom:OnCreated( kv )
	-- references
	local damage = self:GetAbility():GetSpecialValueFor( "damage" ) / 10
	self.interval = 0.1
	if not IsServer() then return end
	self.damageTable = {
		victim = self:GetParent(),
		attacker = self:GetCaster(),
		damage = damage,
		damage_type = DAMAGE_TYPE_PURE,
		ability = self:GetAbility(), --Optional.
	}
	self:StartIntervalThink( self.interval )
    self:OnIntervalThink()
	self:PlayEffects()
end

function modifier_ability_npc_boss_hell3_spell6_doom:OnDestroy()
	if not IsServer() then return end
	-- stop sound
	local sound_cast = "Hero_DoomBringer.Doom"
	StopSoundOn( sound_cast, self:GetParent() )
end

--------------------------------------------------------------------------------
-- Status Effects
function modifier_ability_npc_boss_hell3_spell6_doom:CheckState()
	return {
		[MODIFIER_STATE_SILENCED] = true,
		[MODIFIER_STATE_MUTED] = true,
		[MODIFIER_STATE_PASSIVES_DISABLED] = true,
	}
end

function modifier_ability_npc_boss_hell3_spell6_doom:OnIntervalThink()
	ApplyDamage( self.damageTable )
end

function modifier_ability_npc_boss_hell3_spell6_doom:GetStatusEffectName()
	return "particles/status_fx/status_effect_doom.vpcf"
end

function modifier_ability_npc_boss_hell3_spell6_doom:StatusEffectPriority()
	return MODIFIER_PRIORITY_SUPER_ULTRA
end

function modifier_ability_npc_boss_hell3_spell6_doom:PlayEffects()
	local particle_cast = "particles/units/heroes/hero_doom_bringer/doom_bringer_doom.vpcf"
	local sound_cast = "Hero_DoomBringer.Doom"

	-- Create Particle
	 local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	--local effect_cast = assert(loadfile("lua_abilities/rubick_spell_steal_lua/rubick_spell_steal_lua_arcana"))(self, particle_cast, PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	-- ParticleManager:SetParticleControl( effect_cast, iControlPoint, vControlVector )

	-- buff particle
	self:AddParticle(
		effect_cast,
		false, -- bDestroyImmediately
		false, -- bStatusEffect
		MODIFIER_PRIORITY_SUPER_ULTRA, -- iPriority
		false, -- bHeroEffect
		false -- bOverheadEffect
	)

	-- Create Sound
	EmitSoundOn( sound_cast, self:GetParent() )
end

