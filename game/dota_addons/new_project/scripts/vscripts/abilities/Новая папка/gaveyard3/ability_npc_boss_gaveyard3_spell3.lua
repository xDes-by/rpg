ability_npc_boss_gaveyard3_spell3 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_gaveyard3_spell3","abilities/gaveyard3/ability_npc_boss_gaveyard3_spell3", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_gaveyard3_spell3:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_gaveyard3_spell3"
end

modifier_ability_npc_boss_gaveyard3_spell3 = class({})

--Classifications template
function modifier_ability_npc_boss_gaveyard3_spell3:IsHidden()
    return true
end

function modifier_ability_npc_boss_gaveyard3_spell3:IsPurgable()
    return false
end

function modifier_ability_npc_boss_gaveyard3_spell3:OnCreated()
    self.res = self:GetAbility():GetSpecialValueFor("res")
end

function modifier_ability_npc_boss_gaveyard3_spell3:OnRefresh()
    self:OnCreated()
end

function modifier_ability_npc_boss_gaveyard3_spell3:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS
    }
end

function modifier_ability_npc_boss_gaveyard3_spell3:GetModifierMagicalResistanceBonus()
    return self.res
end
