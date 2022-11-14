LinkLuaModifier("modifier_ability_npc_boss_dark_1_spell2", "abilities/dark/dark_1/ability_npc_boss_dark_1_spell2", LUA_MODIFIER_MOTION_NONE)

ability_npc_boss_dark_1_spell2 = class({})

function ability_npc_boss_dark_1_spell2:OnSpellStart()
	local duration = self:GetSpecialValueFor("duration")
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_dark_1_spell2", {duration = duration})
    EmitSoundOn("Hero_Undying.Tombstone", self:GetCaster())
    EmitSoundOn("Hero_Undying.Tombstone.Spawn.DT", self:GetCaster())
end

--------------------------------------------------------------------------------------------

modifier_ability_npc_boss_dark_1_spell2 = class({})

function modifier_ability_npc_boss_dark_1_spell2:IsHidden()
    return true
end

function modifier_ability_npc_boss_dark_1_spell2:IsPurgable()
    return false
end

function modifier_ability_npc_boss_dark_1_spell2:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_dark_1_spell2:OnCreated()
	self.models = {"models/heroes/undying/undying_minion_torso.vmdl","models/heroes/undying/undying_minion.vmdl"}
	if not IsServer() then return end
    self:StartIntervalThink(1)
end

function modifier_ability_npc_boss_dark_1_spell2:OnIntervalThink()
	if not IsServer() then return end
	local unit = CreateUnitByName("npc_dark_creep_boss", Vector(-10816,1984,295), true, nil, nil, DOTA_TEAM_BADGUYS )
	unit:AddNewModifier(self:GetCaster(), self, "modifier_kill", {duration = 20})
	Rules:unit_settings(unit, "creep", "mini", 0, 0, 50)
	Rules:SetAbilityLevel(unit)
	unit:SetModel(self.models[RandomInt(1, #self.models)])
end