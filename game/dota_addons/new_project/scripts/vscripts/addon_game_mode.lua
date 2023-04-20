if AddonGamemode == nil then
	AddonGamemode = class({})
	_G.AddonGamemode = AddonGamemode
end

require( "maplogic/maplogic" )
require( "events" )
require( "rules" )
require( "www/loader" )
require( "global_data" )
require( "libraries/animations" )
require( "libraries/timers" )
require( "libraries/table" )

require("libraries/UtilFunctions")

Precache = require("precache")



function Activate()
	GameRules.AddonGamemode = AddonGamemode()
	GameRules.AddonGamemode:InitGameMode()
end

function AddonGamemode:InitGameMode()
	local GameMode = GameRules:GetGameModeEntity()
	GameMode:SetBuybackEnabled(false)
	GameRules:SetHeroRespawnEnabled( false )
	
	GameRules:SetCustomGameSetupAutoLaunchDelay(0)
    GameRules:SetStrategyTime(0)
    GameRules:SetShowcaseTime(0)
    GameRules:SetPreGameTime(0)
    GameRules:SetPostGameTime(10)
	GameRules:SetUseUniversalShopMode(true)
	GameRules:SetHideKillMessageHeaders(false)
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 4 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 0 )
    -- GameRules:GetGameModeEntity():SetUseCustomHeroLevels(true)

	
	--GameMode:SetHudCombatEventsDisabled(true)
	--GameMode:SetFogOfWarDisabled(true)
	GameRules:GetGameModeEntity():SetUnseenFogOfWarEnabled( true )  --true
    GameMode:SetCustomBackpackSwapCooldown(0)
    GameMode:SetCustomBuybackCooldownEnabled(false)
	GameMode:SetLoseGoldOnDeath(false) 
	GameMode:SetRandomHeroBonusItemGrantDisabled(true)
	GameMode:SetKillingSpreeAnnouncerDisabled(true)

	GameMode:SetInnateMeleeDamageBlockAmount(0)
	GameMode:SetInnateMeleeDamageBlockPercent(0)
	GameMode:SetInnateMeleeDamageBlockPerLevelAmount(0)
	
	--GameMode: SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_ARMOR, 0)

	-- GameMode:SetCustomXPRequiredToReachNextLevel(self.xpTable)
	--GameMode: SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_DAMAGE, 0)
    --GameMode: SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_HP, 0)
    --GameMode: SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_HP_REGEN, 0.00001)
    --GameMode: SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_DAMAGE, 0)
    
    --GameMode: SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_ATTACK_SPEED, 0)
    --GameMode: SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_DAMAGE, 0)
    --GameMode: SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_MANA, 0)
    --GameMode: SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_MANA_REGEN, 0.00001)

	GameMode:SetCustomGameForceHero("npc_dota_hero_wisp")

	self:LinkGameModifiers()
	ListenToGameEvent("game_rules_state_change", Dynamic_Wrap( AddonGamemode, 'OnGameStateChanged' ), self )
	ListenToGameEvent("entity_killed", Dynamic_Wrap( AddonGamemode, 'OnEntityKilled' ), self )
	ListenToGameEvent("player_chat", Dynamic_Wrap( self, "OnChat" ), self )
end

function AddonGamemode:OnChat(t)
    text = t.text
	local pid = t.playerid
	local hero = PlayerResource:GetSelectedHeroEntity( pid )
    if text == '1' then
		_G.maps = 1
    end
	if text == '2' then
		_G.maps = 2
    end
	if text == "i" then
		mines_1:Init()
	end
	if text == 'god' then
		hero:AddNewModifier(hero, nil, "modifier_god", {})
	end
end

function AddonGamemode:OnEntityKilled( keys )
    local killed_unit = EntIndexToHScript( keys.entindex_killed )
    local killer = EntIndexToHScript( keys.entindex_attacker )
	if killed_unit and killed_unit:IsRealHero() then
		local newItem = CreateItem( "item_tombstone", killed_unit, killed_unit )
		newItem:SetPurchaseTime( 0 )
		newItem:SetPurchaser(killed_unit)
		local tombstone = SpawnEntityFromTableSynchronous( "dota_item_tombstone_drop", {} )
		tombstone:SetContainedItem( newItem )
		tombstone:SetAngles( 0, RandomFloat( 0, 360 ), 0 )
		FindClearSpaceForUnit( tombstone, killed_unit:GetAbsOrigin(), true )	
	end
--------------------------------------------------------------------------------------------
	if killed_unit:IsCreep() then
		local heroes = FindUnitsInRadius(killer:GetTeamNumber(), killed_unit:GetAbsOrigin(), nil, 1300, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NOT_CREEP_HERO + DOTA_UNIT_TARGET_FLAG_NOT_ILLUSIONS + DOTA_UNIT_TARGET_FLAG_INVULNERABLE + DOTA_UNIT_TARGET_FLAG_OUT_OF_WORLD, FIND_ANY_ORDER, false ) 
		for _, hero in pairs(heroes) do
			local expa = killed_unit:GetDeathXP() - killed_unit:GetDeathXP() / #heroes
			hero:AddExperience(expa, DOTA_ModifyXP_Unspecified, false, false)
			if hero ~= killer then
				local gold = killed_unit:GetMinimumGoldBounty()
				hero:ModifyGold( gold, true, 0 )
				SendOverheadEventMessage(hero, OVERHEAD_ALERT_GOLD, hero, gold, nil)
			end
		end
	end
end

function AddonGamemode:OnGameStateChanged( keys )
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_STRATEGY_TIME then
	end
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		Rules:Init()
		Events:Init()			
	end
end

function AddonGamemode:LinkGameModifiers()
	LinkLuaModifier( "modifier_selector", "modifiers/modifier_selector", LUA_MODIFIER_MOTION_NONE )
	LinkLuaModifier( "modifier_cheat_move", "modifiers/modifier_cheat_move", LUA_MODIFIER_MOTION_NONE )
	LinkLuaModifier( "modifier_boss_invelurable", "modifiers/modifier_boss_invelurable", LUA_MODIFIER_MOTION_NONE )
	LinkLuaModifier( "modifier_dummy", "modifiers/modifier_dummy", LUA_MODIFIER_MOTION_NONE )
	LinkLuaModifier( "modifier_god", "modifiers/modifier_god", LUA_MODIFIER_MOTION_NONE )
	LinkLuaModifier( "modifier_generic_arc_lua", "modifiers/modifier_generic_arc_lua", LUA_MODIFIER_MOTION_BOTH )
	LinkLuaModifier( "modifier_generic_ring_lua", "modifiers/modifier_generic_ring_lua", LUA_MODIFIER_MOTION_BOTH )
	LinkLuaModifier( "modifier_animation_test", "modifiers/modifier_animation_test", LUA_MODIFIER_MOTION_NONE )
	LinkLuaModifier( "modifier_simply_motion_controll", "modifiers/modifier_simply_motion_controll", LUA_MODIFIER_MOTION_BOTH )
	LinkLuaModifier( "modifier_ready", "modifiers/modifier_ready", LUA_MODIFIER_MOTION_BOTH )
	LinkLuaModifier( "modifier_hero_class_tank", "modifiers/modifier_hero_class_tank", LUA_MODIFIER_MOTION_BOTH )
	LinkLuaModifier( "modifier_hero_class_damage", "modifiers/modifier_hero_class_damage", LUA_MODIFIER_MOTION_BOTH )
	LinkLuaModifier( "modifier_hero_class_mage", "modifiers/modifier_hero_class_mage", LUA_MODIFIER_MOTION_BOTH )
	LinkLuaModifier( "modifier_hero_class_healer", "modifiers/modifier_hero_class_healer", LUA_MODIFIER_MOTION_BOTH )
	LinkLuaModifier( "modifier_blind", "modifiers/modifier_blind", LUA_MODIFIER_MOTION_BOTH )
	LinkLuaModifier( "modifier_jungle_dragon", "modifiers/modifier_jungle_dragon", LUA_MODIFIER_MOTION_BOTH )
	LinkLuaModifier( "modifier_camp", "modifiers/modifier_campfire", LUA_MODIFIER_MOTION_BOTH )
	LinkLuaModifier( "modifier_mines_hex", "modifiers/modifier_mines_hex", LUA_MODIFIER_MOTION_BOTH )

	--for _,TalentName in ipairs(self.AllTalentsName) do
	--	LinkLuaModifier( TalentName, "modifiers/talents/" .. TalentName, LUA_MODIFIER_MOTION_NONE )
	--end

	--for _,ClassModName in ipairs(self.ClassModName) do
	--	LinkLuaModifier( ClassModName, "modifiers/talents/" .. ClassModName, LUA_MODIFIER_MOTION_NONE )
	--end	
end


function AddonGamemode:ExpGain(data)
	data.experience = self.ModifyExpByPlayerCount[self.PlayerCount] * data.experience
	return true
end