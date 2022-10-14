ability_npc_boss_cave1_spell4 = class({})

LinkLuaModifier( "modidfier_ability_npc_boss_cave1_spell4","abilities/cave1/ability_npc_boss_cave1_spell4", LUA_MODIFIER_MOTION_NONE )


function ability_npc_boss_cave1_spell4:OnSpellStart()
    CreateModifierThinker(self:GetCaster(),self,"modidfier_ability_npc_boss_cave1_spell4",{},self:GetCursorPosition(),self:GetCaster():GetTeamNumber(),false)
end

modidfier_ability_npc_boss_cave1_spell4 = class({})

--------------------------------------------------------------------------------
-- Classifications
function modidfier_ability_npc_boss_cave1_spell4:IsHidden()
	return true
end

--------------------------------------------------------------------------------
-- Initializations
function modidfier_ability_npc_boss_cave1_spell4:OnRefresh()
    self:OnCreated()
end
function modidfier_ability_npc_boss_cave1_spell4:OnCreated( kv )
	if IsServer() then
		-- references
		self.caster_origin = self:GetCaster():GetAbsOrigin()
		self.parent_origin = self:GetParent():GetAbsOrigin()
		self.direction = self.parent_origin - self.caster_origin
		self.direction.z = 0
		self.direction = self.direction:Normalized()

		self.delay = 1.3
		self.radius = 275
		self.distance = 600
		self.speed = 300
		
		self.interval = 0.2
		local damage = self:GetAbility():GetSpecialValueFor( "damage" )

		-- variables
		self.fallen = false
		self.damageTable = {
			-- victim = target,
			attacker = self:GetCaster(),
			damage = damage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self:GetAbility(), --Optional.
		}

		-- Start interval
		self:StartIntervalThink( self.delay )

		-- play effects
		self:PlayEffects1()
	end
end

function modidfier_ability_npc_boss_cave1_spell4:OnDestroy( kv )
	if IsServer() then

		-- stop effects
		local sound_loop = "Hero_Invoker.ChaosMeteor.Loop"
		local sound_stop = "Hero_Invoker.ChaosMeteor.Destroy"
		StopSoundOn( sound_loop, self:GetParent() )
		EmitSoundOnLocationWithCaster( self:GetParent():GetAbsOrigin(), sound_stop, self:GetCaster() )
	end
	UTIL_Remove(self:GetParent())
end

--------------------------------------------------------------------------------
-- Interval Effects
function modidfier_ability_npc_boss_cave1_spell4:OnIntervalThink()
	if not self.fallen then
		-- meatball has fallen
		self.fallen = true
		self:StartIntervalThink( self.interval )
		self:Burn()
		
		self:PlayEffects2()
	else
		-- move & damages
		self:Move_Burn()
	end
end

function modidfier_ability_npc_boss_cave1_spell4:Burn()
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
		self.damageTable.victim = enemy
		ApplyDamage( self.damageTable )
	end
end

--------------------------------------------------------------------------------
-- Motion effects
function modidfier_ability_npc_boss_cave1_spell4:Move_Burn()
	local parent = self:GetParent()

	-- set position
	local target = self.direction*self.speed*self.interval
	parent:SetOrigin( parent:GetAbsOrigin() + target )

	-- Burn
	self:Burn()
	
	-- check distance for next step
	if (parent:GetAbsOrigin() - self.parent_origin + target):Length2D()>self.distance then
		self:Destroy()
		return
	end
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function modidfier_ability_npc_boss_cave1_spell4:PlayEffects1()
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_invoker/invoker_chaos_meteor_fly.vpcf"
	local sound_impact = "Hero_Invoker.ChaosMeteor.Cast"

	-- Get Data
	local height = 1000
	local height_target = -0

	-- Create Particle
	 local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( effect_cast, 0, self.caster_origin + Vector( 0, 0, height ) )
	ParticleManager:SetParticleControl( effect_cast, 1, self.parent_origin + Vector( 0, 0, height_target) )
	ParticleManager:SetParticleControl( effect_cast, 2, Vector( self.delay, 0, 0 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )

	-- Create Sound
	EmitSoundOnLocationWithCaster( self.caster_origin, sound_impact, self:GetCaster() )
end

function modidfier_ability_npc_boss_cave1_spell4:PlayEffects2()
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_invoker/invoker_chaos_meteor.vpcf"
	local sound_impact = "Hero_Invoker.ChaosMeteor.Impact"
	local sound_loop = "Hero_Invoker.ChaosMeteor.Loop"

	-- Create Particle
	 local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( effect_cast, 0, self.parent_origin )
	ParticleManager:SetParticleControlForward( effect_cast, 0, self.direction )
	ParticleManager:SetParticleControl( effect_cast, 1, self.direction * self.speed )
	-- ParticleManager:ReleaseParticleIndex( effect_cast )

	-- -- buff particle
	self:AddParticle(
		effect_cast,
		false,
		false,
		-1,
		false,
		false
	)

	-- Create Sound
	EmitSoundOnLocationWithCaster( self.parent_origin, sound_impact, self:GetCaster() )
	EmitSoundOn( sound_loop, self:GetParent() )
end