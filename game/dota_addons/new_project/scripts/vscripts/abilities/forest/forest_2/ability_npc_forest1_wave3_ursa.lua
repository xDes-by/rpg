ability_npc_forest1_wave3_ursa = class({})

LinkLuaModifier( "modifier_ability_npc_forest1_wave3_ursa","abilities/forest1/ability_npc_forest1_wave3_ursa", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_forest1_wave3_ursa_effect","abilities/forest1/ability_npc_forest1_wave3_ursa", LUA_MODIFIER_MOTION_NONE )

function ability_npc_forest1_wave3_ursa:GetIntrinsicModifierName()
    return "modifier_ability_npc_forest1_wave3_ursa"
end

modifier_ability_npc_forest1_wave3_ursa = class({})

--Classifications template
function modifier_ability_npc_forest1_wave3_ursa:IsHidden()
   return true
end

function modifier_ability_npc_forest1_wave3_ursa:IsPurgable()
   return false
end

function modifier_ability_npc_forest1_wave3_ursa:RemoveOnDeath()
   return true
end

-- Aura template
function modifier_ability_npc_forest1_wave3_ursa:IsAura()
    return true
end

function modifier_ability_npc_forest1_wave3_ursa:GetModifierAura()
    return "modifier_ability_npc_forest1_wave3_ursa_effect"
end

function modifier_ability_npc_forest1_wave3_ursa:GetAuraRadius()
    return 500
end

function modifier_ability_npc_forest1_wave3_ursa:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_forest1_wave3_ursa:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_ability_npc_forest1_wave3_ursa:GetAuraSearchType()
    return DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_forest1_wave3_ursa:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_forest1_wave3_ursa_effect = class({})
--Classifications template
function modifier_ability_npc_forest1_wave3_ursa_effect:IsHidden()
   return false
end

function modifier_ability_npc_forest1_wave3_ursa_effect:IsDebuff()
   return false
end

function modifier_ability_npc_forest1_wave3_ursa_effect:IsPurgable()
   return false
end

function modifier_ability_npc_forest1_wave3_ursa_effect:RemoveOnDeath()
   return true
end

function modifier_ability_npc_forest1_wave3_ursa_effect:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS
}
end

function modifier_ability_npc_forest1_wave3_ursa_effect:GetModifierMagicalResistanceBonus()
    return self:GetAbility():GetSpecialValueFor("mgres")
end
