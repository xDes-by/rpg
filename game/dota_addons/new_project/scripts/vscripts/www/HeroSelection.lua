if HeroSelection == nil then
    _G.HeroSelection = class({})
end

function HeroSelection:init()
print("aaaaaaaaa")
    ListenToGameEvent( "game_rules_state_change", Dynamic_Wrap( self, 'OnGameRulesStateChange' ), self )

    CustomGameEventManager:RegisterListener("ClickOnHero",function(_, keys)
        self:ClickOnHero(keys)
    end)
    CustomGameEventManager:RegisterListener("ConfirmHero",function(_, keys)
        self:ConfirmHero(keys)
    end)
    CustomGameEventManager:RegisterListener("GetRandomHero",function(_, keys)
        self:GetRandomHero(keys)
    end)
    CustomGameEventManager:RegisterListener("PlayerChat",function(_, keys)
        self:PlayerChat(keys)
    end)

    self.List = HeroList
    self.talents = {}
    self.available = {}
    self.process = {}
    self.race = {}
    self.hero_id = {}
    self.heroes = {}
    self.class = {}
    self.timer = 60
    self.post_pick_time = 3
    self.replaced = false
    self.chat = {}
    CustomNetTables:SetTableValue( "hero_selection", "list", self.List)
    CustomNetTables:SetTableValue( "hero_selection", "heroes", self.heroes)


    for race_name, race in pairs(self.List) do
        for _, hero in pairs(race) do
            self.race[hero.name] = race_name
            self.hero_id[hero.name] = hero.hero_id
            self.class[hero.name] = hero.class
            table.insert(self.heroes, hero.name)
        end
    end
    CustomNetTables:SetTableValue( "hero_selection", "class", self.class)
end

function HeroSelection:OnGameRulesStateChange()
    if GameRules:State_Get() == DOTA_GAMERULES_STATE_PRE_GAME then
        self:CreateTimer()
    end
end

--                                                  СМЕНА ГЕРОЯ
function HeroSelection:ReplaceHero()
    self.replaced = true
    for pid, process in pairs(self.process) do
        if not process.heroname or not process.confirmed then
            self:GetRandomHero({PlayerID = pid})
        end
        gold = PlayerResource:GetSelectedHeroEntity( pid ):GetGold()
        local hero = PlayerResource:ReplaceHeroWith(pid,process.heroname,gold,0)
		-------------------------------------------------------------------------------------------------------
		Timers:CreateTimer(1,function()
			hero:FindAbilityByName("ability_capture_lua"):SetLevel(1)
			hero:AddNewModifier(hero, nil, "modifier_hero_class_"..get_class(hero), {})
		end)
		-------------------------------------------------------------------------------------------------------
        -- Rating 
        Rating:UpdateHeroName(pid, process.heroname)
        -- Talent
        talent:PlayerInit(pid, process.heroname)
    end
    talent:PlayersInit()
end
-------------------------------------------------------------------------------------------------------
function get_class(hero)
	if not IsServer() then return end
	for _,v in pairs(heroes_class) do
		for _, h in pairs(v.heroes) do
			if hero:GetUnitName() == h then
				print(v.class)
				return v.class
			end
		end
	end	
end

heroes_class = {
	{class = "tank", heroes = {"npc_dota_hero_lone_druid","npc_dota_hero_undying","npc_dota_hero_abyssal_underlord","npc_dota_hero_shredder","npc_dota_hero_tusk","npc_dota_hero_axe","npc_dota_hero_pudge"}},
	{class = "damage", heroes = {"npc_dota_hero_furion","npc_dota_hero_skeleton_king","npc_dota_hero_nevermore","npc_dota_hero_gyrocopter","npc_dota_hero_monkey_king","npc_dota_hero_troll_warlord","npc_dota_hero_juggernaut"}},
	{class = "mage", heroes = {"npc_dota_hero_keeper_of_the_light","npc_dota_hero_death_prophet","npc_dota_hero_queenofpain","npc_dota_hero_techies","npc_dota_hero_leshrac","npc_dota_hero_disruptor","npc_dota_hero_invoker"}},
	{class = "healer", heroes = {"npc_dota_hero_treant","npc_dota_hero_necrolyte","npc_dota_hero_visage","npc_dota_hero_tinker","npc_dota_hero_hoodwink","npc_dota_hero_dazzle","npc_dota_hero_omniknight"}},
	}
-------------------------------------------------------------------------------------------------------	
--                                                  ДОБАВЛЕНИЕ ИГРОКА
--                                                  ПОСЛЕ ИНИТА С БД
function HeroSelection:AddPlayer(id, data)
    self.talents[id] = {}
    for _,talent in pairs(data) do
        self.talents[id][talent['hero_name']] = talent
    end
    self.available[id] = {}
    for _, race in pairs(self.List) do
        for _, hero in pairs(race) do
            local hero_name = hero.name
            local available = hero.available
            if available then
                self.available[id][hero_name] = true
            else
                self.available[id][hero_name] = false
            end
        end
    end
    self.process[id] = {}
    self.process[id].confirmed = false
    CustomNetTables:SetTableValue( "hero_selection", tostring(id), {
        talents = self.talents[id],
        available = self.available[id],
        process = self.process[id],
    })
end

--                                                  КЛИК НА ГЕРОЯ
function HeroSelection:ClickOnHero(t)
    local pid = t.PlayerID

    if self.process[pid].confirmed then return end

    self.process[pid].available = true
    self.process[pid].race = self.race[t.heroname]
    self.process[pid].hero_id = self.hero_id[t.heroname]
    self.process[pid].heroname = t.heroname
    self.process[pid].level = 0
    if self.talents[pid][t.heroname] then
        self.process[pid].level = self.talents[pid][t.heroname]['level']
    end

    if not self.available[pid][t.heroname] then
        self.process[pid].available = false
    end

    for _,process in pairs(self.process) do
        if process.heroname and process.heroname == t.heroname and process.confirmed == true then
            self.process[pid].available = false
        end
    end
    gold = PlayerResource:GetSelectedHeroEntity( pid ):GetGold()
    PlayerResource:ReplaceHeroWith(pid,t.heroname,gold,0)
    CustomNetTables:SetTableValue( "hero_selection", tostring(pid), {
        talents = self.talents[pid],
        available = self.available[pid],
        process = self.process[pid],
    })
end

--                                                  ПОДТВЕРЖДЕНИЕ ВЫБОРА
function HeroSelection:ConfirmHero(t)
    local pid = t.PlayerID
    if not self.process[pid].available or self.process[pid].confirmed then return end

    self.process[pid].confirmed = true

    for i, process in pairs(self.process) do
        if i ~= pid then
            if process.heroname and process.heroname == self.process[pid].heroname then
                process.available = false
            end
        end
        CustomNetTables:SetTableValue( "hero_selection", tostring(pid), {
            talents = self.talents[pid],
            available = self.available[pid],
            process = self.process[pid],
        })
    end
end


--                                                  ТАЙМЕР ПИКА
function HeroSelection:CreateTimer()
    self.timer = self.timer + 1
    Timers:CreateTimer(0, function()
        self.timer = self.timer - 1

        
        ready = false
        for _, process in pairs(self.process) do
            ready = true
            if not process.confirmed then 
                ready = false
                break
            end
        end

        if ready and not self.replaced then
            self:ReplaceHero()
            self.timer = self.post_pick_time
        end

        CustomNetTables:SetTableValue( "hero_selection", "timer", {time = HeroSelection.timer})
        if self.timer > 0 then
            return 1
        end
    end)
end

--                                                  ПОИСК РАНДОМНОГО ГЕРОЯ
function HeroSelection:GetRandomAvailableHero(id)
    while true do
        local rand = RandomInt(1,#self.heroes)
        local heroname = self.heroes[rand]
        local available = true
        if not self.available[id][heroname] then
            available = false
        end
        for _,process in pairs(self.process) do
            if process.heroname and process.heroname == heroname and process.confirmed then
                available = false
            end
        end
        if available then
            return heroname
        end
    end
end

--                                                  ПОЛУЧЕНИЕ РАНДОМНОГО ГЕРОЯ
function HeroSelection:GetRandomHero(t)
    local pid = t.PlayerID
    if self.process[pid].confirmed then return end

    local heroname = self:GetRandomAvailableHero(pid)
    
    self.process[pid].confirmed = true
    self.process[pid].heroname = heroname
    self.process[pid].level = 0
    if self.talents[pid][heroname] then
        self.process[pid].level = self.talents[pid][heroname]['level']
    end
    self.process[pid].race = self.race[heroname]

    CustomNetTables:SetTableValue( "hero_selection", tostring(pid), {
        talents = self.talents[pid],
        available = self.available[pid],
        process = self.process[pid],
    })
end

--                                                  ИГРОВОЙ ЧАТ
function HeroSelection:PlayerChat(t)
    table.insert(self.chat, t)
    CustomNetTables:SetTableValue("hero_selection", "chat", self.chat)
end

HeroSelection:init()