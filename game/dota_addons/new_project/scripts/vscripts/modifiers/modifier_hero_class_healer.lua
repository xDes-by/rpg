modifier_hero_class_healer = class({})

function modifier_hero_class_healer:IsHidden()
    return true
end

function modifier_hero_class_healer:IsPurgable()
    return false
end

function modifier_hero_class_healer:RemoveOnDeath()
    return false
end


function modifier_hero_class_healer:DeclareFunctions()
	return {
		-- MODIFIER_PROPERTY_HEALTH_BONUS,
		-- MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		-- MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,
		
		-- MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
		-- MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		-- MODIFIER_PROPERTY_EVASION_CONSTANT,
		
		-- MODIFIER_PROPERTY_MANA_BONUS,
		-- MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
		-- MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
		
		MODIFIER_PROPERTY_HEAL_AMPLIFY_PERCENTAGE_TARGET,
		MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
		MODIFIER_PROPERTY_MANACOST_PERCENTAGE
	}
end

function modifier_hero_class_healer:GetModifierHealAmplify_PercentageTarget()
	return 10 *self:GetParent():GetLevel()
end

function modifier_hero_class_healer:GetModifierConstantManaRegen()
	return 2 * self:GetParent():GetLevel()
end

function modifier_hero_class_healer:MODIFIER_PROPERTY_MANACOST_PERCENTAGE()
	return -2 * self:GetParent():GetLevel()
end