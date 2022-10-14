ability_npc_forest1_wave2_status_resist = class({})

LinkLuaModifier( "modifier_ability_npc_forest1_wave2_status_resist_attack", "abilities/forest1/ability_npc_forest1_wave2_status_resist", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_forest1_wave2_status_resist_debuff", "abilities/forest1/ability_npc_forest1_wave2_status_resist", LUA_MODIFIER_MOTION_NONE )

function ability_npc_forest1_wave2_status_resist:GetIntrinsicModifierName()
    return "modifier_ability_npc_forest1_wave2_status_resist_attack"
end

modifier_ability_npc_forest1_wave2_status_resist_attack = class({})
--Classifications template
function modifier_ability_npc_forest1_wave2_status_resist_attack:IsHidden()
   return true
end

function modifier_ability_npc_forest1_wave2_status_resist_attack:IsPurgable()
   return false
end

function modifier_ability_npc_forest1_wave2_status_resist_attack:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
}
end

function modifier_ability_npc_forest1_wave2_status_resist_attack:GetModifierProcAttack_Feedback(data)
    data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_ability_npc_forest1_wave2_status_resist_debuff", {duration = 1})
end


modifier_ability_npc_forest1_wave2_status_resist_debuff = class({})
--Classifications template
function modifier_ability_npc_forest1_wave2_status_resist_debuff:IsHidden()
   return false
end

function modifier_ability_npc_forest1_wave2_status_resist_debuff:IsDebuff()
   return true
end

function modifier_ability_npc_forest1_wave2_status_resist_debuff:IsPurgable()
   return true
end
-- Optional Classifications
function modifier_ability_npc_forest1_wave2_status_resist_debuff:IsStunDebuff()
    return false
end

function modifier_ability_npc_forest1_wave2_status_resist_debuff:RemoveOnDeath()
   return true
end

function modifier_ability_npc_forest1_wave2_status_resist_debuff:DestroyOnExpire()
    return true
end

function modifier_ability_npc_forest1_wave2_status_resist_debuff:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_STATUS_RESISTANCE
}
end

function modifier_ability_npc_forest1_wave2_status_resist_debuff:OnCreated()
    self.res = self:GetAbility():GetSpecialValueFor("resistreducrion")
end
function modifier_ability_npc_forest1_wave2_status_resist_debuff:OnRefresh()
    self:OnCreated()
end

function modifier_ability_npc_forest1_wave2_status_resist_debuff:GetModifierStatusResistance()
    return -(self.res)
end
