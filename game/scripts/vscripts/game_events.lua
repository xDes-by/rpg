if game_events == nil then
	game_events = class({})
end

function game_events:Init()
	GameRules:GetGameModeEntity():SetModifyExperienceFilter(Dynamic_Wrap(self, "ExpFilter"), self)
	
	
	
	CustomGameEventManager:RegisterListener("pick_show_hero", Dynamic_Wrap( self, 'pick_show_hero'))
	CustomGameEventManager:RegisterListener("pick_hero", Dynamic_Wrap( self, 'pick_hero'))
	
	
	

	
	CustomNetTables:SetTableValue("heroes_base_stats", "heroes_base_stats", {
		["npc_dota_hero_dragon_knight"] = {
			str = 28, agi = 20, vit = 25, eng = 10, hp = 110, mp = 20, hp_per_level = 2, mp_per_level = 0.5, hp_per_vit = 3, mp_per_eng = 0.5, damage = 0, speed = 0, armor = 0, movespeed = 300, poison = 100, fire = 100, ice = 100},
		["npc_dota_hero_drow_ranger"] = {
			str = 20, agi = 30, vit = 20, eng = 10, hp = 80, mp = 30, hp_per_level = 1, mp_per_level = 1, hp_per_vit = 2, mp_per_eng = 1, damage = 0, speed = 0, armor = 0, movespeed = 300, poison = 100, fire = 100, ice = 100},
		["npc_dota_hero_death_prophet"] = {
			str = 18, agi = 18, vit = 15, eng = 30, hp = 60, mp = 60, hp_per_level = 1, mp_per_level = 2, hp_per_vit = 1, mp_per_eng = 2, damage = 0, speed = 0, armor = 0, movespeed = 300, poison = 100, fire = 100, ice = 100},
		
		["npc_dota_hero_juggernaut"] = {str = 28, agi = 20, vit = 25, eng = 10, hp = 110, mp = 20, hp_per_level = 2, mp_per_level = 0.5, hp_per_vit = 3, mp_per_eng = 1, damage = 0, speed = 0, armor = 0, movespeed = 300, poison = 100, fire = 100, ice = 100},
		
	})
end

BASE_HERO_HEALTH = 0--120
BASE_HERO_MANA = 0--75

function game_events:ExpFilter(data)
	local pid = data.player_id_const
	local experience = data.experience
	local hero = PlayerResource:GetSelectedHeroEntity(pid)	
	local hero_name = hero:GetUnitName()
	local sid = tostring(PlayerResource:GetSteamID(pid))
	_G.players_data[sid].heroes[hero_name].exp =_G.players_data[sid].heroes[hero_name].exp + experience
	
	local level, percent = game_events:GetLevelAndRemainderXP(_G.players_data[sid].heroes[hero_name].exp)

	if _G.players_data[sid].heroes[hero_name].level < level then
		_G.players_data[sid].heroes[hero_name].level = _G.players_data[sid].heroes[hero_name].level + 1
		_G.players_data[sid].heroes[hero_name].points = _G.players_data[sid].heroes[hero_name].points + 5

		-- TODO: ДОБАВИТЬ ЭФФЕКТ LVLUP
		local pcf = ParticleManager:CreateParticle("particles/generic_hero_status/hero_levelup.vpcf", PATTACH_ABSORIGIN_FOLLOW, hero)
		ParticleManager:ReleaseParticleIndex(pcf)
		
		web:update_hero_data(hero_name, pid, hero)
	end

	local data = game_events:calculate_hero_stats(hero_name, sid)
	CustomNetTables:SetTableValue("hero_hud_stats", tostring(pid), data)
	return false
end

-- maximum exp = 1 919 987 999S

function game_events:GetLevelAndRemainderXP(xp)
    local currentXP = 0
    local level = 0

    while level < 400 do
        local nextLevelXP = currentXP + level * 80
        if xp < nextLevelXP then
            local progress = ((xp - currentXP) / (nextLevelXP - currentXP)) * 100
            return level, progress
        end
        currentXP = nextLevelXP
        level = level + 1
    end

    return 400, 0 -- Если опыт больше максимального, возвращаем максимальный уровень и 0% прогресса
end

-------------------------------------------------------------------------

function game_events:teleport(pid, zone)
	local hero = PlayerResource:GetSelectedHeroEntity(pid)	
	print("tp")
	------------------------------
	--TODO: телепорт в зону
	------------------------------
	CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(pid), "hide_teleport", {})
end

-------------------------------------------------------------------------

function game_events:pick_show_hero(tab)
	local sid = tostring(PlayerResource:GetSteamID(tab.PlayerID))
	local hero_name = tab.name
	local data = game_events:calculate_hero_stats(hero_name, sid)
	CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(tab.PlayerID), "hero_show_pick", data)
end

function game_events:calculate_hero_stats(hero_name, sid)
	local heroes_base_stats = CustomNetTables:GetTableValue("heroes_base_stats", "heroes_base_stats")

	data = {}
	
	if _G.players_data[sid].heroes[hero_name] then
		data = table.deepcopy(_G.players_data[sid].heroes[hero_name])
	end
	
	data['hero_name'] = hero_name

	local function damage(name)
		local formulas = {
			["npc_dota_hero_dragon_knight"] = {min = data.str / 6, max =  data.str / 4},
			["npc_dota_hero_drow_ranger"] = {min = data.agi / 7, max =  data.agi / 4},
			["npc_dota_hero_death_prophet"] = {min = data.eng / 9, max = data.eng / 2},

			["npc_dota_hero_juggernaut"] = {min = data.str / 5, max =  data.str / 3},
			
		}
		return formulas[name].min, formulas[name].max
	end

	local function attack_speed(name)
		local formulas = {
			["npc_dota_hero_dragon_knight"] = {speed = data.agi / 15},
			["npc_dota_hero_drow_ranger"] = {speed = data.agi / 50},
			["npc_dota_hero_death_prophet"] = {speed = data.agi / 10},

			["npc_dota_hero_juggernaut"] = {speed = data.agi / 15},
			
		}
		return math.floor(formulas[name].speed)
	end

	local function armor(name)
		local formulas = {
			["npc_dota_hero_dragon_knight"] = {armor = data.agi / 3},
			["npc_dota_hero_drow_ranger"] = {armor = data.agi / 10},
			["npc_dota_hero_death_prophet"] = {armor = data.agi / 4},

			["npc_dota_hero_juggernaut"] = {armor = data.agi / 3},
			
		}
		return math.floor(formulas[name].armor)
	end

	data.str = (data.str or 0) + heroes_base_stats[hero_name].str
	data.agi = (data.agi or 0) + heroes_base_stats[hero_name].agi
	data.vit = (data.vit or 0)  + heroes_base_stats[hero_name].vit
	data.eng = (data.eng or 0)  + heroes_base_stats[hero_name].eng
	data.poison = data.poison or 0-- + стаки модификатора резиста хз где они, в сете наверное или талантах
	data.fire = data.fire or 0-- + стаки модификатора резиста
	data.ice = data.ice or 0-- + стаки модификатора резиста
	data.critical_damage = 5 -- брать показатели из сета
	data.reflected_damage = 5 -- брать показатели из сета
	data.excellent_damage = 5 -- брать показатели из сета
	data.movespeed = heroes_base_stats[hero_name].movespeed + 5 -- плюс брать показатели из сета
	
    local min_damage, max_damage = damage(hero_name)

	data.min_damage = math.floor(min_damage)
	data.max_damage = math.floor(max_damage)

    data.speed = attack_speed(hero_name)
    data.armor = armor(hero_name)
	data.hp = math.floor(heroes_base_stats[hero_name].hp + (data.level or 1) * heroes_base_stats[hero_name].hp_per_level + data.vit * heroes_base_stats[hero_name].hp_per_vit)
	data.mp = math.floor(heroes_base_stats[hero_name].mp + (data.level or 1) * heroes_base_stats[hero_name].mp_per_level + data.eng * heroes_base_stats[hero_name].mp_per_eng)
	
	return data
end

function game_events:pick_hero(tab)
	local pid = tab.PlayerID
	local hero_name = tab.hero_name
	hero = PlayerResource:ReplaceHeroWith(pid, hero_name, 0, 0)
	PlayerResource:SetCameraTarget(pid, hero)
	
	------------------------------
	--TODO: start effect teleport
	------------------------------
	
	web:update_hero_data(hero_name, pid, hero)
end


function game_events:init_hero(hero_name, pid)
	local sid = tostring(PlayerResource:GetSteamID(pid))
	local data = game_events:calculate_hero_stats(hero_name, sid)

	------------------------------
	--TODO: stop effect teleport
	------------------------------

	hero:AddNewModifier(hero, nil, "modifier_hero_health", {}):SetStackCount(data.hp)
	hero:AddNewModifier(hero, nil, "modifier_hero_mana", {}):SetStackCount(data.mp)

	CustomNetTables:SetTableValue("hero_hud_stats", tostring(pid), data)
end