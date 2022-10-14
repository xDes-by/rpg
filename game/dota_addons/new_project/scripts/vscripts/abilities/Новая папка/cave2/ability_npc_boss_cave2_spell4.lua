ability_npc_boss_cave2_spell4 = class({})

function ability_npc_boss_cave2_spell4:OnSpellStart()
    if RollPseudoRandom(self:GetSpecialValueFor("chance"),self:GetCaster()) then
        self:CreateCustomIllusion(self:GetCaster(), self:GetCaster():GetAbsOrigin(), self:GetSpecialValueFor("duration"), 100, 100)
    end
end