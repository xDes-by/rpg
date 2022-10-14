ability_npc_hell2_colume_fire_meatball = class({})

LinkLuaModifier( "modifier_ability_npc_hell2_colume_fire_meatball", "abilities/hell2/ability_npc_hell2_colume_fire_meatball", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_hell2_colume_fire_meatball_burn", "abilities/hell2/ability_npc_hell2_colume_fire_meatball", LUA_MODIFIER_MOTION_NONE )

function ability_npc_hell2_colume_fire_meatball:Spawn()
	if IsClient() then
		return
	end
	Timers:CreateTimer(1,function()
		if self:GetCaster():IsAlive() then
			local hero = AICore:RandomEnemyHeroInRange(self:GetCaster(), 900)
			if hero ~= nil then
				local caster = self:GetCaster()
				local point = hero:GetAbsOrigin()
				CreateModifierThinker(
					caster, -- player source
					self, -- ability source
					"modifier_ability_npc_hell2_colume_fire_meatball", -- modifier name
					{}, -- kv
					point,
					self:GetCaster():GetTeamNumber(),
					false
				)
				return 3
			else
				return 1
			end
		end
	end)
end

modifier_ability_npc_hell2_colume_fire_meatball = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_ability_npc_hell2_colume_fire_meatball:IsHidden()
	return true
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_ability_npc_hell2_colume_fire_meatball:OnCreated( kv )
	if IsServer() then
		-- references
		self.caster_origin = self:GetCaster():GetAbsOrigin()
		self.parent_origin = self:GetParent():GetAbsOrigin()
		self.direction = self.parent_origin - self.caster_origin
		self.direction.z = 0
		self.direction = self.direction:Normalized()

		self.delay = 1.3
		self.radius = 275
		self.distance = self:GetAbility():GetSpecialValueFor( "distance" )
		self.speed = 300
		
		self.interval = 0.2
		self.duration = self:GetAbility():GetSpecialValueFor( "burn_duration" )
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
function modifier_ability_npc_hell2_colume_fire_meatball:OnRefresh()
    self:OnCreated()
end

function modifier_ability_npc_hell2_colume_fire_meatball:OnDestroy( kv )
	if IsServer() then

		-- stop effects
		local sound_loop = "Hero_Invoker.ChaosMeteor.Loop"
		local sound_stop = "Hero_Invoker.ChaosMeteor.Destroy"
		StopSoundOn( sound_loop, self:GetParent() )
		EmitSoundOnLocationWithCaster( self:GetParent():GetAbsOrigin(), sound_stop, self:GetCaster() )
		UTIL_Remove(self:GetParent())
	end
end

--------------------------------------------------------------------------------
-- Interval Effects
function modifier_ability_npc_hell2_colume_fire_meatball:OnIntervalThink()
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

function modifier_ability_npc_hell2_colume_fire_meatball:Burn()
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
		-- apply damage
		self.damageTable.victim = enemy
		ApplyDamage( self.damageTable )

		-- add modifier
		enemy:AddNewModifier(
			self:GetCaster(), -- player source
			self:GetAbility(), -- ability source
			"modifier_ability_npc_hell2_colume_fire_meatball_burn", -- modifier name
			{ duration = self.duration } -- kv
		)
	end
end

--------------------------------------------------------------------------------
-- Motion effects
function modifier_ability_npc_hell2_colume_fire_meatball:Move_Burn()
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
function modifier_ability_npc_hell2_colume_fire_meatball:PlayEffects1()
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

function modifier_ability_npc_hell2_colume_fire_meatball:PlayEffects2()
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


modifier_ability_npc_hell2_colume_fire_meatball_burn = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_ability_npc_hell2_colume_fire_meatball_burn:IsHidden()
	return false
end

function modifier_ability_npc_hell2_colume_fire_meatball_burn:IsDebuff()
	return true
end

function modifier_ability_npc_hell2_colume_fire_meatball_burn:IsStunDebuff()
	return false
end

function modifier_ability_npc_hell2_colume_fire_meatball_burn:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE 
end

function modifier_ability_npc_hell2_colume_fire_meatball_burn:IsPurgable()
	return true
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_ability_npc_hell2_colume_fire_meatball_burn:OnCreated( kv )
	if IsServer() then
		-- references
		local damage = self:GetAbility():GetSpecialValueFor( "damage_think" )
		local delay = 1
		self.damageTable = {
			victim = self:GetParent(),
			attacker = self:GetCaster(),
			damage = damage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self:GetAbility(), --Optional.
		}

		-- Start interval
		self:StartIntervalThink( delay )
	end
end

function modifier_ability_npc_hell2_colume_fire_meatball_burn:OnRefresh( kv )
	
end

function modifier_ability_npc_hell2_colume_fire_meatball_burn:OnDestroy( kv )

end

--------------------------------------------------------------------------------
-- Interval Effects
function modifier_ability_npc_hell2_colume_fire_meatball_burn:OnIntervalThink()
	-- damage
	ApplyDamage( self.damageTable )

	-- play effects
	local sound_tick = "Hero_Invoker.ChaosMeteor.Damage"
	EmitSoundOn( sound_tick, self:GetParent() )
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_ability_npc_hell2_colume_fire_meatball_burn:GetEffectName()
	return "particles/units/heroes/hero_invoker/invoker_chaos_meteor_burn_debuff.vpcf"
end

function modifier_ability_npc_hell2_colume_fire_meatball_burn:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end