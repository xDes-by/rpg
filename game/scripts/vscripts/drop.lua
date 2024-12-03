if drop == nil then
	_G.drop = class({})
end

function drop:init()
	ListenToGameEvent('entity_killed', Dynamic_Wrap(drop, 'OnEntityKilled'), self)
end

function drop:OnEntityKilled(keys)
	local killedUnit = EntIndexToHScript(keys.entindex_killed)
	local killer = EntIndexToHScript(keys.entindex_attacker)
	if killedUnit and not killedUnit:IsRealHero() then
		DropItem(killedUnit:GetUnitName())
	end
end

function DropItem(unit_name)
    for location, unit in pairs(_G.units_data) do
        if unit[unit_name] and unit[unit_name].drop and RandomInt(1,100) <= unit[unit_name].chance then
            local drop_table = unit[unit_name].drop
            local random_index = RandomInt(1, #drop_table)
			table.print(drop_table[random_index])
			if unit[unit_name].duration then
				--kill loot duration
			end
        end
    end
    print("Монстр не найден: " .. unit_name)
    return nil
end

drop:init()
