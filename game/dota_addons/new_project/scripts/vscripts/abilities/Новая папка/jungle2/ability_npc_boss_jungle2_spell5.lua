ability_npc_boss_jungle2_spell5 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_jungle2_spell5","abilities/jungle2/ability_npc_boss_jungle2_spell5", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_jungle2_spell5:Precache(context)
    PrecacheResource( "particle", "particles/units/heroes/hero_tidehunter/tidehunter_anchor_hero.vpcf", context )
    PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_tidehunter.vsndevts", context )
end

function ability_npc_boss_jungle2_spell5:OnSpellStart()
	local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetCaster():GetAbsOrigin(), nil, 375, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(enemies) do
        self:GetCaster():PerformAttack(unit, false, false, true, true, false, false, true)
    end
    local anchor_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_tidehunter/tidehunter_anchor_hero.vpcf", PATTACH_ABSORIGIN, self:GetCaster())
	ParticleManager:ReleaseParticleIndex(anchor_particle)
    EmitSoundOn("Hero_Tidehunter.AnchorSmash", self:GetCaster())
end
