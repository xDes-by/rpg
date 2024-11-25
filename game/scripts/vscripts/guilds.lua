if guilds == nil then
    _G.guilds = class({})
end


function guilds:init()
	CustomGameEventManager:RegisterListener("get_game_guilds", Dynamic_Wrap( self, 'get_game_guilds' ))
	CustomGameEventManager:RegisterListener("create_game_guild", Dynamic_Wrap( self, 'create_game_guild'))
	CustomGameEventManager:RegisterListener("add_member", Dynamic_Wrap( self, 'add_member' ))
	CustomGameEventManager:RegisterListener("apply_to_member", Dynamic_Wrap( self, 'apply_to_member' ))
	CustomGameEventManager:RegisterListener("leave_guild", Dynamic_Wrap( self, 'leave_guild' ))
	CustomGameEventManager:RegisterListener("remove_member", Dynamic_Wrap( self, 'remove_member' ))
	CustomGameEventManager:RegisterListener("buy_slot", Dynamic_Wrap( self, 'buy_slot' ))
	CustomGameEventManager:RegisterListener("approve_member", Dynamic_Wrap( self, 'approve_member' ))
	CustomGameEventManager:RegisterListener("reject_member", Dynamic_Wrap( self, 'reject_member' ))
	CustomGameEventManager:RegisterListener("reject_all", Dynamic_Wrap( self, 'reject_all' ))
	
	
	
	
	
	
	
	
	
	
	


	CustomGameEventManager:RegisterListener("add_reward_point", Dynamic_Wrap( self, 'add_reward_point' ))
	CustomGameEventManager:RegisterListener("send_message", Dynamic_Wrap( self, 'send_message' ))
	CustomGameEventManager:RegisterListener("update_chat_message", Dynamic_Wrap( self, 'update_chat_message' ))
	CustomGameEventManager:RegisterListener("buy_permanent_reward", Dynamic_Wrap( self, 'buy_permanent_reward' ))
	CustomGameEventManager:RegisterListener("reset_guild", Dynamic_Wrap( self, 'reset_guild' ))
end

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

function guilds:get_game_guilds(t)
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/sqw/api_guilds_get_data/?key=".._G.key)
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local data = json.decode(res.Body)
			CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "guild_init", data)
		else
			print(res.StatusCode)
		end
	end)
end

function guilds:create_game_guild(t)
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
		guild_name = t.name,
		guild_image = t.image,
		guild_description = t.description,
		toggle = t.toggle
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/sqw/api_guilds_create_guild/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local data = json.decode(res.Body)
			print(res.Body)
			CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(t.PlayerID), "guild_init", data)
		else
			print(res.StatusCode)
		end
	end)
end

function guilds:add_member(t)
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
		guild_id = t.guild_id
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/sqw/api_guilds_add_member/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local data = json.decode(res.Body)
			CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(t.PlayerID), "guild_init", data)
		else
			print(res.StatusCode)
		end
	end)
end

function guilds:apply_to_member(t)
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
		guild_id = t.guild_id
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/sqw/api_guilds_apply_to_member/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local data = json.decode(res.Body)
			CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(t.PlayerID), "guild_init", data)
		else
			print(res.StatusCode)
		end
	end)
end

function guilds:leave_guild(t)
	arr = {sid = t.sid}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/sqw/api_guilds_leave_guild/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local data = json.decode(res.Body)
			CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(t.PlayerID), "guild_init", data)
		else
			print(res.StatusCode)
		end
	end)
end


function guilds:remove_member(t)
	arr = {sid = t.sid}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/sqw/api_guilds_remove_member/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local data = json.decode(res.Body)
			CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(t.PlayerID), "guild_init", data)
		else
			print(res.StatusCode)
		end
	end)
end

function guilds:buy_slot(t)
    -- if Shop.pShop[t.PlayerID].coins >= 20 then
        -- Shop.pShop[t.PlayerID].coins = Shop.pShop[t.PlayerID].coins - 20
        local arr = {
            sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
        }
        arr = json.encode(arr)
        
        local req = CreateHTTPRequestScriptVM("POST", "https://custom-dota.ru/sqw/api_buy_slot/?key=".._G.key)
        req:SetHTTPRequestGetOrPostParameter('arr', arr)
        req:SetHTTPRequestAbsoluteTimeoutMS(100000)
        
        req:Send(function(res)
            if res.StatusCode == 200 and res.Body ~= nil then
                local data = json.decode(res.Body)
                CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(t.PlayerID), "guild_init", data)
                CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(t.PlayerID), "sound_events", {sound = 'General.Buy'})
            else
                print(res.StatusCode)
            end
        end)
    -- end
end

function guilds:approve_member(t)
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
		guild_id = t.guild_id,
		user_id = t.sid,
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/sqw/api_guilds_approve_member/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		local data = json.decode(res.Body)
		
		if res.StatusCode == 200 and res.Body ~= nil then
			CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(t.PlayerID), "update_request_list", data)
		else
			print(res.StatusCode)
		end
	end)
end

function guilds:reject_member(t)
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
		guild_id = t.guild_id,
		user_id = t.sid,
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/sqw/api_guilds_reject_member/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		local data = json.decode(res.Body)
		
		if res.StatusCode == 200 and res.Body ~= nil then
			CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(t.PlayerID), "update_request_list", data)
		else
			print(res.StatusCode)
		end
	end)
end

function guilds:reject_all(t)
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
		guild_id = t.guild_id,
		user_id = t.sid,
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/sqw/api_guilds_reject_all/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		local data = json.decode(res.Body)
		if res.StatusCode == 200 and res.Body ~= nil then
			CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(t.PlayerID), "update_request_list", data)
		else
			print(res.StatusCode)
		end
	end)
end




































-- /////////////////////////////////////////////////////////////////////////////////

function guilds:add_reward_point(t)
	-- print("CALL ADD POINTS")
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
		reward = t.reward_id
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/api_guilds_add_reward_point/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			-- print("GUILD POINT ADDED")
			print(res.Body)
			-- print("GUILD POINT ADDED")
			CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "point_feedback", {})
		else
			-- print("ERROR GUILD POINT ADDED")
			print(res.StatusCode)
			-- print("ERROR GUILD POINT ADDED")
		end
	end)
end

function guilds:add_guild_exp(pid, experience)
	-- print("CALL ADD EXP")
	arr = {
		sid = tostring(PlayerResource:GetSteamID(pid)),
		exp = experience
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/api_guilds_add_guild_exp/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			print(res.Body)
		else
			print(res.StatusCode)
		end
	end)
end

function guilds:buy_permanent_reward(t)
	-- print("BUY REWARD")
	local sid = PlayerResource:GetSteamAccountID(t.PlayerID)
		if tonumber(Shop.pShop[sid].coins) >= 25 then
			Shop.pShop[sid].coins = Shop.pShop[sid].coins - 25
		arr = {
			sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
			permanent_reward = t.reward_name
		}
		arr = json.encode(arr)
		local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/api_buy_permanent_reward/?key=".._G.key )
		req:SetHTTPRequestGetOrPostParameter('arr',arr)
		req:SetHTTPRequestAbsoluteTimeoutMS(100000)
		req:Send(function(res)
			if res.StatusCode == 200 and res.Body ~= nil then
				-- print("BUY REWARD ADDED")
				print(res.Body)
				-- print("BUY REWARD ADDED")
				CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "update", {})
				CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "updatecoins", {Shop.pShop[sid].coins} )
			else
				-- print("ERROR BUY REWARD")
				print(res.StatusCode)
				-- print("ERROR BUY REWARD")
			end
		end)
	else
		print("xyi")
	end
end



function guilds:reset_guild(t)
	local sid = PlayerResource:GetSteamAccountID(t.PlayerID)
	if tonumber(Shop.pShop[sid].coins) >= 50 then
		Shop.pShop[sid].coins = Shop.pShop[sid].coins - 50
		arr = {
			sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
		}
		arr = json.encode(arr)
		local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/api_reset_guild/?key=".._G.key )
		req:SetHTTPRequestGetOrPostParameter('arr',arr)
		req:SetHTTPRequestAbsoluteTimeoutMS(100000)
		req:Send(function(res)
			if res.StatusCode == 200 and res.Body ~= nil then
				print(res.Body)
				CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "update", {})
				CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "updatecoins", {Shop.pShop[sid].coins} )
			else
				print(res.StatusCode)
			end
		end)
	else
		print("xyi")
	end
end
-- /////////////////////////////////////////////////////////////////////////////////





function guilds:get_start_game_guilds(pid)
	arr = {tostring(PlayerResource:GetSteamID(pid))}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "GET", "https://custom-dota.ru/api_guilds_game3/")
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local guild = json.decode(res.Body)
			if guild.has_guild == true then
				guilds:update_modifiers(true, guild, pid, true)
			else
				guilds:update_modifiers(false, guild, pid, true)
			end
		else
			print(res.StatusCode)
		end
	end)
end


function guilds:send_message(t)
	-- print("SEND GUILD MESSAGE")
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
		text = t.text,
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/api_guilds_add_message/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			-- print("SEND GUILD MESSAGE OK")
			print(res.Body)
			local chat = json.decode(res.Body)
			print(chat)
			CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "update_chat", chat)
			-- print("SEND GUILD MESSAGE OK")
		else
			-- print("ERROR SEND GUILD MESSAGE")
			print(res.StatusCode)
			-- print("ERROR SEND GUILD MESSAGE")
		end
	end)
end


function guilds:update_chat_message(t)
	-- print("UPDATE GUILD MESSAGE")
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/api_guilds_update_chat_message/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			-- print("UPDATE GUILD MESSAGE OK")
			local chat = json.decode(res.Body)
			CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "update_chat", chat)
			-- print("UPDATE GUILD MESSAGE OK")
		else
			-- print("ERROR UPDATE GUILD MESSAGE")
			print(res.StatusCode)
			-- print("ERROR UPDATE GUILD MESSAGE")
		end
	end)
end

-- /////////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////// MODIFIERS ////////////////////////////////////
-- /////////////////////////////////////////////////////////////////////////////////

function guilds:update_modifiers(status, data, pid, first_spawn)
	local hero = PlayerResource:GetSelectedHeroEntity( pid )
	-- table.print(data)
	-- if hero then
		if status == true then
			local newData = {
				["reward_1"] = data["rewards"]["reward_1"],
				["reward_2"] = data["rewards"]["reward_2"],
				["reward_3"] = data["rewards"]["reward_3"],
				["reward_4"] = data["rewards"]["reward_4"],
				["reward_5"] = data["rewards"]["reward_5"],
				["reward_6"] = data["rewards"]["reward_6"],
				["perm_reward_1"] = data["perm_reward_1"],
				["perm_reward_2"] = data["perm_reward_2"],
			}
			local mod = hero:AddNewModifier(hero, nil, "modifier_guild", newData )
			if first_spawn and mod then
				mod:Spawn_bonus()
			end
		else
			if hero:HasModifier("modifier_guild") then
				hero:RemoveModifierByName("modifier_guild")
			end
		end
	-- end
end

guilds:init()

