if inventory == nil then
	_G.inventory = class({})
end

function inventory:init()
	CustomGameEventManager:RegisterListener("get_hero_inventory", Dynamic_Wrap( inventory, 'get_hero_inventory' ))
	CustomGameEventManager:RegisterListener("update_hero_inventory", Dynamic_Wrap( inventory, 'update_hero_inventory' ))
	
	CustomGameEventManager:RegisterListener("get_items_upgrade", Dynamic_Wrap( inventory, 'get_items_upgrade' ))
	CustomGameEventManager:RegisterListener("try_items_upgrade", Dynamic_Wrap( inventory, 'try_items_upgrade' ))
	
	CustomGameEventManager:RegisterListener("get_trade_items", Dynamic_Wrap( inventory, 'get_trade_items' ))
	CustomGameEventManager:RegisterListener("buy_trade_items", Dynamic_Wrap( inventory, 'buy_trade_items' ))
	CustomGameEventManager:RegisterListener("get_inventory_for_sell", Dynamic_Wrap( inventory, 'get_inventory_for_sell' ))
	CustomGameEventManager:RegisterListener("sell_item", Dynamic_Wrap( inventory, 'sell_item' ))
	CustomGameEventManager:RegisterListener("get_order", Dynamic_Wrap( inventory, 'get_order' ))
	CustomGameEventManager:RegisterListener("close_order", Dynamic_Wrap( inventory, 'close_order' ))
	
	
	CustomNetTables:SetTableValue("set_attributes", "set_attributes", {
		desolator = 1, -- value * itemData.set_number +  boost_step[attrKey][itemData.set_number] * (itemData.level - 1)            --120
		magic_desolator = 1, -- 72
		reflect = 0.4, -- 36
		lifesteal = 0.4, -- 36
		magic_lifesteal = 0.5, -- 36
		mjolnir = 50, -- 62.4----------------
		mjolnir_armor = 50, -- 62.4----------------
		mkb = 75, -- 62.4----------------
		hp_regen = 0.1, -- 61.2----------------
		hp_regen_amp = 5, --120
		damage_block = 3, --96
		manacost = 1, --84
		crit = 5, --180
		multicast = 1, --72---------------------
		
		helm = 50,
		armor = 1,
		weapon = 10,
		pants = 3,
		boots = 1,
		shield = 0.5,
	})
	
	
	print("!-----------------")
	-- value + (itemData.set_number * 0.1 * itemData.level) - itemData.set_number * 0.1
	
	
	CustomNetTables:SetTableValue("boost_attributes", "boost_attributes", {
		desolator = {0.1, 0.2, 0.3, 0.4, 0.5},
		magic_desolator = {0.1, 0.2, 0.3, 0.4, 0.5},
		reflect = {0.1, 0.1, 0.1, 0.1, 0.1},
		lifesteal = {0.1, 0.1, 0.1, 0.1, 0.1},
		magic_lifesteal = {0.1, 0.1, 0.1, 0.1, 0.1},
		mjolnir = {5, 10, 15, 20, 25},
		mjolnir_armor = {5, 10, 15, 20, 25},
		mkb = {5, 10, 15, 20, 25},
		hp_regen = {0.1, 0.1, 0.1, 0.1, 0.1},
		hp_regen_amp = {0.5, 1.0, 1.5, 2.0, 2.5},
		damage_block = {0.1, 0.2, 0.3, 0.4, 0.5},
		manacost = {0.1, 0.1, 0.1, 0.1, 0.1},
		crit = {1, 2, 3, 4, 5},
		multicast = {0.1, 0.1, 0.1, 0.1, 0.1},
	})
	
end

function inventory:get_set_type(level)
	local set_type
	local set_number
	
	if level <= 4 then
		set_type = 'set_1'
		set_number = 1
	elseif level > 4 and level <= 8 then
		set_type = 'set_2'
		set_number = 2
	elseif level > 8 and level <= 12 then
		set_type = 'set_3'
		set_number = 3
	elseif level > 12 and level <= 16 then
		set_type = 'set_4'
		set_number = 4
	elseif level > 16 then
		set_type = 'set_5'
		set_number = 5
	end

	return set_type, set_number
end

-------------------------------------------------------

function inventory:CheckFullSet(data)
    local filledItems = 0
    local setType = nil
    for itemKey, itemData in pairs(data) do
        if itemData ~= nil then
            filledItems = filledItems + 1
            if setType == nil then
                setType = itemData.set_type
            elseif setType ~= itemData.set_type then
                return 1
            end
        end
    end
	if filledItems == 6 then 
		return 2
	else
		return 1
	end
end

can_use_sets = {
	[1] = {min=0},
	[2] = {min=4},
	[3] = {min=8},
	[4] = {min=12},
	[5] = {min=16},
}

function inventory:update_description(data, pid)
	local decription_attributes = CustomNetTables:GetTableValue("set_attributes", "set_attributes")
	local boost_attributes = CustomNetTables:GetTableValue("boost_attributes", "boost_attributes")
	local sid = PlayerResource:GetSteamAccountID(pid)
    local attributeSum = {}
    for itemKey, itemData in pairs(data) do
        if itemData ~= nil then
            for _, attributesKey in ipairs({"bonus_attribute", "base_attribute"}) do
                local attributes = itemData[attributesKey]
                
                for attrKey, _ in pairs(attributes) do
					
					if _G.Account_stats[sid].difficulty < can_use_sets[itemData.set_number].min + 1 then
						goto continue_inner_loop
					end
				
                    local value = decription_attributes[attrKey]

					if attributesKey == "base_attribute" then
						if attributeSum[attrKey] == nil then
							attributeSum[attrKey] = itemData.level * itemData.set_number * value
						end
					else
						if attributeSum[attrKey] == nil then
							-- attributeSum[attrKey] = value + (itemData.set_number * 0.1 * itemData.level) - itemData.set_number * 0.1
							attributeSum[attrKey] = value * itemData.set_number +  boost_attributes[attrKey][tostring(itemData.set_number)] * (itemData.level - 1) 
						else
							-- attributeSum[attrKey] = attributeSum[attrKey] + value + (itemData.set_number * 0.1 * itemData.level) - itemData.set_number * 0.1
							attributeSum[attrKey] = attributeSum[attrKey] + value * itemData.set_number +  boost_attributes[attrKey][tostring(itemData.set_number)] * (itemData.level - 1) 
						end
					end
					::continue_inner_loop::
                end
            end
        end
    end
    return attributeSum
end

function inventory:update_sets(pid, data)
	print("update set")
	new_data = inventory:update_description(data, pid)
	new_data['full_set'] = inventory:CheckFullSet(data)
	local hero = PlayerResource:GetSelectedHeroEntity(pid)
	if hero:HasModifier('modifier_sets') then			--- проблема с OnRefresh() поэтому так
		hero:RemoveModifierByName('modifier_sets')
			hero:AddNewModifier(hero, nil, "modifier_sets", new_data)
	else
		hero:AddNewModifier(hero, nil, "modifier_sets", new_data)
	end
end

-------------------------------------------------------

function inventory:roll_random_attributes_count(pid)
	local chances = {
		{min = 0, max = 1, reward = 4},		-- 1%
		{min = 1, max = 3, reward = 3},		-- 2%
		{min = 4, max = 8, reward = 2},		-- 4%
		{min = 9, max = 20, reward = 1},	-- 12%
		{min = 21, max = 101, reward = 0}	-- 80%
	}
	
	local end_roll = 100
	local hero = PlayerResource:GetSelectedHeroEntity(pid)
	local guild_mod = hero:FindModifierByName("modifier_guild")
	if guild_mod ~= nil then
		end_roll = end_roll - guild_mod.reward_4
	end
	
	local random_number = RandomInt(0, end_roll)
	local result = 0
	for _, range in ipairs(chances) do
		if random_number >= range.min and random_number < range.max then
			result = range.reward
			break
		end
	end
	return result
end

function inventory:selectUniqueRandomAttributes(count, attributes)
    local result = {}
    local tempAttributes = table.shuffle(table.shallowcopy(attributes))
    for i = 1, count do
		result[tempAttributes[i]] = 1
    end
    return result
end

function inventory:get_attribute_data(pid)
	local count = inventory:roll_random_attributes_count(pid)
	local attributes = {'desolator', 'magic_desolator', 'reflect', 'lifesteal', 'magic_lifesteal', 'mjolnir', 'mjolnir_armor', 'mkb', 'hp_regen', 'hp_regen_amp', 'damage_block', 'manacost', 'crit', 'multicast'}
	return inventory:selectUniqueRandomAttributes(count, attributes)
end


-- {
    -- "level": 6,
    -- "quality": 93,
    -- "set_name": "Bronze",
    -- "item_type": "pants",
    -- "item_rarity": "base",
    -- "luck_option": 1,
    -- "additional_level": 0,
    -- "excellent_bonuses": {
      -- "magic_desolator": 1
    -- }
 -- }


function inventory:roll_random_item(pid, unitname)
	if GameRules:IsCheatMode() and not IsInToolsMode() then return end
	
	local golden_unit_drops = {
        GoldenMiner = 'boots',
        GoldenQueen = 'armor',
        GoldenWyvern = 'shield',
        GoldenSea = 'helm',
        GoldenDragon = 'pants',
        GoldenForest = 'weapon'
    }
	
	local item_data = {}
	local set_name, set_number = inventory:get_set_type(_G.Game_Difficulty)
	local item = golden_unit_drops[unitname]
	item_data['item_type'] = item
	item_data['level'] = 1
	item_data['set_type'] = set_name
	item_data['bonus_attribute'] = inventory:get_attribute_data(pid)
	item_data['set_number'] = set_number
	item_data['base_attribute'] = { [item] = 1}
	inventory:add_new_item_in_inventory(pid, item_data)
end

function inventory:add_bless(pid)
	if GameRules:IsCheatMode() and not IsInToolsMode() then return end

	local playerIDs = {}
	for playerID = 0, DOTA_MAX_TEAM_PLAYERS - 1 do
		if PlayerResource:HasSelectedHero(playerID) and PlayerResource:GetTeam(playerID) == DOTA_TEAM_GOODGUYS then
			local connection = PlayerResource:GetConnectionState(playerID)
			if connection ~= DOTA_CONNECTION_STATE_ABANDONED then
				table.insert(playerIDs, playerID)
			end
		end
	end

	if #playerIDs > 0 then
		local randomIndex = RandomInt(1, #playerIDs)
		pid = playerIDs[randomIndex]
	end
	
	local random = RandomInt(0, 20000 - (_G.Game_Difficulty * 500))
	if random < 5 then
		local item_data = {}
		item_data['item_type'] = 'bless'
		item_data['level'] = 1
		item_data['set_type'] = 'jewell'
		item_data['bonus_attribute'] = {}
		item_data['set_number'] = 1
		item_data['base_attribute'] = {}
		inventory:add_new_item_in_inventory(pid, item_data)
	end
end

function inventory:add_soul(pid)
	if GameRules:IsCheatMode() and not IsInToolsMode() then return end

	local item_data = {}
	item_data['item_type'] = 'soul'
	item_data['level'] = _G.Game_Difficulty
	item_data['set_type'] = 'jewell'
	item_data['bonus_attribute'] = {}
	item_data['set_number'] = 1
	item_data['base_attribute'] = {}
	inventory:add_new_item_in_inventory(pid, item_data)
end

function inventory:roll_discount(pid)
    if GameRules:IsCheatMode() and not IsInToolsMode() then return end

    local discount_drop = {'boots', 'armor', 'shield', 'pants', 'helm', 'weapon'}
    
    local attributes = {'desolator', 'magic_desolator', 'reflect', 'lifesteal', 'magic_lifesteal', 'mjolnir', 'mjolnir_armor', 'mkb', 'hp_regen', 'hp_regen_amp', 'damage_block', 'manacost', 'crit', 'multicast'}
    
    local index = 1
    
    Timers:CreateTimer(0, function()
        if index > #discount_drop then
            return nil
        end

        local item = discount_drop[index]
        
        local item_data = {}
        item_data['item_type'] = item
        item_data['level'] = 1
        item_data['set_type'] = 'set_1'
        item_data['bonus_attribute'] = inventory:selectUniqueRandomAttributes(2, attributes)
        item_data['set_number'] = 1
        item_data['base_attribute'] = {[item] = 1}
        
        inventory:add_new_item_in_inventory(pid, item_data)
        
        index = index + 1
        return 0.3
    end)
end

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

function inventory:get_hero_inventory(t)
	local hero = PlayerResource:GetSelectedHeroEntity(t.PlayerID)
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
		hero_name = hero:GetUnitName()
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/dotamu/api_get_hero_inventory/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local data = json.decode(res.Body)
			CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(t.PlayerID), "UpdateInventoryMain", data)
		else
			CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(t.PlayerID), "UpdateInventoryMain", {})
		end
	end)
end

function inventory:update_hero_inventory(t)
	local hero = PlayerResource:GetSelectedHeroEntity(t.PlayerID)
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
		data = t.data,
		hero_name = hero:GetUnitName()
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/dotamu/api_update_hero_inventory/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local data = json.decode(res.Body)
			-- inventory:update_sets(t.PlayerID, data.hero_enquip)
			CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "UpdateInventoryMain", data)
		else
			print(res.StatusCode)
		end
	end)
end













function inventory:add_new_item_in_inventory(pid, data)
	arr = {
		sid = tostring(PlayerResource:GetSteamID(pid)),
		data = data
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "http://91.240.87.224/add_new_item_in_inventory/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(pid), "show_item_reward", data)
		else
			print(res.StatusCode)
		end
	end)
end

----------------------------------------------------------------------------------------

function inventory:get_items_upgrade(t)
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST","http://91.240.87.224/api_get_items_upgrade/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local data = json.decode(res.Body)
			CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "blacksmith_init", data)
		else
			print(res.StatusCode)
		end
	end)
end

function inventory:try_items_upgrade(t)
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
		data = t.data,
		number = t.number
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "http://91.240.87.224/api_try_item_upgrade/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local data = json.decode(res.Body)
			CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "blacksmith_update", data)
		else
			print(res.StatusCode, res.Body)
		end
	end)
end

-- ////////////////////////////////////////// TRADE //////////////////////////////

function inventory:get_trade_items(t)
	arr = {
		type = t.type
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "http://91.240.87.224/api_get_trade_items/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local data = json.decode(res.Body)
			CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "init_buy", {data=data, type=t.type})
		else
			print(res.StatusCode)
		end
	end)
end

function inventory:buy_trade_items(t)
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
		item_id = t.item_id,
		tab = t.tab
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "http://91.240.87.224/api_buy_trade_items/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local data = json.decode(res.Body)
			CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "update_buy", {data=data, type=t.tab})
		else
			print(res.StatusCode)
		end
	end)
end

function inventory:get_inventory_for_sell(t)
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "http://91.240.87.224/api_get_inventory_for_sell/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local data = json.decode(res.Body)
			CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "init_sell", data)
		else
			print(res.StatusCode)
		end
	end)
end

function inventory:sell_item(t)
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
		item = t.item,
		item_num = t.item_num,
		price = t.price
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "http://91.240.87.224/api_sell_item/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local data = json.decode(res.Body)
			CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "init_sell", data)
		else
			print(res.StatusCode)
		end
	end)
end

function inventory:get_order(t)
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "http://91.240.87.224/api_get_order/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local data = json.decode(res.Body)
			CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "init_order", data)
		else
			print(res.StatusCode)
		end
	end)
end

function inventory:close_order(t)
	arr = {
		sid = tostring(PlayerResource:GetSteamID(t.PlayerID)),
		item_id = t.item_id
	}
	arr = json.encode(arr)
	local req = CreateHTTPRequestScriptVM( "POST", "http://91.240.87.224/api_close_order/?key=".._G.key )
	req:SetHTTPRequestGetOrPostParameter('arr',arr)
	req:SetHTTPRequestAbsoluteTimeoutMS(100000)
	req:Send(function(res)
		if res.StatusCode == 200 and res.Body ~= nil then
			local data = json.decode(res.Body)
			CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(t.PlayerID), "update_order", data)
		else
			print(res.StatusCode)
		end
	end)
end

inventory:init()