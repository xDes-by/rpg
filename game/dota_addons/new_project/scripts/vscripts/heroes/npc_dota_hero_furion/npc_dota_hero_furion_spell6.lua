npc_dota_hero_furion_spell6 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_furion_spell6", "heroes/npc_dota_hero_furion/npc_dota_hero_furion_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_furion_spell6_effect", "heroes/npc_dota_hero_furion/npc_dota_hero_furion_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_furion_spell6_animation1", "heroes/npc_dota_hero_furion/npc_dota_hero_furion_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_furion_spell6_animation2", "heroes/npc_dota_hero_furion/npc_dota_hero_furion_spell6", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_furion_spell6:GetChannelTime()
    return 5
end

function npc_dota_hero_furion_spell6:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_furion_spell6", {duration = 5})
	self.effect_cast = ParticleManager:CreateParticle( "particles/npc_dota_hero_furion/npc_dota_hero_furion_ulti_cast.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
	ParticleManager:SetParticleControlEnt(self.effect_cast, 1, self:GetCaster(), PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", self:GetCaster():GetAbsOrigin(), true)
	EmitSoundOn( "void_spirit_voidspir_ability4_04", self:GetCaster() )
    local caster = self:GetCaster()
    Timers:CreateTimer(3,function()
        if caster:HasModifier("modifier_npc_dota_hero_furion_spell6") then
	        EmitSoundOn( "void_spirit_voidspir_ability1_02", caster )
        end
    end)
    if IsClient() then
        return
    end
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_furion_spell6_animation1", {duration = 3.2})
end

function npc_dota_hero_furion_spell6:OnChannelFinish(bInterrupted)
    if bInterrupted then
        if self:GetCaster():HasModifier("modifier_npc_dota_hero_furion_spell6_animation1") then
            self:GetCaster():RemoveModifierByName("modifier_npc_dota_hero_furion_spell6_animation1")
            StopSoundOn( "void_spirit_voidspir_ability4_04", self:GetCaster() )
        end
        if self:GetCaster():HasModifier("modifier_npc_dota_hero_furion_spell6_animation2") then
            self:GetCaster():RemoveModifierByName("modifier_npc_dota_hero_furion_spell6_animation2")
            StopSoundOn( "void_spirit_voidspir_ability1_02", self:GetCaster() )
        end
        ParticleManager:DestroyParticle(self.effect_cast, true)
    end
    if not bInterrupted then
        local allies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self:GetCaster():GetAbsOrigin(), nil, self:GetSpecialValueFor("rind_radius"), DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, 0, 0,false)
        for _,unit in pairs(allies) do
            unit:AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_furion_spell6_effect", {duration = self:GetSpecialValueFor("duration")})
        end
        EmitSoundOn("Hero_VoidSpirit.Pulse.Cast", self:GetCaster())
        ParticleManager:DestroyParticle(self.effect_cast, false)
    end
end


function npc_dota_hero_furion_spell6:OnProjectileHit_ExtraData(hTarget, vLocation, ExtraData)
    if ExtraData.attacker == self:GetCaster() then
        self:GetCaster():PerformAttack(hTarget, false, false, true, false, false, false, true)
    else
        ApplyDamage({victim = hTarget,
        damage = self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster()),
        damage_type = DAMAGE_TYPE_PHYSICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION + DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL,
        attacker = self:GetCaster(),
        ability = self})
    end
end

modifier_npc_dota_hero_furion_spell6_effect = class({})
--Classifications template
function modifier_npc_dota_hero_furion_spell6_effect:IsHidden()
    return false
end

function modifier_npc_dota_hero_furion_spell6_effect:IsDebuff()
    return false
end

function modifier_npc_dota_hero_furion_spell6_effect:IsPurgable()
    return false
end

function modifier_npc_dota_hero_furion_spell6_effect:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_furion_spell6_effect:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_furion_spell6_effect:OnCreated()
    local effect_cast1 = ParticleManager:CreateParticle("particles/units/heroes/hero_keeper_of_the_light/keeper_chakra_magic.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
	ParticleManager:SetParticleControlEnt(effect_cast1, 1, self:GetParent(), PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", self:GetParent():GetAbsOrigin(), true)
    
    local effect_cast = ParticleManager:CreateParticle("particles/npc_dota_hero_furion/npc_dota_hero_furion_ulti_buff1.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
    self:AddParticle(effect_cast, false, false, -1, false, false)
    self.CanTwiseAttack = true
end

function modifier_npc_dota_hero_furion_spell6_effect:OnIntervalThink()
    self.CanTwiseAttack = true
    self:StartIntervalThink(-1)
end

function modifier_npc_dota_hero_furion_spell6_effect:DeclareFunctions()
    return {
       MODIFIER_EVENT_ON_ATTACK
    }
end

function modifier_npc_dota_hero_furion_spell6_effect:OnAttack(data)
    if data.attacker == self:GetParent() and self.CanTwiseAttack then
        local hiter = self:GetCaster()
        if self:GetCaster() ~= data.attacker then
            local ability = self:GetAbility()
            Timers:CreateTimer(0.3,function()
                    ProjectileManager:CreateTrackingProjectile({
                    Target = data.target,
                    Source = data.attacker,
                    Ability = ability,	
                    
                    EffectName = "particles/units/heroes/hero_furion/furion_base_attack.vpcf",
                    iMoveSpeed = 1125,
                    ExtraData = {attacker = data.attacker}
                })
            end)
            local effect_cast = ParticleManager:CreateParticle( "particles/econ/items/void_spirit/void_spirit_immortal_2021/void_spirit_immortal_2021_astral_step_travel_strike_blur.vpcf", PATTACH_POINT, self:GetParent() )
            ParticleManager:ReleaseParticleIndex( effect_cast )
            self.CanTwiseAttack = false
            self:StartIntervalThink(3)
        else
            self.CanTwiseAttack = false
            self:StartIntervalThink(3)
            Timers:CreateTimer(0.3,function()
                hiter:PerformAttack(data.target, false, false, true, false, true, false, true)
            end)
        end
    end
end

modifier_npc_dota_hero_furion_spell6_animation1 = class({})

function modifier_npc_dota_hero_furion_spell6_animation1:IsHidden()
    return true
end

function modifier_npc_dota_hero_furion_spell6_animation1:OnDestroy()
    if IsClient() then
        return
    end
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_furion_spell6_animation2", {duration = 2})
end

function modifier_npc_dota_hero_furion_spell6_animation1:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION
    }
end

function modifier_npc_dota_hero_furion_spell6_animation1:GetOverrideAnimation()
    return ACT_DOTA_CAST_ABILITY_2
end

modifier_npc_dota_hero_furion_spell6_animation2 = class({})

function modifier_npc_dota_hero_furion_spell6_animation2:IsHidden()
    return true
end

function modifier_npc_dota_hero_furion_spell6_animation2:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION_RATE
    }
end

function modifier_npc_dota_hero_furion_spell6_animation2:GetOverrideAnimationRate()
    return 0.8
end

function modifier_npc_dota_hero_furion_spell6_animation2:GetOverrideAnimation()
    return ACT_DOTA_CAST_ABILITY_3
end