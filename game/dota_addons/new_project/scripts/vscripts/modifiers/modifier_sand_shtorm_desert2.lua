modifier_sand_shtorm_desert2 = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_sand_shtorm_desert2:IsHidden()
	return false
end

function modifier_sand_shtorm_desert2:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_sand_shtorm_desert2:OnCreated( kv )
	-- references
	self.radius = 500
	self.center = self:GetParent():GetOrigin()
    self.pull_speed = 0.25
    self.rotate_speed = 1
	if IsServer() then
		-- precache damage
		self.damageTable = {
			-- victim = target,
			attacker = self:GetCaster(),
			--damage = damage,
			damage_type = DAMAGE_TYPE_PURE,
			ability = self:GetAbility(), --Optional.
			damage_flags = DOTA_DAMAGE_FLAG_NONE, --Optional.
		}

		-- Start interval
		self:StartIntervalThink( FrameTime() )
		self:PlayEffects()
	end
end

--------------------------------------------------------------------------------
-- Interval Effects
function modifier_sand_shtorm_desert2:OnIntervalThink()
	-- aoe damage
	local enemies = FindUnitsInRadius(
		DOTA_TEAM_BADGUYS,	-- int, your team number
		self:GetParent():GetOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		self.radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
		DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,	-- int, flag filter
		0,	-- int, order filter
		false	-- bool, can grow cache
	)

	for _,enemy in pairs(enemies) do
		local target = enemy:GetOrigin()-self.center
		target.z = 0
		if target:Length2D() < 450 then
			local targetL = target:Length2D()-self.pull_speed*FrameTime()
			local targetN = target:Normalized()
			local deg = math.atan2( targetN.y, targetN.x )
			local targetN = Vector( math.cos(deg+self.rotate_speed*FrameTime()), math.sin(deg+self.rotate_speed*FrameTime()), 0 );
			FindClearSpaceForUnit(enemy, (self.center + targetN * targetL) - target:Normalized() * 3, true)
		end
	end
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_sand_shtorm_desert2:PlayEffects()
	-- Get Resources
	local particle_cast = "particles/desert2_sand.vpcf"
	local sound_cast = "Hero_Enigma.Black_Hole"

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN, self:GetParent() )
	--local effect_cast = assert(loadfile("lua_abilities/rubick_spell_steal_lua/rubick_spell_steal_lua_arcana"))(self, particle_cast, PATTACH_ABSORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetOrigin() )

	-- buff particle
	self:AddParticle(
		effect_cast,
		false, -- bDestroyImmediately
		false, -- bStatusEffect
		-1, -- iPriority
		false, -- bHeroEffect
		false -- bOverheadEffect
	)

	-- Create Sound
	EmitSoundOn( sound_cast, self:GetParent() )
end