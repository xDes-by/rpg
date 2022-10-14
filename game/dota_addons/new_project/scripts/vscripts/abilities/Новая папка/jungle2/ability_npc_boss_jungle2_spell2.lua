ability_npc_boss_jungle2_spell2 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_jungle2_spell2_indicator","abilities/jungle2/ability_npc_boss_jungle2_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_jungle2_spell2","abilities/jungle2/ability_npc_boss_jungle2_spell2", LUA_MODIFIER_MOTION_NONE )


function ability_npc_boss_jungle2_spell2:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_jungle2_spell2_indicator", {duration = 4})
    self.point = self:GetCaster():GetAbsOrigin()
end

modifier_ability_npc_boss_jungle2_spell2_indicator = class({})
--Classifications template
function modifier_ability_npc_boss_jungle2_spell2_indicator:IsHidden()
    return true
end

function modifier_ability_npc_boss_jungle2_spell2_indicator:IsPurgable()
    return false
end

function modifier_ability_npc_boss_jungle2_spell2_indicator:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_jungle2_spell2_indicator:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_jungle2_spell2_indicator:OnCreated()
	EmitSoundOn( "Hero_DarkWillow.Ley.Cast", self:GetCaster() )
    self.pfx = ParticleManager:CreateParticle("particles/econ/items/dark_willow/dark_willow_ti8_immortal_head/dw_ti8_immortal_cursed_crown_start.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetParent())
end

function modifier_ability_npc_boss_jungle2_spell2_indicator:OnDestroy()
    ParticleManager:DestroyParticle(self.pfx, false)
    CreateModifierThinker(self:GetCaster(), self:GetAbility(), "modifier_ability_npc_boss_jungle2_spell2", {duration = 5}, self:GetAbility().point, DOTA_TEAM_BADGUYS, false)
end

modifier_ability_npc_boss_jungle2_spell2 = class({})

function modifier_ability_npc_boss_jungle2_spell2:IsHidden()
	return false
end

function modifier_ability_npc_boss_jungle2_spell2:IsDebuff()
	return true
end

function modifier_ability_npc_boss_jungle2_spell2:IsStunDebuff()
	return false
end

function modifier_ability_npc_boss_jungle2_spell2:IsPurgable()
	return true
end

function modifier_ability_npc_boss_jungle2_spell2:OnCreated( kv )
	if not IsServer() then return end
	self.owner = kv.isProvidedByAura~=1
	if not self.owner then return end
	self.radius = 450
	self.pulses = 20
	local duration = 5
	local damage = self:GetAbility():GetSpecialValueFor("damage")
	local interval = duration/self.pulses
	local max_tick_damage = damage*interval
	self.tick_damage = max_tick_damage/self.pulses
	self.pulse = 0
	self.damageTable = {
		-- victim = target,
		attacker = self:GetCaster(),
		-- damage = 500,
		damage_type = DAMAGE_TYPE_MAGICAL,
		--ability = self:GetAbility(), --Optional.
	}
	self:StartIntervalThink( interval )
	self:PlayEffects1( duration )
	self.sound_loop = "Hero_Disruptor.StaticStorm"
	EmitSoundOn( self.sound_loop, self:GetParent() )
end

function modifier_ability_npc_boss_jungle2_spell2:OnRefresh( kv )
	
end

function modifier_ability_npc_boss_jungle2_spell2:OnRemoved()
end

function modifier_ability_npc_boss_jungle2_spell2:OnDestroy()
	if not IsServer() then return end

	if self.owner then
		StopSoundOn( self.sound_loop, self:GetParent() )
		local sound_stop = "Hero_Disruptor.StaticStorm.End"
		EmitSoundOn( sound_stop, self:GetParent() )
		UTIL_Remove( self:GetParent() )
	end
end

function modifier_ability_npc_boss_jungle2_spell2:CheckState()
	return {
		[MODIFIER_STATE_SILENCED] = true,
	}
end

function modifier_ability_npc_boss_jungle2_spell2:OnIntervalThink()
	self.pulse = self.pulse + 1
	local enemies = FindUnitsInRadius(
		DOTA_TEAM_BADGUYS,	-- int, your team number
		self:GetParent():GetOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		self.radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
		0,	-- int, flag filter
		0,	-- int, order filter
		false	-- bool, can grow cache
	)

	self.damageTable.damage = self.tick_damage * self.pulse

	for _,enemy in pairs(enemies) do
		self.damageTable.victim = enemy
		ApplyDamage( self.damageTable )
		self:PlayEffects2(enemy)
	end
	if self.pulse >= self.pulses then
		self:Destroy()
	end
end

function modifier_ability_npc_boss_jungle2_spell2:IsAura()
	return self.owner
end

function modifier_ability_npc_boss_jungle2_spell2:GetModifierAura()
	return "modifier_ability_npc_boss_jungle2_spell2"
end

function modifier_ability_npc_boss_jungle2_spell2:GetAuraRadius()
	return self.radius
end

function modifier_ability_npc_boss_jungle2_spell2:GetAuraDuration()
	return 0.3
end

function modifier_ability_npc_boss_jungle2_spell2:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ability_npc_boss_jungle2_spell2:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_boss_jungle2_spell2:PlayEffects1( duration )
	local particle_cast = "particles/units/heroes/hero_disruptor/disruptor_static_storm.vpcf"
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, self:GetParent() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetOrigin() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( self.radius, self.radius, self.radius ) )
	ParticleManager:SetParticleControl( effect_cast, 2, Vector( duration, 0, 0 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )
end

function modifier_ability_npc_boss_jungle2_spell2:PlayEffects2( target )
	local particle_cast = "particles/units/heroes/hero_disruptor/disruptor_static_storm_bolt_hero.vpcf"
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_OVERHEAD_FOLLOW, target )
	ParticleManager:ReleaseParticleIndex( effect_cast )
end