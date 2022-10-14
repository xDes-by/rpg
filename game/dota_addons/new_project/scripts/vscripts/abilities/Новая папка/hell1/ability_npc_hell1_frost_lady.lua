ability_npc_hell1_frost_lady = class({})

LinkLuaModifier( "modifier_ability_npc_hell1_frost_lady","abilities/hell1/ability_npc_hell1_frost_lady", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_hell1_frost_lady_cold_effect","abilities/hell1/ability_npc_hell1_frost_lady", LUA_MODIFIER_MOTION_NONE )

function ability_npc_hell1_frost_lady:GetIntrinsicModifierName()
    return "modifier_ability_npc_hell1_frost_lady"
end

modifier_ability_npc_hell1_frost_lady = class({})

--Classifications template
function modifier_ability_npc_hell1_frost_lady:IsHidden()
   return true
end

function modifier_ability_npc_hell1_frost_lady:IsPurgable()
   return false
end

function modifier_ability_npc_hell1_frost_lady:OnCreated()
    self.vortex_particle = ParticleManager:CreateParticle( "particles/units/heroes/hero_ancient_apparition/ancient_ice_vortex.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	ParticleManager:SetParticleControl( self.vortex_particle, 0, self:GetParent():GetAbsOrigin() )
	ParticleManager:SetParticleControl( self.vortex_particle, 1, Vector( 200, 1, 1 ) )
end

function modifier_ability_npc_hell1_frost_lady:OnDestroy()
    ParticleManager:DestroyParticle(self.vortex_particle, false)
    ParticleManager:ReleaseParticleIndex(self.vortex_particle)
end

function modifier_ability_npc_hell1_frost_lady:CheckState()
	return {
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_NOT_ON_MINIMAP] = true,
		[MODIFIER_STATE_UNSELECTABLE] = true,
		[MODIFIER_STATE_COMMAND_RESTRICTED] = true,
		[MODIFIER_STATE_ATTACK_IMMUNE] = true,
		[MODIFIER_STATE_DISARMED] = true,
		[MODIFIER_STATE_ROOTED] = true,
	}
end

-- Aura template
function modifier_ability_npc_hell1_frost_lady:IsAura()
    return true
end

function modifier_ability_npc_hell1_frost_lady:GetModifierAura()
    return "modifier_ability_npc_hell1_frost_lady_cold_effect"
end

function modifier_ability_npc_hell1_frost_lady:GetAuraRadius()
    return 500
end

function modifier_ability_npc_hell1_frost_lady:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_hell1_frost_lady:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_ability_npc_hell1_frost_lady:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_hell1_frost_lady:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_hell1_frost_lady_cold_effect = class({})
--Classifications template
function modifier_ability_npc_hell1_frost_lady_cold_effect:IsHidden()
   return true
end

function modifier_ability_npc_hell1_frost_lady_cold_effect:IsPurgable()
   return false
end

function modifier_ability_npc_hell1_frost_lady_cold_effect:OnCreated()
    if IsClient() then
        return
    end
    self.modifier = self:GetParent():FindModifierByName("modifier_ability_location_hell1_burn")
    self:StartIntervalThink(0.2)
end

function modifier_ability_npc_hell1_frost_lady_cold_effect:OnIntervalThink()
    self.modifier:DecrementStackCount()
end