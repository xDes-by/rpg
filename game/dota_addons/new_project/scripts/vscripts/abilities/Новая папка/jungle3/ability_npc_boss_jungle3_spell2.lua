ability_npc_boss_jungle3_spell2 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_jungle3_spell2","abilities/jungle3/ability_npc_boss_jungle2_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_jungle3_spell2_effect","abilities/jungle3/ability_npc_boss_jungle2_spell2", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_jungle3_spell2:OnSpellStart()
    CreateModifierThinker(self:GetCaster(), self, "modifier_ability_npc_boss_jungle3_spell2", {duration = 15}, self:GetCursorPosition(), DOTA_TEAM_BADGUYS, false)
end

modifier_ability_npc_boss_jungle3_spell2 = class({})

function modifier_ability_npc_boss_jungle3_spell2:IsHidden()
    return true
end

-- Aura template
function modifier_ability_npc_boss_jungle3_spell2:IsAura()
    return true
end

function modifier_ability_npc_boss_jungle3_spell2:GetModifierAura()
    return "modifier_ability_npc_boss_jungle3_spell2_effect"
end

function modifier_ability_npc_boss_jungle3_spell2:GetAuraRadius()
    return 500
end

function modifier_ability_npc_boss_jungle3_spell2:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_boss_jungle3_spell2:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_ability_npc_boss_jungle3_spell2:GetAuraSearchType()
    return DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_boss_jungle3_spell2:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_boss_jungle3_spell2_effect = class({})
--Classifications template
function modifier_ability_npc_boss_jungle3_spell2_effect:IsHidden()
    return false
end

function modifier_ability_npc_boss_jungle3_spell2_effect:IsDebuff()
    return false
end

function modifier_ability_npc_boss_jungle3_spell2_effect:IsPurgable()
    return false
end

function modifier_ability_npc_boss_jungle3_spell2_effect:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_jungle3_spell2_effect:OnCreated()
    self.ms = self:GetAbility():GetSpecialValueFor("ms")
    self.damage = self:GetAbility():GetSpecialValueFor("damage")
    self.health = self:GetAbility():GetSpecialValueFor("health")
end

function modifier_ability_npc_boss_jungle3_spell2_effect:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
        MODIFIER_PROPERTY_BASEATTACK_BONUSDAMAGE,
        MODIFIER_PROPERTY_HEALTH_BONUS
    }
end

function modifier_ability_npc_boss_jungle3_spell2_effect:GetModifierMoveSpeedBonus_Percentage()
    return self.ms
end

function modifier_ability_npc_boss_jungle3_spell2_effect:GetModifierBaseAttack_BonusDamage()
    return self.damage
end

function modifier_ability_npc_boss_jungle3_spell2_effect:GetModifierHealthBonus()
    return self.health
end
