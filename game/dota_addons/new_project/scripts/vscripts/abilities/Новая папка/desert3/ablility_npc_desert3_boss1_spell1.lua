ablility_npc_desert3_boss1_spell1 = class({})

LinkLuaModifier( "modifier_ablility_npc_desert3_boss1_spell1","abilities/desert3/ablility_npc_desert3_boss1_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ablility_npc_desert3_boss1_spell1_effect","abilities/desert3/ablility_npc_desert3_boss1_spell1", LUA_MODIFIER_MOTION_NONE )

function ablility_npc_desert3_boss1_spell1:GetIntrinsicModifierName()
    return "modifier_ablility_npc_desert3_boss1_spell1"
end

modifier_ablility_npc_desert3_boss1_spell1 = class({})

--Classifications template
function modifier_ablility_npc_desert3_boss1_spell1:IsHidden()
    return true
end

function modifier_ablility_npc_desert3_boss1_spell1:IsPurgable()
    return false
end

-- Aura template
function modifier_ablility_npc_desert3_boss1_spell1:IsAura()
    return true
end

function modifier_ablility_npc_desert3_boss1_spell1:GetModifierAura()
    return "modifier_ablility_npc_desert3_boss1_spell1_effect"
end

function modifier_ablility_npc_desert3_boss1_spell1:GetAuraRadius()
    return 300
end

function modifier_ablility_npc_desert3_boss1_spell1:GetAuraDuration()
    return 0.5
end

function modifier_ablility_npc_desert3_boss1_spell1:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ablility_npc_desert3_boss1_spell1:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ablility_npc_desert3_boss1_spell1:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ablility_npc_desert3_boss1_spell1_effect = class({})
--Classifications template
function modifier_ablility_npc_desert3_boss1_spell1_effect:IsHidden()
    return false
end

function modifier_ablility_npc_desert3_boss1_spell1_effect:IsDebuff()
    return true
end

function modifier_ablility_npc_desert3_boss1_spell1_effect:IsPurgable()
    return false
end

function modifier_ablility_npc_desert3_boss1_spell1_effect:RemoveOnDeath()
    return true
end

function modifier_ablility_npc_desert3_boss1_spell1_effect:DestroyOnExpire()
    return true
end

function modifier_ablility_npc_desert3_boss1_spell1_effect:OnCreated()
    self.damage = self:GetAbility():GetSpecialValueFor("reduse")
end
function modifier_ablility_npc_desert3_boss1_spell1_effect:OnRefresh()
    self:OnCreated()
end

function modifier_ablility_npc_desert3_boss1_spell1_effect:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE
    }
end

function modifier_ablility_npc_desert3_boss1_spell1_effect:GetModifierIncomingDamage_Percentage()
    return self.damage
end