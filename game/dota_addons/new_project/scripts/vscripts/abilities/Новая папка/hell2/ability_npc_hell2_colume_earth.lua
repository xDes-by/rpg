ability_npc_hell2_colume_earth = class({})

LinkLuaModifier( "modifier_ability_npc_hell2_colume_earth","abilities/hell2/ability_npc_hell2_colume_earth", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_hell2_colume_earth_shtorm","abilities/hell2/ability_npc_hell2_colume_earth", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_hell2_colume_earth_shtorm_effect","abilities/hell2/ability_npc_hell2_colume_earth", LUA_MODIFIER_MOTION_NONE )

function ability_npc_hell2_colume_earth:Spawn()
	if IsClient() then
		return
	end
	Timers:CreateTimer(1,function()
		if self:GetCaster():IsAlive() then
			local hero = AICore:RandomEnemyHeroInRange(self:GetCaster(), 900)
			if hero ~= nil then
				local point = self:GetCaster():GetAbsOrigin() 
				local projectile_direction = point - hero:GetOrigin()
				projectile_direction = Vector( projectile_direction.x, projectile_direction.y, 0 ):Normalized()
				local projectile_name = "particles/econ/items/elder_titan/elder_titan_2021/elder_titan_2021_earth_splitter_projectile.vpcf"
				local projectile_distance = projectile_direction * 600
				local projectile_speed = projectile_distance/1.5
				-- create projectile
				local info = {
					Source = self:GetCaster(),
					Ability = self,
					vSpawnOrigin = self:GetCaster():GetAbsOrigin(),
					
					bDeleteOnHit = false,
					
					iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
					iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
					
					EffectName = projectile_name,
					fDistance = projectile_distance,
					--fStartRadius = projectile_radius,
					--fEndRadius =projectile_radius,
					vVelocity = projectile_direction * projectile_speed,
				
					bReplaceExisting = false,
					
					bProvidesVision = false,
					--iVisionRadius = vision_radius,
					--iVisionTeamNumber = caster:GetTeamNumber(),
				}
				ProjectileManager:CreateLinearProjectile(info)
				CreateModifierThinker(self:GetCaster(), self, "modifier_ability_npc_hell2_colume_earth", {duration = 1.5}, hero:GetOrigin() + RandomVector(RandomInt(100, 300)), self:GetCaster():GetTeamNumber(), false)
				return 6
			else
				return 1
			end
		end
	end)
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_hell2_colume_earth_shtorm", {})
end

modifier_ability_npc_hell2_colume_earth = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_ability_npc_hell2_colume_earth:IsHidden()
	return true
end

function modifier_ability_npc_hell2_colume_earth:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_ability_npc_hell2_colume_earth:OnCreated( kv )
	self.duration = 5
	self.radius = 350
	-- ApplyDamage(damageTable)
end

function modifier_ability_npc_hell2_colume_earth:OnDestroy()
	if not IsServer() then return end

	-- find enemies
	local enemies = FindUnitsInRadius(
		self:GetCaster():GetTeamNumber(),	-- int, your team number
		self:GetParent():GetAbsOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		self.radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
		0,	-- int, flag filter
		0,	-- int, order filter
		false	-- bool, can grow cache
	)

	for _,enemy in pairs(enemies) do
		-- stun
		enemy:AddNewModifier(
			self:GetCaster(), -- player source
			self:GetAbility(), -- ability source
			"modifier_stunned", -- modifier name
			{ duration = self.duration } -- kv
		)
	end

	-- play effects
	self:PlayEffects()

	UTIL_Remove( self:GetParent() )
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_ability_npc_hell2_colume_earth:PlayEffects()
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_leshrac/leshrac_split_earth.vpcf"
	local sound_cast = "Hero_Leshrac.Split_Earth"

	-- -- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetAbsOrigin() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( self.radius, 0, 0 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )

	-- Create Sound
	EmitSoundOnLocationWithCaster( self:GetParent():GetAbsOrigin(), sound_cast, self:GetCaster() )
end

modifier_ability_npc_hell2_colume_earth_shtorm = class({})

function modifier_ability_npc_hell2_colume_earth_shtorm:IsHidden()
	return true
end

function modifier_ability_npc_hell2_colume_earth_shtorm:OnCreated()
	self.effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_sandking/sandking_sandstorm.vpcf", PATTACH_POINT, self:GetParent() )
	ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( 600, 600, 600 ) )
	EmitSoundOn( "Ability.SandKing_SandStorm.loop", self:GetParent() )
end

function modifier_ability_npc_hell2_colume_earth_shtorm:OnDestroy()
	ParticleManager:DestroyParticle( self.effect_cast, false )
	ParticleManager:ReleaseParticleIndex( self.effect_cast )

	-- Stop sound
	local sound_cast = "Ability.SandKing_SandStorm.loop"
	StopSoundOn( sound_cast, self:GetParent() )
end

-- Aura template
function modifier_ability_npc_hell2_colume_earth_shtorm:IsAura()
	return true
end

function modifier_ability_npc_hell2_colume_earth_shtorm:GetModifierAura()
	return "modifier_ability_npc_hell2_colume_earth_shtorm_effect"
end

function modifier_ability_npc_hell2_colume_earth_shtorm:GetAuraRadius()
	return 500
end

function modifier_ability_npc_hell2_colume_earth_shtorm:GetAuraDuration()
	return 0.5
end

function modifier_ability_npc_hell2_colume_earth_shtorm:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ability_npc_hell2_colume_earth_shtorm:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_hell2_colume_earth_shtorm:GetAuraSearchFlags()
	return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_hell2_colume_earth_shtorm_effect = class({})
--Classifications template
function modifier_ability_npc_hell2_colume_earth_shtorm_effect:IsHidden()
   return false
end

function modifier_ability_npc_hell2_colume_earth_shtorm_effect:IsDebuff()
   return true
end

function modifier_ability_npc_hell2_colume_earth_shtorm_effect:IsPurgable()
   return false
end

function modifier_ability_npc_hell2_colume_earth_shtorm_effect:RemoveOnDeath()
   return true
end

function modifier_ability_npc_hell2_colume_earth_shtorm_effect:DestroyOnExpire()
	return true
end

function modifier_ability_npc_hell2_colume_earth_shtorm_effect:DeclareFunctions()
   return {
	   MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
}
end

function modifier_ability_npc_hell2_colume_earth_shtorm_effect:GetModifierMoveSpeedBonus_Percentage()
	return -20
end
