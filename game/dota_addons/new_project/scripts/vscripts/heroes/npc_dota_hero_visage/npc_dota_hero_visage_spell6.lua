LinkLuaModifier( "modifier_npc_dota_hero_visage_spell6", "heroes/npc_dota_hero_visage/npc_dota_hero_visage_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_visage_spell6_effect", "heroes/npc_dota_hero_visage/npc_dota_hero_visage_spell6", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_visage_spell6 = class({})

function npc_dota_hero_visage_spell6:GetAOERadius()
	return self:GetSpecialValueFor( "radius" )
end


function npc_dota_hero_visage_spell6:OnSpellStart()
    CreateModifierThinker(self:GetCaster(), self, "modifier_npc_dota_hero_visage_spell6", {duration = self:GetSpecialValueFor("duration")}, self:GetCursorPosition(), self:GetCaster():GetTeamNumber(), false)
	EmitSoundOn("Hero_Visage.SummonFamiliars.Cast", self:GetCaster() )
end

----------------------------------------------------------------------------------

modifier_npc_dota_hero_visage_spell6 = class({})

function modifier_npc_dota_hero_visage_spell6:IsHidden()
    return true
end

function modifier_npc_dota_hero_visage_spell6:OnCreated()
    self.radius = self:GetAbility():GetSpecialValueFor("radius")
	if not IsServer() then return end
	self.effect_cast = ParticleManager:CreateParticle( "particles/vis4.vpcf", PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( self.effect_cast, 0, self:GetParent():GetAbsOrigin() )
	ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( self.radius, 1, 1 ) )
end

function modifier_npc_dota_hero_visage_spell6:OnDestroy()
	if not IsServer() then return end
	if self.effect_cast then
		ParticleManager:DestroyParticle(self.effect_cast, false)
		ParticleManager:ReleaseParticleIndex(self.effect_cast)
	end
    UTIL_Remove(self:GetParent())
end

function modifier_npc_dota_hero_visage_spell6:IsAura()
    return true
end

function modifier_npc_dota_hero_visage_spell6:GetModifierAura()
    return "modifier_npc_dota_hero_visage_spell6_effect"
end

function modifier_npc_dota_hero_visage_spell6:GetAuraRadius()
    return self.radius
end

function modifier_npc_dota_hero_visage_spell6:GetAuraDuration()
    return 0.5
end

function modifier_npc_dota_hero_visage_spell6:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_npc_dota_hero_visage_spell6:GetAuraSearchType()
    return DOTA_UNIT_TARGET_BASIC
end

function modifier_npc_dota_hero_visage_spell6:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

----------------------------------------------------------------------------------

modifier_npc_dota_hero_visage_spell6_effect = class({})

function modifier_npc_dota_hero_visage_spell6_effect:IsHidden()
    return false
end

function modifier_npc_dota_hero_visage_spell6_effect:IsDebuff()
    return true
end

function modifier_npc_dota_hero_visage_spell6_effect:IsPurgable()
    return false
end

function modifier_npc_dota_hero_visage_spell6_effect:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_visage_spell6_effect:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_visage_spell6_effect:OnCreated()
    self.damage = self:GetAbility():GetSpecialValueFor("bonus_damage")
    self.damage_tick = self:GetAbility():GetSpecialValueFor("damage_tick")
    if not IsServer() then return end
    self:StartIntervalThink(1)
end

function modifier_npc_dota_hero_visage_spell6_effect:OnIntervalThink()
    ApplyDamage({victim = self:GetParent(),
    damage = self.damage_tick,
    damage_type = self:GetAbility():GetAbilityDamageType(),
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end

function modifier_npc_dota_hero_visage_spell6_effect:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE
    }
end

function modifier_npc_dota_hero_visage_spell6_effect:GetModifierIncomingDamage_Percentage()
    return self.damage
end