item_take = item_take or class({})
item_set_item = item_take or class({})
item_zen = item_take or class({})
item_bless = item_take or class({})
item_soul = item_take or class({})

function item_take:GetBehavior()
    return DOTA_ABILITY_BEHAVIOR_IMMEDIATE
end

function item_take:OnSpellStart()
    if IsServer() then
        local index = self:entindex()
        local caster = self:GetCaster()
        local pid = caster:GetPlayerID()
        local sid = tostring(PlayerResource:GetSteamID(pid))
        local data = CustomNetTables:GetTableValue("drop_take", tostring(index))

        local player_data = _G.players_data[sid]

        -- Обработка различных типов предметов
        if self:GetName() == "item_zen" then
            player_data.stats.zen = (player_data.stats.zen or 0) + (data.level or 0)

        elseif self:GetName() == "item_bless" or self:GetName() == "item_soul" then
            local jewel_slot = find_jewel(player_data, data)
            if jewel_slot then
                player_data.stats.user_inventory[tostring(jewel_slot)].level = player_data.stats.user_inventory[tostring(jewel_slot)].level + 1
            else
                local empty_slot = find_slot(player_data)
                if empty_slot then
                    add_item(player_data, empty_slot, data)
                else
                    re_drop(data)
                end
            end

        else
            local empty_slot = find_slot(player_data)
            if empty_slot then
                add_item(player_data, empty_slot, data)
            else
                re_drop(data)
            end
        end

        -- Отправляем обновленные данные на сервер
        web:enqueue_request({
            pid = pid,
            sid = sid,
            hero_name = caster:GetUnitName(),
            data = player_data
        }, function(response)
            if response then
                _G.players_data[sid] = response
            end
        end, false)

        UTIL_Remove(self) -- Удаляем предмет
    end
end

-- Логика повторного дропа
function re_drop(data)
    -- TODO: Добавить логику для повторного дропа предмета
end

-- Добавление предмета в инвентарь
function add_item(player_data, slot, data)
    player_data.stats.user_inventory[slot] = data
end

-- Поиск первого свободного слота
function find_slot(player_data)
    for i = 1, 70 do
        if not player_data.stats.user_inventory[tostring(i)] then
            return tostring(i)
        end
    end
    return nil
end

-- Поиск соответствующего камня (jewel)
function find_jewel(player_data, data)
    for key, value in pairs(player_data.stats.user_inventory) do
        if value.item_class == "jewel" and value.item_type == data.item_type then
            return key
        end
    end
    return nil
end
