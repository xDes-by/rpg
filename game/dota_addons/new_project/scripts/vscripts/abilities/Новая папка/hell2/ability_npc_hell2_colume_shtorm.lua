ability_npc_hell2_colume_shtorm = class({})

LinkLuaModifier( "modifier_ability_npc_hell2_colume_shtorm", "abilities/hell2/ability_npc_hell2_colume_shtorm", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------
-- Ability Start
function ability_npc_hell2_colume_shtorm:Spawn()
	if IsClient() then
		return
	end
	Timers:CreateTimer(1,function()
		if self:GetCaster():IsAlive() then
			local hero = AICore:RandomEnemyHeroInRange(self:GetCaster(), 900)
			if hero ~= nil then
					
				local caster = self:GetCaster()

				-- load data
				local radius = self:GetSpecialValueFor( "radius" )
				local speed = self:GetSpecialValueFor( "speed" )

				-- play effects
				local effect = self:PlayEffects( radius, speed )

				-- create ring
				local pulse = caster:AddNewModifier(
					caster, -- player source
					self, -- ability source
					"modifier_generic_ring_lua", -- modifier name
					{
						end_radius = radius,
						speed = speed,
						target_team = DOTA_UNIT_TARGET_TEAM_ENEMY,
						target_type = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
					} -- kv
				)
				pulse:SetCallback( function( enemy )
					self:OnHit( enemy )
				end)

				pulse:SetEndCallback( function()
					-- set effects
					ParticleManager:SetParticleControl( effect, 1, Vector( speed, radius, -1 ) )

					ParticleManager:DestroyParticle( effect, false )
					ParticleManager:ReleaseParticleIndex( effect )
				end)
				return 3
			else
				return 1
			end
		end
	end)
end

function ability_npc_hell2_colume_shtorm:OnHit( enemy )
	local caster = self:GetCaster()

	-- load data
	local radius = self:GetSpecialValueFor( "radius" )
	local duration = self:GetSpecialValueFor( "slow_duration" )

	-- calculate damage & slow
	local distance = (enemy:GetAbsOrigin()-caster:GetAbsOrigin()):Length2D()
	local slow = self:GetSpecialValueFor( "slow" )
	-- slow
	enemy:AddNewModifier(
		caster, -- player source
		self, -- ability source
		"modifier_ability_npc_hell2_colume_shtorm", -- modifier name
		{
			duration = duration,
			slow = slow,
		} -- kv
	)

	-- Play effects
	-- self:PlayEffects2( enemy )
	local sound_cast = "Ability.PlasmaFieldImpact"
	EmitSoundOn( sound_cast, enemy )
end

--------------------------------------------------------------------------------
-- Effects
function ability_npc_hell2_colume_shtorm:PlayEffects( radius, speed )
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_razor/razor_plasmafield.vpcf"
	local sound_cast = "Ability.PlasmaField"

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( speed, radius, 1 ) )

	EmitSoundOn( sound_cast, self:GetCaster() )

	return effect_cast
end

modifier_ability_npc_hell2_colume_shtorm = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_ability_npc_hell2_colume_shtorm:IsHidden()
	return false
end

function modifier_ability_npc_hell2_colume_shtorm:IsDebuff()
	return true
end

function modifier_ability_npc_hell2_colume_shtorm:IsPurgable()
	return true
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_ability_npc_hell2_colume_shtorm:OnCreated( kv )
	if not IsServer() then return end
	-- send init data from server to client
	self:SetHasCustomTransmitterData( true )

	-- references
	self.slow = kv.slow
	self:SetStackCount( self.slow )
end

function modifier_ability_npc_hell2_colume_shtorm:OnRefresh( kv )
	if not IsServer() then return end
	-- references
	self.slow = math.max(kv.slow,self.slow)
	self:SetStackCount( self.slow )
end


--------------------------------------------------------------------------------
-- Transmitter data
function modifier_ability_npc_hell2_colume_shtorm:AddCustomTransmitterData()
	-- on server
	local data = {
		slow = self.slow
	}

	return data
end

function modifier_ability_npc_hell2_colume_shtorm:HandleCustomTransmitterData( data )
	-- on client
	self.slow = data.slow
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_ability_npc_hell2_colume_shtorm:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
	}

	return funcs
end

function modifier_ability_npc_hell2_colume_shtorm:GetModifierMoveSpeedBonus_Percentage()
	return -self.slow
end