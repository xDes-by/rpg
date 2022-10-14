ability_npc_boss_hell3_spell2 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_hell3_spell2","abilities/hell3/ability_npc_boss_hell3_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_hell3_spell2_aura","abilities/hell3/ability_npc_boss_hell3_spell2", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_hell3_spell2:OnSpellStart()
    CreateModifierThinker(self:GetCaster(),self,"modifier_ability_npc_boss_hell3_spell2",{duration = self:GetSpecialValueFor("thinker_duration")},self:GetCursorPosition(),self:GetCaster():GetTeamNumber(),false)
end

modifier_ability_npc_boss_hell3_spell2 = class({})
--Classifications template
function modifier_ability_npc_boss_hell3_spell2:IsHidden()
    return true
end

function modifier_ability_npc_boss_hell3_spell2:OnCreated()
    local radius = self:GetAbility():GetSpecialValueFor("radius")
    self.effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/heroes_underlord/underlord_pitofmalice_pre.vpcf", PATTACH_WORLDORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( self.effect_cast, 0, self:GetParent():GetAbsOrigin() )
	ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( radius, radius, radius ) )
    EmitSoundOn("Hero_AbyssalUnderlord.PitOfMalice.Start", self:GetParent())

    local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/heroes_underlord/underlord_pitofmalice.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetAbsOrigin() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( radius, radius, radius ) )
	ParticleManager:SetParticleControl( effect_cast, 2, Vector( self:GetDuration(), 0, 0 ) )
end

function modifier_ability_npc_boss_hell3_spell2:OnRefresh()
    self:OnCreated()
end


function modifier_ability_npc_boss_hell3_spell2:OnDestroy()
    if IsClient() then
        return
    end
    UTIL_Remove(self:GetParent())
end

-- Aura template
function modifier_ability_npc_boss_hell3_spell2:IsAura()
    return true
end

function modifier_ability_npc_boss_hell3_spell2:GetModifierAura()
    return "modifier_ability_npc_boss_hell3_spell2_aura"
end

function modifier_ability_npc_boss_hell3_spell2:GetAuraRadius()
    return 500
end

function modifier_ability_npc_boss_hell3_spell2:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_boss_hell3_spell2:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ability_npc_boss_hell3_spell2:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_boss_hell3_spell2:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_boss_hell3_spell2_aura = class({})
--Classifications template
function modifier_ability_npc_boss_hell3_spell2_aura:IsHidden()
    return true
end

function modifier_ability_npc_boss_hell3_spell2_aura:IsDebuff()
    return true
end

function modifier_ability_npc_boss_hell3_spell2_aura:IsPurgable()
    return true
end

function modifier_ability_npc_boss_hell3_spell2_aura:IsStunDebuff()
    return true
end

function modifier_ability_npc_boss_hell3_spell2_aura:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_hell3_spell2_aura:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_hell3_spell2_aura:OnCreated()
    self.dur = self:GetAbility():GetSpecialValueFor("duration")
    self.pfx = ParticleManager:CreateParticle("particles/units/heroes/heroes_underlord/abyssal_underlord_pitofmalice_stun.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
    self.roted = true
    if IsClient() then
        return
    end
    self:GetParent():AddNewModifier(self:GetCaster(), self, "modifier_fissure_rooted", {duration = self.dur})
    self:StartIntervalThink(self.dur)
end

function modifier_ability_npc_boss_hell3_spell2_aura:OnRefresh()
    self:OnCreated()
end

function modifier_ability_npc_boss_hell3_spell2_aura:OnIntervalThink()
    if self.roted then
        self.roted = false
        ParticleManager:DestroyParticle(self.pfx, false)
        ParticleManager:ReleaseParticleIndex(self.pfx)
    else
        self:GetParent():AddNewModifier(self:GetCaster(), self, "modifier_fissure_rooted", {duration = self.dur})
        self.roted = true
        self.pfx = ParticleManager:CreateParticle("particles/units/heroes/heroes_underlord/abyssal_underlord_pitofmalice_stun.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
    end
end