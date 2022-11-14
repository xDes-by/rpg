ability_npc_boss_dust_2_spell_1 = class({})

function ability_npc_boss_dust_2_spell_1:OnSpellStart()
	self:GetCaster():EmitSound("Hero_Broodmother.SpawnSpiderlingsCast")
    local unit = CreateUnitByName("npc_dust_creep_egg_fake", self:GetCursorPosition() + RandomVector( RandomInt( 50, 300 )) , true, nil, nil, DOTA_TEAM_BADGUYS )
	unit:AddNewModifier(unit, nil, "modifier_kill",  {duration = 60}) 	
end

