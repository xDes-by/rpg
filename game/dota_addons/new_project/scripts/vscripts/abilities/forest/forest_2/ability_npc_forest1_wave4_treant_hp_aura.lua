ability_npc_forest1_wave4_treant_hp_aura = class({})

LinkLuaModifier( "modifier_ability_npc_forest1_wave4_treant_hp_aura", "abilities/forest1/ability_npc_forest1_wave4_treant_hp_aura", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_forest1_wave4_treant_hp_aura_effect", "abilities/forest1/ability_npc_forest1_wave4_treant_hp_aura", LUA_MODIFIER_MOTION_NONE )

function ability_npc_forest1_wave4_treant_hp_aura:GetIntrinsicModifierName()
    return "modifier_ability_npc_forest1_wave4_treant_hp_aura"
end

modifier_ability_npc_forest1_wave4_treant_hp_aura = class({})
-- Aura template

function modifier_ability_npc_forest1_wave4_treant_hp_aura:IsHidden()
   return true
end

function modifier_ability_npc_forest1_wave4_treant_hp_aura:IsAura()
    return true
end

function modifier_ability_npc_forest1_wave4_treant_hp_aura:GetModifierAura()
    return "modifier_ability_npc_forest1_wave4_treant_hp_aura_effect"
end

function modifier_ability_npc_forest1_wave4_treant_hp_aura:GetAuraRadius()
    return 500
end

function modifier_ability_npc_forest1_wave4_treant_hp_aura:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_forest1_wave4_treant_hp_aura:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_ability_npc_forest1_wave4_treant_hp_aura:GetAuraSearchType()
    return DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_forest1_wave4_treant_hp_aura:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_forest1_wave4_treant_hp_aura_effect = class({})
--Classifications template
function modifier_ability_npc_forest1_wave4_treant_hp_aura_effect:IsHidden()
   return true
end

function modifier_ability_npc_forest1_wave4_treant_hp_aura_effect:IsDebuff()
   return true
end

function modifier_ability_npc_forest1_wave4_treant_hp_aura_effect:IsPurgable()
   return true
end

function modifier_ability_npc_forest1_wave4_treant_hp_aura_effect:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function modifier_ability_npc_forest1_wave4_treant_hp_aura_effect:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT
    --   MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS
}
end

function modifier_ability_npc_forest1_wave4_treant_hp_aura_effect:GetModifierPhysicalArmorBonus()
    return 2
end

function modifier_ability_npc_forest1_wave4_treant_hp_aura_effect:GetModifierConstantHealthRegen()
    return 5
end