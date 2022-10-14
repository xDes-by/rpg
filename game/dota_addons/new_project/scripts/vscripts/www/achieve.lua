if Achieve == nil then
    _G.Achieve = class({})
end


function Achieve:init()
    self.daily = DaysAchieve
    self.account  = AchieveList
    self.core = HeroAchieve.core
    self.support = HeroAchieve.support
    self.player = {}
    self.hero = {}
    CustomNetTables:SetTableValue( "achieve", "account", self.account )
    CustomNetTables:SetTableValue( "achieve", "daily", self.daily )
    CustomNetTables:SetTableValue( "achieve", "core",  self.core)
    CustomNetTables:SetTableValue( "achieve", "support",  self.support)
    CustomGameEventManager:RegisterListener("GetAccountReward",function(_, keys)
        Achieve:GetAccountReward(keys)
    end)
    CustomGameEventManager:RegisterListener("AchieveAndDailyRequest",function(_, keys)
        CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer( keys.PlayerID ), "AchieveAndDailyReturn", {
            daily = self.daily, account = self.account,
        })
    end)
    ListenToGameEvent("player_chat", Dynamic_Wrap( self, "OnChat" ), self )
end

function Achieve:OnChat(t)
    text = t.text
    if text == 'a1' then
        self:UpdateCounter('daily', 1)
    end
end

function Achieve:InitPlayerInfo(PlayerID, data)
    self.player[PlayerID] = {account = {}, daily = {}, hero = {}}
    for i,_ in pairs(self.account) do
        if not data['account'][tostring(i)] then
            self.player[PlayerID]['account'][i] = {count = 0, received = false}
        else
            self.player[PlayerID]['account'][i] = data['account'][tostring(i)]
        end
    end
    for i,_ in pairs(self.daily) do
        if not data['daily'][tostring(i)] then
            self.player[PlayerID]['daily'][i] = {count = 0, received = false}
        else
            self.player[PlayerID]['daily'][i] = data['daily'][tostring(i)]
        end
    end
    CustomNetTables:SetTableValue( "achieve", tostring(PlayerID), self.player[PlayerID])
end

function Achieve:InitPlayerHeroesAchieve(PlayerID, data)
    self.hero[PlayerID] = {}
    for _, hero_name in pairs(HeroSelection.heroes) do
        -- поиск сохраненных достижений у героев
        local dbAchive = {}
        for _,value in pairs(data) do
            if value.hero_name == hero_name then
                dbAchive = value.achieve
                break
            end
        end
        local class = HeroSelection.class[hero_name]
        self.hero[PlayerID][hero_name] = {}
        for _,a in pairs(self[class]) do
            if not dbAchive[tostring(a.id)] then
                self.hero[PlayerID][hero_name][a.id] = {count = 0, received = false}
            else
                self.hero[PlayerID][hero_name][a.id] = dbAchive[tostring(a.id)]
            end
        end
        self:SetTableHeroAchieve(PlayerID, hero_name, self.hero[PlayerID][hero_name])
    end
    -- CustomNetTables:SetTableValue( "hero_achieve", tostring(PlayerID), self.hero[PlayerID])
end


function Achieve:UpdateCounter(type, identifier)
    -- цикл по квестам
    for _, content in pairs(self[type]) do
        -- вычлинение нужного квеста
        if content['id'] == identifier or content['name'] == identifier then
            local ID = content['id']
            -- цикл по игрокам
            for pid,_ in pairs(self.player) do
                -- проверка count < amount
                if self.player[pid][type][ID]['count'] < content['amount'] and ( Shop.premium[pid] or not content['premium'] ) then
                    self.player[pid][type][ID]['count'] = self.player[pid][type][ID]['count'] + 1
                    CustomNetTables:SetTableValue( "achieve", tostring(pid), Achieve.player[pid])
                    if self.player[pid][type][ID]['count'] % 5 == 0 then
                        Server:AchieveSave(pid, type, ID, self.player[pid][type][ID]['count'])
                    end
                end
            end
            break
        end
    end
end

function Achieve:GetAccountReward(t)
    local type = t.type
    local achieve_id = t.achieve_id
    local pid = t.PlayerID
    if self[type][achieve_id].amount ~= self.player[pid][type][achieve_id].count then return end
    if self.player[pid][type][achieve_id].received then return end
    self.player[pid][type][achieve_id].received = true
    CustomNetTables:SetTableValue( "achieve", tostring(pid), self.player[pid])
    -- Give Reward
    -- Запись в бд
    Server:GetAccountReward(pid, type, achieve_id, self.player[pid][type][achieve_id].count, self[type][achieve_id].reward[1], self[type][achieve_id].reward[2])
    -- выдача награды в игре
    if self[type][achieve_id].reward[1] == "gold" then
        Shop:AddGold(pid, self[type][achieve_id].reward[2])
    end
    if self[type][achieve_id].reward[1] == "gems" then
        Shop:AddGems(pid, self[type][achieve_id].reward[2])
    end
end

function Achieve:SetTableHeroAchieve(PlayerID, hero_name, data)
    local get = CustomNetTables:GetTableValue( "hero_achieve", "hero_name" )
    if not get then get = {} end
    get[PlayerID] = data
    CustomNetTables:SetTableValue("hero_achieve", hero_name, get)
end

Achieve:init()