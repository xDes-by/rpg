LinkLuaModifier( "modifier_npc_dota_hero_treant_spell3","heroes/npc_dota_hero_treant/npc_dota_hero_treant_spell3", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_treant_spell3 = class({})

function npc_dota_hero_treant_spell3:GetIntrinsicModifierName()
    return "modifier_npc_dota_hero_treant_spell3"
end

-----------------------------------------------------------------------------

modifier_npc_dota_hero_treant_spell3 = class({})

function modifier_npc_dota_hero_treant_spell3:IsHidden()
    return true
end

function modifier_npc_dota_hero_treant_spell3:IsPurgable()
    return false
end

function modifier_npc_dota_hero_treant_spell3:RemoveOnDeath()
   return false
end

function modifier_npc_dota_hero_treant_spell3:OnCreated()
    self.abiregen = self:GetAbility():GetSpecialValueFor("regen_persent")
    self.radius = self:GetAbility():GetSpecialValueFor("radius")
    if IsClient() then
        return
    end
    self:StartIntervalThink(1)
end

function modifier_npc_dota_hero_treant_spell3:OnIntervalThink()
    if (GridNav:IsNearbyTree(self:GetCaster():GetAbsOrigin(), self.radius, true)) then
        self:SetStackCount(self.abiregen)
    else
        self:SetStackCount(0)
    end
end

function modifier_npc_dota_hero_treant_spell3:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE
    }
end

function modifier_npc_dota_hero_treant_spell3:GetModifierHealthRegenPercentage()
    return self:GetStackCount()
end
