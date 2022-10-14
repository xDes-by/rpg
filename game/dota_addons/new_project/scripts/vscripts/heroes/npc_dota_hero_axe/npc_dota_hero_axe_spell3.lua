npc_dota_hero_axe_spell3 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_axe_spell3", "heroes/npc_dota_hero_axe/npc_dota_hero_axe_spell3", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_axe_spell3:GetIntrinsicModifierName()
	return "modifier_npc_dota_hero_axe_spell3"
end

modifier_npc_dota_hero_axe_spell3 = class({})

function modifier_npc_dota_hero_axe_spell3:IsHidden()
	if self:GetStackCount() > 0 then
		return false
	end
	return true
end

function modifier_npc_dota_hero_axe_spell3:IsPurgable()
	return false
end

function modifier_npc_dota_hero_axe_spell3:DestroyOnExpire()
	return false
end

function modifier_npc_dota_hero_axe_spell3:OnCreated( kv )
	self.radius = self:GetAbility():GetSpecialValueFor( "radius" )
	self.damage = self:GetAbility():GetSpecialValueFor( "damage" )
	self.chance = self:GetAbility():GetSpecialValueFor( "chance" )
	self.duration = self:GetAbility():GetSpecialValueFor( "duration" )
	self.max = self:GetAbility():GetSpecialValueFor( "max" )
end

function modifier_npc_dota_hero_axe_spell3:OnRefresh( kv )
	self:OnCreated()
end

function modifier_npc_dota_hero_axe_spell3:OnIntervalThink()
	self:SetStackCount(0)
end

function modifier_npc_dota_hero_axe_spell3:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_TOTALDAMAGEOUTGOING_PERCENTAGE,
		MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
		MODIFIER_EVENT_ON_ATTACK_LANDED
	}
end

function modifier_npc_dota_hero_axe_spell3:GetModifierTotalDamageOutgoing_Percentage( kv )
	return 2 * self:GetStackCount()
end

function modifier_npc_dota_hero_axe_spell3:GetModifierIncomingDamage_Percentage( kv )
	return -2 * self:GetStackCount()
end

function modifier_npc_dota_hero_axe_spell3:OnAttackLanded(params)
	if IsClient() then
		return
	end
	if self:GetParent() == params.target and self:GetAbility():IsCooldownReady() and RollPseudoRandom(self.chance,self:GetCaster()) then 
		if self:GetStackCount() < self.max then
			self:IncrementStackCount()
		end
		self:SetDuration(self.duration, true)
		self:StartIntervalThink(self.duration)
		local enemies = FindUnitsInRadius(
			self:GetCaster():GetTeamNumber(),	-- int, your team number
			self:GetCaster():GetOrigin(),	-- point, center point
			nil,	-- handle, cacheUnit. (not known)
			275,	-- float, radius. or use FIND_UNITS_EVERYWHERE
			DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
			DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
			DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,	-- int, flag filter
			0,	-- int, order filter
			false	-- bool, can grow cache
		)
	
		self.damageTable = {
			-- victim = target,
			attacker = self:GetCaster(),
			damage = self.damage,
			damage_type = DAMAGE_TYPE_PURE,
			ability = self:GetAbility(), --Optional.
			damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION, --Optional.
		}

		for _,enemy in pairs(enemies) do
			self.damageTable.victim = enemy
			ApplyDamage( self.damageTable )
		end

		self:GetAbility():UseResources( false, false, true )

		self:PlayEffects()
	end
end


function modifier_npc_dota_hero_axe_spell3:PlayEffects()
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_axe/axe_counterhelix.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	ParticleManager:ReleaseParticleIndex( effect_cast )
	local effect_cast2 = ParticleManager:CreateParticle( "particles/units/heroes/hero_axe/axe_attack_blur_counterhelix.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	ParticleManager:ReleaseParticleIndex( effect_cast2 )
	EmitSoundOn( "Hero_Axe.CounterHelix", self:GetParent() )
end

