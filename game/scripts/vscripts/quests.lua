if not quests then
	quests = class({})
end

_G.players_quest_progress = {}

_G.quest_data = {
	['lorencia'] = {
		[1] = {type = 'kill', target = 'npc_custom_creep_1', goal = 5, rewards = {gold = 500, exp = 1000}},
		[2] = {type = 'bring', target = 'npc_custom_creep_1', goal = 1, rewards = {gold = 50110, exp = 100110}},
		[3] = {type = 'find', target = 'npc_custom_creep_1', goal = 50, rewards = {gold = 500, exp = 1000}},
		[4] = {type = 'use', target = 'npc_custom_creep_1', goal = 50, rewards = {gold = 500, exp = 1000}},
		[5] = {type = 'research', target = 'npc_custom_creep_1', goal = 50, rewards = {gold = 500, exp = 1000}},
	},
	['noria'] = {
		[1] = {type = 'kill', target = 'npc_custom_creep_1', goal = 51, rewards = {gold = 500, exp = 1000}},
		[2] = {type = 'bring', target = 'npc_custom_creep_1', goal = 50, rewards = {gold = 500, exp = 1000}},
		[3] = {type = 'find', target = 'npc_custom_creep_1', goal = 50, rewards = {gold = 500, exp = 1000}},
		[4] = {type = 'use', target = 'npc_custom_creep_1', goal = 50, rewards = {gold = 500, exp = 1000}},
		[5] = {type = 'research', target = 'npc_custom_creep_1', goal = 50, rewards = {gold = 500, exp = 1000}},
	},
	['devias'] = {
		[1] = {type = 'kill', target = 'npc_custom_creep_1', goal = 52, rewards = {gold = 500, exp = 1000}},
		[2] = {type = 'bring', target = 'npc_custom_creep_1', goal = 50, rewards = {gold = 500, exp = 1000}},
		[3] = {type = 'find', target = 'npc_custom_creep_1', goal = 50, rewards = {gold = 500, exp = 1000}},
		[4] = {type = 'use', target = 'npc_custom_creep_1', goal = 50, rewards = {gold = 500, exp = 1000}},
		[5] = {type = 'research', target = 'npc_custom_creep_1', goal = 50, rewards = {gold = 500, exp = 1000}},
	},
}

function quests:Init()
	ListenToGameEvent("entity_killed", Dynamic_Wrap(self, 'OnEntityKilled'), self)
end

function quests:OnEntityKilled(data)
    local killed_unit = EntIndexToHScript(data.entindex_killed)
    local killer = EntIndexToHScript(data.entindex_attacker)
	local killed_unit_name = killed_unit:GetUnitName()

	for playerId, progress in pairs(_G.players_quest_progress) do
		for location, locProgress in pairs(progress) do
			local currentQuestId = locProgress.current_quest
			local currentQuest = _G.quest_data[location][currentQuestId]

			if currentQuest and currentQuest.type == 'kill' and currentQuest.target == killed_unit_name then
				locProgress.kill_count = (locProgress.kill_count or 0) + 1

				print("Player " .. playerId .. " убил " .. locProgress.kill_count .. "/" .. currentQuest.goal .. " " .. killed_unit_name)

				if locProgress.kill_count >= currentQuest.goal then
					quests:CompleteQuest(playerId, location)
				end
			end
		end
	end
end


function quests:GetCurrentQuest(playerId, location) -- получение текущего квеста
	local progress = _G.players_quest_progress[playerId][location]
	return _G.quest_data[location][progress.current_quest]
end


function quests:StartQuest(playerId, location) -- начало квеста 
	if not _G.players_quest_progress[playerId] then
		_G.players_quest_progress[playerId] = {}
	end
	
	if _G.players_quest_progress[playerId][location] == nil then 
		_G.players_quest_progress[playerId][location] = {current_quest = 1, completed = {}, kill_count = 0}
		progress = _G.players_quest_progress[playerId][location]
	end
	-- если все квесты завершены
	if progress.current_quest > #_G.quest_data[location] then
		print("Все квесты в " .. location .. " завершены.")
		return nil
	end

	local quest = quests:GetCurrentQuest(playerId, location)
	print("Выдан квест: " .. quest.type .. " " .. quest.target .. " ( Цель: " .. quest.goal .. ")")
	return quest
end


function quests:CompleteQuest(playerId, location)-- завершение квеста
	local progress = _G.players_quest_progress[playerId][location]
	local quest = quests:GetCurrentQuest(playerId, location)

	table.insert(progress.completed, quest)
	progress.current_quest = progress.current_quest + 1
	progress.kill_count = 0  -- сбросить счётчик убийств для следующего квеста

	print("Квест завершен: " .. quest.type .. " " .. quest.target)
	print("Выдано золота: " .. quest.rewards.gold)
	print("Выдано опыта: " .. quest.rewards.exp)
end

quests:Init()
