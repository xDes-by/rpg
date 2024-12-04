if web == nil then
	web = class({})
end

function web:init()
	CustomGameEventManager:RegisterListener("hero_get_stats", Dynamic_Wrap( self, 'hero_get_stats' ))
	CustomGameEventManager:RegisterListener("hero_add_stats", Dynamic_Wrap( self, 'hero_add_stats' ))


	GameRules:GetGameModeEntity():SetThink("Think_Players_Exp", self, "web", 60)
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
	local exp = _G.players_data[sid].heroes[hero_name].exp
	local level = _G.players_data[sid].heroes[hero_name].level
	arr = {
		sid = sid,
		hero_name = hero_name,
		exp = exp,
		level = level
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/dotamu/api_update_hero_data/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local data = json.decode(res.Body)
			_G.players_data[sid].heroes[hero_name] = data
			return game_events:init_hero(hero, pid, _G.players_data[sid].heroes[hero_name]) 																			
		else
			print(res.StatusCode)
		end
	end)
end

function web:Think_Players_Exp()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		print("send")
	end
	return 60
end





function web:hero_get_stats(t)
	local hero = PlayerResource:GetSelectedHeroEntity(t.PlayerID)	
	-- arr = {
		-- sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
	-- }
	-- arr = json.encode(arr)
	-- local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/api_close_order/?key=".._G.key )
	-- req:SetHTTPRequestGetOrPostParameter('arr',arr)
	-- req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	-- req:Send(function(res)
		-- if res.StatusCode == 200 and res.Body ~= nil then
		
			-- local data = json.decode(res.Body)  -- ответ о кол-ве поинтов
			CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "hero_show_stats", {	points = 5, --data.points,
																													str = 6,
																													agi = 5,
																													vit = 32,
																													eng = 213}
																													)																									
		-- else
			-- print(res.StatusCode)
		-- end
	-- end)
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

