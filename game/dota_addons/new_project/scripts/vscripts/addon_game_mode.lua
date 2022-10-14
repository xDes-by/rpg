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


require("libraries/timers")
require("libraries/timers")
require("libraries/UtilFunctions")





function Precache( context )
	PrecacheResource( "soundfile", "soundevents/music/game_sounds_music_tutorial.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/soundevents_conquest.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_dungeon.vsndevts", context )

	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_crystalmaiden.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_bristleback.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_furion.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_rattletrap.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_antimage.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_axe.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_bane.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_bloodseeker.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_drowranger.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_earthshaker.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_juggernaut.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_mirana.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_nevermore.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_morphling.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_phantom_lancer.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_puck.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_pudge.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_razor.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_sandking.vsndevts", context )	
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_stormspirit.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_sven.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_tiny.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_vengefulspirit.vsndevts", context )	
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_windrunner.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_zuus.vsndevts", context )	
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_kunkka.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_lina.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_antimage.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_lich.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_lion.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_shadowshaman.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_slardar.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_tidehunter.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_witchdoctor.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_riki.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_enigma.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_tinker.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_sniper.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_necrolyte.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_warlock.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_beastmaster.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_queenofpain.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_venomancer.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_faceless_void.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_skeletonking.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_death_prophet.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_phantom_assassin.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_pugna.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_templar_assassin.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_viper.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_luna.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_dragon_knight.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_dazzle.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_leshrac.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_life_stealer.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_dark_seer.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_clinkz.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_omniknight.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_enchantress.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_huskar.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_nightstalker.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_broodmother.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_weaver.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_bounty_hunter.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_batrider.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_jakiro.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_chen.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_spectre.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_doombringer.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_ancient_apparition.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_ursa.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_spirit_breaker.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_gyrocopter.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_alchemist.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_invoker.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_silencer.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_obsidian_destroyer.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_lycan.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_brewmaster.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_shadow_demon.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_lone_druid.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_chaos_knight.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_meepo.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_treant.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_ogre_magi.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_undying.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_rubick.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_disruptor.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_nyx_assassin.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_naga_siren.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_keeper_of_the_light.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_wisp.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_visage.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_slark.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_medusa.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_troll_warlord.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_centaur.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_shredder.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_tusk.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_skywrath_mage.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_abaddon.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_elder_titan.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_legion_commander.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_ember_spirit.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_earth_spirit.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_terrorblade.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_phoenix.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_oracle.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_techies.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_winter_wyvern.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_arc_warden.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_abyssal_underlord.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_monkey_king.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_pangolier.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_dark_willow.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_mars.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_grimstroke.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_void_spirit.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_snapfire.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_magnataur.vsndevts", context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_marci.vsndevts", context )
    
	PrecacheResource( "model", "models/heroes/pangolier/pangolier_gyroshell2_rubick.vmdl", context )
	PrecacheResource( "model", "models/items/tiny/scarlet_quarry/scarlet_quarry01.vmdl", context )
	PrecacheResource( "model", "models/items/tiny/scarlet_quarry/scarlet_quarry_02.vmdl", context )
	PrecacheResource( "model", "models/items/tiny/scarlet_quarry/scarlet_quarry_03.vmdl", context )
	PrecacheResource( "model", "models/items/tiny/scarlet_quarry/scarlet_quarry_04.vmdl", context )
    PrecacheResource( "model", "models/heroes/undying/undying_flesh_golem.vmdl", context )
	PrecacheResource( "model", "models/heroes/hoodwink/hoodwink_tree_model.vmdl", context )

end

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
	GameRules:GetGameModeEntity():SetUnseenFogOfWarEnabled( false )  --true
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
    if text == '1' then
		-- for i =1, 5 do
			-- local point = Entities:FindByName( nil, "fire_"..i):GetAbsOrigin()
			-- local trees = GridNav:GetAllTreesAroundPoint(point, 2500, false)
			-- for _,t in pairs(trees) do
				-- local effect_cast = ParticleManager:CreateParticle("particles/flame.vpcf", PATTACH_WORLDORIGIN, nil)
				-- cps = {0, 1, 2, 3, 4}
				-- point = t:GetAbsOrigin()
				-- for i = 1, #cps do
					-- ParticleManager:SetParticleControl(effect_cast, cps[i], point)
				-- end
			-- end
		-- end
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