if web == nil then
	web = class({})
end

EXP_TIMER_UPDATE = 60

function web:init()
	CustomGameEventManager:RegisterListener("try_teleport", Dynamic_Wrap( self, 'try_teleport'))









	CustomGameEventManager:RegisterListener("hero_add_stats", Dynamic_Wrap( self, 'hero_add_stats' ))
	


	GameRules:GetGameModeEntity():SetThink("Think_Players_Exp", self, "web", EXP_TIMER_UPDATE)
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
			print("ERROR START GAME")
		end
	end)
end

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

function web:Think_Players_Exp()
    if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        local arr = {}
        for i = 0 , PlayerResource:GetPlayerCount() do
            if PlayerResource:IsValidPlayer(i) then
                local pl_sid = tostring(PlayerResource:GetSteamID(i))
                local hero = PlayerResource:GetSelectedHeroEntity(i)    
                local hero_name = hero:GetUnitName()
                if hero_name == 'npc_dota_hero_wisp' then
                    goto continue_send
                end
                arr[tostring(i)] = {
                    sid = pl_sid,
                    hero_name = hero_name,
                    exp = _G.players_data[pl_sid].heroes[hero_name].exp,
                    level = _G.players_data[pl_sid].heroes[hero_name].level,
                    points = _G.players_data[pl_sid].heroes[hero_name].points
                }
                ::continue_send::
            end
        end

        if arr['0'] == nil then
            return EXP_TIMER_UPDATE
        end

        arr = json.encode(arr)
        local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/dotamu/api_send_players_exp/?key=".._G.key )
        req:SetHTTPRequestGetOrPostParameter('arr',arr)
        req:SetHTTPRequestAbsoluteTimeoutMS(100000)
        req:Send(function(res)
            if res.StatusCode == 200 and res.Body ~= nil then
                local web_data = json.decode(res.Body)			
				for i = 0 , PlayerResource:GetPlayerCount() do
					if PlayerResource:IsValidPlayer(i) then
						local sid = tostring(PlayerResource:GetSteamID(i))
                		local hero = PlayerResource:GetSelectedHeroEntity(i)    
                		local hero_name = hero:GetUnitName()
						_G.players_data[sid].heroes[hero_name].exp = web_data[sid].exp
						_G.players_data[sid].heroes[hero_name].level = web_data[sid].level
						_G.players_data[sid].heroes[hero_name].points = web_data[sid].points
						
						local data = game_events:calculate_hero_stats(hero_name, sid)
						CustomNetTables:SetTableValue("hero_hud_stats", tostring(pid), data)
					end
				end
                print("EXP OK")
            else
                print("EXP ERROR")
                print(res.StatusCode)
            end
        end)
    end
    return EXP_TIMER_UPDATE
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
	local hero = PlayerResource:GetSelectedHeroEntity(t.PlayerID)	
	-- arr = {
		-- sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
		-- type = t.type,
	-- }
	-- arr = json.encode(arr)
	-- local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/api_close_order/?key=".._G.key )
	-- req:SetHTTPRequestGetOrPostParameter('arr',arr)
	-- req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	-- req:Send(function(res)
		-- if res.StatusCode == 200 and res.Body ~= nil then
		
			-- local data = json.decode(res.Body)  -- ответ о кол-ве поинтов
			
			local vit_mod = hero:FindModifierByName('modifier_hero_stats')
			hero:SetBaseIntellect(hero:GetBaseIntellect() + 1)
			hero:SetBaseStrength(hero:GetBaseStrength() + 1)
			hero:SetBaseAgility(hero:GetBaseAgility() + 1)
			vit_mod:IncrementStackCount()
			
			hero:AddNewModifier(hero, nil, "modifier_hero_stats", {agi=1, str=1, vit=1, eng=0}) -- данные о поинтах с сервера
			
			
			CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "hero_show_stats", {	points = 5, --data.points,
																													str = hero:GetStrength(),
																													agi = hero:GetAgility(),
																													vit = hero:FindModifierByName('modifier_hero_stats'):GetStackCount(),
																													eng = hero:GetIntellect(true)}
																													)																									
		-- else
			-- print(res.StatusCode)
		-- end
	-- end)
end

