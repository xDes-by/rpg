if BP == nil then
    _G.BP = class({})
end

function BP:init()
    CustomGameEventManager:RegisterListener("GetAllReward",function(_, keys)
        self:GetAllReward(keys)
    end)
    CustomGameEventManager:RegisterListener("GetReward",function(_, keys)
        self:GetReward(keys)
    end)
    CustomGameEventManager:RegisterListener("bp_start_lua",function(_, keys)
        Shop:bp_start_lua(keys)
    end)
    self.player = {}
    self.reward = {
        base = BPBaseRewardList,
        gold = BPGoldRewardList,
        days = BPMonthRewardList
    }
    self.ExpToLevelUp = BPExp
    CustomNetTables:SetTableValue('battlepass', "reward", self.reward)
    CustomNetTables:SetTableValue('battlepass', "ExpToLevelUp", self.ExpToLevelUp)
end

function BP:AddPlayer(sid, obj)
    self.player[sid] = {}
    self.player[sid].level = obj.level
    self.player[sid].exp = obj.exp
    self.player[sid].available = obj.bp_rewards
    self.player[sid].day = obj.day
    self.player[sid].premium = obj.premium
    self.player[sid].AddLevel = 0
    CustomNetTables:SetTableValue('battlepass', tostring(sid), self.player[sid])
end

-- function BP:bp_start_lua(t)
--     CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer( t.PlayerID ), "bp_start_js", BP.reward )
--     CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer( t.PlayerID ), "bp_available_js", {
--         level = BP.Level[t.PlayerID],
--         exp = BP.exp[t.PlayerID],
--         available = BP.available[t.PlayerID],
--         premium = BP.premium[t.PlayerID],
--         day = BP.day[t.PlayerID],
--     })
-- end

function BP:BuyExp(pid, add)
    self:AddExp(pid, add)
    Server:BPSave(pid, self.player[pid].exp, self.player[pid].AddLevel)
    self.player[pid].AddLevel = 0
end

function BP:AddExp(id, add)
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
    self.player[id]['exp'] = exp[2]
    for i=1, LevelAdd do
        local nextLevel = self.player[id]['level'] + 1
        self.player[id]['level'] = nextLevel
        self.player[id].available['base'][tostring(nextLevel)] = true
        self.player[id].available['gold'][tostring(nextLevel)] = {true, true}
    end
    
    -- до сих пор не ебу
    self.player[id].AddLevel = self.player[id].AddLevel + LevelAdd
    CustomNetTables:SetTableValue('battlepass', tostring(id), self.player[id])
end

function BP:GetReward(t)
    if not BP.player[t.PlayerID].available[t.type][tostring(t.number)] then print("return") return end
    BP.player[t.PlayerID].available[t.type][tostring(t.number)] = false
    local reward
    if t.type == "gold" then
        reward = BP.reward[t.type][t.number][t.layer]
    end
    if t.type == "base" then
        reward = BP.reward[t.type][t.number]
    end
    if t.type == "day" then
        reward = BP.reward[t.type][t.number]
    end
    CustomNetTables:SetTableValue('battlepass', tostring(t.PlayerID), self.player[t.PlayerID])
    Server:GetReward(t.PlayerID, t.type, t.number, t.layer)
end

function BP:GetAllReward(t)
    for i = 1, self.player[t.PlayerID].level do
        self.player[t.PlayerID].available['base'][tostring(i)] = false
        if self.player[t.PlayerID].premium then
            self.player[t.PlayerID].available['gold'][tostring(i)][1] = false
            self.player[t.PlayerID].available['gold'][tostring(i)][2] = false
        end
    end
    CustomNetTables:SetTableValue('battlepass', tostring(t.PlayerID), self.player[t.PlayerID])
    Server:GetAllReward(t.PlayerID)
end

function BP:TaikReward(t)
    



    if reward.info.type == 'chest' then
        t.add = reward.info.add or 1
        t.type = reward.info.type
        t.number = reward.info.number
        Shop:Give(t)
    end
end
function BP:bp_taik_lua(t)
    BP:TaikReward(t)
end
function BP:bp_taik_all_lua(t)
    for i = 1, BP.Level[t.PlayerID] do
        BP:TaikReward({PlayerID = t.PlayerID, number = i, type = 'base'})
        BP:TaikReward({PlayerID = t.PlayerID, number = i, type = 'gold'})
    end
end

function BP:GiveLevel(t)
    BP.Level[t.PlayerID] = BP.Level[t.PlayerID] + t.add

    CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer( t.PlayerID ), "bp_available_js", {
        level = BP.Level[t.PlayerID],
        exp = BP.exp[t.PlayerID],
        available = BP.available[t.PlayerID],
        premium = BP.premium[t.PlayerID],
    })
end

function BP:GivePremium(t)
    BP.premium[t.PlayerID] = true
    CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer( t.PlayerID ), "bp_available_js", {
        level = BP.Level[t.PlayerID],
        exp = BP.exp[t.PlayerID],
        available = BP.available[t.PlayerID],
        premium = BP.premium[t.PlayerID],
    })
end

BP:init()