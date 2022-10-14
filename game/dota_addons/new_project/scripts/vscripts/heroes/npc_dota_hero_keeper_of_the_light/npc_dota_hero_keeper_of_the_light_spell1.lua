npc_dota_hero_keeper_of_the_light_spell1 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_keeper_of_the_light_spell1_animation", "heroes/npc_dota_hero_keeper_of_the_light/npc_dota_hero_keeper_of_the_light_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_keeper_of_the_light_spell1", "heroes/npc_dota_hero_keeper_of_the_light/npc_dota_hero_keeper_of_the_light_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_keeper_of_the_light_spell1_attack", "heroes/npc_dota_hero_keeper_of_the_light/npc_dota_hero_keeper_of_the_light_spell1", LUA_MODIFIER_MOTION_NONE )


function npc_dota_hero_keeper_of_the_light_spell1:IsRefreshable() 
	return false
end

function npc_dota_hero_keeper_of_the_light_spell1:OnSpellStart() 
    self.roaming_radius = math.max((self:GetCaster():GetAbsOrigin() - self:GetCursorPosition()):Length2D())
    if self.roaming_radius < 200 then
        self.roaming_radius = 200
    end
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_keeper_of_the_light_spell1", {duration = self:GetSpecialValueFor("duration"), radius = self.roaming_radius})
end

function npc_dota_hero_keeper_of_the_light_spell1:OnProjectileHit_ExtraData( target, location, ExtraData )
	--local effect_cast = ExtraData.effect
	--ParticleManager:DestroyParticle( effect_cast, false )
	--ParticleManager:ReleaseParticleIndex( effect_cast )

	if not target then return end
	local damageTable = {
		victim = target,
		attacker = self:GetCaster(),
		damage = ExtraData.damage,
		damage_type = self:GetAbilityDamageType(),
		ability = self, --Optional.
	}
	ApplyDamage(damageTable)
end

modifier_npc_dota_hero_keeper_of_the_light_spell1 = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_npc_dota_hero_keeper_of_the_light_spell1:IsHidden()
	return false
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1:IsDebuff()
	return false
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_npc_dota_hero_keeper_of_the_light_spell1:OnCreated( kv )
	self.parent = self:GetParent()
	self.zero = Vector(0,0,0)

	self.revolution = self:GetAbility():GetSpecialValueFor( "rotation" )

	if not IsServer() then return end

	self.interval = 0.03
	self.base_facing = Vector(0,1,0)
	self.relative_pos = Vector( -kv.radius, 0, 100 )
	self.rotate_delta = 360/self.revolution * self.interval

	self.position = self.parent:GetOrigin() + self.relative_pos
	self.rotation = 0
	self.facing = self.base_facing

	self.wisp = CreateUnitByName(
		"npc_dota_hero_keeper_of_the_light_spell1_wisp",
		self.position,
		true,
		self.parent,
		self.parent:GetOwner(),
		self.parent:GetTeamNumber()
	)
	self.wisp:SetForwardVector( self.facing )
	self.wisp:AddNewModifier(
		self:GetCaster(),
		self:GetAbility(),
		"modifier_npc_dota_hero_keeper_of_the_light_spell1_animation",
		{} -- kv
	)
	self.wisp:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_keeper_of_the_light_spell1_attack", { duration = kv.duration })
	self:StartIntervalThink( self.interval )
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1:OnRefresh( kv )
	-- refresh references
	self.revolution = self:GetAbility():GetSpecialValueFor( "roaming_seconds_per_rotation" )

	if not IsServer() then return end

	self.relative_pos = Vector( -kv.radius, 0, 100 )
	self.rotate_delta = 360/self.revolution * self.interval

	-- refresh attack modifier
	self.wisp:AddNewModifier(
		self:GetCaster(), -- player source
		self:GetAbility(), -- ability source
		"modifier_npc_dota_hero_keeper_of_the_light_spell1_attack", -- modifier name
		{ duration = kv.duration } -- kv
	)
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1:OnRemoved()
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1:OnDestroy()
	if not IsServer() then return end

	-- kill the wisp
	UTIL_Remove( self.wisp )
	-- self.wisp:ForceKill( false )

end

--------------------------------------------------------------------------------
-- Interval Effects
function modifier_npc_dota_hero_keeper_of_the_light_spell1:OnIntervalThink()
	-- update position
	self.rotation = self.rotation + self.rotate_delta
	local origin = self.parent:GetOrigin()
	self.position = RotatePosition( origin, QAngle( 0, -self.rotation, 0 ), origin + self.relative_pos )
	self.facing = RotatePosition( self.zero, QAngle( 0, -self.rotation, 0 ), self.base_facing )

	-- update wisp
	self.wisp:SetOrigin( self.position )
	self.wisp:SetForwardVector( self.facing )
end

modifier_npc_dota_hero_keeper_of_the_light_spell1_attack = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_npc_dota_hero_keeper_of_the_light_spell1_attack:IsHidden()
	return false
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_attack:IsDebuff()
	return false
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_attack:IsStunDebuff()
	return false
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_attack:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_npc_dota_hero_keeper_of_the_light_spell1_attack:OnCreated( kv )
	-- references
	local damage = self:GetAbility():GetSpecialValueFor( "attack_damage" )
	self.interval = self:GetAbility():GetSpecialValueFor( "attack_interval" )
	self.radius = self:GetAbility():GetSpecialValueFor( "attack_radius" )

	if not IsServer() then return end
	-- precache projectile
	 local projectile_name = "particles/units/heroes/hero_dark_willow/dark_willow_willowisp_base_attack.vpcf"
	local projectile_speed = 1400

	self.info = {
		-- Target = target,
		Source = self:GetParent(),
		Ability = self:GetAbility(),	
		
		EffectName = projectile_name,
		iMoveSpeed = projectile_speed,
		bDodgeable = true,                           -- Optional
		-- bIsAttack = false,                                -- Optional

		ExtraData = {
			damage = damage,
		}
	}
	self:StartIntervalThink( self.interval )
	--local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_dark_willow/dark_willow_wisp_aoe.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	--ParticleManager:SetParticleControl( effect_cast, 1, Vector( self.radius, self.radius, self.radius ) )
	--self:AddParticle(effect_cast,false,false,-1,false,false)
	EmitSoundOn( "Hero_DarkWillow.WispStrike.Cast", self:GetParent() )
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_attack:OnRefresh( kv )
	local damage = self:GetAbility():GetSpecialValueFor( "attack_damage" )
	self.interval = self:GetAbility():GetSpecialValueFor( "attack_interval" )
	self.radius = self:GetAbility():GetSpecialValueFor( "attack_radius" )

	if not IsServer() then return end
	self.info.ExtraData.damage = damage
	EmitSoundOn( "Hero_DarkWillow.WispStrike.Cast", self:GetParent() )
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_attack:OnIntervalThink()
	-- find enemies
	local enemies = FindUnitsInRadius(
		self:GetCaster():GetTeamNumber(),	-- int, your team number
		self:GetParent():GetOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		self.radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
		DOTA_UNIT_TARGET_FLAG_NO_INVIS + DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE,	-- int, flag filter
		0,	-- int, order filter
		false	-- bool, can grow cache
	)

	for _,enemy in pairs(enemies) do
		-- create projectile effect
		--local effect = self:PlayEffects1( enemy, self.info.iMoveSpeed )

		-- launch attack
		self.info.Target = enemy
		self.info.ExtraData.effect = effect

		ProjectileManager:CreateTrackingProjectile( self.info )

		-- play effects
		local sound_cast = "Hero_DarkWillow.WillOWisp.Damage"
		EmitSoundOn( sound_cast, self:GetParent() )

		-- only on first unit
		break
	end
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_attack:PlayEffects1( target, speed )
	local particle_cast = "particles/units/heroes/hero_dark_willow/dark_willow_willowisp_base_attack.vpcf"
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )

    local attach = self:GetParent():ScriptLookupAttachment("head_end")

	ParticleManager:SetParticleControlEnt(
		effect_cast,
		0,
		self:GetParent(),
		attach,
		"head_end",
		Vector(0,0,0), -- unknown
		true -- unknown, true
	)
	ParticleManager:SetParticleControlEnt(
		effect_cast,
		1,
		target,
		attach,
		"head_end",
		Vector(0,0,0), -- unknown
		true -- unknown, true
	)
	ParticleManager:SetParticleControl( effect_cast, 2, Vector( speed, 0, 0 ) )

	return effect_cast
end

modifier_npc_dota_hero_keeper_of_the_light_spell1_animation = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_npc_dota_hero_keeper_of_the_light_spell1_animation:IsHidden()
	return false
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_animation:IsPurgable()
	return false
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_animation:OnCreated()
    self.effect_cast = ParticleManager:CreateParticle( "particles/npc_dota_hero_keeper_of_the_light/npc_dota_hero_keeper_of_the_light_spell1.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	ParticleManager:SetParticleControlEnt(self.effect_cast,0,self:GetParent(),PATTACH_ABSORIGIN_FOLLOW,"follow_origin",Vector(0,0,0),true)
	ParticleManager:SetParticleControlEnt(self.effect_cast,1,self:GetParent(),PATTACH_ABSORIGIN_FOLLOW,"follow_origin",Vector(0,0,0),true)
	self:AddParticle(self.effect_cast,false,false,-1,false,false)
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_animation:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_BASEATTACK_BONUSDAMAGE,
	}
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_animation:GetStatusEffectName()
    return "particles/status_fx/status_effect_abaddon_borrowed_time.vpcf"
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_animation:GetModifierBaseAttack_BonusDamage()
	if not IsServer() then return end

	local target = self:GetParent():GetOrigin() + self:GetParent():GetForwardVector()
	local forward = self:GetParent():GetForwardVector()
	ParticleManager:SetParticleControl( self.effect_cast, 2, target )
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_animation:CheckState()
	return {
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_UNSELECTABLE] = true,
		[MODIFIER_STATE_UNTARGETABLE] = true,
		[MODIFIER_STATE_OUT_OF_GAME] = true,
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
	}
end






