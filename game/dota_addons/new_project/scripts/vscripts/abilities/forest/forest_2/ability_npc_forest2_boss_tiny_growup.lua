ability_npc_forest2_boss_tiny_growup = class({})

LinkLuaModifier( "modifier_ability_npc_forest2_boss_tiny_growup","abilities/forest2/ability_npc_forest2_boss_tiny_growup", LUA_MODIFIER_MOTION_NONE )

function ability_npc_forest2_boss_tiny_growup:GetIntrinsicModifierName()
    return "modifier_ability_npc_forest2_boss_tiny_growup"
end

modifier_ability_npc_forest2_boss_tiny_growup = class({})

--Classifications template
function modifier_ability_npc_forest2_boss_tiny_growup:IsHidden()
   return true
end

function modifier_ability_npc_forest2_boss_tiny_growup:IsPurgable()
   return false
end

function modifier_ability_npc_forest2_boss_tiny_growup:OnCreated()
    self.CurrentPhase = 1
    self.PhaseTble = {70, 50, 30, 0}
    self.ModelTable = {
        "models/items/tiny/scarlet_quarry/scarlet_quarry01.vmdl",
        "models/items/tiny/scarlet_quarry/scarlet_quarry_02.vmdl",
        "models/items/tiny/scarlet_quarry/scarlet_quarry_03.vmdl",
        "models/items/tiny/scarlet_quarry/scarlet_quarry_04.vmdl",
    }
    self.PhaseAttackBonus = {30, 40, 50, 60}
    self.PhaseArmorBonus = {30, 40, 50, 60}
    self:StartIntervalThink(1)
end

function modifier_ability_npc_forest2_boss_tiny_growup:OnIntervalThink()
    if self:GetParent():GetHealthPercent() <= self.PhaseTble[self.CurrentPhase] then
        print(self.CurrentPhase)
        self:GetModifierModelChange()
        self.CurrentPhase = self.CurrentPhase + 1
    end
end

function modifier_ability_npc_forest2_boss_tiny_growup:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_BASEATTACK_BONUSDAMAGE,
       MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
       MODIFIER_PROPERTY_MODEL_CHANGE 
}
end

function modifier_ability_npc_forest2_boss_tiny_growup:GetModifierBaseAttack_BonusDamage()
    return self.PhaseAttackBonus[self.CurrentPhase]
end

function modifier_ability_npc_forest2_boss_tiny_growup:GetModifierPhysicalArmorBonus()
    return self.PhaseArmorBonus[self.CurrentPhase]
end

function modifier_ability_npc_forest2_boss_tiny_growup:GetModifierModelChange()
    return self.ModelTable[self.CurrentPhase]
end




