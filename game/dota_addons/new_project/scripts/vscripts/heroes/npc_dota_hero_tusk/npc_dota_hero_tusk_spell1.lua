npc_dota_hero_tusk_spell1 = class({})
LinkLuaModifier( "modifier_tusk_skill_1", "heroes/npc_dota_hero_tusk/npc_dota_hero_tusk_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_tusk_skill_1_effect", "heroes/npc_dota_hero_tusk/npc_dota_hero_tusk_spell1", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_tusk_spell1:GetAOERadius()
	return self:GetSpecialValueFor( "radius" )
end

function npc_dota_hero_tusk_spell1:OnSpellStart()
	local debuffDuration = self:GetSpecialValueFor("duration")
	self:GetCaster():AddNewModifier( self:GetCaster(), self, "modifier_tusk_skill_1", { duration = debuffDuration } )
end

-------------------------------------------------------------------------------------------------------------

modifier_tusk_skill_1 = class({})

function modifier_tusk_skill_1:IsHidden()
	return true
end

function modifier_tusk_skill_1:IsDebuff()
	return false
end

function modifier_tusk_skill_1:IsPurgable()
	return false
end

function modifier_tusk_skill_1:IsAura()
	return (not self:GetCaster():PassivesDisabled())
end

function modifier_tusk_skill_1:GetModifierAura()
	return "modifier_tusk_skill_1_effect"
end

function modifier_tusk_skill_1:GetAuraRadius()
	return self:GetAbility():GetSpecialValueFor("radius")
end

function modifier_tusk_skill_1:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_tusk_skill_1:GetAuraSearchType()
	return DOTA_UNIT_TARGET_BASIC
end

function modifier_tusk_skill_1:GetEffectName()
	return "particles/units/heroes/hero_tusk/tusk_tag_team.vpcf"
end

function modifier_tusk_skill_1:StatusEffectPriority()
	return MODIFIER_PRIORITY_ULTRA
end

function modifier_tusk_skill_1:GetEffectAttachType()
	return PATTACH_POINT_FOLLOW
end

-------------------------------------------------------------------------------------------------------------

modifier_tusk_skill_1_effect = class({})

function modifier_tusk_skill_1_effect:IsHidden()
	return false
end

function modifier_tusk_skill_1_effect:IsDebuff()
	return false
end

function modifier_tusk_skill_1_effect:IsPurgable()
	return false
end

function modifier_tusk_skill_1_effect:OnCreated( kv )
	self.damage = self:GetAbility():GetSpecialValueFor( "damage" )
end

function modifier_tusk_skill_1_effect:OnRefresh( kv )
	self.damage = self:GetAbility():GetSpecialValueFor( "damage" )
end

function modifier_tusk_skill_1_effect:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_INCOMING_PHYSICAL_DAMAGE_CONSTANT,
		MODIFIER_PROPERTY_INCOMING_SPELL_DAMAGE_CONSTANT
	}
	return funcs
end

function modifier_tusk_skill_1_effect:GetModifierIncomingPhysicalDamageConstant()
	return self.damage
end

function modifier_tusk_skill_1_effect:GetModifierIncomingSpellDamageConstant()
	return self.damage
end


