local particles =
{
    "particles/units/heroes/hero_juggernaut/juggernaut_blade_fury.vpcf",
    "particles/units/heroes/hero_juggernaut/juggernaut_blade_fury_null.vpcf",
    "particles/units/heroes/hero_juggernaut/juggernaut_blade_fury_tgt.vpcf",
    "",
    "",
    "",
    "",
    "",
    "",
}

local sounds =
{
    "soundevents/soundevents_conquest.vsndevts",
	"",
}

local models =
{
	"",
	"",
}

return function(context)
	local heroes = LoadKeyValues("scripts/npc/activelist.txt")
    for k,v in pairs(heroes) do
      	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_" .. k:gsub('npc_dota_hero_','') ..".vsndevts", context )  
      	PrecacheResource( "soundfile", "soundevents/voscripts/game_sounds_vo_" .. k:gsub('npc_dota_hero_','') ..".vsndevts", context ) 
    end
    for _, p in pairs(particles) do
        PrecacheResource("particle", p, context)
    end
    for _, p in pairs(sounds) do
        PrecacheResource("soundfile", p, context)
    end
    for _, p in pairs(models) do
        PrecacheResource("model", p, context)
    end
end