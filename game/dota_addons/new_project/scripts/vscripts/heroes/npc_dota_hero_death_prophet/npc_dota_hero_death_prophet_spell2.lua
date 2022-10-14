npc_dota_hero_death_prophet_spell2 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_death_prophet_spell2", "heroes/npc_dota_hero_death_prophet/npc_dota_hero_death_prophet_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_death_prophet_spell2_effect", "heroes/npc_dota_hero_death_prophet/npc_dota_hero_death_prophet_spell2", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_death_prophet_spell2:OnSpellStart()
    CreateModifierThinker(self:GetCaster(), self, "modifier_npc_dota_hero_death_prophet_spell2", {duration = self:GetSpecialValueFor("duration")}, self:GetCursorPosition(), self:GetCaster():GetTeamNumber(), false)
    self.abi = self:GetCaster():FindAbilityByName("npc_dota_hero_death_prophet_spell3")
end

modifier_npc_dota_hero_death_prophet_spell2 = class({})

function modifier_npc_dota_hero_death_prophet_spell2:OnCreated()
    self.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_enigma/enigma_midnight_pulse.vpcf", PATTACH_POINT, self:GetParent())
    ParticleManager:SetParticleControl(self.pfx, 1, Vector(500, 0, 0))
end

function modifier_npc_dota_hero_death_prophet_spell2:OnDestroy()
    ParticleManager:DestroyParticle(self.pfx, false)
    ParticleManager:ReleaseParticleIndex(self.pfx)
end

-- Aura template
function modifier_npc_dota_hero_death_prophet_spell2:IsAura()
    return true
end

function modifier_npc_dota_hero_death_prophet_spell2:GetModifierAura()
    return "modifier_npc_dota_hero_death_prophet_spell2_effect"
end

function modifier_npc_dota_hero_death_prophet_spell2:GetAuraRadius()
    return 500
end

function modifier_npc_dota_hero_death_prophet_spell2:GetAuraDuration()
    return 0.5
end

function modifier_npc_dota_hero_death_prophet_spell2:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_npc_dota_hero_death_prophet_spell2:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_npc_dota_hero_death_prophet_spell2:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_npc_dota_hero_death_prophet_spell2_effect = class({})
--Classifications template
function modifier_npc_dota_hero_death_prophet_spell2_effect:IsHidden()
    return false
end

function modifier_npc_dota_hero_death_prophet_spell2_effect:IsDebuff()
    return true
end

function modifier_npc_dota_hero_death_prophet_spell2_effect:IsPurgable()
    return false
end

function modifier_npc_dota_hero_death_prophet_spell2_effect:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_death_prophet_spell2_effect:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_death_prophet_spell2_effect:OnCreated()
    if IsClient() then
        return
    end
    self:StartIntervalThink(1)
end

function modifier_npc_dota_hero_death_prophet_spell2_effect:OnIntervalThink()
    self:GetAbility().abi:CreateGhost(self:GetParent())
    ApplyDamage({victim = self:GetParent(),
    damage =  self:GetAbility():GetSpecialValueFor("damage"),
    damage_type = self:GetAbility():GetAbilityDamageType(),
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end

function modifier_npc_dota_hero_death_prophet_spell2_effect:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
    }
end

function modifier_npc_dota_hero_death_prophet_spell2_effect:GetModifierMoveSpeedBonus_Percentage()
    return -self:GetAbility():GetSpecialValueFor("slow")
end