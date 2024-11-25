if modifier_hero_mana == nil then modifier_hero_mana = class({}) end

function modifier_hero_mana:IsHidden()
    return true
end

function modifier_hero_mana:IsPurgable()
    return false
end

function modifier_hero_mana:RemoveOnDeath()
    return false
end

function modifier_hero_mana:OnCreated(kv)
    if not IsServer() then return end
    self:GetParent():CalculateStatBonus(true)
end

function modifier_hero_mana:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MANA_BONUS,
    }
end

function modifier_hero_mana:GetModifierManaBonus()
    return self:GetStackCount()
end
