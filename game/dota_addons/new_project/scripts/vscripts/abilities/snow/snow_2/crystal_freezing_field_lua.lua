crystal_freezing_field_lua = class({})
LinkLuaModifier( "modifier_crystal_freezing_field_lua", "abilities/snow/snow_2/crystal_freezing_field_lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_crystal_freezing_field_lua_effect", "abilities/snow/snow_2/crystal_freezing_field_lua_effect", LUA_MODIFIER_MOTION_NONE )


function crystal_freezing_field_lua:OnSpellStart()
	local caster = self:GetCaster()
	self.modifier = caster:AddNewModifier(caster,self,"modifier_crystal_freezing_field_lua",{ duration = self:GetChannelTime()})
	
	Timers:CreateTimer(5, function()
		if self:GetCaster():IsAlive() then
			local fires = FindUnitsInRadius( self:GetCaster():GetTeamNumber(), self:GetCaster():GetOrigin(), nil, 700, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_ALL, 0, 0, false )
			for _,fire in pairs(fires) do
				if fire:GetUnitName() == "npc_snow_2_fire" then
					fire:ForceKill(false)
				end
			end
		end
	end)
end

function crystal_freezing_field_lua:OnChannelFinish( bInterrupted )
	if self.modifier then
		self.modifier:Destroy()
		self.modifier = nil
	end
end

----------------------------------------------------------------------------------------------

modifier_crystal_freezing_field_lua = class({})

function modifier_crystal_freezing_field_lua:IsHidden()
	return true
end

function modifier_crystal_freezing_field_lua:IsDebuff()
	return false
end

function modifier_crystal_freezing_field_lua:IsPurgable()
	return false
end

function modifier_crystal_freezing_field_lua:IsAura()
	return true
end

function modifier_crystal_freezing_field_lua:GetModifierAura()
	return "modifier_crystal_freezing_field_lua_effect"
end

function modifier_crystal_freezing_field_lua:GetAuraRadius()
	return self.slow_radius
end

function modifier_crystal_freezing_field_lua:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_crystal_freezing_field_lua:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP
end

function modifier_crystal_freezing_field_lua:GetAuraDuration()
	return self.slow_duration
end

function modifier_crystal_freezing_field_lua:OnCreated( kv )
	self.slow_radius = self:GetAbility():GetSpecialValueFor( "radius" )
	self.slow_duration = self:GetAbility():GetSpecialValueFor( "slow_duration" )
	self.explosion_radius = self:GetAbility():GetSpecialValueFor( "explosion_radius" )
	self.explosion_interval = self:GetAbility():GetSpecialValueFor( "explosion_interval" )
	self.explosion_min_dist = self:GetAbility():GetSpecialValueFor( "explosion_min_dist" )
	self.explosion_max_dist = self:GetAbility():GetSpecialValueFor( "explosion_max_dist" )

	self.quartal = -1

	if IsServer() then
		self:StartIntervalThink( self.explosion_interval )
		self:OnIntervalThink()
		self:PlayEffects1()
	end
end

function modifier_crystal_freezing_field_lua:OnDestroy( kv )
	if IsServer() then
		self:StartIntervalThink( -1 )
		self:StopEffects1()
	end
end


function modifier_crystal_freezing_field_lua:OnIntervalThink()
	self.quartal = self.quartal+1
	if self.quartal>3 then self.quartal = 0 end

	local a = RandomInt(0,90) + self.quartal*90
	local r = RandomInt(self.explosion_min_dist,self.explosion_max_dist)
	local point = Vector( math.cos(a), math.sin(a), 0 ):Normalized() * r

	point = self:GetCaster():GetOrigin() + point
	
	self:PlayEffects2( point )
end

function modifier_crystal_freezing_field_lua:PlayEffects1()
	local particle_cast = "particles/units/heroes/hero_crystalmaiden/maiden_freezing_field_snow.vpcf"
	self.sound_cast = "hero_Crystal.freezingField.wind"

	self.effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
	ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( self.slow_radius, self.slow_radius, 1 ) )
	self:AddParticle(
		self.effect_cast,
		false,
		false,
		-1,
		false,
		false
	)

	EmitSoundOn( self.sound_cast, self:GetCaster() )
end

function modifier_crystal_freezing_field_lua:PlayEffects2( point )
	local particle_cast = "particles/units/heroes/hero_crystalmaiden/maiden_freezing_field_explosion.vpcf"

	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( effect_cast, 0, point )

	local sound_cast = "hero_Crystal.freezingField.explosion"
	EmitSoundOnLocationWithCaster( point, sound_cast, self:GetCaster() )
end

function modifier_crystal_freezing_field_lua:StopEffects1()
	StopSoundOn( self.sound_cast, self:GetCaster() )
end

-------------------------------------------------------------------------------------------------------------

modifier_crystal_freezing_field_lua_effect = class({})

function modifier_crystal_freezing_field_lua_effect:IsHidden()
	return false
end

function modifier_crystal_freezing_field_lua_effect:IsDebuff()
	return true
end

function modifier_crystal_freezing_field_lua_effect:IsPurgable()
	return true
end

function modifier_crystal_freezing_field_lua_effect:OnCreated( kv )
	self.ms_slow = self:GetAbility():GetSpecialValueFor( "movespeed_slow" )
	self.as_slow = self:GetAbility():GetSpecialValueFor( "attack_slow" )
end

function modifier_crystal_freezing_field_lua_effect:OnRefresh( kv )
	self.ms_slow = self:GetAbility():GetSpecialValueFor( "movespeed_slow" )
	self.as_slow = self:GetAbility():GetSpecialValueFor( "attack_slow" )	
end

function modifier_crystal_freezing_field_lua_effect:OnDestroy( kv )

end

function modifier_crystal_freezing_field_lua_effect:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
	}
	return funcs
end

function modifier_crystal_freezing_field_lua_effect:GetModifierMoveSpeedBonus_Percentage()
	return self.ms_slow
end

function modifier_crystal_freezing_field_lua_effect:GetModifierAttackSpeedBonus_Constant()
	return self.as_slow
end

function modifier_crystal_freezing_field_lua_effect:GetEffectName()
	return "particles/generic_gameplay/generic_slowed_cold.vpcf"
end

function modifier_crystal_freezing_field_lua_effect:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end