if Quest == nil then
    _G.Quest = class({})
end

function Quest:init()
    self.task_list = QuestList
    self.map = nil          -- Название карты (string)
    self.tasks = nil        -- Массив с заданими карты
    self.number = nil       -- Номер задания на карте
    self.net = nil          -- NetTable
    ListenToGameEvent("player_chat", Dynamic_Wrap( self, "OnChat" ), self )
end

function Quest:OnChat(t)
    text = t.text
    if text == 'q1' then
       Quest:MapActivate('forest_2')
	 -- EmitGlobalSound("underdraft_levelup_2")
    elseif text == 'q2' then
       Quest:UpdateCounter(self.map, self.number)
    end
end

function Quest:MapActivate(map_name)
    self.map = map_name
    self.tasks = self.task_list[map_name]
    self.number = 0
    Quest:NextTask(map_name)
end

function Quest:NextTask(map_name)
	EmitGlobalSound("Conquest.capture_point_timer.Generic")
    -- Если не послейдний квест на локации
    if self.tasks[self.number + 1] then	
        self.number = self.number + 1
		
		if self.number == 2 then
			Events:spawn_boss(map_name)
		end
		
        self.net = {
            short  = self.tasks[self.number]['short'],
            full   = self.tasks[self.number]['full'],
            lore   = self.tasks[self.number]['lore'],
            goal   = self.tasks[self.number]['amount'],
            now    = 0,
        }
        CustomNetTables:SetTableValue( "info", "quest", Quest.net)
        return
    end
    
    -- Если больше нет квестов на локации
    self.number = 0
    self.net = {
        short  = "Нет задания",
        full   = "На этой локации больше нет заданий, активируйте следующую для получения новых заданий",
        lore   = "",
        goal   = 0,
        now    = 0,
    }
    CustomNetTables:SetTableValue( "info", "quest", Quest.net)
	
	Events:MoveToZone("center_village")
	Events.round_process = false
end

function Quest:UpdateCounter(map_name, number)
    if self.map ~= map_name or self.number ~= number then return end    -- Проверка на совместимость
    self.net['now'] = self.net['now'] + 1
    if self.net['now'] == self.net['goal'] then
		EmitGlobalSound("Tutorial.Quest.complete_01")
        Quest:GiveAward()
        Quest:NextTask(map_name)
        return
    end
    CustomNetTables:SetTableValue( "info", "quest", Quest.net)
end

function Quest:GiveAward()
    print('Give Quest Award Function map:', self.map, " task: ", self.number)
end

Quest:init()
