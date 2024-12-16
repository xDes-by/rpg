if inventory == nil then
	_G.inventory = class({})
end

function inventory:init()
	CustomGameEventManager:RegisterListener("get_hero_inventory", Dynamic_Wrap( inventory, 'get_hero_inventory' ))
	CustomGameEventManager:RegisterListener("update_hero_inventory", Dynamic_Wrap( inventory, 'update_hero_inventory' ))
end

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

function inventory:get_hero_inventory(t)
	local sid = tostring(PlayerResource:GetSteamID(t.PlayerID))
	local data = {
		pid = t.PlayerID,
		sid = sid,
		hero_name = PlayerResource:GetSelectedHeroEntity(t.PlayerID):GetUnitName(),
		data = _G.players_data[sid]
	}
	web:enqueue_request(data, function(response)
		if response then
			_G.players_data[sid] = response
		end
	end, true)
end

---------------------------------------------------------------------------------------------------------------------

function inventory:update_hero_inventory(t)
	local sid = tostring(PlayerResource:GetSteamID(t.PlayerID))
	_G.players_data[sid] = t.data
	local data = {
		pid = t.PlayerID,
		sid = sid,
		hero_name = PlayerResource:GetSelectedHeroEntity(t.PlayerID):GetUnitName(),
		data = _G.players_data[sid]
	}
	web:enqueue_request(data, function(response)
		if response then
			_G.players_data[sid] = response
		end
	end, true)
end

---------------------------------------------------------------------------------------------------------------------

function inventory:update_sets(pid)
	print("update set")
	local sid = tostring(PlayerResource:GetSteamID(pid))
	local hero = PlayerResource:GetSelectedHeroEntity(pid)
	local hero_name = hero:GetUnitName()
	local data = game_events:calculate_hero_stats(hero_name, sid)
	CustomNetTables:SetTableValue("hero_hud_stats", tostring(pid), data)


	-- new_data['full_set'] = inventory:CheckFullSet(data)
	
	-- if hero:HasModifier('modifier_sets') then			--- проблема с OnRefresh() поэтому так
	-- 	hero:RemoveModifierByName('modifier_sets')
	-- 		hero:AddNewModifier(hero, nil, "modifier_sets", new_data)
	-- else
	-- 	hero:AddNewModifier(hero, nil, "modifier_sets", new_data)
	-- end
end

---------------------------------------------------------------------------------------------------------------------

function inventory:update_description(data, pid)
end


inventory:init()