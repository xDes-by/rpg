npc_dota_hero_skeleton_king_spell6 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_skeleton_king_spell6", "heroes/npc_dota_hero_skeleton_king/npc_dota_hero_skeleton_king_spell6", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_skeleton_king_spell6:GetIntrinsicModifierName()
	return "modifier_npc_dota_hero_skeleton_king_spell6"
end

modifier_npc_dota_hero_skeleton_king_spell6 = class({})

function modifier_npc_dota_hero_skeleton_king_spell6:IsHidden()
	return true
end

function modifier_npc_dota_hero_skeleton_king_spell6:OnCreated( kv )
	self.reincarnate_time = self:GetAbility():GetSpecialValueFor( "reincarnate_time" )
	self.slow_radius = self:GetAbility():GetSpecialValueFor( "slow_radius" )
	self.slow_duration = self:GetAbility():GetSpecialValueFor( "slow_duration" )
	self.aura_radius = self:GetAbility():GetSpecialValueFor( "aura_radius" )
end

function modifier_npc_dota_hero_skeleton_king_spell6:OnRefresh( kv )
	self.reincarnate_time = self:GetAbility():GetSpecialValueFor( "reincarnate_time" )
	self.slow_radius = self:GetAbility():GetSpecialValueFor( "slow_radius" )
	self.slow_duration = self:GetAbility():GetSpecialValueFor( "slow_duration" )
	self.aura_radius = self:GetAbility():GetSpecialValueFor( "aura_radius" )
end

function modifier_npc_dota_hero_skeleton_king_spell6:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_REINCARNATION,
	}
end

function modifier_npc_dota_hero_skeleton_king_spell6:ReincarnateTime( params )
	if IsServer() then
		if self:GetAbility():IsFullyCastable() then
			self:Reincarnate()
			return self.reincarnate_time
		end
		return 0
	end
end

function modifier_npc_dota_hero_skeleton_king_spell6:Reincarnate()

	self:GetAbility():UseResources(true, false, true)

	-- find affected enemies
	local enemies = FindUnitsInRadius(
		self:GetParent():GetTeamNumber(),	-- int, your team number
		self:GetParent():GetOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		self.slow_radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
		0,	-- int, flag filter
		0,	-- int, order filter
		false	-- bool, can grow cache
	)
end

function modifier_npc_dota_hero_skeleton_king_spell6:PlayEffects()
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_skeletonking/wraith_king_reincarnate.vpcf", PATTACH_ABSORIGIN, self:GetParent() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetOrigin() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( self.reincarnate_time, 0, 0 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )
	EmitSoundOn( "Hero_SkeletonKing.Reincarnate", self:GetParent() )
end