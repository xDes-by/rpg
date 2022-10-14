ability_npc_boss_gaveyard3_spell5 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_gaveyard3_spell5","abilities/gaveyard3/ability_npc_boss_gaveyard3_spell5", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_gaveyard3_spell5:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_gaveyard3_spell5"
end

modifier_ability_npc_boss_gaveyard3_spell5 = class({})

--Classifications template
function modifier_ability_npc_boss_gaveyard3_spell5:IsHidden()
    return true
end

function modifier_ability_npc_boss_gaveyard3_spell5:IsPurgable()
    return false
end

function modifier_ability_npc_boss_gaveyard3_spell5:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE
    }
end

function modifier_ability_npc_boss_gaveyard3_spell5:OnCreated()
    self.crit = self:GetAbility():GetSpecialValueFor("crit")
end

function modifier_ability_npc_boss_gaveyard3_spell5:OnRefresh()
    self:OnCreated()
end

function modifier_ability_npc_boss_gaveyard3_spell5:GetModifierPreAttack_CriticalStrike()
    if RollPseudoRandom(10,self:GetParent()) then
        return self.crit
    end
end