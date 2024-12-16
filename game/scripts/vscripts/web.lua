if web == nil then
	web = class({})
end

web.request_queue = {}

function web:init()
	CustomGameEventManager:RegisterListener("try_teleport", Dynamic_Wrap( self, 'try_teleport'))
	CustomGameEventManager:RegisterListener("hero_add_stats", Dynamic_Wrap( self, 'hero_add_stats' ))
	web:start_game()
end

function web:start_game()
	_G.players_data = {}

	local arr = {}
	for i = 0 , PlayerResource:GetPlayerCount() do
	    if PlayerResource:IsValidPlayer(i) then
			arr[tostring(i)] = {
				sid = tostring(PlayerResource:GetSteamID(i))
			}
		end
	end
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/dotamu/api_start_game/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			_G.players_data = json.decode(res.Body)
			print("START GAME")
		else
			print("ERROR START GAME")
			print(res.StatusCode)
		end
	end)
end


function web:enqueue_request(data, callback, update_inventory)
    table.insert(self.request_queue, {
        data = data,
        callback = callback,
        update_inventory = update_inventory
    })
    if not self.processing then
        self:process_next_request()
    end
end

function web:process_next_request()
	print("SEND REQUEST")
    if #self.request_queue == 0 then
        self.processing = false
        return
    end

    self.processing = true
    local request = table.remove(self.request_queue, 1)

    local req = CreateHTTPRequestScriptVM("POST", "https://custom-dota.ru/dotamu/api_update_player_data/?key=" .. _G.key)
    req:SetHTTPRequestGetOrPostParameter('arr', json.encode(request.data))
    req:SetHTTPRequestAbsoluteTimeoutMS(100000)

    req:Send(function(res)
        if res.StatusCode == 200 and res.Body ~= nil then
            local response = json.decode(res.Body)
            if request.callback then
                request.callback(response)
            end

            if request.update_inventory then
                local pid = request.data.pid
				local sid = request.data.sid
                CustomGameEventManager:Send_ServerToPlayer(
                    PlayerResource:GetPlayer(pid),
                    "UpdateInventoryMain",
                    _G.players_data[sid]
                )
				inventory:update_sets(pid)
            end
        else
            print("Error:", res.StatusCode)
        end
        self:process_next_request()
    end)
end

--------------------------------------------------------------------------------------

function web:update_hero_data(hero_name, pid, hero)
	local sid = tostring(PlayerResource:GetSteamID(pid))
	if _G.players_data[sid].heroes[hero_name] then
		arr = {
			sid = sid,
			hero_name = hero_name,
			exp = _G.players_data[sid].heroes[hero_name].exp,
			level = _G.players_data[sid].heroes[hero_name].level,
			points = _G.players_data[sid].heroes[hero_name].points
		}
	else
		arr = {
			sid = sid,
			hero_name = hero_name,
			exp = 0,
			level = 1,
			points = 0
		}
	end

	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/dotamu/api_update_hero_data/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local data = json.decode(res.Body)
			_G.players_data[sid].heroes[hero_name] = data
			-- game_events:init_hero(hero, pid, _G.players_data[sid].heroes[hero_name]) 																			
			game_events:init_hero(hero_name, pid) 																			
		else
			print(res.StatusCode)
		end
	end)
end



function web:try_teleport(tab)
	local sid = tostring(PlayerResource:GetSteamID(tab.PlayerID))
	local zone = tab.zone
	local zen = tab.zen
	if _G.players_data[sid].stats.zen >= tonumber(zen) then
		arr = {
			sid = sid,
			zen = zen,
		}
		arr = json.encode(arr)
		local req = CreateHTTPRequestScriptVM( "POST",  "https://custom-dota.ru/dotamu/api_teleport/?key=".._G.key )
		req:SetHTTPRequestGetOrPostParameter('arr',arr)
		req:SetHTTPRequestAbsoluteTimeoutMS(100000)
		req:Send(function(res)
			if res.StatusCode == 200 and res.Body ~= nil then
				_G.players_data[sid].stats.zen = _G.players_data[sid].stats.zen - zen			
				game_events:teleport(tab.PlayerID, zone)															
			else
				print(res.StatusCode)
			end
		end)
	end
end

















---------------------------------------------------------------------------------------------------------------------------------


function web:hero_add_stats(t)
	local sid = tostring(PlayerResource:GetSteamID(t.PlayerID))
	local hero = PlayerResource:GetSelectedHeroEntity(t.PlayerID)	
	local hero_name = hero:GetUnitName()
	if _G.players_data[sid].heroes[hero_name].points > 0 then
		_G.players_data[sid].heroes[hero_name].points = _G.players_data[sid].heroes[hero_name].points - 1
		arr = {
			sid = sid,
			hero_name = hero_name,
			type = t.type,
		}
		arr = json.encode(arr)
		local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/dotamu/api_add_hero_stats/?key=".._G.key )
		req:SetHTTPRequestGetOrPostParameter('arr',arr)
		req:SetHTTPRequestAbsoluteTimeoutMS(100000)
		req:Send(function(res)
			if res.StatusCode == 200 and res.Body ~= nil then
				local web_data = json.decode(res.Body)
				_G.players_data[sid].heroes[hero_name] = web_data
				local data = game_events:calculate_hero_stats(hero_name, sid)
				CustomNetTables:SetTableValue("hero_hud_stats", tostring(t.PlayerID), data)
			else
				print(res.StatusCode)
			end
		end)
	end
end

