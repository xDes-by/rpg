LinkLuaModifier( "modifier_npc_dota_hero_abyssal_underlord_spell2", "heroes/npc_dota_hero_abyssal_underlord/npc_dota_hero_abyssal_underlord_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_abyssal_underlord_spell2_slow", "heroes/npc_dota_hero_abyssal_underlord/npc_dota_hero_abyssal_underlord_spell2", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_abyssal_underlord_spell2 = class({})

function npc_dota_hero_abyssal_underlord_spell2:OnSpellStart()
	local caster = self:GetCaster()
	local front = caster:GetForwardVector():Normalized()
	local point = caster:GetOrigin() + front * 50
	local radius = self:GetSpecialValueFor("radius")
	local angle = self:GetSpecialValueFor("angle")/2
	local duration = self:GetSpecialValueFor("knockback_duration")
	local distance = self:GetSpecialValueFor("knockback_distance")
	Timers:CreateTimer(0.15, function()
		local enemies = FindUnitsInRadius(caster:GetTeamNumber(), caster:GetOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, 0, false )
		local buff = caster:AddNewModifier(caster, self, "modifier_npc_dota_hero_abyssal_underlord_spell2", {})
		local origin = caster:GetOrigin()
		local cast_direction = (point-origin):Normalized()
		local cast_angle = VectorToAngles( cast_direction ).y
		for _,enemy in pairs(enemies) do
			local enemy_direction = (enemy:GetOrigin() - origin):Normalized()
			local enemy_angle = VectorToAngles( enemy_direction ).y
			local angle_diff = math.abs( AngleDiff( cast_angle, enemy_angle ) )
			if angle_diff<=angle then
				caster:PerformAttack(enemy, true, true, true, true, true, false, true)
				enemy:AddNewModifier(caster, self, "modifier_npc_dota_hero_abyssal_underlord_spell2_slow", {duration = self:GetSpecialValueFor("duration")})
				enemy:AddNewModifier(caster, self,  "modifier_knockback",
						{
							center_x			= self:GetCaster():GetAbsOrigin()[1] + 1,
							center_y			= self:GetCaster():GetAbsOrigin()[2] + 1,
							center_z			= self:GetCaster():GetAbsOrigin()[3],
							duration			= duration,
							knockback_duration	= duration,
							knockback_distance	= distance,
							knockback_height	= 20,
							should_stun			= 0
						})
			end
		end
		buff:Destroy()
		self:PlayEffects1((point-origin):Normalized() )
		self:PlayEffects2()
	end)
end

function npc_dota_hero_abyssal_underlord_spell2:PlayEffects1( direction )
	EmitSoundOn( "Hero_EarthShaker.Totem", self:GetCaster() )
	local effect_cast = ParticleManager:CreateParticle( "particles/under2.vpcf", PATTACH_WORLDORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetCaster():GetOrigin() )
	ParticleManager:SetParticleControlForward( effect_cast, 0, direction )
	ParticleManager:ReleaseParticleIndex( effect_cast )
	EmitSoundOn("Hero_Mars.Shield.Cast.Small", self:GetCaster() )
end

function npc_dota_hero_abyssal_underlord_spell2:PlayEffects2()
	local particle_cast = "particles/units/heroes/hero_earthshaker/earthshaker_aftershock.vpcf"
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector(300, 300, 300) )
	ParticleManager:ReleaseParticleIndex( effect_cast )
end

----------------------------------------------------------------------------

modifier_npc_dota_hero_abyssal_underlord_spell2 = class({})

function modifier_npc_dota_hero_abyssal_underlord_spell2:IsHidden()
	return true
end

function modifier_npc_dota_hero_abyssal_underlord_spell2:IsDebuff()
	return false
end

function modifier_npc_dota_hero_abyssal_underlord_spell2:IsPurgable()
	return false
end

function modifier_npc_dota_hero_abyssal_underlord_spell2:OnCreated( kv )
	self.damage = self:GetAbility():GetSpecialValueFor( "damage" )
end

function modifier_npc_dota_hero_abyssal_underlord_spell2:OnRefresh( kv )
end

function modifier_npc_dota_hero_abyssal_underlord_spell2:OnRemoved()
end

function modifier_npc_dota_hero_abyssal_underlord_spell2:OnDestroy()
end

function modifier_npc_dota_hero_abyssal_underlord_spell2:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
	}

	return funcs
end

function modifier_npc_dota_hero_abyssal_underlord_spell2:GetModifierPreAttack_BonusDamage( params )
	if not IsServer() then return end
	return self.damage
end

----------------------------------------------------------------------------

modifier_npc_dota_hero_abyssal_underlord_spell2_slow = class({})

function modifier_npc_dota_hero_abyssal_underlord_spell2_slow:IsHidden()
	return true
end

function modifier_npc_dota_hero_abyssal_underlord_spell2_slow:IsDebuff()
	return true
end

function modifier_npc_dota_hero_abyssal_underlord_spell2_slow:IsPurgable()
	return false
end

function modifier_npc_dota_hero_abyssal_underlord_spell2_slow:OnCreated( kv )
	self.slow = self:GetAbility():GetSpecialValueFor( "slow" )
end

function modifier_npc_dota_hero_abyssal_underlord_spell2_slow:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
	}

	return funcs
end

function modifier_npc_dota_hero_abyssal_underlord_spell2_slow:GetModifierMoveSpeedBonus_Percentage( params )
	if not IsServer() then return end
	return self.slow
end
