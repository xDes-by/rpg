ability_npc_jungle1_treant2_slow = class({})

LinkLuaModifier( "modifier_ability_npc_jungle1_treant2_slow_attack", "abilities/jungle1/ability_npc_jungle1_treant2_slow", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_jungle1_treant2_slow_debuff", "abilities/jungle1/ability_npc_jungle1_treant2_slow", LUA_MODIFIER_MOTION_NONE )

function ability_npc_jungle1_treant2_slow:GetIntrinsicModifierName()
    return "modifier_ability_npc_jungle1_treant2_slow_attack"
end

modifier_ability_npc_jungle1_treant2_slow_attack = class({})
--Classifications template
function modifier_ability_npc_jungle1_treant2_slow_attack:IsHidden()
   return true
end

function modifier_ability_npc_jungle1_treant2_slow_attack:IsPurgable()
   return false
end

function modifier_ability_npc_jungle1_treant2_slow_attack:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
}
end

function modifier_ability_npc_jungle1_treant2_slow_attack:GetModifierProcAttack_Feedback(data)
    data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_ability_npc_jungle1_treant2_slow_debuff", {duration = 1})
end


modifier_ability_npc_jungle1_treant2_slow_debuff = class({})
--Classifications template
function modifier_ability_npc_jungle1_treant2_slow_debuff:IsHidden()
   return false
end

function modifier_ability_npc_jungle1_treant2_slow_debuff:IsDebuff()
   return true
end

function modifier_ability_npc_jungle1_treant2_slow_debuff:IsPurgable()
   return true
end
-- Optional Classifications
function modifier_ability_npc_jungle1_treant2_slow_debuff:IsStunDebuff()
    return false
end

function modifier_ability_npc_jungle1_treant2_slow_debuff:RemoveOnDeath()
   return true
end

function modifier_ability_npc_jungle1_treant2_slow_debuff:DestroyOnExpire()
    return true
end

function modifier_ability_npc_jungle1_treant2_slow_debuff:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
}
end

function modifier_ability_npc_jungle1_treant2_slow_debuff:GetModifierStatusResistance()
    return -10
end
