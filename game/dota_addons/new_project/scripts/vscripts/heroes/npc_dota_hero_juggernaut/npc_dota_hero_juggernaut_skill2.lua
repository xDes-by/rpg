npc_dota_hero_juggernaut_skill2 = class({})
LinkLuaModifier( "modifier_npc_dota_hero_juggernaut_skill2", "heroes/npc_dota_hero_juggernaut/npc_dota_hero_juggernaut_skill2", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_juggernaut_skill2:OnSpellStart()
	StartAnimation(self:GetCaster(), {duration = 2.5, activity = ACT_DOTA_TAUNT, rate = 2, translate = "sharp_blade"})
	
	self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_juggernaut_skill2", {duration = 2.5})
end

--------------------------------------------------------------------------

modifier_npc_dota_hero_juggernaut_skill2 = class({})

function modifier_npc_dota_hero_juggernaut_skill2:IsHidden()
   return false
end

function modifier_npc_dota_hero_juggernaut_skill2:IsDebuff()
   return false
end

function modifier_npc_dota_hero_juggernaut_skill2:IsPurgable()
   return false
end

function modifier_npc_dota_hero_juggernaut_skill2:RemoveOnDeath()
   return true
end

function modifier_npc_dota_hero_juggernaut_skill2:DestroyOnExpire()
	return true
end

function modifier_npc_dota_hero_juggernaut_skill2:OnCreated( kv )
	if not IsServer() then return end
	self.radius = self:GetAbility():GetSpecialValueFor( "radius" )
	self.damage_bonus = self:GetAbility():GetSpecialValueFor( "damage_bonus" )
	local trigger = 3
	Timers:CreateTimer(1.25,function()
		self:AttackUnits()
		trigger = trigger - 1
		if trigger == 0 then
			return
		end
		return 0.3
	end)
end

function modifier_npc_dota_hero_juggernaut_skill2:AttackUnits()
if not IsServer() then return end
	local direction = self:GetCaster():GetForwardVector():Normalized()
	local pos = self:GetCaster():GetOrigin() + direction * 350
	
	local enemies = FindUnitsInCone( self:GetCaster():GetTeamNumber(), self:GetCaster():GetOrigin(), self:GetCaster():GetOrigin(), pos, 150, 350, nil, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_CLOSEST, false)
	for _,enemy in pairs(enemies) do
		ApplyDamage({victim = enemy, attacker = self:GetCaster(), damage = self.damage_bonus + self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster()), damage_type = DAMAGE_TYPE_PHYSICAL, damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION})
	end
	self:PlayEffects1(direction )
end

function modifier_npc_dota_hero_juggernaut_skill2:PlayEffects1(direction )
	local effect_cast = ParticleManager:CreateParticle( "particles/econ/items/sven/sven_ti7_sword/sven_ti7_sword_spell_great_cleave.vpcf", PATTACH_WORLDORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetCaster():GetOrigin() )
	ParticleManager:SetParticleControlForward( effect_cast, 0, direction )
	ParticleManager:ReleaseParticleIndex( effect_cast )
end

function FindUnitsInCone( nTeamNumber, vCenterPos, vStartPos, vEndPos, fStartRadius, fEndRadius, hCacheUnit, nTeamFilter, nTypeFilter, nFlagFilter, nOrderFilter, bCanGrowCache )
	local direction = vEndPos-vStartPos
	direction.z = 0

	local distance = direction:Length2D()
	direction = direction:Normalized()

	local big_radius = distance + math.max(fStartRadius, fEndRadius)

	local units = FindUnitsInRadius(
		nTeamNumber,	-- int, your team number
		vCenterPos,	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		big_radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		nTeamFilter,	-- int, team filter
		nTypeFilter,	-- int, type filter
		nFlagFilter,	-- int, flag filter
		nOrderFilter,	-- int, order filter
		bCanGrowCache	-- bool, can grow cache
	)

	local targets = {}
	for _,unit in pairs(units) do
		local vUnitPos = unit:GetOrigin()-vStartPos
		local fProjection = vUnitPos.x*direction.x + vUnitPos.y*direction.y + vUnitPos.z*direction.z
		fProjection = math.max(math.min(fProjection,distance),0)
		local vProjection = direction*fProjection
		local fUnitRadius = (vUnitPos - vProjection):Length2D()
		local fInterpRadius = (fProjection/distance)*(fEndRadius-fStartRadius) + fStartRadius
		if fUnitRadius<=fInterpRadius then
			table.insert( targets, unit )
		end
	end
	return targets
end

function modifier_npc_dota_hero_juggernaut_skill2:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_BASEATTACK_BONUSDAMAGE
	}
end

function modifier_npc_dota_hero_juggernaut_skill2:GetModifierBaseAttack_BonusDamage()
	return self:GetAbility():GetSpecialValueFor( "damage_bonus" )
end
