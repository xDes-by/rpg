ability_npc_boss_hell3_spell4 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_hell3_spell4","abilities/hell3/ability_npc_boss_hell3_spell4", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_hell3_spell4_effect","abilities/hell3/ability_npc_boss_hell3_spell4", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_hell3_spell4:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_hell3_spell4"
end

modifier_ability_npc_boss_hell3_spell4 = class({})

--Classifications template
function modifier_ability_npc_boss_hell3_spell4:IsHidden()
    return true
end

function modifier_ability_npc_boss_hell3_spell4:IsPurgable()
    return false
end

function modifier_ability_npc_boss_hell3_spell4:RemoveOnDeath()
   return false
end

-- Aura template
function modifier_ability_npc_boss_hell3_spell4:IsAura()
    return true
end

function modifier_ability_npc_boss_hell3_spell4:GetModifierAura()
    return "modifier_ability_npc_boss_hell3_spell4_effect"
end

function modifier_ability_npc_boss_hell3_spell4:GetAuraRadius()
    return 300
end

function modifier_ability_npc_boss_hell3_spell4:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_boss_hell3_spell4:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ability_npc_boss_hell3_spell4:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_boss_hell3_spell4:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_boss_hell3_spell4_effect = class({})
--Classifications template
function modifier_ability_npc_boss_hell3_spell4_effect:IsHidden()
    return false
end

function modifier_ability_npc_boss_hell3_spell4_effect:IsDebuff()
    return true
end

function modifier_ability_npc_boss_hell3_spell4_effect:IsPurgable()
    return false
end

function modifier_ability_npc_boss_hell3_spell4_effect:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_hell3_spell4_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_hell3_spell4_effect:OnCreated()
    self.reduce = 100 - self:GetAbility():GetSpecialValueFor("reduce")
end

function modifier_ability_npc_boss_hell3_spell4_effect:OnRefresh()
    self:OnCreated()
end

function modifier_ability_npc_boss_hell3_spell4_effect:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE
    }
end

function modifier_ability_npc_boss_hell3_spell4_effect:GetModifierDamageOutgoing_Percentage()
    return self.reduce 
end
