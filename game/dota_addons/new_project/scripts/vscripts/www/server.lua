if Server == nil then
    _G.Server = class({})
end

function Server:init()
    self.host = "https://cha.random-defence-adventure.ru/"
    self.api = {}
    self.api.PlayerInit = self.host .. "PlayerInit"
    self.api.EndGame = self.host .. "GameStatistics"
    self.api.PlayerEnd = self.host .. "PlayerEnd"
    self.api.NewTalent = self.host .. "NewTalent"
    self.api.GetProducts = self.host .. "GetProducts"
    self.api.Buy = self.host .. "Buy"
    self.api.AchieveSave = self.host .. "AchieveSave"
    self.api.GetAccountReward = self.host .. "GetAccountReward"
    self.api.BPSave = self.host .. "BPSave"
    self.api.GetReward = self.host .. "GetReward"
    self.api.GetAllReward = self.host .. "GetAllReward"
    self.api.TalentSave = self.host .. "TalentSave"
    self.api.TalentReset = self.host .. "ResetTalents"
    self.api.LearnTalent = self.host .. "LearnTalent"
    
    
    
    ListenToGameEvent( "player_chat", Dynamic_Wrap( self, "OnChat" ), self )
    ListenToGameEvent( "game_rules_state_change", Dynamic_Wrap( self, 'OnGameRulesStateChange' ), self )

    self.pEnd = {}
end

function Server:OnChat(t)
    local text = t.text 
    steamID = PlayerResource:GetSteamAccountID(t.playerid)
    if text == "end" then
        Server:EndGame()
        
    end
    if text == "pend" then
        Server:PlayerEnd(0)
    end
    if text == "name" then
        print("Name: ",PlayerResource:GetPlayerName( 0 ))
    end
end

function Server:OnGameRulesStateChange()
    local GameState = GameRules:State_Get()
    if GameState == DOTA_GAMERULES_STATE_HERO_SELECTION then
        Server:GetProducts()
    end
end

function Server:GetProducts()
    local req = CreateHTTPRequestScriptVM( "GET", self.api.GetProducts )
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
            Shop:ListInit(json.decode(res.Body))
            for i = 0, 4 do
                if PlayerResource:IsValidPlayer(i) then
                    Server:PlayerInit(i)
                end
            end
        end 
	end)
end


function Server:PlayerInit(id)
    info = json.encode({
        sid     = PlayerResource:GetSteamAccountID( id ),
        name    = PlayerResource:GetPlayerName( id ),
    })
    local req = CreateHTTPRequestScriptVM( "GET", self.api.PlayerInit )
	req:SetHTTPRequestGetOrPostParameter("info", info)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
        
		if res.StatusCode == 200 and res.Body ~= nil then
            local data = json.decode(res.Body)
            -- выбор героя
            HeroSelection:AddPlayer(id, data["talents"])
            -- рейтинг
            Rating:AddPlayer(id, data["player"])
            -- таланты
            talent:AddPlayer(id, data["talents"])
            -- достижения
            Achieve:InitPlayerInfo(id, data["player"])
            Achieve:InitPlayerHeroesAchieve(id, data["talents"])
            -- магазин игрока
            Shop:PlayerShopInit(id, data["player"])
            -- инит бп
            BP:AddPlayer(id, data["player"])
        end
	end)

end

function Server:EndGame()
    info = {
        match_id    = tostring( GameRules:Script_GetMatchID() ),
        duration    = math.ceil( GameRules:GetGameTime() ),
        result      = 23,
        game_mode   = "easy",
        players     = { },
    }
    for id = 0, PlayerResource:GetPlayerCount()-1 do
        if PlayerResource:IsValidPlayer(id) then
            table.insert(info['players'], {
                sid         = PlayerResource:GetSteamAccountID(id),
                hero_name   = PlayerResource:GetSelectedHeroName(id),
                items       = GetHeroItems(id),
            })
        end
    end

    info = json.encode(info)
    local req = CreateHTTPRequestScriptVM( "GET", self.api.EndGame )
	req:SetHTTPRequestGetOrPostParameter("info", info)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)end)

    for id = 0, PlayerResource:GetPlayerCount()-1 do
        if PlayerResource:IsValidPlayer(id) then
            Server:PlayerEnd(id)
        end
    end
end

function GetHeroItems(id)
    ent = PlayerResource:GetSelectedHeroEntity(id)
    local items = {}
    for i=DOTA_ITEM_SLOT_1, DOTA_ITEM_SLOT_6 do
        local current_item = ent:GetItemInSlot(i)
        if current_item then
            items[i] = current_item:GetName()
        else
            items[i] = ""
        end
    end
    return items
end

function Server:PlayerEnd(id)
    if not self.pEnd[id] then
        self.pEnd[id] = true
    else return end

    info = json.encode({
        sid             = PlayerResource:GetSteamAccountID(id),
        talent_exp      = 124,
        bp_exp          = 256,
        rating_change   = 23,
        hero_name       = PlayerResource:GetSelectedHeroName(id),
        duration        = math.ceil( GameRules:GetGameTime() ),
    })

    local req = CreateHTTPRequestScriptVM( "GET", self.api.PlayerEnd )
	req:SetHTTPRequestGetOrPostParameter("info", info)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)end)
end

function Server:Buy(PlayerID, prodID, currency, amount)
    info = json.encode({
        sid         = PlayerResource:GetSteamAccountID(PlayerID),
        prod_id     = prodID,
        currency    = currency,
        amount      = amount,
    })
    local req = CreateHTTPRequestScriptVM( "GET", self.api.Buy )
	req:SetHTTPRequestGetOrPostParameter("info", info)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
        if res.StatusCode == 200 and res.Body ~= nil then
            
        end
    end)
end

function Server:TalentSave(PlayerID, level_add, exp)
    info = json.encode({
        sid         = PlayerResource:GetSteamAccountID(PlayerID),
        add_level   = level_add,
        exp         = exp,
        hero_name   = PlayerResource:GetSelectedHeroName(PlayerID)
    })
    local req = CreateHTTPRequestScriptVM( "GET", self.api.TalentSave )
	req:SetHTTPRequestGetOrPostParameter("info", info)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
    end)
end

function Server:TalentReset(PlayerID)
    info = json.encode({
        sid         = PlayerResource:GetSteamAccountID(PlayerID),
        hero_name   = PlayerResource:GetSelectedHeroName(PlayerID)
    })
    local req = CreateHTTPRequestScriptVM( "GET", self.api.TalentReset )
	req:SetHTTPRequestGetOrPostParameter("info", info)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
	end)
end

function Server:NewTalent(PlayerID, heroname)
    info = json.encode({
        sid = PlayerResource:GetSteamAccountID(PlayerID),
        hero_name = heroname
    })
    local req = CreateHTTPRequestScriptVM( "GET", self.api.NewTalent )
	req:SetHTTPRequestGetOrPostParameter("info", info)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
            local data = json.decode(res.Body)
            local heroname = data['hero_name']
            talent.own[PlayerID][heroname] = data
            talent:PlayerInit(PlayerID, heroname)
        end
	end)
end

function Server:AchieveSave(PlayerID, type, AchieveID, count)
    info = json.encode({
        sid = PlayerResource:GetSteamAccountID(PlayerID),
        type = type,
        achieve_id = AchieveID,
        count = count
    })
    local req = CreateHTTPRequestScriptVM( "GET", self.api.AchieveSave )
	req:SetHTTPRequestGetOrPostParameter("info", info)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
	end)
end

function Server:GetAccountReward(PlayerID, achieve_type, achieve_id, achieve_count, reward_type, reward_amount)
    info = json.encode({
        sid = PlayerResource:GetSteamAccountID(PlayerID),
        achieve_type = achieve_type,
        achieve_id = achieve_id,
        achieve_count = achieve_count,
        reward_type = reward_type,
        reward_amount = reward_amount,
    })
    local req = CreateHTTPRequestScriptVM( "GET", self.api.GetAccountReward )
	req:SetHTTPRequestGetOrPostParameter("info", info)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
	end)
end

function Server:BPSave(PlayerID, exp, addLevel)
    info = json.encode({
        sid = PlayerResource:GetSteamAccountID(PlayerID),
        exp = exp,
        add_level = addLevel
    })
    local req = CreateHTTPRequestScriptVM( "GET", self.api.BPSave )
	req:SetHTTPRequestGetOrPostParameter("info", info)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
	end)
end

function Server:GetReward(PlayerID, type, number, layer)
    info = json.encode({
        sid = PlayerResource:GetSteamAccountID(PlayerID),
        type = type,
        number = number,
        layer = layer
    })
    local req = CreateHTTPRequestScriptVM( "GET", self.api.GetReward )
	req:SetHTTPRequestGetOrPostParameter("info", info)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
	end)
end

function Server:GetAllReward(PlayerID)
    info = json.encode({
        sid = PlayerResource:GetSteamAccountID(PlayerID)
    })
    local req = CreateHTTPRequestScriptVM( "GET", self.api.GetAllReward )
	req:SetHTTPRequestGetOrPostParameter("info", info)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
	end)
end

function Server:LearnTalent(PlayerID, talent_id)
    info = json.encode({
        sid = PlayerResource:GetSteamAccountID(PlayerID),
        hero_name = PlayerResource:GetSelectedHeroName(PlayerID),
        talent_id = talent_id,
    })
    local req = CreateHTTPRequestScriptVM( "GET", self.api.LearnTalent )
	req:SetHTTPRequestGetOrPostParameter("info", info)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
	end)
end

Server:init()

