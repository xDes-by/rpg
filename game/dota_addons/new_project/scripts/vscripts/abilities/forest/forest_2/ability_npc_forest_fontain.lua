LinkLuaModifier( "modifier_ability_npc_forest_fontain", "abilities/forest/forest_2/ability_npc_forest_fontain", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_forest_fontain_effect", "abilities/forest/forest_2/ability_npc_forest_fontain", LUA_MODIFIER_MOTION_NONE )

ability_npc_forest_fontain = class({})

function ability_npc_forest_fontain:GetIntrinsicModifierName()
    return "modifier_ability_npc_forest_fontain"
end

-----------------------------------------------------------------------------

modifier_ability_npc_forest_fontain = class({})

function modifier_ability_npc_forest_fontain:IsAura()
	return true
end

function modifier_ability_npc_forest_fontain:GetAuraRadius()
	return 500
end

function modifier_ability_npc_forest_fontain:OnCreated()
end

function modifier_ability_npc_forest_fontain:GetAuraSearchFlags()
	return DOTA_UNIT_TARGET_FLAG_NONE
end

function modifier_ability_npc_forest_fontain:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_BOTH
end

function modifier_ability_npc_forest_fontain:GetAuraSearchType()
	return DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_forest_fontain:GetModifierAura()
	return "modifier_ability_npc_forest_fontain_effect"
end

-----------------------------------------------------------

modifier_ability_npc_forest_fontain_effect = class({})

function modifier_ability_npc_forest_fontain_effect:OnCreated()
	self.damage = self:GetAbility():GetSpecialValueFor("damage")
	self:StartIntervalThink(1)
end

function modifier_ability_npc_forest_fontain_effect:OnIntervalThink()
	if IsServer() then
		if self:GetParent():GetTeamNumber() == DOTA_TEAM_BADGUYS then
			if self:GetParent():HasModifier("modifier_ability_npc_forest_2_stinky") then
				ApplyDamage({attacker = self:GetCaster(), victim = self:GetParent(),  damage = self:GetParent():GetMaxHealth() / 100 * self.damage * 2, ability = self:GetAbility(), damage_type = DAMAGE_TYPE_MAGICAL})
			else
				ApplyDamage({attacker = self:GetCaster(), victim = self:GetParent(),  damage = self:GetParent():GetMaxHealth() / 100 * self.damage, ability = self:GetAbility(), damage_type = DAMAGE_TYPE_MAGICAL})
			end
		end
	end
end

function modifier_ability_npc_forest_fontain_effect:GetEffectName()
	if self:GetParent():GetTeamNumber() == DOTA_TEAM_BADGUYS then
		return "particles/units/heroes/hero_ogre_magi/ogre_magi_ignite_debuff.vpcf"
	end
end

function modifier_ability_npc_forest_fontain_effect:DeclareFunctions()
	return {MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE}
end

function modifier_ability_npc_forest_fontain_effect:GetModifierDamageOutgoing_Percentage()
	if self:GetParent():GetTeamNumber() ~= DOTA_TEAM_BADGUYS then
		return 110
	end
	return 0
end