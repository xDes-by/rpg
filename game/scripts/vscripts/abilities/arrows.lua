LinkLuaModifier("modifier_fire_arrow", "abilities/arrows", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_ice_arrow", "abilities/arrows", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_ice_arrow_debuff", "abilities/arrows", LUA_MODIFIER_MOTION_NONE)

QuiverArrows = class({})

FireArrows = class({})
IceArrows = class({})
PoisonArrows = class({})

function FireArrows:GetIntrinsicModifierName()
	return "modifier_fire_arrow"
end

function IceArrows:GetIntrinsicModifierName()
	return "modifier_ice_arrow"
end

function PoisonArrows:GetIntrinsicModifierName()
	return "modifier_poison_arrow"
end

-------------------------------------- FIRE ARROW --------------------------------

modifier_fire_arrow = class({})

function modifier_fire_arrow:IsHidden() return true end
function modifier_fire_arrow:IsDebuff() return false end
function modifier_fire_arrow:IsPurgable() return false end
function modifier_fire_arrow:RemoveOnDeath() return false end
function modifier_fire_arrow:AllowIllusionDuplicate() return false end

function modifier_fire_arrow:DeclareFunctions()
return
	{
		MODIFIER_PROPERTY_PROJECTILE_NAME,
		MODIFIER_PROPERTY_TRANSLATE_ATTACK_SOUND,
		MODIFIER_EVENT_ON_ATTACK_LANDED
	}
end

function modifier_fire_arrow:GetModifierProjectileName()
	return "particles/scout/scout_fire_arrow.vpcf"
end

function modifier_fire_arrow:GetAttackSound()
	return "Hero_Clinkz.SearingArrows"
end

function modifier_fire_arrow:OnAttackLanded(keys)
	if IsServer() then
		if keys.attacker == self:GetParent() then
			keys.target:EmitSound("Hero_Clinkz.SearingArrows.Impact")

			local caster = self:GetParent()
			local target = keys.target
			local ability = self:GetAbility()
			local splash = ability:GetSpecialValueFor("splash")
			local damage = ability:GetSpecialValueFor("damage")
			local radius = ability:GetSpecialValueFor("radius")

			CustomDealDamage(target, caster, ability, true_damage, 'fire')
			local enemies = FindUnitsInRadius(caster:GetTeamNumber(), target:GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NOT_ATTACK_IMMUNE + DOTA_UNIT_TARGET_FLAG_NO_INVIS + DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, 0, false)
			for _,enemy in pairs(enemies) do
				if enemy ~= target then
					CustomDealDamage(enemy, caster, ability, true_damage, 'fire')
				end
			end
		end
	end
end

-------------------------------------- ICE ARROW -------------------------------------------

modifier_ice_arrow = class({})

function modifier_ice_arrow:IsHidden() return true end
function modifier_ice_arrow:IsDebuff() return false end
function modifier_ice_arrow:IsPurgable() return false end
function modifier_ice_arrow:RemoveOnDeath() return false end
function modifier_ice_arrow:AllowIllusionDuplicate() return false end

function modifier_ice_arrow:DeclareFunctions()
return
	{
		MODIFIER_PROPERTY_PROJECTILE_NAME,
		MODIFIER_PROPERTY_TRANSLATE_ATTACK_SOUND,
		MODIFIER_EVENT_ON_ATTACK_LANDED
	}
end

function modifier_ice_arrow:GetModifierProjectileName()
	return "particles/scout/scout_frost_arrow.vpcf"
end

function modifier_ice_arrow:GetAttackSound()
	return "Hero_DrowRanger.FrostArrows"
end

function modifier_ice_arrow:OnAttackLanded(keys)
	if IsServer() then
		if keys.attacker == self:GetParent() then
			local caster = self:GetParent()
			local ability = self:GetAbility()
			local target = keys.target
			local duration = ability:GetSpecialValueFor("duration")

		end
	end
end


modifier_scout_frost_arrow_debuff = class({})

function modifier_scout_frost_arrow_debuff:IsHidden() return false end
function modifier_scout_frost_arrow_debuff:IsDebuff() return true end
function modifier_scout_frost_arrow_debuff:IsPurgable() return true end
function modifier_scout_frost_arrow_debuff:RemoveOnDeath() return true end
function modifier_scout_frost_arrow_debuff:GetTexture() return "scout_frost" end

function modifier_scout_frost_arrow_debuff:GetStatusEffectName() return "particles/status_fx/status_effect_frost.vpcf" end
function modifier_scout_frost_arrow_debuff:StatusEffectPriority() return 110 end

function modifier_scout_frost_arrow_debuff:DeclareFunctions()
return
	{
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
	}
end

function modifier_scout_frost_arrow_debuff:GetModifierMoveSpeedBonus_Percentage()
	return 15
end

function modifier_scout_frost_arrow_debuff:GetModifierAttackSpeedBonus_Constant()	
	return 15
end

-------------------------------- POISON ARROW -------------------------------------------
























ScoutRefreshingArrows = class({})

function ScoutRefreshingArrows:GetCooldown(iLevel)
	local bonus = 0
	local caster = self:GetCaster()
	local ArrowsBaseTalent = caster:FindAbilityByName("scout_talent3")
	if ArrowsBaseTalent then 
		bonus = ArrowsBaseTalent:GetSpecialValueFor("cooldown")
	end
	return self.BaseClass.GetCooldown(self, iLevel) - bonus
end

function ScoutRefreshingArrows:GetManaCost( level )
	local mana_cost_bonus = 0
	local caster = self:GetCaster()
	local ArrowsBaseTalent = caster:FindAbilityByName("scout_talent3")
	if ArrowsBaseTalent then
		mana_cost_bonus = ArrowsBaseTalent:GetSpecialValueFor("mana_cost")
	end
	return self.BaseClass.GetManaCost(self,level) - mana_cost_bonus
end

function ScoutRefreshingArrows:OnSpellStart()
	if not IsServer() then return end
	local ability = self
	local caster = self:GetCaster()

	caster:AddNewModifier(caster, ability, "modifier_scout_refreshing_arrow_buff", {duration = ability:GetSpecialValueFor("duration")})
	local particle = ParticleManager:CreateParticle("particles/units/abilities/hero_phantom_assassin_persona/pa_persona_shard_fan_of_knives_cast_swirl.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
	ParticleManager:ReleaseParticleIndex(particle)	
end











----

modifier_scout_poison_arrow_hidden = class({})

function modifier_scout_poison_arrow_hidden:IsHidden() return true end
function modifier_scout_poison_arrow_hidden:IsDebuff() return false end
function modifier_scout_poison_arrow_hidden:IsPurgable() return false end
function modifier_scout_poison_arrow_hidden:RemoveOnDeath() return false end
function modifier_scout_poison_arrow_hidden:AllowIllusionDuplicate() return false end

function modifier_scout_poison_arrow_hidden:DeclareFunctions()
return
	{
		MODIFIER_PROPERTY_PROJECTILE_NAME,
		MODIFIER_PROPERTY_TRANSLATE_ATTACK_SOUND,
		MODIFIER_EVENT_ON_ATTACK_LANDED
	}
end

function modifier_scout_poison_arrow_hidden:GetModifierProjectileName()
	return "particles/scout/scout_poision_arrow.vpcf"
end

function modifier_scout_poison_arrow_hidden:GetAttackSound()
	return nil --"hero_viper.poisonAttack.Cast"
end

function modifier_scout_poison_arrow_hidden:OnAttackLanded(keys)
	if IsServer() then
		if keys.attacker == self:GetParent() then
			local caster = self:GetParent()
			local ability = caster:FindAbilityByName("ScoutPoisonArrows")
			local target = keys.target
			local duration = ability:GetSpecialValueFor("duration")
			local max_stack = ability:GetSpecialValueFor("max_stack")

			local MaxStackTalent = caster:FindAbilityByName("scout_talent10")
			if MaxStackTalent then
				max_stack = max_stack + MaxStackTalent:GetSpecialValueFor("max_stack")
			end

			local debuff = "modifier_scout_poison_arrow_debuff"
			local stack = target:GetModifierStackCount(debuff, caster)

			target:AddNewModifier(caster, ability, debuff, {duration  = duration})
			if stack < max_stack then
				target:SetModifierStackCount(debuff, caster, stack + 1)
			end

			target:EmitSound("hero_viper.projectileImpact")
			target:EmitSound("Hero_Venomancer.ProjectileImpact")
		end
	end
end



modifier_scout_poison_arrow_debuff = class({})
function modifier_scout_poison_arrow_debuff:IsHidden() return false end
function modifier_scout_poison_arrow_debuff:IsPurgable() return true end
function modifier_scout_poison_arrow_debuff:IsDebuff() return true end
function modifier_scout_poison_arrow_debuff:RemoveOnDeath() return true end
function modifier_scout_poison_arrow_debuff:GetTexture() return "scout_poison" end

function modifier_scout_poison_arrow_debuff:GetEffectName() return "particles/units/abilities/hero_venomancer/venomancer_poison_debuff.vpcf" end
function modifier_scout_poison_arrow_debuff:GetEffectAttachType() return PATTACH_ABSORIGIN_FOLLOW end
function modifier_scout_poison_arrow_debuff:GetStatusEffectName() return "particles/status_fx/status_effect_poison_venomancer.vpcf" end
function modifier_scout_poison_arrow_debuff:StatusEffectPriority() return 120 end

function modifier_scout_poison_arrow_debuff:DeclareFunctions()
return
	{
		MODIFIER_PROPERTY_HP_REGEN_AMPLIFY_PERCENTAGE,
		MODIFIER_EVENT_ON_DEATH
	}
end

function modifier_scout_poison_arrow_debuff:OnCreated(table)
	local caster = self:GetCaster()
	local interval = self:GetAbility():GetSpecialValueFor("interval")
	local IntervalTalent = caster:FindAbilityByName("scout_talent12")
	if IntervalTalent then
		interval = interval * 0.5
	end		
	self:StartIntervalThink(interval)
end

function modifier_scout_poison_arrow_debuff:OnIntervalThink()
	if not IsServer() then return end
	local target = self:GetParent()
	local caster = self:GetCaster()
	local ability = self:GetAbility()

	local base_damage = ability:GetSpecialValueFor("damage") * self:GetStackCount()

	ScoutDamagePoison ( target, caster, ability, base_damage )
end

function modifier_scout_poison_arrow_debuff:GetModifierHPRegenAmplify_Percentage()
	local caster = self:GetCaster()
	local regen = 0
	local MaxStackTalent = caster:FindAbilityByName("scout_talent10")
	if MaxStackTalent then
		regen = regen + MaxStackTalent:GetSpecialValueFor("regen")
	end		
	return -1 * regen
end

function modifier_scout_poison_arrow_debuff:OnDeath(params)
	if not IsServer() then return end
	if self:GetParent() ~= params.unit then return end
	local target = self:GetParent()
	local caster = self:GetCaster()
	local ExplosionTalent = caster:FindAbilityByName("scout_talent7")
	if ExplosionTalent then	
		local exp_radius = ExplosionTalent:GetSpecialValueFor("radius")		
		local enemies = FindUnitsInRadius(
			caster:GetTeamNumber(),	-- int, your team number
			target:GetAbsOrigin(),	-- point, center point
			nil,	-- handle, cacheUnit. (not known)
			exp_radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
			DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
			DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
			DOTA_DAMAGE_FLAG_NONE,	-- int, flag filter
			0,	-- int, order filter
			false	-- bool, can grow cache
		)

		local particle = ParticleManager:CreateParticle("particles/scout/scout_poision_explosion.vpcf", PATTACH_ABSORIGIN_FOLLOW, target)
	    ParticleManager:SetParticleControl(particle, 0, target:GetAbsOrigin())
	    ParticleManager:SetParticleControl(particle, 1, Vector(exp_radius, 0, 0))		
		ParticleManager:ReleaseParticleIndex(particle)		
		target:EmitSound("Hero_Venomancer.VenomousGaleImpact")	

		for _,enemy in pairs(enemies) do
			if enemy ~= target then
				ScoutDamagePoison ( enemy, caster, ExplosionTalent, ExplosionTalent:GetSpecialValueFor("damage") * self:GetStackCount() )
			end
		end
	end
end




function ScoutSwap(event)
	local caster = event.caster
	local ability = event.ability
	local ScoutFlamingArrows = caster:FindAbilityByName("ScoutFlamingArrows")
	local ScoutFrostArrows = caster:FindAbilityByName("ScoutFrostArrows")
	local ScoutPoisonArrows = caster:FindAbilityByName("ScoutPoisonArrows")

	local fire_arrow_modifier = "modifier_fire_arrow"
	local frost_arrow_modifier = "modifier_ice_arrow"
	local poison_arrow_modifier = "modifier_scout_poison_arrow_hidden"

	if ScoutFlamingArrows:GetAutoCastState() == true then
		caster:AddNewModifier(caster, ability, fire_arrow_modifier, {duration = -1})
	else
		caster:RemoveModifierByName(fire_arrow_modifier)
	end

	if ScoutFrostArrows:GetAutoCastState() == true then
		caster:AddNewModifier(caster, ability, frost_arrow_modifier, {duration = -1})
	else
		caster:RemoveModifierByName(frost_arrow_modifier)
	end

	if ScoutPoisonArrows:GetAutoCastState() == true then
		caster:AddNewModifier(caster, ability, poison_arrow_modifier, {duration = -1})
	else
		caster:RemoveModifierByName(poison_arrow_modifier)
	end


	local modifier_arrows = "modifier_scout_arrows"
	local arrows_count = caster:GetModifierStackCount(modifier_arrows, caster)
	local modifier_disarm = "modifier_scout_disarm_no_arrows"

	if arrows_count <= 0 then
		ability:ApplyDataDrivenModifier(caster, caster, modifier_disarm, {})
	else
		caster:RemoveModifierByName(modifier_disarm)
	end
end
