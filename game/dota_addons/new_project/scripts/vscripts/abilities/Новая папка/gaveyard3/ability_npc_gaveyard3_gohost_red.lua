ability_npc_gaveyard3_gohost_red = class({})

LinkLuaModifier( "modifier_ability_npc_gaveyard3_gohost_red","abilities/gaveyard3/ability_npc_gaveyard3_gohost_red", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_gaveyard3_gohost_red_effect","abilities/gaveyard3/ability_npc_gaveyard3_gohost_red", LUA_MODIFIER_MOTION_NONE )

function ability_npc_gaveyard3_gohost_red:GetIntrinsicModifierName()
    return "modifier_ability_npc_gaveyard3_gohost_red"
end

modifier_ability_npc_gaveyard3_gohost_red = class({})

--Classifications template
function modifier_ability_npc_gaveyard3_gohost_red:IsHidden()
   return true
end

function modifier_ability_npc_gaveyard3_gohost_red:IsPurgable()
   return false
end

function modifier_ability_npc_gaveyard3_gohost_red:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
}
end

function modifier_ability_npc_gaveyard3_gohost_red:GetModifierProcAttack_Feedback(data)
    data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_ability_npc_gaveyard3_gohost_red_effect", {duration = 1})
end

modifier_ability_npc_gaveyard3_gohost_red_effect = class({})
--Classifications template
function modifier_ability_npc_gaveyard3_gohost_red_effect:IsHidden()
   return false
end

function modifier_ability_npc_gaveyard3_gohost_red_effect:IsDebuff()
   return true
end

function modifier_ability_npc_gaveyard3_gohost_red_effect:IsPurgable()
   return true
end

function modifier_ability_npc_gaveyard3_gohost_red_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_gaveyard3_gohost_red_effect:AllowIllusionDuplicate()
    return true
end

function modifier_ability_npc_gaveyard3_gohost_red_effect:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function modifier_ability_npc_gaveyard3_gohost_red_effect:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
       MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT
}
end

function modifier_ability_npc_gaveyard3_gohost_red_effect:GetModifierAttackSpeedBonus_Constant()
    return - self:GetAbility():GetSpecialValueFor("ms")
end

function modifier_ability_npc_gaveyard3_gohost_red_effect:GetModifierMoveSpeedBonus_Constant()
    return - self:GetAbility():GetSpecialValueFor("as")
end