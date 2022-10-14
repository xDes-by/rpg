Convars:RegisterCommand( "print_game_table", function( cmd, key1, key2, key3, key4, key5 )
    if key5 ~= nil then 
        return table.print(_G[key1][key2][key3][key4][key5])
    elseif key4 ~= nil then 
        return table.print(_G[key1][key2][key3][key4])
    elseif key3 ~= nil then 
        return table.print(_G[key1][key2][key3])
    elseif key2 ~= nil then 
        return table.print(_G[key1][key2])
    elseif key1 ~= nil then 
        return table.print(_G[key1])
    else
        print("NotGetAnyValues")
    end
    end, "Print game table", FCVAR_UNREGISTERED + FCVAR_PROTECTED + FCVAR_HIDDEN 
)

Convars:RegisterCommand( "god_mode", function( cmd, nPlayerID )
    local hero  = PlayerResource:GetSelectedHeroEntity( tonumber(nPlayerID) )
	hero:AddNewModifier(nil, nil, "modifier_cheat_move", nil)
	hero:AddNewModifier(nil, nil, "modifier_god", nil)
    end, "god_mode", FCVAR_UNREGISTERED + FCVAR_PROTECTED + FCVAR_HIDDEN 
)

Convars:RegisterCommand( "remove_god_mode", function( cmd, nPlayerID )
    local hero  = PlayerResource:GetSelectedHeroEntity( tonumber(nPlayerID) )
	hero:RemoveModifierByName("modifier_cheat_move")
	hero:RemoveModifierByName("modifier_god")
    end, "remove_god_mode", FCVAR_UNREGISTERED + FCVAR_PROTECTED + FCVAR_HIDDEN 
)

Convars:RegisterCommand( "call_map_logic_function", function( cmd, function_name )
    MapLogic[function_name] (MapLogic)
    end, "ally", FCVAR_UNREGISTERED + FCVAR_PROTECTED + FCVAR_HIDDEN 
)

Convars:RegisterCommand( "spawn_necessary_location", function( cmd, zone_name )
    print(zone_name)
    AddonGamemode:SpawnLocationEvent(_,zone_name)
    end, "ally", FCVAR_UNREGISTERED + FCVAR_PROTECTED + FCVAR_HIDDEN 
)