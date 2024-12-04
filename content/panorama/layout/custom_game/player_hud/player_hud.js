GameUI.SetRenderBottomInsetOverride( 0 );
GameUI.SetRenderTopInsetOverride( 0 );
GameUI.SetCameraTerrainAdjustmentEnabled( false )
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_TOP_TIMEOFDAY, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_TOP_HEROES, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_FLYOUT_SCOREBOARD, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_PREGAME_STRATEGYUI, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_ENDGAME, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_HERO_SELECTION_TEAMS, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_ACTION_MINIMAP, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_INVENTORY_SHOP, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_INVENTORY_ITEMS, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_INVENTORY_QUICKBUY, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_INVENTORY_COURIER, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_ACTION_PANEL, false );


var HpBar;
var MpBar;
var ExpBar;
var current_selected_player = -1;
var ButtonStats = $("#ButtonStats")
var ButtonStatsEffect = $("#ButtonStatsEffect")
var ButtonInventory = $("#ButtonInventory")
var ExpBarContainer = $("#ExpBarContainer")

var very_rare_item_effect = $.CreatePanel("DOTAParticleScenePanel", ButtonStatsEffect, "", {particleName:"particles/ui/hud/autocasting_square.vpcf", renderdeferred:"true", particleonly:"false", startActive:"true", cameraOrigin:"0 0 90", lookAt:"0 0 0", fov:"60"});
very_rare_item_effect.AddClass("full");

function main() {

    // if (current_selected_player != Players.GetLocalPlayerPortraitUnit()) {
        current_selected_player = Players.GetLocalPlayerPortraitUnit();
        
		let player_id = Entities.GetPlayerOwnerID(current_selected_player)
		
		// $.Msg(Entities.IsRealHero(current_selected_player), "---", player_id , "------", Players.GetLocalPlayer())
		
        if (Entities.IsRealHero(current_selected_player) && player_id == Players.GetLocalPlayer()) {
			
            var data = CustomNetTables.GetTableValue("hero_hud_stats", current_selected_player);
			
			// $.Msg(data)

            if (data) {
				
				ButtonStatsEffect.visible = data.points > 0 ? true : false
				
				level_data = getLevelAndRemainderXP(data.exp)
				
				
				$.Msg(level_data)
				// $.Msg(data.exp, "---", data.level)
				
                $("#DamageLabel").text = data.min_damage.toFixed(0) + " - " + data.max_damage.toFixed(0);
                $("#AttackSpeedLabel").text = data.speed.toFixed(1);
                $("#ArmorLabel").text = data.armor.toFixed(0);
                $("#MoveSpeedLabel").text = data.movespeed.toFixed(0);
				
                $("#StrLabel").text = data.str.toFixed(0);
                $("#AgiLabel").text = data.agi.toFixed(0);
                $("#VitLabel").text = data.vit.toFixed(0);
                $("#EngLabel").text = data.eng.toFixed(0);
								

                if (!HpBar) {
                    HpBar = $.CreatePanel(`DOTAScenePanel`, $("#HpBar"), "RegenBurnerHP", {class: `RegenBurner`, camera: `camera_1`, particleonly: `false`, map: `maps/hp_bar.vmap`, hittest: `false`});
                    HpBar.style.width = "70%";
                    HpBar.style.height = "100%";
                    HpBar.style.backgroundColor = "#fc1919";
                }

                if (!MpBar) {
                    MpBar = $.CreatePanel(`DOTAScenePanel`, $("#MpBar"), "RegenBurnerHP", {class: `RegenBurner`, camera: `camera_1`, particleonly: `false`, map: `maps/mp_bar.vmap`, hittest: `false`});
                    MpBar.style.width = "70%";
                    MpBar.style.height = "100%";
                    MpBar.style.backgroundColor = "#006eeb";
                }
				
				if (!ExpBar) {
                    ExpBar = $.CreatePanel(`DOTAScenePanel`, $("#ExpBar"), "RegenBurnerHP", {class: `RegenBurner`, camera: `camera_1`, particleonly: `false`, map: `maps/scenes/hud/healthbarburner.vmap`, hittest: `false`});
                    ExpBar.style.width = "7%";
                    ExpBar.style.height = "100%";
                    ExpBar.style.backgroundColor = "gold";
                }
            }
			ButtonStats.visible = true
			ButtonInventory.visible = true
			ExpBarContainer.visible = true
        } else {
            // $.Msg("Selected unit is not a hero.");
			ButtonStats.visible = false
			ButtonInventory.visible = false
			ExpBarContainer.visible = false
        }
    // }

    if (HpBar) {
        HpBar.style.width = Entities.GetHealthPercent(current_selected_player) + "%";
		$("#HpLabel").text = Entities.GetHealth(current_selected_player) + " / " + Entities.GetMaxHealth(current_selected_player)	
    }

    if (MpBar) {
        var manaPercent =
            (Entities.GetMana(current_selected_player) / Entities.GetMaxMana(current_selected_player)) * 100;
        MpBar.style.width = manaPercent + "%";
		$("#MpLabel").text = Entities.GetMana(current_selected_player) + " / " + Entities.GetMaxMana(current_selected_player)
    }

	if (ExpBar) {
        ExpBar.style.width = level_data.percent + "%";
    }
	
    $.Schedule(1.0 / 30.0, main);
}

function getLevelAndRemainderXP(xp) {
    let currentXP = 0;
    let level = 0;

    while (level < 400) {
        let nextLevelXP = currentXP + level * 80;
        if (xp < nextLevelXP) {
            let percent = ((xp - currentXP) / (nextLevelXP - currentXP)) * 100;
            return { level, percent };
        }
        currentXP = nextLevelXP;
        level += 1;
    }

    // Если опыт больше максимального, возвращаем максимальный уровень и 0% прогресса
    return { level: 400, percent: 0 };
}


// -------------------------------------------------------------------------------

var invopened = false;
var player_stats_menu_main = $("#player_stats_menu_main")


function OpenStatsMenu() {
	invopened = !invopened
	player_stats_menu_main.SetHasClass("open_stats_menu", invopened)
	GameEvents.SendCustomGameEventToServer("hero_get_stats", {});
}

function OpenStatsMenuOneTime() {
	invopened = true
	player_stats_menu_main.SetHasClass("open_stats_menu", true)
	GameEvents.SendCustomGameEventToServer("hero_get_stats", {});
	open_stats_menu_button_level_up.visible = false
}

function hero_show_stats(data){
	$.Msg("S")
	$.Msg(data)
	player_stats_menu_main.FindChildTraverse("player_stats_menu_str").text = data.str
	player_stats_menu_main.FindChildTraverse("player_stats_menu_agi").text = data.agi
	player_stats_menu_main.FindChildTraverse("player_stats_menu_vit").text = data.vit
	player_stats_menu_main.FindChildTraverse("player_stats_menu_eng").text = data.eng
	
	if(data.points > 0){
		$.Msg("!")
	}
	
}

function AddPoints(data){
	$.Msg(data)
	GameEvents.SendCustomGameEventToServer("hero_add_stats", {type:data});
}


function hero_level_up(){
	$.Msg("show bg")
	ButtonStatsEffect.visible = true
	// ButtonStats.style.boxShadow = "gold 0px 0px 3px 0px";
	
	       
	
}

function OpenInventory(){
	GameUI.CustomUIConfig.OpenInventory();
}


(function() {
	main();
	GameEvents.Subscribe("hero_level_up", hero_level_up)
	GameEvents.Subscribe("hero_show_stats", hero_show_stats)
})();





