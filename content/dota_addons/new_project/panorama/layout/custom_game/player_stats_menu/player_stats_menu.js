var invopened = false;
var open_stats_menu_button_level_up = $("#open_stats_menu_button_level_up")
var player_stats_menu_main = $("#player_stats_menu_main")
open_stats_menu_button_level_up.visible = false

var pid = Players.GetLocalPlayer()

function OpenStatsMenu() {
	$.Msg("open")
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
	open_stats_menu_button_level_up.visible = true
}


(function() {
	GameEvents.Subscribe("hero_level_up", hero_level_up)
	GameEvents.Subscribe("hero_show_stats", hero_show_stats)
})();