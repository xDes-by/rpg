item_cave1_miner_soul = class({})

function item_cave1_miner_soul:GetCastRange()
    return 300
end

function item_cave1_miner_soul:OnSpellStart()
    local unit = CreateUnitByName("npc_boss_cave1", self:GetCursorPosition(), true, nil, nil, DOTA_TEAM_BADGUYS )
	MapLogic.Listeners[1] = ListenToGameEvent("entity_killed", Dynamic_Wrap( MapLogic, 'OnEntityKilledCave1' ), MapLogic )
    MapLogic.BossCave1 = unit
    UTIL_Remove(self)
end
