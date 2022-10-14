ability_npc_boss_jungle3_spell1 = class({})

function ability_npc_boss_jungle3_spell1:OnSpellStart()
    local unit = CreateUnitByName("npc_boss_jungle3_spidersack", self:GetCursorPosition(), true, nil, nil, DOTA_TEAM_BADGUYS )
end

