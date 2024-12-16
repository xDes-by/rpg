if drop == nil then
	_G.drop = class({})
end

function drop:init()
	ListenToGameEvent('entity_killed', Dynamic_Wrap(drop, 'OnEntityKilled'), self)
	_G.drop_table = {}
end

function drop:OnEntityKilled(keys)
	local killedUnit = EntIndexToHScript(keys.entindex_killed)
	local killer = EntIndexToHScript(keys.entindex_attacker)
	if killedUnit and not killedUnit:IsRealHero() then
		drop:drop_item(killedUnit, killer)
	end
end

function drop:drop_item(target, killer)
	local unit_name = target:GetUnitName() 
    for location, unit in pairs(_G.units_data) do
        if unit[unit_name] and unit[unit_name].drop then
            local roll = RandomInt(1, 100)
			local drop_type = get_drop_type(unit[unit_name].chances, roll)

			if drop_type == 'no_drop' then
				return
			end

			local creep_drop_table = unit[unit_name].drop[drop_type]

            local random_index = RandomInt(1, #creep_drop_table)
			-- print(random_index)
			local drop = creep_drop_table[random_index]

			-- table.print(drop)

			if unit[unit_name].duration then
				
				data, item_name = create_drop_data(drop)
	
				local spawnPoint = target:GetAbsOrigin()	
				local newItem = CreateItem(item_name, nil, nil)
				local itemDrop = CreateItemOnPositionForLaunch(spawnPoint, newItem)
				local dropRadius = RandomInt(50, 100)

				if data.item_class == 'jewel' then
					killer:EmitSound("Item.DropGemWorld")
				end

				local index = itemDrop:entindex()
				local index2 = newItem:entindex()

				print("--------------TEST------------")				
				
				_G.drop_table[index] = data -- альтернатива, пишем в таблицу а ее в неттейблах все время меняем, подняли предмет, вышло время и т.д.

				CustomNetTables:SetTableValue("drop", tostring(index), data) -- пока не понятно нормально ли использовать при большом кол-ве дропа
				CustomNetTables:SetTableValue("drop_take", tostring(index2), data) -- пока не понятно нормально ли использовать при большом кол-ве дропа
					
				print("--------------TEST------------")	

				newItem:LaunchLootInitialHeight(false, 0, 150, 0.5, spawnPoint + RandomVector(dropRadius))

			
				newItem:SetContextThink("kill_loot", function() return kill_loot(newItem, itemDrop) end, unit[unit_name].duration)
			end
		end
    end
end

function get_drop_type(chances, roll)
	roll = 99
	local cumulativeChance = 0
    for _, chanceData in ipairs(chances) do
        cumulativeChance = cumulativeChance + chanceData.chance
        if roll <= cumulativeChance then
            return chanceData.type
        end
    end
end

function kill_loot(item, drop)
	if drop:IsNull() then
		return
	end

	local nFXIndex = ParticleManager:CreateParticle("particles/items2_fx/veil_of_discord.vpcf", PATTACH_CUSTOMORIGIN, drop)
	ParticleManager:SetParticleControl(nFXIndex, 0, drop:GetOrigin())
	ParticleManager:SetParticleControl(nFXIndex, 1, Vector(35, 35, 25))
	ParticleManager:ReleaseParticleIndex(nFXIndex)

	UTIL_Remove(item)
	UTIL_Remove(drop)
end

function create_drop_data(drop)
	data = {}
	if drop.item_class == 'zen' then
		local zen_count = RandomInt(drop.zen_min, drop.zen_max)
		data.level = zen_count
		data.item_class = 'zen'
		item_name = 'item_zen'
	elseif drop.item_class == 'jewel' then
		data.level = 1
		data.item_class = 'jewel'
		data.item_type = drop.item_type
		item_name = 'item_'..drop.item_type
	else
		data.level = drop.level
		data.quality = math.min(RandomInt(50, 100), 100) --возможно какой-то бонус к качеству дропа
		data.item_class = 'item'
		data.set_name = drop.set_name
		data.item_type = drop.item_type
		data.item_rarity = data.item_rarity
		data.luck_option = drop.luck_chance < RandomInt(1, 100) and 1 or 0
		data.additional_level = 0
		data.excellent_bonuses = drop.item_rarity == 'excellent' and get_excellent_data() or {}
		item_name = 'item_set_item'
	end
	return data, item_name
end

function get_excellent_data()
	data = {}
	-- TODO: наполнить логикой excellennt
	return data
end

drop:init()

