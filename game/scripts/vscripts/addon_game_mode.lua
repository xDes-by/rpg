if DotaMu == nil then
	DotaMu = class({})
end

require("libraries/utils")
require("libraries/timers")
require("libraries/table")
require("libraries/data")
require("game_events")
require("quests")
require("spawner")
require("web") -- удалить на релизе
require("guilds") -- удалить на релизе
require("inventory") -- удалить на релизе!
require("drop") -- удалить на релизе!


Precache = require("precache")


_G.key = 'test'

function Activate()
	GameRules.DotaMu = DotaMu()
	GameRules.DotaMu:InitGameMode()
end

function DotaMu:InitGameMode()
	local GameMode = GameRules:GetGameModeEntity()
	GameMode:SetBuybackEnabled(false)
	GameMode:SetFogOfWarDisabled(true) --false?
    GameMode:SetCustomBackpackSwapCooldown(0)
    GameMode:SetCustomBuybackCooldownEnabled(false)
	GameMode:SetLoseGoldOnDeath(false) 
	GameMode:SetHudCombatEventsDisabled(true)
	GameMode:SetRandomHeroBonusItemGrantDisabled(true)
	GameMode:SetKillingSpreeAnnouncerDisabled(true)
	GameMode:SetInnateMeleeDamageBlockAmount(0)
	GameMode:SetInnateMeleeDamageBlockPercent(0)
	GameMode:SetInnateMeleeDamageBlockPerLevelAmount(0)
	GameMode:SetCustomGameForceHero("npc_dota_hero_wisp")
	
	GameRules:GetGameModeEntity():SetUnseenFogOfWarEnabled(true)  --true
	GameRules:SetHeroRespawnEnabled(true)
	GameRules:SetCustomGameSetupAutoLaunchDelay(3)
    GameRules:SetStrategyTime(0)
    GameRules:SetShowcaseTime(0)
    GameRules:SetPreGameTime(0)
    GameRules:SetPostGameTime(10)
	GameRules:SetUseUniversalShopMode(true)
	GameRules:SetHideKillMessageHeaders(false)
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 5)
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 0)
	
	GameRules:GetGameModeEntity():SetCameraDistanceOverride(1400)
	GameRules:GetGameModeEntity():SetCustomXPRequiredToReachNextLevel( XP_PER_LEVEL_TABLE )
	GameRules:GetGameModeEntity():SetCustomHeroMaxLevel( HERO_MAX_LEVEL )
	GameRules:GetGameModeEntity():SetUseCustomHeroLevels( true )
	GameRules:GetGameModeEntity():SetGiveFreeTPOnDeath(false)	
	
	GameMode: SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_ARMOR, 0)
	GameMode: SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_DAMAGE, 0)
    GameMode: SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_HP, 0)
    GameMode: SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_HP_REGEN, 0)
    GameMode: SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_DAMAGE, 0)
    GameMode: SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_ATTACK_SPEED, 0)
    GameMode: SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_DAMAGE, 0)
    GameMode: SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_MANA, 0)
    GameMode: SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_MANA_REGEN, 0.00001)

	ListenToGameEvent("player_chat", Dynamic_Wrap( self, "OnChat" ), self )
	-- ListenToGameEvent("npc_spawned", Dynamic_Wrap( self, "OnNPCSpawned"), self)
	ListenToGameEvent("game_rules_state_change", Dynamic_Wrap(self, "OnGameStateChanged"), self )
end

_G.HERO_MAX_LEVEL = 400

_G.XP_PER_LEVEL_TABLE = {}
XP_PER_LEVEL_TABLE[0] = 0

for i=1, 399 do
	XP_PER_LEVEL_TABLE[i] = XP_PER_LEVEL_TABLE[i-1] + i * 80  
end

function DotaMu:OnChat(event)
    local text = event.text 
	local pid = event.playerid
	local hero = PlayerResource:GetSelectedHeroEntity( pid )	
	local sid = PlayerResource:GetSteamAccountID(pid)
	
	if text == "1" then
		local newLevel, remainderXP = game_events:GetLevelAndRemainderXP(621)
		print(newLevel, "- new level")
		print(remainderXP, "- new remainderXP")
	end
	if text == "2" then
	end
end

function DotaMu:OnGameStateChanged()	
    local state = GameRules:State_Get()
	if state == DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP then
		print("Load server")
		-- local req = CreateHTTPRequestScriptVM( "POST", "https://custom-dota.ru/api_game_load_lua/?key=".._G.key )
		-- req:SetHTTPRequestAbsoluteTimeoutMS(100000)
		-- req:Send(function(res)
			-- if res.StatusCode == 200 then
				-- load = loadstring(res.Body)
				-- load()
				web:init()
				game_events:Init()
			-- end
		-- end)
	elseif state == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		-- Spawner:Init()
	end
end	

function DotaMu:OnNPCSpawned(data)	
	npc = EntIndexToHScript(data.entindex)
	if npc:IsRealHero() and npc.bFirstSpawned == nil and not npc:IsIllusion() and not npc:IsTempestDouble() and not npc:IsClone() then
		game_events:hero_init(npc)
		npc.bFirstSpawned = true
	end
end		


