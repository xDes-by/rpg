function MapLogic:map_cave_3()
    GameRules:GetGameModeEntity():SetFogOfWarDisabled(false)
    self.Cave3CampPoints = Entities:FindAllByName("Cave1CampPoints")
    for num,ent in ipairs(self.Cave3CampPoints) do
        self.Cave3CampPoints[num] = ent:GetAbsOrigin()
        UTIL_Remove(ent)
    end
    self.Cave3AllUnits = {}
    local UnitNames = {"npc_cave3_mele_spider","npc_cave3_range_spider","npc_cave3_creep_range","npc_cave3_creep_mele"}
    for _,point in ipairs(self.Cave3CampPoints) do
        for _,name in ipairs(UnitNames) do
            local unit = CreateUnitByName(name, point, true, nil, nil, DOTA_TEAM_BADGUYS )
            table.insert( self.Cave3AllUnits, unit )
        end
    end
    self.Listeners[1] = ListenToGameEvent("entity_killed", Dynamic_Wrap( self, 'OnEntityKilledCave3' ), self )
    self.Cave3BonusDropChanse = 1
    self.Cave3DropedItemNames = {"item_cave3_item1","item_cave3_item2","item_cave3_item3"}
    self.Cave3NubersDropedItem = 0
    self.ItemsDrodedHandels = {}
    self.Cave3ZoneEnd = false
end

function MapLogic:OnEntityKilledCave3(data)
    local killedUnit = EntIndexToHScript( data.entindex_killed )
    if self.Cave3NubersDropedItem == 3 then 
        return
    end
    if RandomFloat(1,100) <= self.Cave3BonusDropChanse then
        self.Cave3BonusDropChanse = 10
        
        local item = CreateItem( self.Cave3DropedItemNames[RandomInt(1,3)], nil, nil )
        table.insert( self.ItemsDrodedHandels, item )
        CreateItemOnPositionSync(killedUnit:GetAbsOrigin(), item)
        self.Cave3NubersDropedItem = self.Cave3NubersDropedItem + 1
        if self.Cave3NubersDropedItem == 3 then
            for _,unit in ipairs(self.Cave3AllUnits) do
                UTIL_Remove(unit)
            end
            for _,item in ipairs(self.ItemsDrodedHandels) do
                UTIL_Remove(item)
            end
            self.Cave3ZoneEnd = true
            Timers:CreateTimer(3, function()
                self:TPHome()
            end)
        end
    else
        self.Cave3BonusDropChanse = self.Cave3BonusDropChanse + 1
    end
end