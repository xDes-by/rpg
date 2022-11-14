modifier_hero_class_damage = class({})

function modifier_hero_class_damage:IsHidden()
    return false
end

function modifier_hero_class_damage:IsPurgable()
    return false
end

function modifier_hero_class_damage:RemoveOnDeath()
    return false
end


function modifier_hero_class_damage:DeclareFunctions()
	return {
		-- MODIFIER_PROPERTY_HEALTH_BONUS,
		-- MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		-- MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,
		
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_EVASION_CONSTANT,
		
		-- MODIFIER_PROPERTY_MANA_BONUS,
		-- MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
		-- MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE,
		
		-- MODIFIER_PROPERTY_HEAL_AMPLIFY_PERCENTAGE_TARGET,
		-- MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
		-- MODIFIER_PROPERTY_MANACOST_PERCENTAGE
	}
end

function modifier_hero_class_damage:GetModifierPreAttack_BonusDamage()
	return 10 *self:GetParent():GetLevel()
end

function modifier_hero_class_damage:GetModifierAttackSpeedBonus_Constant()
	return 5 * self:GetParent():GetLevel()
end

function modifier_hero_class_damage:GetModifierEvasion_Constant()
	return 2 * self:GetParent():GetLevel()
end