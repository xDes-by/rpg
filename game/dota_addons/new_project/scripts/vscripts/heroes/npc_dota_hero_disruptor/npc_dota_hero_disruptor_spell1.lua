npc_dota_hero_disruptor_spell1 = class({})

LinkLuaModifier( "modifier_disruptor_skill_1", "heroes/npc_dota_hero_disruptor/npc_dota_hero_disruptor_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_disruptor_skill_1_slow", "heroes/npc_dota_hero_disruptor/npc_dota_hero_disruptor_spell1", LUA_MODIFIER_MOTION_NONE )


function npc_dota_hero_disruptor_spell1:OnSpellStart()
	self:GetCaster():EmitSound("Hero_Zuus.LightningBolt")
	self.target = self:GetCursorTarget()
	local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_zuus/zuus_lightning_bolt.vpcf", PATTACH_WORLDORIGIN, self.target)
	target_point = self:GetCursorPosition()
	ParticleManager:SetParticleControl(particle, 0, target_point)
	ParticleManager:SetParticleControl(particle, 1, target_point + Vector(0,0,2000))
	ParticleManager:SetParticleControl(particle, 2, target_point)
	local damage = self:GetSpecialValueFor("damage")		
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
	
	local slow = self:GetSpecialValueFor("slow")
	self.npc = CreateModifierThinker(self:GetCaster(),self,"modifier_disruptor_skill_1",{duration  = 10},target_point,self:GetCaster():GetTeamNumber(),false)
	local radius = self:GetSpecialValueFor("radius")
	local duration = self:GetSpecialValueFor("duration")
	local speed = 400

	local effect = ParticleManager:CreateParticle( "particles/units/heroes/hero_razor/razor_plasmafield.vpcf", PATTACH_ABSORIGIN_FOLLOW, self.npc )
	ParticleManager:SetParticleControl( effect, 1, Vector( speed, radius, 1 ) )
	EmitSoundOn( "Ability.PlasmaField", self.npc )

	local pulse = self.npc:AddNewModifier(
		self:GetCaster(), -- player source
		self, -- ability source
		"modifier_generic_ring_lua", -- modifier name
		{
			end_radius = radius,
			speed = speed,
			target_team = DOTA_UNIT_TARGET_TEAM_ENEMY,
			target_type = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
		}
	)
	pulse:SetCallback( function( enemy )
		if IsClient() then
			return
		end
		enemy:AddNewModifier(self:GetCaster(), self, "modifier_disruptor_skill_1_slow", {duration = duration, slow = slow, damage = damage})
		EmitSoundOn( "Ability.PlasmaFieldImpact", enemy )
	end)

	pulse:SetEndCallback( function()
		ParticleManager:SetParticleControl( effect, 1, Vector( speed, radius, -1 ) )
		ParticleManager:DestroyParticle( effect, false )
		ParticleManager:ReleaseParticleIndex( effect )
	end)
end

modifier_disruptor_skill_1 = class({})

function modifier_disruptor_skill_1:OnDestroy(kv)
	if IsClient() then
		return
	end
	UTIL_Remove(self:GetParent())
end

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

function modifier_disruptor_skill_1_slow:OnCreated(kv)
	if IsClient() then
		return
	end
--	table.print(kv)
	ApplyDamage({victim = self:GetParent(),
	damage =  kv.damage,
	damage_type = self:GetAbility():GetAbilityDamageType(),
	damage_flags = DOTA_DAMAGE_FLAG_NONE,
	attacker = self:GetCaster(),
	ability = self:GetAbility()})
	self.slow = kv.slow
end

function modifier_disruptor_skill_1_slow:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
	}
end

function modifier_disruptor_skill_1:GetModifierMoveSpeedBonus_Percentage()
	return -self.slow
end
