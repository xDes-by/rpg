ability_npc_hell1_druid_ats_aura = class({})

LinkLuaModifier( "modifier_ability_npc_hell1_druid_ats_aura","abilities/hell1/ability_npc_hell1_druid_ats_aura", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_hell1_druid_ats_aura_effect","abilities/hell1/ability_npc_hell1_druid_ats_aura", LUA_MODIFIER_MOTION_NONE )

function ability_npc_hell1_druid_ats_aura:GetIntrinsicModifierName()
    return "modifier_ability_npc_hell1_druid_ats_aura"
end

modifier_ability_npc_hell1_druid_ats_aura = class({})

--Classifications template
function modifier_ability_npc_hell1_druid_ats_aura:IsHidden()
   return true
end

function modifier_ability_npc_hell1_druid_ats_aura:IsPurgable()
   return false
end

-- Aura template
function modifier_ability_npc_hell1_druid_ats_aura:IsAura()
    return true
end

function modifier_ability_npc_hell1_druid_ats_aura:GetModifierAura()
    return "modifier_ability_npc_hell1_druid_ats_aura_effect"
end

function modifier_ability_npc_hell1_druid_ats_aura:GetAuraRadius()
    return 500
end

function modifier_ability_npc_hell1_druid_ats_aura:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_hell1_druid_ats_aura:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_ability_npc_hell1_druid_ats_aura:GetAuraSearchType()
    return DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_hell1_druid_ats_aura:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_hell1_druid_ats_aura_effect = class({})
--Classifications template
function modifier_ability_npc_hell1_druid_ats_aura_effect:IsHidden()
   return false
end

function modifier_ability_npc_hell1_druid_ats_aura_effect:IsDebuff()
   return false
end

function modifier_ability_npc_hell1_druid_ats_aura_effect:IsPurgable()
   return false
end

function modifier_ability_npc_hell1_druid_ats_aura_effect:RemoveOnDeath()
   return true
end

function modifier_ability_npc_hell1_druid_ats_aura_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_hell1_druid_ats_aura_effect:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
}
end

function modifier_ability_npc_hell1_druid_ats_aura_effect:GetModifierAttackSpeedBonus_Constant()
    return 10
end
