if talent == nil then
	_G.talent = class({})
end

function talent:init()
    -- ListenToGameEvent( 'game_rules_state_change', Dynamic_Wrap( self, 'OnGameRulesStateChange'), self)
    -- CustomGameEventManager:RegisterListener("selectTalantButton", Dynamic_Wrap(self, 'selectTalantButton'))
    -- CustomGameEventManager:RegisterListener("talant_shop", Dynamic_Wrap(self, 'talant_shop'))
    -- ListenToGameEvent("player_reconnected", Dynamic_Wrap( self, 'OnPlayerReconnected' ), self)
    CustomGameEventManager:RegisterListener("TalentInitLua",function(_, keys)
        self:PanoramaInit(keys)
    end)
    CustomGameEventManager:RegisterListener("ActiveTalentButton",function(_, keys)
        self:ActiveTalentButton(keys)
    end)
    self.own = {}
    self.visual = TalantData
    self.player = {}
    self.ExpToLevelUp = {
        [1] = 1000,
        [2] = 1000,
        [3] = 1000,
        [4] = 1000,
        [5] = 1000,
        [6] = 1000,
        [7] = 1000,
        [8] = 1000,
        [9] = 1000,
        [10] = 1000,
        [11] = 1000,
        [12] = 1000,
        [13] = 1000,
        [14] = 1000,
        [15] = 1000,
        [16] = 1000,
        [17] = 1000,
        [18] = 1000,
        [19] = 1000,
        [20] = 1000,
        [21] = 1000,
        [22] = 1000,
        [23] = 1000,
        [24] = 1000,
        [25] = 1000,
        [26] = 1000,
        [27] = 1000,
        [28] = 1000,
        [29] = 1000,
        [30] = 1000,
    }
    CustomNetTables:SetTableValue( "talent", "ExpToLevelUp", self.ExpToLevelUp)
end

function talent:AddPlayer(id, data)
    self.own[id] = {}
    for _,talent in pairs(data) do
        self.own[id][talent['hero_name']] = talent
    end
end

function talent:PlayersInit()
    for pid = 0, PlayerResource:GetPlayerCount()-1 do
        if PlayerResource:IsValidPlayer(pid) then
            heroname = PlayerResource:GetSelectedHeroName( pid )
            
        end
    end
    CustomGameEventManager:Send_ServerToAllClients( "talentInit", talent.ExpToLevelUp )
end

function talent:PlayerInit(id, heroname)
    if not self.own[id][heroname] then
        Server:NewTalent(id, heroname)
        return
    end
    used = 0
    exp = self.own[id][heroname]['exp']
    for _,t in pairs(self.own[id][heroname]['list']) do
        used = used + t
    end
    self.player[id] = {
        heroname = heroname,
        visual = self.visual[heroname],
        own = self.own[id][heroname],
        exp = self.own[id][heroname]['exp'],
        level = self.own[id][heroname]['level'],
        free = self.own[id][heroname]['level'] - used + self.own[id][heroname]['extra'],
        addLevel = 0,
    }
    CustomNetTables:SetTableValue( "talent", tostring(id), talent.player[id])
end

function talent:ActiveTalentButton(t)
    if self.player[t.PlayerID]['free'] == 0 then return end
    if self.player[t.PlayerID]['own']['list'][t.n] == 3 then return end
    -- изучение таланта
    self.player[t.PlayerID]['own']['list'][tostring(t.n)] = self.player[t.PlayerID]['own']['list'][tostring(t.n)] +1
    -- минус скилл поинт
    self.player[t.PlayerID]['free'] = self.player[t.PlayerID]['free'] -1
    -- обновить таблицу
    CustomNetTables:SetTableValue('talent', tostring(t.PlayerID), self.player[t.PlayerID])
    talent:Explore(t)
end

function talent:Explore(t)
    Server:LearnTalent(t.PlayerID, t.n)
    -- DeepPrintTable(t)
end

function talent:BuyExp(id, add)
    -- покупка опыта
    talent:AddExp(id, add)
    Server:TalentSave(id, self.player[id].addLevel, self.player[id].exp)
    self.player[id].addLevel = 0
end

function talent:AddExp(id, add)
    -- Начисление опыта
    LevelAdd = 0    -- кол-во уровней полученный за опыт
    
    level = {}
    exp = {}
    -- уровень и опыт до изменений
    level[1] = self.player[id]['level']
    exp[1] = self.player[id]['exp']
    exp[2] = self.player[id]['exp']
    -- Я ваще хз что тут происходит
    while true do
        level[2] = level[1] + LevelAdd
        if  self.ExpToLevelUp[level[2]+1] 
        and self.ExpToLevelUp[level[2]+1] <= exp[2] + add then
            LevelAdd = LevelAdd + 1
            add = add - self.ExpToLevelUp[level[2]+1] + exp[2]
            exp[2] = 0
        else
            exp[2] = exp[2] + add
            break
        end
    end
    -- ваще хз
    self.player[id]['level'] = level[1] + LevelAdd
    self.player[id]['exp'] = exp[2]
    self.player[id]['free'] = self.player[id]['free'] + LevelAdd
    -- до сих пор не ебу
    CustomNetTables:SetTableValue('talent', tostring(id), self.player[id])
    self.player[id].addLevel = self.player[id].addLevel + LevelAdd
end

function talent:BuyReset(id)
    Server:TalentReset(id)
    talent:Reset(id)
end

function talent:Reset(id)
    for i = 1, 19 do
        self.player[id]['own']['list'][tostring(i)] = 0
    end
    self.player[id]['free'] = self.player[id]['level'] + self.player[id]['own']['extra']
    CustomNetTables:SetTableValue('talent', tostring(id), self.player[id])
end

talent:init()