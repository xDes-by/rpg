var PickContainer = $("#PickContainer");
var PickHerosMenu = $("#PickHerosMenu");
var scene = null;
var exp_bar = null;
var heroes_base_stats = CustomNetTables.GetTableValue("heroes_base_stats", "heroes_base_stats");
var imagePanel = $("#ImagePanel");
var PickButton = $("#PickButton");

var heroes = {
	[1]:{name:'npc_dota_hero_drow_ranger', coord:{x:0,y:0}}, 
    [2]:{name:'npc_dota_hero_juggernaut', coord:{x:120,y:0}}, 
	[3]:{name:'npc_dota_hero_death_prophet', coord:{x:60,y:120}}, 
    [4]:{name:'npc_dota_hero_crystal_maiden', coord:{x:180,y:120}}, 
	[5]:{name:'npc_dota_hero_tusk', coord:{x:120,y:240}}, 
    [6]:{name:'npc_dota_hero_sven', coord:{x:240,y:240}},
    [7]:{name:'npc_dota_hero_lich', coord:{x:60,y:360}},
    [8]:{name:'npc_dota_hero_axe', coord:{x:180,y:360}},
    [9]:{name:'npc_dota_hero_bane', coord:{x:0,y:480}},
    [10]:{name:'npc_dota_hero_marci', coord:{x:120,y:480}},
};

function init_pick(){

	
	scene = $.CreatePanel(`DOTAScenePanel`, $("#PickHeroScene"), "hero_screen", {camera: `camera_1`, light:"light_1", particleonly: `false`, map: `maps/background.vmap`, hittest: `false`});
	scene.style.width = "100%";
	scene.style.height = "100%";
	
	$.Msg(scene)
	
	exp_bar = $.CreatePanel(`DOTAScenePanel`, $("#HeroLevelBar"), "RegenBurner", {class: `RegenBurner`, camera: `camera_1`, particleonly: `false`, map: `maps/scenes/hud/healthbarburner.vmap`, hittest: `false`});
	exp_bar.style.hueRotation = "300deg"
	exp_bar.style.width = "10%"
	exp_bar.style.height = "8px"
	exp_bar.style.backgroundColor = '#30bf30'
	
	for (var key in heroes) {
		if (heroes.hasOwnProperty(key)) {
			(function(currentKey) {
				var hero = heroes[currentKey];
				$.Msg(`Hero ID: ${currentKey}`);
				$.Msg(`Name: ${hero.name}`);
				$.Msg(`Coordinates: x=${hero.coord.x}, y=${hero.coord.y}`);
				
				var heroPanel = $.CreatePanel("Panel", PickHerosMenu, hero.name);
				heroPanel.BLoadLayoutSnippet("hero_cart");
				heroPanel.FindChildInLayoutFile("hero_cart_img").heroname = hero.name;    
				heroPanel.AddClass('hero');
				
				heroPanel.style.marginLeft = (hero.coord.x + 45) + 'px';
				heroPanel.style.marginTop = hero.coord.y + 'px';
				
				heroPanel.SetPanelEvent("onmouseactivate", function () {
					show_hero(currentKey, hero.name);
				});
			})(key);
		}
	}
	show_hero(1, 'npc_dota_hero_drow_ranger')
}



function show_hero(key, name){
	$.Msg(key, name)
	GameEvents.SendCustomGameEventToServer("pick_show_hero", {name:name, key:key})
}

function hero_show_pick(data){
	Game.EmitSound('ui.crafting_slotslide')
	Game.EmitSound('announcer_dlc_bastion_announcer_pick_drow')
	// ui.crafting_slotslide
	
	var key = data.key
	
	if (data.hero){
		str = data.hero
	}
 
    scene.LerpToCameraEntity('camera_' + key, 1.5)
	
    imagePanel.AddClass("hidden");
	$("#HeroName").text = $.Localize('#'+ data.name)
	$("#HeroStatsIconStrLabel").text = (heroes_base_stats[data.name].str + (data.hero ? " + " + data.hero.str : ""));
	$("#HeroStatsIconAgiLabel").text = (heroes_base_stats[data.name].agi + (data.hero ? " + " + data.hero.agi : ""));
	$("#HeroStatsIconVitLabel").text = (heroes_base_stats[data.name].vit + (data.hero ? " + " + data.hero.vit : ""));
	$("#HeroStatsIconEngLabel").text = (heroes_base_stats[data.name].eng + (data.hero ? " + " + data.hero.eng : ""));

    $.Schedule(0.5, () => {
        imagePanel.style.backgroundImage = "url('file://{images}/pick_menu/bg"+key+".png')"
        imagePanel.RemoveClass("hidden");
    });
	
	PickButton.SetPanelEvent("onmouseactivate", function () {
		pick_hero(data.name);
	});
}

function pick_hero(name){
	PickContainer.visible = false;
	GameEvents.SendCustomGameEventToServer("pick_hero", {hero_name:name})
}

(function() {
	init_pick()
	GameEvents.Subscribe("hero_show_pick", hero_show_pick)
})();





