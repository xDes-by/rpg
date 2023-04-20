LinkLuaModifier( "modifier_npc_dota_hero_death_prophet_spell1_slow","heroes/npc_dota_hero_death_prophet/npc_dota_hero_death_prophet_spell1", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_death_prophet_spell1 = class({})

function npc_dota_hero_death_prophet_spell1:OnSpellStart()
	
	EmitSoundOn("Hero_DeathProphet.CarrionSwarm", self:GetCaster())

    self.abi = self:GetCaster():FindAbilityByName("npc_dota_hero_death_prophet_spell3")
   
	local caster = self:GetCaster()
	local point = self:GetCursorPosition()

	local projectile_distance = self:GetSpecialValueFor( "distanse" )
	local projectile_speed = self:GetSpecialValueFor( "distanse" )
	local projectile_start_radius = self:GetSpecialValueFor( "start" )
	local projectile_end_radius = self:GetSpecialValueFor( "end" )

	local direction = point-caster:GetOrigin()
	direction.z = 0
	local projectile_direction = direction:Normalized()

	local info = {
		Source = caster,
		Ability = self,
		vSpawnOrigin = caster:GetAbsOrigin(),
		
	    bDeleteOnHit = false,
	    
	    iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
	    iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
	    iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
	    
	    EffectName = "particles/econ/items/death_prophet/death_prophet_acherontia/death_prophet_acher_swarm.vpcf",
	    fDistance = projectile_distance,
	    fStartRadius = projectile_start_radius,
	    fEndRadius = projectile_end_radius,
		vVelocity = projectile_direction * projectile_speed,

		bProvidesVision = false,
	}
	ProjectileManager:CreateLinearProjectile(info)
end

function npc_dota_hero_death_prophet_spell1:OnProjectileHitHandle( target, location, projectile )
	if not target then return end

	target:AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_death_prophet_spell1_slow", {duration = self:GetSpecialValueFor("duration")})
	
	if self.abi:GetLevel() > 0 then
		self.abi:CreateGhost(target)
	end
	
	local damageTable = {
		victim = target,
		attacker = self:GetCaster(),
		damage = self:GetSpecialValueFor("damage"),
		damage_type = self:GetAbilityDamageType(),
	}
	ApplyDamage( damageTable )

	local direction = ProjectileManager:GetLinearProjectileVelocity( projectile )
	direction.z = 0
	direction = direction:Normalized()
end

---------------------------------------

modifier_npc_dota_hero_death_prophet_spell1_slow = class({})

function modifier_npc_dota_hero_death_prophet_spell1_slow:IsHidden()
    return true
end

function modifier_npc_dota_hero_death_prophet_spell1_slow:IsDebuff()
    return true
end

function modifier_npc_dota_hero_death_prophet_spell1_slow:IsPurgable()
    return true
end

function modifier_npc_dota_hero_death_prophet_spell1_slow:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_death_prophet_spell1_slow:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
    }
end

function modifier_npc_dota_hero_death_prophet_spell1_slow:GetModifierMoveSpeedBonus_Percentage()
    return -self:GetAbility():GetSpecialValueFor("slow")
end