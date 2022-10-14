ablility_npc_desert3_boss3_spell1 = class({})

function ablility_npc_desert3_boss3_spell1:OnSpellStart()
	-- unit identifier
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()
	local point = self:GetCursorPosition()

	-- load data
	if target then
		point = target:GetOrigin()
	end

	local projectile_name = "particles/econ/items/nyx_assassin/nyx_assassin_ti6/nyx_assassin_impale_ti6.vpcf"
	local projectile_distance = self:GetSpecialValueFor( "distance" )
	local projectile_speed = self:GetSpecialValueFor( "speed" )
    if not self:GetCaster().directional then
	    self.projectile_direction = (point-caster:GetOrigin()):Normalized()
		self.projectile_radius = self:GetSpecialValueFor( "width" )
	else
		self.projectile_direction = self:GetCaster().directional
		self.projectile_radius = 300
		self:GetCaster().directional = false
    end
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
	    fStartRadius = self.projectile_radius,
	    fEndRadius = self.projectile_radius,
		vVelocity = self.projectile_direction * projectile_speed,
	}
	ProjectileManager:CreateLinearProjectile(info)
	EmitSoundOn( "Hero_NyxAssassin.Impale", caster )
end

--------------------------------------------------------------------------------
-- Projectile
function ablility_npc_desert3_boss3_spell1:OnProjectileHit( target, location )
	if not target then return end
	if target:TriggerSpellAbsorb( self ) then return end

	local stun = self:GetSpecialValueFor( "duration" )
	local damage = self:GetAbilityDamage()

	local damageTable = {
		victim = target,
		attacker = self:GetCaster(),
		damage = damage,
		damage_type = self:GetAbilityDamageType(),
		ability = self, --Optional.
	}

	-- stun
	target:AddNewModifier(
		self:GetCaster(), -- player source
		self, -- ability source
		"modifier_stunned", -- modifier name
		{ duration = stun } -- kv
	)
    local knockback = target:AddNewModifier(self:GetCaster(),self,"modifier_generic_arc_lua", {
    height = 300, duration = 0.5,
    isStun = true, activity = ACT_DOTA_FLAIL})
	local callback = function()
		local damageTable = {
			victim = target,
			attacker = self:GetCaster(),
			damage = damage,
			damage_type = self:GetAbilityDamageType(),
			ability = self, --Optional.
		}
		ApplyDamage(damageTable)
		EmitSoundOn( "Hero_NyxAssassin.Impale.Target", target )
	end
	knockback:SetEndCallback( callback )
	local particle_cast = "particles/units/heroes/hero_nyx_assassin/nyx_assassin_impale_hit_spikes.vpcf"
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, target )
	ParticleManager:ReleaseParticleIndex( effect_cast )
end