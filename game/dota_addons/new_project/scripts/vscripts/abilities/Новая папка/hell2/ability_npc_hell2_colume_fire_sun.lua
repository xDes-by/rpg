ability_npc_hell2_colume_fire_sun = class({})

LinkLuaModifier( "modifier_ability_npc_hell2_colume_fire_sun", "abilities/hell2/ability_npc_hell2_colume_fire_sun", LUA_MODIFIER_MOTION_NONE )

function ability_npc_hell2_colume_fire_sun:Spawn()
	if IsClient() then
		return
	end
	Timers:CreateTimer(1,function()
		if self:GetCaster():IsAlive() then
			local hero = AICore:RandomEnemyHeroInRange(self:GetCaster(), 900)
			if hero ~= nil then
				local delay = self:GetSpecialValueFor("delay")
				if IsClient() then
					return
				end
				local point = hero:GetAbsOrigin()
				-- create modifier thinker
				CreateModifierThinker(
					self:GetCaster(),
					self,
					"modifier_ability_npc_hell2_colume_fire_sun",
					{ duration = delay },
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

modifier_ability_npc_hell2_colume_fire_sun = class({})

function modifier_ability_npc_hell2_colume_fire_sun:OnDestroy( kv )
    self.radius = self:GetAbility():GetSpecialValueFor("radius")
    self.damage = self:GetAbility():GetSpecialValueFor("damage")
	if IsServer() then
		-- Damage enemies
		local damageTable = {
			-- victim = target,
			attacker = self:GetCaster(),
			-- damage = self.damage,
			damage_type = DAMAGE_TYPE_PURE,
			ability = self:GetAbility(), --Optional.
		}

		local enemies = FindUnitsInRadius(
			self:GetCaster():GetTeamNumber(),	-- int, your team number
			self:GetParent():GetAbsOrigin(),	-- point, center point
			nil,	-- handle, cacheUnit. (not known)
			self.radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
			DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
			DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
			DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,	-- int, flag filter
			0,	-- int, order filter
			false	-- bool, can grow cache
		)

		for _,enemy in pairs(enemies) do
			damageTable.victim = enemy
			damageTable.damage = self.damage/#enemies
			ApplyDamage(damageTable)
		end

		-- Play effects
		self:PlayEffects2()

		-- remove thinker
		UTIL_Remove( self:GetParent() )
	end
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_ability_npc_hell2_colume_fire_sun:OnCreated()
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_invoker/invoker_sun_strike_team.vpcf"
	local sound_cast = "Hero_Invoker.SunStrike.Charge"

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetAbsOrigin() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( self.radius, 0, 0 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )

	-- Create Sound
	EmitSoundOnLocationForAllies( self:GetParent():GetAbsOrigin(), sound_cast, self:GetCaster() )
end

function modifier_ability_npc_hell2_colume_fire_sun:PlayEffects2()
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_invoker/invoker_sun_strike.vpcf"
	local sound_cast = "Hero_Invoker.SunStrike.Ignite"

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetAbsOrigin() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( self.radius, 0, 0 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )

	-- Create Sound
	EmitSoundOnLocationWithCaster( self:GetParent():GetAbsOrigin(), sound_cast, self:GetCaster() )
end