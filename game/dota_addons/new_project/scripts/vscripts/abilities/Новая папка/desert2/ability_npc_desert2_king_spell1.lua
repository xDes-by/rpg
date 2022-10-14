ability_npc_desert2_king_spell1 = class({})

function ability_npc_desert2_king_spell1:OnSpellStart()
	-- unit identifier
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()
	local point = self:GetCursorPosition()
	local origin = caster:GetOrigin()
    self.point = self:GetCursorPosition()

	local projectile_name = "particles/units/heroes/hero_sandking/sandking_burrowstrike.vpcf"
	local projectile_start_radius = 150
	local projectile_end_radius = projectile_start_radius
	local projectile_direction = (point-origin)
	projectile_direction.z = 0
	projectile_direction:Normalized()
	local projectile_speed = 2000
	local projectile_distance = (point-origin):Length2D()

	-- create projectile
	local info = {
		Source = caster,
		Ability = self,
		vSpawnOrigin = caster:GetAbsOrigin(),
		
	    bDeleteOnHit = false,
	    
	    iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
	    iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
	    iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
	    
	    EffectName = projectile_name,
	    fDistance = projectile_distance,
	    fStartRadius = projectile_start_radius,
	    fEndRadius =projectile_end_radius,
		vVelocity = projectile_direction * projectile_speed,
	}
	ProjectileManager:CreateLinearProjectile(info)

	self:PlayEffects( origin, point )
end
--------------------------------------------------------------------------------
-- Projectile
function ability_npc_desert2_king_spell1:OnProjectileHit( target, location )
	if not target then 
        FindClearSpaceForUnit(self:GetCaster(), self.point, true) 
        return
    end

	-- cancel if linken
	if target:TriggerSpellAbsorb( self ) then return end

	-- apply stun
	local duration = self:GetSpecialValueFor( "burrow_duration" )
	target:AddNewModifier(
		self:GetCaster(), -- player source
		self, -- ability source
		"modifier_stunned", -- modifier name
		{ duration = duration } -- kv
	)

    target:AddNewModifier(self:GetCaster(),self,"modifier_generic_arc_lua", {
    height = 300, duration = 0.5,
    isStun = true, activity = ACT_DOTA_FLAIL})
	-- apply damage
	local damageTable = {
		victim = target,
		attacker = self:GetCaster(),
		damage = self:GetAbilityDamage(),
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self, --Optional.
	}
	ApplyDamage(damageTable)
end

function ability_npc_desert2_king_spell1:PlayEffects( origin, target )
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_sandking/sandking_burrowstrike.vpcf"
	local sound_cast = "Ability.SandKing_BurrowStrike"

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 0, origin )
	ParticleManager:SetParticleControl( effect_cast, 1, target )
	ParticleManager:ReleaseParticleIndex( effect_cast )

	-- Create Sound
	EmitSoundOn( sound_cast, self:GetCaster() )
end