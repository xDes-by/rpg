npc_dota_hero_skeleton_king_spell3 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_skeleton_king_spell3", "heroes/npc_dota_hero_skeleton_king/npc_dota_hero_skeleton_king_spell3", LUA_MODIFIER_MOTION_NONE)

function npc_dota_hero_skeleton_king_spell3:OnSpellStart()
    self:GetCaster():SetHealth(math.max(self:GetCaster():GetHealth() - (self:GetCaster():GetHealth() * self:GetSpecialValueFor("health_cost") * 0.01), 1))
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_skeleton_king_spell3", {duration = 5})
end

modifier_npc_dota_hero_skeleton_king_spell3 = class({})

function modifier_npc_dota_hero_skeleton_king_spell3:IsHidden()
	return false
end

function modifier_npc_dota_hero_skeleton_king_spell3:IsDebuff()
	return false
end

function modifier_npc_dota_hero_skeleton_king_spell3:IsPurgable()
	return false
end

function modifier_npc_dota_hero_skeleton_king_spell3:RemoveOnDeath()
	return true
end

function modifier_npc_dota_hero_skeleton_king_spell3:DestroyOnExpire()
	return true
end

function modifier_npc_dota_hero_skeleton_king_spell3:OnCreated( kv )
	self.bonus = self:GetAbility():GetSpecialValueFor( "damage_pct" )
	self.particle_cast = ParticleManager:CreateParticle("particles/units/heroes/hero_skeletonking/skeletonking_hellfireblast_debuff.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster())
    self:GetCaster():EmitSound("Hero_Undying.SoulRip.Cast")
end

function modifier_npc_dota_hero_skeleton_king_spell3:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE,
		MODIFIER_PROPERTY_PROCATTACK_FEEDBACK,
	}
end

function modifier_npc_dota_hero_skeleton_king_spell3:GetModifierBaseDamageOutgoing_Percentage()
	return self.bonus
end

function modifier_npc_dota_hero_skeleton_king_spell3:OnDestroy()
	ParticleManager:DestroyParticle(self.particle_cast,false)
	ParticleManager:ReleaseParticleIndex(self.particle_cast)
end