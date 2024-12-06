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

var exp_bar;

function init_pick(){
	scene = $.CreatePanel(`DOTAScenePanel`, $("#PickHeroScene"), "hero_screen", {camera: `camera_1`, light:"light_1", particleonly: `false`, map: `maps/background.vmap`, hittest: `false`});
	scene.style.width = "100%";
	scene.style.height = "100%";
	
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
					show_hero(hero.name);
				});
			})(key);
		}
	}
	show_hero('npc_dota_hero_drow_ranger')
}

function show_hero(name){
	GameEvents.SendCustomGameEventToServer("pick_show_hero", {name:name})
}

function hero_show_pick(data){
	Game.EmitSound('ui.crafting_slotslide')
	Game.EmitSound('announcer_dlc_bastion_announcer_pick_drow')
	const key = findKeyByName(heroes, data.hero_name);

	//{"level":14,"can_reset":0,"speed":2.133333444595337,
	// "armor":10.666666984558105,"movespeed":305,
	// "min_damage":9,"hero_enquip":{},"critical_damage":5,
	// "excellent_damage":5,"reflected_damage":5,
	// "hero_name":"npc_dota_hero_drow_ranger",
	// "str":49,"fructs":0,"points":0,"max_damage":16,"exp":2123,
	// "hp":13851,"agi":32,"vit":4571,"eng":444,"resets":7,"mp":471}
	
    scene.LerpToCameraEntity('camera_' + key, 1.5)

    imagePanel.AddClass("hidden");
	$("#HeroName").text = $.Localize('#'+ data.hero_name)
	$("#HeroLevelLabel").text = $.Localize('#level') + ": " + 1 + " (" + 0 + ")" 

	var base_str = heroes_base_stats[data.hero_name].str
	var base_agi = heroes_base_stats[data.hero_name].agi
	var base_vit = heroes_base_stats[data.hero_name].vit
	var base_eng = heroes_base_stats[data.hero_name].eng

	$("#HeroStatsIconStrLabel").text = base_str + " <font color='#00f704'> +" + (data.str-base_str) + "</font>"
	$("#HeroStatsIconAgiLabel").text = base_agi + " <font color='#00f704'> +" + (data.agi-base_agi) + "</font>"
	$("#HeroStatsIconVitLabel").text = base_vit + " <font color='#00f704'> +" + (data.vit-base_vit) + "</font>"
	$("#HeroStatsIconEngLabel").text = base_eng + " <font color='#00f704'> +" + (data.eng-base_eng) + "</font>"

	$("#DamageLabel").text = data.min_damage + "-" + data.max_damage
	$("#AttackSpeedLabel").text = data.speed
	$("#ArmorLabel").text = data.armor
	$("#MoveSpeedLabel").text = data.movespeed

	createBar("#HeroHpBar", "hp_bar", "#30bf30", data.hp, 0);
	createBar("#HeroMpBar", "mp_bar", "#30bf30", data.mp, 90);

	if (data.exp){
		levelData = getLevelAndRemainderXP(data.exp);
		exp_bar.style.width = levelData.percent + '%';
		$("#HeroLevelLabel").text = $.Localize('#level') + ": " + data.level + " (" + data.resets + ")" 
	}

    $.Schedule(0.5, () => {
        imagePanel.style.backgroundImage = "url('file://{images}/pick_menu/bg"+key+".png')"
        imagePanel.RemoveClass("hidden");
    });
	
	PickButton.SetPanelEvent("onmouseactivate", function () {
		pick_hero(data.hero_name);
	});
}

function createBar(containerId, barId, color, value, deg) {
    let bar = $.CreatePanel("DOTAScenePanel", $(containerId), barId, {
        class: barId,
        camera: "camera_1",
        particleonly: "false",
        map: "maps/scenes/hud/healthbarburner.vmap",
        hittest: "false"
    });
    bar.style.hueRotation = deg+"deg";
    bar.style.width = "100%";
    bar.style.height = "20px";
    bar.style.backgroundColor = color;

    let label = $.CreatePanel("Label", $(containerId), "", {class:'hpmp_labels'});
    label.text = value;
}

function findKeyByName(heroes, targetName) {
    for (const key in heroes) {
        if (heroes[key].name === targetName) {
            return key;
        }
    }
    return null
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

	if (level == 400){
		return { level: 400, percent: 0 };
	}

    return { level: 0, percent: 0 };
}

function pick_hero(name){
	PickContainer.visible = false;
	GameEvents.SendCustomGameEventToServer("pick_hero", {hero_name:name})
}

(function() {
	init_pick()
	GameEvents.Subscribe("hero_show_pick", hero_show_pick)
})();





