if Rating == nil then
    _G.Rating = class({})
end


function Rating:Init()
    CustomGameEventManager:RegisterListener("RatingInitLua", function(_, keys)
        Rating:InitJs(keys)
    end)
    self.player = {}
    self.top = RatingTop
    self.time = RatingTime
end

function Rating:AddPlayer(id, data)
    self.player[id] = {
        sid = data["sid"],
        rating = data["rating"],
        games = data["game_amount"],
        reputation = data["like"] - data["dislike"],
        top = 0, -- доработать
        wr = data["win_amount"] + data["lose_amount"] / 100 * data["win_amount"],
        heroname = "", -- доработать
        last_game = data["last_game"],
    }
end

function Rating:UpdateHeroName(id, heroname)
    self.player[id].heroname = heroname
    CustomNetTables:SetTableValue('rating', tostring(id), Rating.player[id])
end




function Rating:InitJs(t)
    CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(t.PlayerID), "RatingInitJs", {
        top = Rating.top,
        time = Rating.time,
        team = Rating.team,
    })
end

Rating:Init()