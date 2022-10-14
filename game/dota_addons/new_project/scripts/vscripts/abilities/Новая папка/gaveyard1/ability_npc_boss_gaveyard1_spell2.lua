ability_npc_boss_gaveyard1_spell2 = class({})

LinkLuaModifier("modifier_ability_npc_boss_gaveyard1_spell2", "abilities/gaveyard1/ability_npc_boss_gaveyard1_spell2", LUA_MODIFIER_MOTION_NONE)

function ability_npc_boss_gaveyard1_spell2:OnSpellStart()
    local pos = self:GetCursorPosition()
    local unit = CreateUnitByName("npc_tomb_graveyard", pos, true, nil, nil, DOTA_TEAM_BADGUYS )
    unit:AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_gaveyard1_spell2", {})
    unit:AddNewModifier(self:GetCaster(), self, "modifier_kill", {duration = 30})
    EmitSoundOn("Hero_Undying.Tombstone", self:GetCaster())
    EmitSoundOn("Hero_Undying.Tombstone.Spawn.DT", self:GetCaster())
end

modifier_ability_npc_boss_gaveyard1_spell2 = class({})
--Classifications template
function modifier_ability_npc_boss_gaveyard1_spell2:IsHidden()
    return true
end

function modifier_ability_npc_boss_gaveyard1_spell2:IsPurgable()
    return false
end

function modifier_ability_npc_boss_gaveyard1_spell2:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_gaveyard1_spell2:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_gaveyard1_spell2:OnCreated()
    if IsClient() then
        return
    end
    self:StartIntervalThink(1)
end

function modifier_ability_npc_boss_gaveyard1_spell2:OnIntervalThink()
    if RandomInt(1,2) == 1 then
        CreateUnitByName("npc_gaveyard1_kostyan", self:GetParent():GetAbsOrigin()+ RandomVector(RandomInt(100, 300)), true, nil, nil, DOTA_TEAM_BADGUYS )
    else
        CreateUnitByName("npc_gaveyard1_zomby", self:GetParent():GetAbsOrigin()+ RandomVector(RandomInt(100, 300)), true, nil, nil, DOTA_TEAM_BADGUYS )
    end
end