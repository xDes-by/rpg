npc_dota_hero_dazzle_spell1 = class({})
LinkLuaModifier( "modifier_dazzle_skill_1", "heroes/npc_dota_hero_dazzle/npc_dota_hero_dazzle_spell1.lua", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_dazzle_spell1:GetAOERadius()
	return self:GetSpecialValueFor( "radius" )
end

function npc_dota_hero_dazzle_spell1:OnSpellStart()
	local caster = self:GetCaster()
	local point = self:GetCursorPosition()

	local damage = self:GetSpecialValueFor("damage")
	local radius = self:GetSpecialValueFor("radius")
	local debuffDuration = self:GetSpecialValueFor("duration")

	local enemies = FindUnitsInRadius( self:GetCaster():GetTeamNumber(), self:GetCursorPosition(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false )
	for _,enemy in pairs(enemies) do
		enemy:AddNewModifier( self:GetCaster(), self, "modifier_dazzle_skill_1", { duration = debuffDuration } )
	end

	self:PlayEffects( point )
end


function npc_dota_hero_dazzle_spell1:PlayEffects( point )
	local particle_cast = "particles/units/heroes/hero_dazzle/dazzle_weave.vpcf"
	local sound_cast = "Hero_Dazzle.Weave"

	local radius = self:GetSpecialValueFor("radius")
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( effect_cast, 0, point )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( radius, 0, 0 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )

	EmitSoundOnLocationWithCaster( point, sound_cast, self:GetCaster() )
end

-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------

modifier_dazzle_skill_1 = class({})

function modifier_dazzle_skill_1:IsHidden()
	return false
end

function modifier_dazzle_skill_1:IsDebuff()
	return true
end

function modifier_dazzle_skill_1:IsPurgable()
	return true
end

function modifier_dazzle_skill_1:OnCreated( kv )
	local damage = self:GetAbility():GetSpecialValueFor( "damage" )
	self.slow = self:GetAbility():GetSpecialValueFor( "slow" )
	self.duration = kv.duration

	if not IsServer() then return end
	self.damageTable = {
		victim = self:GetParent(),
		attacker = self:GetCaster(),
		damage = damage,
		damage_type = self:GetAbility():GetAbilityDamageType(),
	}
	ApplyDamage( self.damageTable )

	self:StartIntervalThink( 1 )
	self:OnIntervalThink()
end


function modifier_dazzle_skill_1:OnIntervalThink()
	ApplyDamage( self.damageTable )
	EmitSoundOn( "Hero_Dazzle.Poison_Tick", self:GetParent() )
end

function modifier_dazzle_skill_1:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
	}
	return funcs
end

function modifier_dazzle_skill_1:GetModifierMoveSpeedBonus_Percentage()
	return -self.slow
end

function modifier_dazzle_skill_1:GetEffectName()
	return "particles/units/heroes/hero_dazzle/dazzle_poison_debuff.vpcf"
end

function modifier_dazzle_skill_1:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

function modifier_dazzle_skill_1:GetStatusEffectName()
	return "particles/status_fx/status_effect_poison_dazzle_copy.vpcf"
end