ability_npc_boss_hell1_spell5 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_hell1_spell5","abilities/hell1/ability_npc_boss_hell1_spell5", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_hell1_spell5_effect","abilities/hell1/ability_npc_boss_hell1_spell5", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_hell1_spell5:OnSpellStart()
    local pos = self:GetCaster():GetOrigin()
    local trigger = 0
    Timers:CreateTimer(0.2,function()
        trigger = trigger + 1
        if trigger <= 3 then
            local npc = CreateModifierThinker(self:GetCaster(), self, "modifier_ability_npc_boss_hell1_spell5", {duration = 3}, pos + RandomVector(RandomInt(100, 500)), self:GetCaster():GetTeamNumber(), false)
            ProjectileManager:CreateTrackingProjectile{
                Source = self:GetCaster(),
                Ability = self,	
                
                EffectName = "particles/units/heroes/hero_snapfire/snapfire_lizard_blobs_arced.vpcf",
                iMoveSpeed = 1300,
                bDodgeable = false,                           -- Optional
                Target = npc,
                vSourceLoc = self:GetCaster():GetOrigin(),                -- Optional (HOW)
                
                bDrawsOnMinimap = false,                          -- Optional
                bVisibleToEnemies = true,                         -- Optional
                bProvidesVision = true,                           -- Optional
                iVisionRadius = true,                              -- Optional
                iVisionTeamNumber = self:GetCaster():GetTeamNumber(),        -- Optional
            }
            return 0.2
        end
    end)
	EmitSoundOn( "Hero_Snapfire.MortimerBlob.Launch", self:GetCaster() )
end

function ability_npc_boss_hell1_spell5:OnProjectileHit(hTarget, vLocation)
    hTarget:FindModifierByName("modifier_ability_npc_boss_hell1_spell5"):Active()
end

modifier_ability_npc_boss_hell1_spell5 = class({})

function modifier_ability_npc_boss_hell1_spell5:Active()
    local loc = self:GetParent():GetOrigin()
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_snapfire/hero_snapfire_ultimate_impact.vpcf", PATTACH_WORLDORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 3, loc )
	ParticleManager:ReleaseParticleIndex( effect_cast )
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_snapfire/hero_snapfire_ultimate_linger.vpcf", PATTACH_WORLDORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 0, loc )
	ParticleManager:SetParticleControl( effect_cast, 1, loc )
	ParticleManager:ReleaseParticleIndex( effect_cast )
	EmitSoundOnLocationWithCaster( loc, "Hero_Snapfire.MortimerBlob.Impact", self:GetCaster() )
    self.aura = true
end

function modifier_ability_npc_boss_hell1_spell5:OnDestroy()
    UTIL_Remove(self:GetParent())
end

-- Aura template
function modifier_ability_npc_boss_hell1_spell5:IsAura()
    return self.aura
end

function modifier_ability_npc_boss_hell1_spell5:GetModifierAura()
    return "modifier_ability_npc_boss_hell1_spell5_effect"
end

function modifier_ability_npc_boss_hell1_spell5:GetAuraRadius()
    return 300
end

function modifier_ability_npc_boss_hell1_spell5:GetAuraDuration()
    return 3
end

function modifier_ability_npc_boss_hell1_spell5:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ability_npc_boss_hell1_spell5:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_boss_hell1_spell5:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_boss_hell1_spell5_effect = class({})
--Classifications template
function modifier_ability_npc_boss_hell1_spell5_effect:IsHidden()
    return false
end

function modifier_ability_npc_boss_hell1_spell5_effect:IsDebuff()
    return true
end

function modifier_ability_npc_boss_hell1_spell5_effect:IsPurgable()
    return true
end

function modifier_ability_npc_boss_hell1_spell5_effect:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_hell1_spell5_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_hell1_spell5_effect:OnCreated()
    if IsClient() then
        return
    end
    ApplyDamage({victim = self:GetParent(),
    damage = self:GetAbility():GetSpecialValueFor("damage_hit"),
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
    self.damage = self:GetAbility():GetSpecialValueFor("damage_think")
    self.slow = self:GetAbility():GetSpecialValueFor("slow")
    self:StartIntervalThink(1)
end

function modifier_ability_npc_boss_hell1_spell5_effect:OnIntervalThink()
    ApplyDamage({victim = self:GetParent(),
    damage = self.damage,
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end

function modifier_ability_npc_boss_hell1_spell5_effect:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
    }
end

function modifier_ability_npc_boss_hell1_spell5_effect:GetModifierMoveSpeedBonus_Percentage()
    return -self.slow
end
