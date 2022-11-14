npc_dota_hero_disruptor_spell1 = class({})

LinkLuaModifier( "modifier_disruptor_skill_1", "heroes/npc_dota_hero_disruptor/npc_dota_hero_disruptor_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_disruptor_skill_1_slow", "heroes/npc_dota_hero_disruptor/npc_dota_hero_disruptor_spell1", LUA_MODIFIER_MOTION_NONE )


function npc_dota_hero_disruptor_spell1:OnSpellStart()
	self:GetCaster():EmitSound("Hero_Zuus.LightningBolt")
	self.target = self:GetCursorTarget()
	
	local caster = self:GetCaster()
	
	local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_zuus/zuus_lightning_bolt.vpcf", PATTACH_WORLDORIGIN, self.target)
	_G.target_point_dis_1_skill = self:GetCursorPosition()
	ParticleManager:SetParticleControl(particle, 0, target_point_dis_1_skill)
	ParticleManager:SetParticleControl(particle, 1, target_point_dis_1_skill + Vector(0,0,2000))
	ParticleManager:SetParticleControl(particle, 2, target_point_dis_1_skill)
	
	AddFOWViewer(caster:GetTeamNumber(), _G.target_point_dis_1_skill, 400, 2, false)
	
	local damage = self:GetSpecialValueFor("damage")
	local radius = self:GetSpecialValueFor("radius")
	local speed = 400
	
	local damage_table = {
	damage = damage,
	damage_type = self:GetAbilityDamageType(),
	damage_flags = DOTA_DAMAGE_FLAG_NONE,
	attacker = self:GetCaster(),
	ability = self}

	if self.target then
		damage_table.victim = self.target
		ApplyDamage(damage_table)
	end
	
	self.npc = CreateModifierThinker(self:GetCaster(),self,"modifier_disruptor_skill_1",{duration = 2},target_point_dis_1_skill, self:GetCaster():GetTeamNumber(),false)
	
	local effect = self:PlayEffects( radius, speed, self.npc )

	local pulse = caster:AddNewModifier( caster, self, "modifier_generic_ring_lua", {end_radius = radius, speed = speed, target_team = DOTA_UNIT_TARGET_TEAM_ENEMY, target_type = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC})
	pulse:SetCallback( function( enemy )
		self:OnHit( enemy )
	end)

	pulse:SetEndCallback( function()
		ParticleManager:SetParticleControl( effect, 1, Vector( speed, radius, -1 ) )
		local retract
		local dead = false
		if not caster:IsAlive() then
			dead = true
			local thinker = CreateModifierThinker( caster, self, "modifier_generic_ring_lua", { start_radius = radius, end_radius = 0, speed = speed, target_team = DOTA_UNIT_TARGET_TEAM_ENEMY, target_type = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC},self.npc:GetOrigin(), caster:GetTeamNumber(), false )
			retract = thinker:FindModifierByName( "modifier_generic_ring_lua" )
		else
			retract = caster:AddNewModifier( caster, self, "modifier_generic_ring_lua", { start_radius = radius, end_radius = 0, speed = speed, target_team = DOTA_UNIT_TARGET_TEAM_ENEMY, target_type = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC})
		end
		retract:SetCallback( function( enemy )
			self:OnHit( enemy )
		end)

		retract:SetEndCallback( function()
			ParticleManager:DestroyParticle( effect, false )
			ParticleManager:ReleaseParticleIndex( effect )
		end)
	end)
end

function npc_dota_hero_disruptor_spell1:OnHit( enemy )
	local caster = self:GetCaster()
	local radius = self:GetSpecialValueFor( "radius" )
	local damage = self:GetSpecialValueFor( "damage_ring" )
	local slow = self:GetSpecialValueFor( "slow" )
	local duration = self:GetSpecialValueFor( "duration" )
	enemy:AddNewModifier( caster, self, "modifier_disruptor_skill_1_slow", { duration = duration })
	local damageTable = {
		victim = enemy,
		attacker = caster,
		damage = damage,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self, --Optional.
	}
	ApplyDamage(damageTable)

	EmitSoundOn( "Ability.PlasmaFieldImpact", enemy )
end


function npc_dota_hero_disruptor_spell1:PlayEffects( radius, speed, target )
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_razor/razor_plasmafield.vpcf", PATTACH_ABSORIGIN_FOLLOW, target )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( speed, radius, 1 ) )
	EmitSoundOn( "Ability.PlasmaField", target )
	return effect_cast
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

modifier_disruptor_skill_1 = class({})

function modifier_disruptor_skill_1:IsHidden()
	return false
end


---------------------------------------------------------

modifier_disruptor_skill_1_slow = class({})

function modifier_disruptor_skill_1_slow:IsHidden()
	return false
end

function modifier_disruptor_skill_1_slow:IsDebuff()
	return true
end

function modifier_disruptor_skill_1_slow:IsPurgable()
	return true
end

function modifier_disruptor_skill_1_slow:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
	}
	return funcs
end

function modifier_disruptor_skill_1_slow:GetModifierMoveSpeedBonus_Percentage()
	return -self:GetAbility():GetSpecialValueFor( "slow" )
end