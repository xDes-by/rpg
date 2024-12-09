if debug_panel == nil then
	debug_panel = class({})
end

function debug_panel:init()
	CustomGameEventManager:RegisterListener("spawn_creep", Dynamic_Wrap( self, 'spawn_creep'))
end

function debug_panel:spawn_creep(tab)
	local hero = PlayerResource:GetSelectedHeroEntity( tab.PlayerID )	
	local front = hero:GetForwardVector():Normalized()
	local pos = hero:GetOrigin() + front * 700
	Spawner:CreateUnit(tab.creep_name, pos, tab.zone)
end

debug_panel:init()