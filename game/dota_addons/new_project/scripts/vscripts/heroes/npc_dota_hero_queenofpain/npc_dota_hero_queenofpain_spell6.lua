npc_dota_hero_queenofpain_spell6 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_queenofpain_spell6", "heroes/npc_dota_hero_queenofpain/npc_dota_hero_queenofpain_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_queenofpain_spell6_effect", "heroes/npc_dota_hero_queenofpain/npc_dota_hero_queenofpain_spell6", LUA_MODIFIER_MOTION_NONE )


function npc_dota_hero_queenofpain_spell6:OnSpellStart()
    self.modifier = self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_queenofpain_spell6", {duration = 5})
	self.effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_doom_bringer/doom_scorched_earth.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
	ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( self:GetSpecialValueFor("radius"), 0, 0 ) )
	EmitSoundOn( "Hero_DoomBringer.ScorchedEarthAura", self:GetCaster() )
    EmitSoundOn( "Hero_DoomBringer.Doom", self:GetCaster() )
    self:GetCaster():StartGesture(ACT_DOTA_GENERIC_CHANNEL_1)
	self.effect_cast2 = ParticleManager:CreateParticle( "particles/units/heroes/hero_doom_bringer/doom_bringer_doom.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
end

function npc_dota_hero_queenofpain_spell6:GetChannelTime()
    return self:GetSpecialValueFor("channel_time")
end

function npc_dota_hero_queenofpain_spell6:OnChannelFinish()
    self:GetCaster():FadeGesture(ACT_DOTA_GENERIC_CHANNEL_1)
    self.modifier:Destroy()
    ParticleManager:DestroyParticle(self.effect_cast, false)
    ParticleManager:DestroyParticle(self.effect_cast2, false)
	StopSoundOn( "Hero_DoomBringer.ScorchedEarthAura", self:GetCaster() )
	StopSoundOn( "Hero_DoomBringer.Doom", self:GetCaster() )
end

modifier_npc_dota_hero_queenofpain_spell6 = class({})
--Classifications template
function modifier_npc_dota_hero_queenofpain_spell6:IsHidden()
   return true
end

function modifier_npc_dota_hero_queenofpain_spell6:IsPurgable()
   return false
end

function modifier_npc_dota_hero_queenofpain_spell6:RemoveOnDeath()
   return true
end

function modifier_npc_dota_hero_queenofpain_spell6:DestroyOnExpire()
    return true
end

-- Aura template
function modifier_npc_dota_hero_queenofpain_spell6:IsAura()
    return true
end

function modifier_npc_dota_hero_queenofpain_spell6:GetModifierAura()
    return "modifier_npc_dota_hero_queenofpain_spell6_effect"
end

function modifier_npc_dota_hero_queenofpain_spell6:GetAuraRadius()
    return 500
end

function modifier_npc_dota_hero_queenofpain_spell6:GetAuraDuration()
    return 0.5
end

function modifier_npc_dota_hero_queenofpain_spell6:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_npc_dota_hero_queenofpain_spell6:GetAuraSearchType()
    return DOTA_UNIT_TARGET_BASIC
end

function modifier_npc_dota_hero_queenofpain_spell6:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_npc_dota_hero_queenofpain_spell6_effect = class({})

function modifier_npc_dota_hero_queenofpain_spell6_effect:IsHidden()
   return false
end

function modifier_npc_dota_hero_queenofpain_spell6_effect:IsPurgable()
   return false
end

function modifier_npc_dota_hero_queenofpain_spell6_effect:RemoveOnDeath()
   return true
end

function modifier_npc_dota_hero_queenofpain_spell6_effect:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_queenofpain_spell6_effect:OnCreated()
    self.radius = self:GetAbility():GetSpecialValueFor("radius")
    self.damage = self:GetAbility():GetSpecialValueFor("damage_tick")
    self:StartIntervalThink(0.33)
end

function modifier_npc_dota_hero_queenofpain_spell6_effect:OnIntervalThink()
    if IsClient() then
        return
    end
    ApplyDamage({victim = self:GetParent(),
    damage =  self.damage,
    damage_type = self:GetAbility():GetAbilityDamageType(),
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end
