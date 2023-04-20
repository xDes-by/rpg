LinkLuaModifier( "modifier_npc_dota_hero_abyssal_underlord_spell3", "heroes/npc_dota_hero_abyssal_underlord/npc_dota_hero_abyssal_underlord_spell3", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_abyssal_underlord_spell3 = class({})

function npc_dota_hero_abyssal_underlord_spell3:OnSpellStart() 
    self.damage = self:GetSpecialValueFor("damage")
	local point = self:GetCursorPosition()
	
	local direction = point-self:GetCaster():GetOrigin()
	direction.z = 0
	local projectile_direction = direction:Normalized()

    ProjectileManager:CreateLinearProjectile({
        Source = self:GetCaster(),
        Ability = self,
        vSpawnOrigin = self:GetCaster():GetAbsOrigin(),
        
        bDeleteOnHit = false,
        
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetType = DOTA_UNIT_TARGET_BASIC,
        
        EffectName = "particles/npc_dota_hero_abyssal_underlord/npc_dota_hero_abyssal_underlord_spell3.vpcf",
        fDistance = self:GetSpecialValueFor("distanse"),
        fStartRadius = self:GetSpecialValueFor("with"),
        fEndRadius = self:GetSpecialValueFor("with"),
        vVelocity = projectile_direction * self:GetSpecialValueFor("distanse"),

        bReplaceExisting = false,     
        bProvidesVision = false,
    })
    EmitSoundOn("Hero_AbyssalUnderlord.Firestorm.Cast", self:GetCaster())
end

function npc_dota_hero_abyssal_underlord_spell3:OnProjectileHitHandle( target, location, proj )
    if target then
        ApplyDamage({victim = target,
        damage = self.damage,
        damage_type = self:GetAbilityDamageType(),
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self})
		target:AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_abyssal_underlord_spell3", { duration = self:GetSpecialValueFor("duration") })
	end
end

------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------

modifier_npc_dota_hero_abyssal_underlord_spell3 = class({})

function modifier_npc_dota_hero_abyssal_underlord_spell3:IsHidden()
	return false
end

function modifier_npc_dota_hero_abyssal_underlord_spell3:IsDebuff()
	return not self.buff
end

function modifier_npc_dota_hero_abyssal_underlord_spell3:IsStunDebuff()
	return false
end

function modifier_npc_dota_hero_abyssal_underlord_spell3:IsPurgable()
	return false
end

function modifier_npc_dota_hero_abyssal_underlord_spell3:OnCreated( kv )
	self:StartIntervalThink(1)
end

function modifier_npc_dota_hero_abyssal_underlord_spell3:OnIntervalThink()
	if not IsServer() then return end
	ApplyDamage({
		victim = self:GetParent(),
		damage = self:GetAbility():GetSpecialValueFor("damage_per_sec"),
		damage_type = DAMAGE_TYPE_MAGICAL,
		attacker = self:GetCaster()
		})
end

function modifier_npc_dota_hero_abyssal_underlord_spell3:GetEffectName()
	return "particles/units/heroes/hero_viper/viper_poison_debuff.vpcf"
end

function modifier_npc_dota_hero_abyssal_underlord_spell3:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end