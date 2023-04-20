LinkLuaModifier( "modifier_npc_dota_hero_furion_spell6_effect", "heroes/npc_dota_hero_furion/npc_dota_hero_furion_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_furion_spell6_animation1", "heroes/npc_dota_hero_furion/npc_dota_hero_furion_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_furion_spell6_animation2", "heroes/npc_dota_hero_furion/npc_dota_hero_furion_spell6", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_furion_spell6 = class({})

function npc_dota_hero_furion_spell6:OnSpellStart()
	self.effect_cast = ParticleManager:CreateParticle( "particles/npc_dota_hero_furion/npc_dota_hero_furion_ulti_cast.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
	ParticleManager:SetParticleControlEnt(self.effect_cast, 1, self:GetCaster(), PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", self:GetCaster():GetAbsOrigin(), true)
	EmitSoundOn( "Hero_VoidSpirit.AetherRemnant.Triggered", self:GetCaster() )
    if not IsServer() then return end
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_furion_spell6_animation1", {duration = 2.0})
end

function npc_dota_hero_furion_spell6:OnChannelFinish(bInterrupted)
    if bInterrupted then
        if self:GetCaster():HasModifier("modifier_npc_dota_hero_furion_spell6_animation1") then
            self:GetCaster():RemoveModifierByName("modifier_npc_dota_hero_furion_spell6_animation1")
            StopSoundOn( "Hero_VoidSpirit.AetherRemnant.Triggered", self:GetCaster() )
        end
        if self:GetCaster():HasModifier("modifier_npc_dota_hero_furion_spell6_animation2") then
            self:GetCaster():RemoveModifierByName("modifier_npc_dota_hero_furion_spell6_animation2")
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
	ApplyDamage({
		victim = hTarget,
		damage = self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster()),
		damage_type = DAMAGE_TYPE_PHYSICAL,
		damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION + DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL,
		attacker = self:GetCaster(),
	})
end

-------------------------------------------------------------------------------------------

modifier_npc_dota_hero_furion_spell6_effect = class({})

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
	self:StartIntervalThink(0.1)
end

function modifier_npc_dota_hero_furion_spell6_effect:OnIntervalThink()
	if not IsServer() then return end
	local enemies = FindUnitsInRadius(self:GetParent():GetTeamNumber(), self:GetParent():GetOrigin(), nil, 400, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)
	if #enemies > 0 then
		ProjectileManager:CreateTrackingProjectile({
			Target = enemies[1],
			Source = self:GetParent(),  
			Ability = self:GetAbility(),
			EffectName = "particles/units/heroes/hero_furion/furion_base_attack.vpcf",
			iMoveSpeed = 1125,
			ExtraData = {attacker = self:GetCaster()}
		})
				
		-- ProjectileManager:CreateTrackingProjectile({
			-- Target = enemies[1],
			-- Source = self:GetParent(),
			-- EffectName = "particles/units/heroes/hero_furion/furion_base_attack.vpcf",
			-- iMoveSpeed = 1125,
			-- ExtraData = {attacker = self:GetCaster()}
		-- })
	end
	self:StartIntervalThink(-1)
	self:StartIntervalThink(1)
end

------------------------------------------------------------------------

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

---------------------------------------------------------------

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