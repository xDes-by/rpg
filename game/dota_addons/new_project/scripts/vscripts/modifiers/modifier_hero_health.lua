if modifier_hero_health == nil then modifier_hero_health = class({}) end

function modifier_hero_health:IsHidden()
    return true
end

function modifier_hero_health:IsPurgable()
    return false
end

function modifier_hero_health:RemoveOnDeath()
    return false
end

function modifier_hero_health:OnCreated(kv)
    if not IsServer() then return end
    self:GetParent():CalculateStatBonus(true)
end

function modifier_hero_health:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_HEALTH_BONUS,
    }
end

function modifier_hero_health:GetModifierHealthBonus()
    return self:GetStackCount()
end
