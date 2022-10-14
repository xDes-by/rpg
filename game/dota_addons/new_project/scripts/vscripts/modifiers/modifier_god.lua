modifier_god = class({})
--Classifications template
function modifier_god:IsHidden()
   return false
end

function modifier_god:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
       MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
       MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
       MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE
}
end

function modifier_god:GetModifierBonusStats_Strength()
    return 1000
end

function modifier_god:GetModifierBonusStats_Intellect()
    return 1000
end

function modifier_god:GetModifierBonusStats_Agility()
    return 1000
end

function modifier_god:GetModifierHealthRegenPercentage()
    return 100
end

function modifier_god:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end
