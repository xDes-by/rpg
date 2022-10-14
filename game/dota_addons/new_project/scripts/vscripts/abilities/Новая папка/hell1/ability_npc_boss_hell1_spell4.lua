ability_npc_boss_hell1_spell4 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_hell1_spell4","abilities/hell1/ability_npc_boss_hell1_spell4", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_hell1_spell4_effect","abilities/hell1/ability_npc_boss_hell1_spell4", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_hell1_spell4:OnSpellStart()
    local pos = self:GetCaster():GetOrigin()
    local pfx = ParticleManager:CreateParticle("particles/ability_npc_boss_hell1_spell4.vpcf", PATTACH_WORLDORIGIN, self:GetCaster())
	ParticleManager:SetParticleControl( pfx, 0, pos )
	ParticleManager:SetParticleControl( pfx, 4, pos )
    ParticleManager:ReleaseParticleIndex(pfx)
    local procs = 0
    local vector = self:GetCaster():GetForwardVector() * 300
    Timers:CreateTimer(1.3,function()
        procs = procs + 1
        if procs <= 12 then 
            local newpos = RotatePosition(Vector(0, 0, 0), QAngle(0, procs * 30, 0), vector)
            CreateModifierThinker(self:GetCaster(), self, "modifier_ability_npc_boss_hell1_spell4", {duration = 3}, newpos + pos, self:GetCaster():GetTeamNumber(), false)
            return 0.2
        end
    end)
end

modifier_ability_npc_boss_hell1_spell4 = class({})

function modifier_ability_npc_boss_hell1_spell4:OnCreated()
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_dragon_knight/dragon_knight_shard_fireball_core.vpcf", PATTACH_WORLDORIGIN, self:GetParent())
	ParticleManager:SetParticleControl( pfx, 0, self:GetParent():GetOrigin() )
    ParticleManager:ReleaseParticleIndex(pfx)
end

function modifier_ability_npc_boss_hell1_spell4:OnDestroy()
    if IsClient() then
        return
    end
    UTIL_Remove(self:GetParent())
end

-- Aura template
function modifier_ability_npc_boss_hell1_spell4:IsAura()
    return true
end

function modifier_ability_npc_boss_hell1_spell4:GetModifierAura()
    return "modifier_ability_npc_boss_hell1_spell4_effect"
end

function modifier_ability_npc_boss_hell1_spell4:GetAuraRadius()
    return 250
end

function modifier_ability_npc_boss_hell1_spell4:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_boss_hell1_spell4:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_ability_npc_boss_hell1_spell4:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_boss_hell1_spell4:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_boss_hell1_spell4_effect = class({})
--Classifications template
function modifier_ability_npc_boss_hell1_spell4_effect:IsHidden()
    return false
end

function modifier_ability_npc_boss_hell1_spell4_effect:IsDebuff()
    return true
end

function modifier_ability_npc_boss_hell1_spell4_effect:IsPurgable()
    return true
end

function modifier_ability_npc_boss_hell1_spell4_effect:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_hell1_spell4_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_hell1_spell4_effect:OnCreated()
    self.damage = self:GetAbility():GetSpecialValueFor("damage")
    self:StartIntervalThink(1)
end

function modifier_ability_npc_boss_hell1_spell4_effect:OnIntervalThink()
    ApplyDamage({victim = self:GetParent(),
    damage = self.damage,
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end