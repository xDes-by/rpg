ability_npc_forest1_wave3_pine_cone = class({})

LinkLuaModifier( "modifier_ability_npc_forest1_wave3_pine_cone","abilities/forest1/ability_npc_forest1_wave3_pine_cone", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_forest1_wave3_pine_cone_effect","abilities/forest1/ability_npc_forest1_wave3_pine_cone", LUA_MODIFIER_MOTION_NONE )

function ability_npc_forest1_wave3_pine_cone:GetIntrinsicModifierName()
    return "modifier_ability_npc_forest1_wave3_pine_cone"
end

modifier_ability_npc_forest1_wave3_pine_cone = class({})

--Classifications template
function modifier_ability_npc_forest1_wave3_pine_cone:IsHidden()
   return true
end

function modifier_ability_npc_forest1_wave3_pine_cone:IsPurgable()
   return false
end

-- Aura template
function modifier_ability_npc_forest1_wave3_pine_cone:IsAura()
    return true
end

function modifier_ability_npc_forest1_wave3_pine_cone:GetModifierAura()
    return ""
end

function modifier_ability_npc_forest1_wave3_pine_cone:GetAuraRadius()
    return 500
end

function modifier_ability_npc_forest1_wave3_pine_cone:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_forest1_wave3_pine_cone:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_ability_npc_forest1_wave3_pine_cone:GetAuraSearchType()
    return DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_forest1_wave3_pine_cone:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_forest1_wave3_pine_cone_effect = class({})
--Classifications template
function modifier_ability_npc_forest1_wave3_pine_cone_effect:IsHidden()
   return false
end

function modifier_ability_npc_forest1_wave3_pine_cone_effect:IsDebuff()
   return false
end

function modifier_ability_npc_forest1_wave3_pine_cone_effect:IsPurgable()
   return false
end

function modifier_ability_npc_forest1_wave3_pine_cone_effect:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
       MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT
}
end

function modifier_ability_npc_forest1_wave3_wolf_effect:GetModifierAttackSpeedBonus_Constant()
    return self:GetAbility():GetSpecialValueFor("ms")
end

function modifier_ability_npc_forest1_wave3_wolf_effect:GetModifierMoveSpeedBonus_Constant()
    return self:GetAbility():GetSpecialValueFor("as")
end