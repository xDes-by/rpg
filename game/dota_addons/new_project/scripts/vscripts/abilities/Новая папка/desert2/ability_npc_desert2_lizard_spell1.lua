ability_npc_desert2_lizard_spell1 = class({})

LinkLuaModifier( "modifier_ability_npc_desert2_lizard_spell1","abilities/desert2/ability_npc_desert2_lizard_spell1", LUA_MODIFIER_MOTION_NONE )

function ability_npc_desert2_lizard_spell1:OnSpellStart()
    local dur = self:GetSpecialValueFor("duration")
    self:GetCursorTarget():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_desert2_lizard_spell1", {duration = dur})
end

modifier_ability_npc_desert2_lizard_spell1 = class({})
--Classifications template
function modifier_ability_npc_desert2_lizard_spell1:IsHidden()
    return false
end

function modifier_ability_npc_desert2_lizard_spell1:IsDebuff()
    return false
end

function modifier_ability_npc_desert2_lizard_spell1:IsPurgable()
    return true
end

function modifier_ability_npc_desert2_lizard_spell1:RemoveOnDeath()
    return true
end

function modifier_ability_npc_desert2_lizard_spell1:DestroyOnExpire()
    return true
end

function modifier_ability_npc_desert2_lizard_spell1:OnCreated()
    self.as = self:GetAbility():GetSpecialValueFor("as_bonus")
end

function modifier_ability_npc_desert2_lizard_spell1:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
    }
end

function modifier_ability_npc_desert2_lizard_spell1:GetModifierAttackSpeedBonus_Constant()
    return self.as
end