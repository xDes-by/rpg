LinkLuaModifier( "modifier_ability_npc_boss_forest_1_spell_1", "abilities/forest/forest_1/ability_npc_boss_forest_1_spell_1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_forest_1_armor_per_treant", "abilities/forest/forest_1/ability_npc_boss_forest_1_spell_1", LUA_MODIFIER_MOTION_NONE )

ability_npc_boss_forest_1_spell_1 = class({})

function ability_npc_boss_forest_1_spell_1:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_forest_1_spell_1"
end

--------------------------------------------------------------------------------------------------------------------------------------------------------

modifier_ability_npc_boss_forest_1_spell_1 = class({})

function modifier_ability_npc_boss_forest_1_spell_1:IsHidden()
   return true
end

function modifier_ability_npc_boss_forest_1_spell_1:IsPurgable()
   return false
end

function modifier_ability_npc_boss_forest_1_spell_1:RemoveOnDeath()
   return true
end

function modifier_ability_npc_boss_forest_1_spell_1:OnCreated()
	if not IsServer() then return end
    self:StartIntervalThink(2)
    self.modifier = self:GetParent():AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_ability_npc_boss_forest_1_armor_per_treant", nil)
end

function modifier_ability_npc_boss_forest_1_spell_1:OnIntervalThink()
	if not IsServer() then return end
    if self:GetParent():HasModifier("modifier_boss_invelurable") or not self:GetParent():IsAlive() then
        return
    end
    local enemies = FindUnitsInRadius(self:GetParent():GetTeamNumber(), self:GetParent():GetAbsOrigin(), nil, self:GetParent():GetAcquisitionRange(), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, 0, 0, false )
    if #enemies == 0 then 
        return
    end
    local treants = FindUnitsInRadius( self:GetParent():GetTeamNumber(), self:GetParent():GetAbsOrigin(), nil, self:GetParent():GetAcquisitionRange(), DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_BASIC, 0, 0, false )
    self.modifier:SetStackCount(#treants)
    local unit = CreateUnitByName("npc_forest_1_treant_small", self:GetParent():GetAbsOrigin() + RandomVector(RandomInt(100,500)), true, nil, nil, DOTA_TEAM_BADGUYS )
    self:StartGrow(unit)
	Rules:unit_settings(unit, "creep", "mini", 0, 0, 100)
end

function modifier_ability_npc_boss_forest_1_spell_1:StartGrow(unit)
    unit:AddNewModifier(nil,nil,"modifier_invulnerable",{duration = 1})
    unit:AddNewModifier(nil,nil,"modifier_disarmed",{duration = 1})
    modelscale = 0.1
    unit:SetModelScale(modelscale)
    Timers:CreateTimer(0.1,function()
        if unit:GetModelScale() >= 1 then 
            return nil
        end
        modelscale = modelscale + 0.1
        unit:SetModelScale(modelscale)
        return 0.1
    end)
end

function modifier_ability_npc_boss_forest_1_spell_1:CheckState()
    return {
        [MODIFIER_STATE_NO_HEALTH_BAR] = true,
    }
end

--------------------------------------------------------------------------------------------------------------------------------------------------------

modifier_ability_npc_boss_forest_1_armor_per_treant = class({})

function modifier_ability_npc_boss_forest_1_armor_per_treant:IsHidden()
   return true
end

function modifier_ability_npc_boss_forest_1_armor_per_treant:IsPurgable()
   return false
end

function modifier_ability_npc_boss_forest_1_armor_per_treant:DeclareFunctions()
    return {
       MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
       MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT
}
end

function modifier_ability_npc_boss_forest_1_armor_per_treant:GetModifierPhysicalArmorBonus()
    return self:GetStackCount()
end

function modifier_ability_npc_boss_forest_1_armor_per_treant:GetModifierConstantHealthRegen()
    return self:GetStackCount() * 2
end