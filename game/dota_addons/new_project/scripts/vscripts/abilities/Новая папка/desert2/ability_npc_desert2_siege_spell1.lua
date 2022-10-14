ability_npc_desert2_siege_spell1 = class({})

LinkLuaModifier( "modifier_ability_npc_desert2_siege_spell1","abilities/desert2/ability_npc_desert2_siege_spell1", LUA_MODIFIER_MOTION_NONE )

function ability_npc_desert2_siege_spell1:GetIntrinsicModifierName()
    return "modifier_ability_npc_desert2_siege_spell1"
end

modifier_ability_npc_desert2_siege_spell1 = class({})

--Classifications template
function modifier_ability_npc_desert2_siege_spell1:IsHidden()
    return true
end

function modifier_ability_npc_desert2_siege_spell1:IsPurgable()
    return false
end

function modifier_ability_npc_desert2_siege_spell1:RemoveOnDeath()
    return false
end

function modifier_ability_npc_desert2_siege_spell1:OnCreated()
    self.dur = self:GetAbility():GetSpecialValueFor("stun_dur")
end

function modifier_ability_npc_desert2_siege_spell1:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
    }
end

function modifier_ability_npc_desert2_siege_spell1:GetModifierProcAttack_Feedback(data)
    data.target:AddNewModifier(self:GetCaster(), self, "modifier_stunned", {duration = self.dur})
end