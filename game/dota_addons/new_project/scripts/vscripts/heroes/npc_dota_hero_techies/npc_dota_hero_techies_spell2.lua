npc_dota_hero_techies_spell2 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_techies_spell2", "heroes/npc_dota_hero_techies/npc_dota_hero_techies_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_techies_spell2_effect", "heroes/npc_dota_hero_techies/npc_dota_hero_techies_spell2", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_techies_spell2:OnSpellStart()
    CreateModifierThinker(self:GetCaster(), self, "modifier_npc_dota_hero_techies_spell2", {duration = self:GetSpecialValueFor("duration")}, self:GetCursorPosition(), self:GetCaster():GetTeamNumber(), false)
end

modifier_npc_dota_hero_techies_spell2 = class({})
--Classifications template
function modifier_npc_dota_hero_techies_spell2:IsHidden()
    return true
end

function modifier_npc_dota_hero_techies_spell2:OnCreated()
    self.radius = self:GetAbility():GetSpecialValueFor("radius")
    local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_techies/techies_taunt_compendium.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
    ParticleManager:ReleaseParticleIndex(effect_cast)
	self.effect_cast = ParticleManager:CreateParticle( "particles/npc_dota_hero_techies/npc_dota_hero_techies_spell2.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	ParticleManager:SetParticleControl( self.effect_cast, 0, self:GetParent():GetAbsOrigin() )
	ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( self.radius, 0, self.radius ) )  
    EmitSoundOn("Hero_Batrider.Firefly.Cast", self:GetParent())
end

function modifier_npc_dota_hero_techies_spell2:OnDestroy()
    ParticleManager:DestroyParticle(self.effect_cast, false)
    ParticleManager:ReleaseParticleIndex(self.effect_cast)
    UTIL_Remove(self:GetParent())
end

-- Aura template
function modifier_npc_dota_hero_techies_spell2:IsAura()
    return true
end

function modifier_npc_dota_hero_techies_spell2:GetModifierAura()
    return "modifier_npc_dota_hero_techies_spell2_effect"
end

function modifier_npc_dota_hero_techies_spell2:GetAuraRadius()
    return self.radius
end

function modifier_npc_dota_hero_techies_spell2:GetAuraDuration()
    return 0.5
end

function modifier_npc_dota_hero_techies_spell2:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_npc_dota_hero_techies_spell2:GetAuraSearchType()
    return DOTA_UNIT_TARGET_BASIC
end

function modifier_npc_dota_hero_techies_spell2:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_npc_dota_hero_techies_spell2_effect = class({})
--Classifications template
function modifier_npc_dota_hero_techies_spell2_effect:IsHidden()
    return false
end

function modifier_npc_dota_hero_techies_spell2_effect:IsDebuff()
    return true
end

function modifier_npc_dota_hero_techies_spell2_effect:IsPurgable()
    return true
end

function modifier_npc_dota_hero_techies_spell2_effect:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_techies_spell2_effect:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_techies_spell2_effect:OnCreated()
    self.chance = self:GetAbility():GetSpecialValueFor("chance")
    if IsClient() then
        return
    end
    self:StartIntervalThink(1)
end

function modifier_npc_dota_hero_techies_spell2_effect:OnIntervalThink()
    ApplyDamage({victim = self:GetParent(),
    damage =  self:GetAbility():GetSpecialValueFor("damage"),
    damage_type = self:GetAbility():GetAbilityDamageType(),
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end

function modifier_npc_dota_hero_techies_spell2_effect:CheckState()
    return {
        [MODIFIER_STATE_BLIND] = true
    }
end

function modifier_npc_dota_hero_techies_spell2_effect:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MISS_PERCENTAGE
    }
end

function modifier_npc_dota_hero_techies_spell2_effect:GetModifierMiss_Percentage()
    return self.chance
end
