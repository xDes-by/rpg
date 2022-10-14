npc_dota_hero_juggernaut_skill3 = class({})
LinkLuaModifier( "modifier_npc_dota_hero_juggernaut_skill3", "heroes/npc_dota_hero_juggernaut/npc_dota_hero_juggernaut_skill3", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_juggernaut_skill3:OnSpellStart()
	self:GetCaster():Purge(false, true, false, false, false)
	local dur = self:GetSpecialValueFor("duration")
	self:GetCaster():AddNewModifier(self:GetCaster(),self,"modifier_npc_dota_hero_juggernaut_skill3",{ duration = dur})
end

----------------------------------------------------------------------

modifier_npc_dota_hero_juggernaut_skill3 = class({})

function modifier_npc_dota_hero_juggernaut_skill3:IsHidden()
	return false
end

function modifier_npc_dota_hero_juggernaut_skill3:IsDebuff()
	return false
end

function modifier_npc_dota_hero_juggernaut_skill3:IsPurgable()
	return false
end

function modifier_npc_dota_hero_juggernaut_skill3:DestroyOnExpire()
	return true
end

function modifier_npc_dota_hero_juggernaut_skill3:OnCreated( kv )
	self.radius = self:GetAbility():GetSpecialValueFor( "blade_fury_radius" ) -- special value
	self.dps = self:GetAbility():GetSpecialValueFor( "blade_fury_damage" ) -- special value
	
	if IsServer() then
		self.damageTable = {
			attacker = self:GetParent(),
			damage = self.dps * 0.2,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self:GetAbility(), --Optional.
		}
		self:StartIntervalThink( 0.2 )
	end
			
	local particle_cast = "particles/units/heroes/hero_juggernaut/juggernaut_blade_fury.vpcf"
	local sound_cast = "Hero_Juggernaut.BladeFuryStart"

	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	ParticleManager:SetParticleControl( effect_cast, 5, Vector( self.radius, 0, 0 ) )

	self:AddParticle(effect_cast, false, false, -1, false, false)
	EmitSoundOn( sound_cast, self:GetParent() )
end

function modifier_npc_dota_hero_juggernaut_skill3:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
	}
end

function modifier_npc_dota_hero_juggernaut_skill3:GetOverrideAnimation()
	return ACT_DOTA_OVERRIDE_ABILITY_1
end

function modifier_npc_dota_hero_juggernaut_skill3:OnRefresh( kv )
	self.radius = self:GetAbility():GetSpecialValueFor( "blade_fury_radius" ) -- special value
	self.dps = self:GetAbility():GetSpecialValueFor( "blade_fury_damage" ) -- special value
end

function modifier_npc_dota_hero_juggernaut_skill3:OnDestroy( kv )
	local sound_cast = "Hero_Juggernaut.BladeFuryStart"
	StopSoundOn( sound_cast, self:GetParent() )
end

function modifier_npc_dota_hero_juggernaut_skill3:CheckState()
	local state = {
		[MODIFIER_STATE_MAGIC_IMMUNE] = true
	}
	return state
end


function modifier_npc_dota_hero_juggernaut_skill3:OnIntervalThink()
	local enemies = FindUnitsInRadius(
		self:GetCaster():GetTeamNumber(),	-- int, your team number
		self:GetParent():GetAbsOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		self.radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
		0,	-- int, flag filter
		0,	-- int, order filter
		false	-- bool, can grow cache
	)

	for _,enemy in pairs(enemies) do
		self.damageTable.victim = enemy
		ApplyDamage( self.damageTable )

		self:PlayEffects( enemy )
	end
end

function modifier_npc_dota_hero_juggernaut_skill3:PlayEffects( target )
	local particle_cast = "particles/units/heroes/hero_juggernaut/juggernaut_blade_fury_tgt.vpcf"
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, target )
	ParticleManager:ReleaseParticleIndex( effect_cast )
end
