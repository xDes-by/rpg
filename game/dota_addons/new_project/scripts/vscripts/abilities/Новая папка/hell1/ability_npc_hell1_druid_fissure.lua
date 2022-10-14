ability_npc_hell1_druid_fissure = class({})

LinkLuaModifier( "modifier_ability_npc_hell1_druid_fissure_thinker", "abilities/hell1/ability_npc_hell1_druid_fissure", LUA_MODIFIER_MOTION_NONE )

function ability_npc_hell1_druid_fissure:OnSpellStart()
	-- unit identifier
	local caster = self:GetCaster()
	local point = self:GetCursorPosition()
    
	-- load data
	local damage = self:GetAbilityDamage()
	local distance = self:GetCastRange( point, caster )
	local duration = self:GetSpecialValueFor("fissure_duration")
	local radius = self:GetSpecialValueFor("fissure_radius")
	local stun_duration = self:GetSpecialValueFor("stun_duration")

	-- generate data
	local block_width = 24
	local block_delta = 8.25

	-- get wall vector
	local direction = point-caster:GetAbsOrigin()
	direction.z = 0
	direction = direction:Normalized()
	local wall_vector = direction * distance

	-- Create blocker along path
	local block_spacing = (block_delta+2*block_width)
	local blocks = distance/block_spacing
	local block_pos = caster:GetHullRadius() + block_delta + block_width
	local start_pos = caster:GetAbsOrigin() + direction*block_pos

	for i=1,blocks do
		local block_vec = caster:GetAbsOrigin() + direction*block_pos
		local blocker = CreateModifierThinker(
			caster, -- player source
			self, -- ability source
			"modifier_ability_npc_hell1_druid_fissure_thinker", -- modifier name
			{ duration = duration }, -- kv
			block_vec,
			caster:GetTeamNumber(),
			false
		)
	end

	-- find units in line
	local end_pos = start_pos + wall_vector
	local units = FindUnitsInLine(
		caster:GetTeamNumber(),
		start_pos,
		end_pos,
		-- caster:GetAbsOrigin() + direction*caster:GetHullRadius(),
		-- caster:GetAbsOrigin() + direction*caster:GetHullRadius() + wall_vector,
		nil,
		radius,
		DOTA_UNIT_TARGET_TEAM_BOTH,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
		0
	)

	-- precache damage
	local damageTable = {
		-- victim = target,
		attacker = caster,
		damage = damage,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self, --Optional.
	}

	-- apply damage, shove and stun
	for _,unit in pairs(units) do
		-- shove
		FindClearSpaceForUnit( unit, unit:GetAbsOrigin(), true )

		if unit:GetTeamNumber()~=caster:GetTeamNumber() then
			-- damage
			damageTable.victim = unit
			ApplyDamage(damageTable)

			-- stun
			unit:AddNewModifier(
				caster, -- player source
				self, -- ability source
				"modifier_stunned", -- modifier name
				{ duration = stun_duration } -- kv
			)
		end
	end

	-- Effects
	self:PlayEffects( start_pos, end_pos, duration )
end

--------------------------------------------------------------------------------
function ability_npc_hell1_druid_fissure:PlayEffects( start_pos, end_pos, duration )
	-- Get Resources
	local particle_cast = "particles/econ/items/earthshaker/earthshaker_ti9/earthshaker_fissure_ti9_lvl2.vpcf"
	local sound_cast = "Hero_EarthShaker.Fissure"

	-- generate data
	local caster = self:GetCaster()

	-- Create Particle
	-- local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, caster )
	local effect_cast = ParticleManager:CreateParticle(particle_cast, PATTACH_WORLDORIGIN, caster )
	ParticleManager:SetParticleControl( effect_cast, 0, start_pos )
	ParticleManager:SetParticleControl( effect_cast, 1, end_pos )
	ParticleManager:SetParticleControl( effect_cast, 2, Vector( duration, 0, 0 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )

	-- Create Sound
	EmitSoundOnLocationWithCaster( start_pos, sound_cast, caster )
	EmitSoundOnLocationWithCaster( end_pos, sound_cast, caster )
end

modifier_ability_npc_hell1_druid_fissure_thinker = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_ability_npc_hell1_druid_fissure_thinker:IsHidden()
	return true
end

function modifier_ability_npc_hell1_druid_fissure_thinker:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations

function modifier_ability_npc_hell1_druid_fissure_thinker:OnDestroy( kv )
	if IsServer() then
		-- Effects
		local sound_cast = "Hero_EarthShaker.FissureDestroy"
		EmitSoundOnLocationWithCaster(self:GetParent():GetAbsOrigin(), sound_cast, self:GetCaster() )
		UTIL_Remove(self:GetParent())
	end
end