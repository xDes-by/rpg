npc_dota_hero_skeleton_king_spell2 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_skeleton_king_spell2", "heroes/npc_dota_hero_skeleton_king/npc_dota_hero_skeleton_king_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_skeleton_king_spell2_lifesteal", "heroes/npc_dota_hero_skeleton_king/npc_dota_hero_skeleton_king_spell2", LUA_MODIFIER_MOTION_NONE )


function npc_dota_hero_skeleton_king_spell2:GetIntrinsicModifierName()
	return "modifier_npc_dota_hero_skeleton_king_spell2"
end

modifier_npc_dota_hero_skeleton_king_spell2 = class({})
--Classifications template
function modifier_npc_dota_hero_skeleton_king_spell2:IsHidden()
	return true
end

function modifier_npc_dota_hero_skeleton_king_spell2:IsPurgable()
	return false
end

function modifier_npc_dota_hero_skeleton_king_spell2:RemoveOnDeath()
	return false
end

function modifier_npc_dota_hero_skeleton_king_spell2:IsAura()
	return true
end

function modifier_npc_dota_hero_skeleton_king_spell2:GetModifierAura()
	return "modifier_npc_dota_hero_skeleton_king_spell2_lifesteal"
end

function modifier_npc_dota_hero_skeleton_king_spell2:GetAuraRadius()
	return 0
end

function modifier_npc_dota_hero_skeleton_king_spell2:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_npc_dota_hero_skeleton_king_spell2:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_npc_dota_hero_skeleton_king_spell2:GetAuraSearchFlags()
	return DOTA_UNIT_TARGET_FLAG_INVULNERABLE
end

function modifier_npc_dota_hero_skeleton_king_spell2:IsAuraActiveOnDeath()
	return false
end

modifier_npc_dota_hero_skeleton_king_spell2_lifesteal = class({})

function modifier_npc_dota_hero_skeleton_king_spell2_lifesteal:IsHidden()
	return false
end

function modifier_npc_dota_hero_skeleton_king_spell2_lifesteal:IsDebuff()
	return false
end

function modifier_npc_dota_hero_skeleton_king_spell2_lifesteal:OnCreated( kv )
	self.aura_lifesteal = self:GetAbility():GetSpecialValueFor("vampiric_aura") -- special value
end

function modifier_npc_dota_hero_skeleton_king_spell2_lifesteal:OnRefresh( kv )
	self.aura_lifesteal = self:GetAbility():GetSpecialValueFor("vampiric_aura") -- special value
end

function modifier_npc_dota_hero_skeleton_king_spell2_lifesteal:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_PROCATTACK_FEEDBACK,
		MODIFIER_EVENT_ON_TAKEDAMAGE,
	}
end

function modifier_npc_dota_hero_skeleton_king_spell2_lifesteal:GetModifierProcAttack_Feedback( data )
	local heal = data.damage * self.aura_lifesteal/100
	self:GetCaster():Heal(heal, self:GetAbility())
	local effect_cast = 
	ParticleManager:CreateParticle( "particles/units/heroes/hero_skeletonking/wraith_king_vampiric_aura_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
	ParticleManager:ReleaseParticleIndex(effect_cast)
end
