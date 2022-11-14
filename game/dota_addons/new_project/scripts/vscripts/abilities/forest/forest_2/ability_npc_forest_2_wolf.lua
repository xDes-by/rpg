LinkLuaModifier( "modifier_ability_npc_forest_2_wolf","abilities/forest1/ability_npc_forest_2_wolf", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_forest_2_wolf_effect","abilities/forest1/ability_npc_forest_2_wolf", LUA_MODIFIER_MOTION_NONE )

ability_npc_forest_2_wolf = class({})

function ability_npc_forest_2_wolf:GetIntrinsicModifierName()
    return "modifier_ability_npc_forest_2_wolf"
end

-----------------------------------------------------------------------

modifier_ability_npc_forest_2_wolf = class({})

function modifier_ability_npc_forest_2_wolf:IsHidden()
   return true
end

function modifier_ability_npc_forest_2_wolf:IsPurgable()
   return false
end

function modifier_ability_npc_forest_2_wolf:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
}
end

function modifier_ability_npc_forest_2_wolf:GetModifierProcAttack_Feedback(data)
    data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_ability_npc_forest_2_wolf_effect", {duration = 1})
end

----------------------------------------------------------------------------------------------

modifier_ability_npc_forest_2_wolf_effect = class({})

function modifier_ability_npc_forest_2_wolf_effect:IsHidden()
   return false
end

function modifier_ability_npc_forest_2_wolf_effect:IsDebuff()
   return true
end

function modifier_ability_npc_forest_2_wolf_effect:IsPurgable()
   return true
end

function modifier_ability_npc_forest_2_wolf_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_forest_2_wolf_effect:AllowIllusionDuplicate()
    return true
end

function modifier_ability_npc_forest_2_wolf_effect:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function modifier_ability_npc_forest_2_wolf_effect:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
       MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT
}
end

function modifier_ability_npc_forest_2_wolf_effect:GetModifierAttackSpeedBonus_Constant()
    return - self:GetAbility():GetSpecialValueFor("ms")
end

function modifier_ability_npc_forest_2_wolf_effect:GetModifierMoveSpeedBonus_Constant()
    return - self:GetAbility():GetSpecialValueFor("as")
end