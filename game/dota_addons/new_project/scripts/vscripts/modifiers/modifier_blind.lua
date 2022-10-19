modifier_blind = class({})

function modifier_blind:IsHidden()
    return true
end

function modifier_blind:IsPurgable()
    return false
end

function modifier_blind:RemoveOnDeath()
    return false
end

function modifier_blind:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_FIXED_DAY_VISION,
	   MODIFIER_PROPERTY_FIXED_NIGHT_VISION
}
end

function modifier_blind:GetFixedDayVision(data)
	return 300
end

function modifier_blind:GetFixedNightVision(data)
	return 300
end