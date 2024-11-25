var fraction_container = $('#fraction_container');
var pick_panel = $('#pick_panel');
var hero_scene_panels = [];

particles = {
	ice:['particles/pick_particles/ice.vpcf'],
	fire:['particles/pick_particles/fire.vpcf'],
	poison:['particles/pick_particles/poison.vpcf'],
	humans:['particles/pick_particles/human.vpcf'],
	darkness:['particles/pick_particles/darkness.vpcf'],
	undead:['particles/pick_particles/undead.vpcf'],
	nature:['particles/pick_particles/nature.vpcf'],
}

const fractions = {
    ice: [
        'npc_dota_hero_drow_ranger', 
        'npc_dota_hero_winter_wyvern',
        'npc_dota_hero_tusk',
        'npc_dota_hero_crystal_maiden',
        'npc_dota_hero_ancient_apparition',
        'npc_dota_hero_lich'
    ],
    fire: [
        'npc_dota_hero_lina', 
        'npc_dota_hero_ember_spirit',
        'npc_dota_hero_phoenix',
        'npc_dota_hero_batrider',
        'npc_dota_hero_huskar',
        'npc_dota_hero_snapfire'
    ],
	poison: [
        'npc_dota_hero_venomancer', 
        'npc_dota_hero_viper',
        'npc_dota_hero_queenofpain',
        'npc_dota_hero_dazzle',
        'npc_dota_hero_sand_king',
        'npc_dota_hero_witch_doctor'
    ],
    humans: [
        'npc_dota_hero_omniknight', 
        'npc_dota_hero_keeper_of_the_light',
        'npc_dota_hero_sniper',
        'npc_dota_hero_dragon_knight',
        'npc_dota_hero_mars',
        'npc_dota_hero_sven'
    ],
    darkness: [
        'npc_dota_hero_nevermore', 
        'npc_dota_hero_doom_bringer',
        'npc_dota_hero_terrorblade',
        'npc_dota_hero_abaddon',
        'npc_dota_hero_shadow_demon',
        'npc_dota_hero_abyssal_underlord'
    ],
    undead: [
        'npc_dota_hero_necrolyte', 
        'npc_dota_hero_pudge',
        'npc_dota_hero_life_stealer',
        'npc_dota_hero_undying',
        'npc_dota_hero_muerta',
        'npc_dota_hero_skeleton_king'
    ],
    nature: [
        'npc_dota_hero_beastmaster', 
        'npc_dota_hero_treant',
        'npc_dota_hero_enchantress',
        'npc_dota_hero_wisp',
        'npc_dota_hero_leshrac',
        'npc_dota_hero_hoodwink'
    ],
};

const FRACTION_ANGLE_STEP = (2 * Math.PI) / Object.keys(fractions).length;
const ANGLE_OFFSET = Math.PI / 2;
const MAIN_RADIUS = 380;
const HEROES_RADIUS = 100;

Object.entries(fractions).forEach(([fraction, heroes], index) => {
    const panel = $.CreatePanel('Panel', fraction_container, fraction);
    panel.AddClass('cart');
	
	

    const fractionAngle = FRACTION_ANGLE_STEP * index - ANGLE_OFFSET;
    const xPos = Math.cos(fractionAngle) * MAIN_RADIUS + MAIN_RADIUS;
    const yPos = Math.sin(fractionAngle) * MAIN_RADIUS + MAIN_RADIUS;

    panel.style.position = `${xPos}px ${yPos}px 0px`;
	
	let fraction_effect = $.CreatePanel("DOTAParticleScenePanel", panel, "", {	particleName:particles[fraction],
																				renderdeferred:"true",
																				particleonly:"false",
																				startActive:"true",
																				cameraOrigin:"160 0 0",
																				lookAt:"0 0 0",
																				fov:"50"})
	fraction_effect.AddClass("fraction_effect")

    const heroAngleStep = (2 * Math.PI) / heroes.length;

    heroes.forEach((hero, heroIndex) => {
        heroPanel = $.CreatePanel("DOTAHeroImage", panel, hero);
		heroPanel.heroname = hero;	
		heroPanel.heroimagestyle="portrait"
        heroPanel.AddClass('hero');
		
		heroPanel.SetPanelEvent("onmouseactivate", function () {
			ShowHero(hero);
		});
				
        const heroAngle = heroAngleStep * heroIndex;
        const heroXPos = Math.cos(heroAngle) * HEROES_RADIUS + HEROES_RADIUS;
        const heroYPos = Math.sin(heroAngle) * HEROES_RADIUS + HEROES_RADIUS;

        heroPanel.style.position = `${heroXPos}px ${heroYPos}px 0px`;
		
		panel_hero_back = $.CreatePanel("Panel", panel, hero+"_back");
		panel_hero_back.AddClass('hero_back');
		panel_hero_back.hittest = false;

        panel_hero_back.style.position = `${heroXPos}px ${heroYPos}px 0px`;
    });
});


function ShowHero(hero){
	if (hero_scene_panels[hero]) {
		for (var key in hero_scene_panels) {
			hero_scene_panels[key].visible = false;
		}
		hero_scene_panels[hero].visible = true;
	} else {
		for (var key in hero_scene_panels) {
			hero_scene_panels[key].visible = false;
		}
		var heroImagePanel = $.CreatePanel("DOTAScenePanel", pick_panel, "scene_" + hero, {
			class: "SceneLoaded",
			unit: hero,
			particleonly: false,
			allowrotation: true,
			// map:'maps/ui/dota_hud_loadout_2022.vmap',
			// camera:'default_camera',
			// cameraOrigin:"1000 0 0",
			drawbackground: "false",
			hittest : "true"
		});
		heroImagePanel.AddClass("pick_scene")
		heroImagePanel.visible = true;
		hero_scene_panels[hero] = heroImagePanel;
	}
}

           