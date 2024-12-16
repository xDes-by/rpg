if debug_panel == nil then
	debug_panel = class({})
end

function debug_panel:init()
	CustomGameEventManager:RegisterListener("spawn_creep", Dynamic_Wrap( self, 'spawn_creep'))
	CustomGameEventManager:RegisterListener("up_hero", Dynamic_Wrap( self, 'up_hero'))
end

function debug_panel:spawn_creep(tab)
	local hero = PlayerResource:GetSelectedHeroEntity( tab.PlayerID )	
	local front = hero:GetForwardVector():Normalized()
	local pos = hero:GetOrigin() + front * 700
	Spawner:CreateUnit(tab.creep_name, pos, tab.zone)
end


function debug_panel:up_hero(tab)
	local hero = PlayerResource:GetSelectedHeroEntity( tab.PlayerID )
	while hero:GetLevel() < 400 do
		hero:HeroLevelUp(false)
	end
	hero:SetBaseIntellect(hero:GetBaseIntellect() + 10000)
	hero:SetBaseAgility(hero:GetBaseAgility() + 10000)
	hero:SetBaseStrength(hero:GetBaseStrength() + 11000)	
end

debug_panel:init()