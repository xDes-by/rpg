modifier_hero_class_healer = class({})

function modifier_hero_class_healer:IsHidden()
    return false
end

function modifier_hero_class_healer:IsPurgable()
    return false
end

function modifier_hero_class_healer:RemoveOnDeath()
    return false
end


function modifier_hero_class_healer:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_HEAL_AMPLIFY_PERCENTAGE_SOURCE ,
		MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
		MODIFIER_PROPERTY_MANACOST_PERCENTAGE
	}
end

function modifier_hero_class_healer:GetModifierHealAmplify_PercentageSource()
	return 10 * self:GetParent():GetLevel()
end

function modifier_hero_class_healer:GetModifierConstantManaRegen()
	return 2 * self:GetParent():GetLevel()
end

function modifier_hero_class_healer:GetModifierPercentageManacost()
	return 2 * self:GetParent():GetLevel()
end