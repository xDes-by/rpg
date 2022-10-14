npc_dota_hero_leshrac_spell2 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_leshrac_spell2", "heroes/npc_dota_hero_leshrac/npc_dota_hero_leshrac_spell2", LUA_MODIFIER_MOTION_NONE)

function npc_dota_hero_leshrac_spell2:GetChannelTime()
	return 3
end

function npc_dota_hero_leshrac_spell2:GetChannelAnimation()
	return ACT_DOTA_GENERIC_CHANNEL_1
end

function npc_dota_hero_leshrac_spell2:OnChannelFinish(bInterrupted)
	if not bInterrupted then
		local pos = self:GetCaster():GetForwardVector()
		local distance = self:GetSpecialValueFor("distance")
		local speed = self:GetSpecialValueFor("speed")
		self.dur = distance / speed
		self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_leshrac_spell2", {duration = self.dur})
		self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_simply_motion_controll", {
		x = pos.x,
		y = pos.y,
		r = distance,
		s = speed})
	end
end

modifier_npc_dota_hero_leshrac_spell2 = class({})
--Classifications template
function modifier_npc_dota_hero_leshrac_spell2:IsHidden()
    return false
end

function modifier_npc_dota_hero_leshrac_spell2:IsPurgable()
    return false
end

function modifier_npc_dota_hero_leshrac_spell2:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_leshrac_spell2:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_leshrac_spell2:OnCreated()
    self.delay = self:GetAbility():GetSpecialValueFor("stun_delay")
	self.duration = self:GetAbility():GetSpecialValueFor("stun_duration")
	self.radius = self:GetAbility():GetSpecialValueFor("stun_radius")
	self.damageTable = {attacker = self:GetCaster(),
		damage = damage,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self:GetAbility()
	}
    if IsClient() then
        return
    end
    self:StartIntervalThink(self.delay)
    self:OnIntervalThink()
end

function modifier_npc_dota_hero_leshrac_spell2:OnIntervalThink()
    	local enemies = FindUnitsInRadius(
		self:GetCaster():GetTeamNumber(),
		self:GetParent():GetAbsOrigin(),
		nil,
		self.radius,
		DOTA_UNIT_TARGET_TEAM_ENEMY,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
		0,
		0,
		false)

	for _,enemy in pairs(enemies) do
		enemy:AddNewModifier(
			self:GetCaster(), -- player source
			self:GetAbility(), -- ability source
			"modifier_stunned", -- modifier name
			{ duration = self.duration } -- kv
		)
	end
	local effect_cast = ParticleManager:CreateParticle( "particles/econ/items/leshrac/leshrac_tormented_staff/leshrac_split_tormented.vpcf", PATTACH_WORLDORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetAbsOrigin() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( self.radius, 0, 0 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )
	EmitSoundOnLocationWithCaster( self:GetParent():GetAbsOrigin(), "Hero_Leshrac.Split_Earth", self:GetCaster() )
end

