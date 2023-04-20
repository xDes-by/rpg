LinkLuaModifier( "modifier_npc_dota_hero_abyssal_underlord_spell1", "heroes/npc_dota_hero_abyssal_underlord/npc_dota_hero_abyssal_underlord_spell1", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_abyssal_underlord_spell1 = class({})

function npc_dota_hero_abyssal_underlord_spell1:GetAOERadius()
	return self:GetSpecialValueFor( "radius" )
end

function npc_dota_hero_abyssal_underlord_spell1:OnSpellStart()
	local caster = self:GetCaster()
	local point = self:GetCursorPosition()
	local radius = self:GetSpecialValueFor("radius")
	local bDuration = self:GetSpecialValueFor("duration")
	EmitSoundOn("Hero_AbyssalUnderlord.Firestorm.Start", caster)
	local enemies = FindUnitsInRadius(caster:GetTeamNumber(), point, nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, 0, false)
	for _,enemy in pairs(enemies) do
		enemy:AddNewModifier(caster, self, "modifier_npc_dota_hero_abyssal_underlord_spell1", { duration = bDuration })
	end
	self:PlayEffects( point )
end

function npc_dota_hero_abyssal_underlord_spell1:PlayEffects( point )
	local radius = self:GetSpecialValueFor("radius")
	local effect_cast = ParticleManager:CreateParticle( "particles/under1_1.vpcf", PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( effect_cast, 0, point )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( radius, 0, 0 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )
end

--------------------------------------------------------------------------------------------------

modifier_npc_dota_hero_abyssal_underlord_spell1 = class({})

function modifier_npc_dota_hero_abyssal_underlord_spell1:IsHidden()
	return false
end

function modifier_npc_dota_hero_abyssal_underlord_spell1:IsDebuff()
	return not self.buff
end

function modifier_npc_dota_hero_abyssal_underlord_spell1:IsStunDebuff()
	return false
end

function modifier_npc_dota_hero_abyssal_underlord_spell1:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

function modifier_npc_dota_hero_abyssal_underlord_spell1:IsPurgable()
	return false
end

function modifier_npc_dota_hero_abyssal_underlord_spell1:DeclareFunctions()
    return {
		MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE,
    }
end

function modifier_npc_dota_hero_abyssal_underlord_spell1:GetModifierDamageOutgoing_Percentage(params)
	if not IsServer() then return end
	if params.target == self:GetCaster() then
		return -self:GetAbility():GetSpecialValueFor("damage_block")
	else
		return 0
	end
end

function modifier_npc_dota_hero_abyssal_underlord_spell1:OnCreated( kv )
	self:StartIntervalThink(1)
end

function modifier_npc_dota_hero_abyssal_underlord_spell1:OnIntervalThink()
	ApplyDamage({victim = self:GetParent(),
		damage = self:GetAbility():GetSpecialValueFor("damage_per_sec"),
		damage_type = DAMAGE_TYPE_MAGICAL,
		attacker = self:GetCaster(),
		ability = self})
end

function modifier_npc_dota_hero_abyssal_underlord_spell1:GetEffectName()
	return "particles/under_debuff.vpcf"
end

function modifier_npc_dota_hero_abyssal_underlord_spell1:GetEffectAttachType()
	return PATTACH_OVERHEAD_FOLLOW
end