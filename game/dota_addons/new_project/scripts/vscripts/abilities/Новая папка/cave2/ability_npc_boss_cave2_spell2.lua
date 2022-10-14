ability_npc_boss_cave2_spell2 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_cave2_spell2","abilities/cave2/ability_npc_boss_cave2_spell2", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_cave2_spell2:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_cave2_spell2"
end

modifier_ability_npc_boss_cave2_spell2 = class({})

--Classifications template
function modifier_ability_npc_boss_cave2_spell2:IsHidden()
    return true
end

function modifier_ability_npc_boss_cave2_spell2:IsPurgable()
    return false
end

function modifier_ability_npc_boss_cave2_spell2:OnCreated()
    self.steal = self:GetAbility():GetSpecialValueFor("steal") / 100
end

function modifier_ability_npc_boss_cave2_spell2:OnRefresh()
    self.steal = self:GetAbility():GetSpecialValueFor("steal") / 100
end

function modifier_ability_npc_boss_cave2_spell2:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
    }
end

function modifier_ability_npc_boss_cave2_spell2:GetModifierProcAttack_Feedback(data)
    self:GetParent():Heal(data.damage * self.steal, self:GetAbility())
    local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_skeletonking/wraith_king_vampiric_aura_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
	ParticleManager:ReleaseParticleIndex(effect_cast)
end