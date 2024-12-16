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

function updateBar(bar, container, width, color, map) {
    if (!bar) {
        bar = $.CreatePanel('DOTAScenePanel', container, '', {
            class: 'RegenBurner',
            camera: 'camera_1',
            particleonly: 'false',
            map: map,
            hittest: 'false',
        });
        bar.style.width = width;
        bar.style.height = '100%';
        bar.style.backgroundColor = color;
    }
    return bar;
}

function updateStatLabel(id, value, suffix = '') {
    const label = $(id);
    if (label) {
        label.text = value.toFixed(0) + suffix;
    }
}

//поменять все на просто локального игрока, а не привязка к юниту

function main() {
    current_selected_player = Players.GetLocalPlayerPortraitUnit();
    const playerId = Entities.GetPlayerOwnerID(current_selected_player);
    const isRealHero = Entities.IsRealHero(current_selected_player);
    const isLocalPlayer = playerId === Players.GetLocalPlayer();

    if (isRealHero && isLocalPlayer) {
        const data = CustomNetTables.GetTableValue('hero_hud_stats', playerId);

        if (data) {
            ButtonStatsEffect.visible = data.points > 0;

            // $.Msg(data)

            hero_show_stats(data)

            const levelData = getLevelAndRemainderXP(data.exp);

            updateStatLabel('#DamageLabel', data.min_damage, ' - ' + data.max_damage);
            updateStatLabel('#AttackSpeedLabel', data.speed, '.1');
            updateStatLabel('#ArmorLabel', data.armor);
            updateStatLabel('#MoveSpeedLabel', data.movespeed);
            updateStatLabel('#StrLabel', data.str);
            updateStatLabel('#AgiLabel', data.agi);
            updateStatLabel('#VitLabel', data.vit);
            updateStatLabel('#EngLabel', data.eng);

            HpBar = updateBar(HpBar, $('#HpBar'), '70%', '#fc1919', 'maps/hp_bar.vmap');
            MpBar = updateBar(MpBar, $('#MpBar'), '70%', '#006eeb', 'maps/mp_bar.vmap');
            ExpBar = updateBar(ExpBar, $('#ExpBar'), '7%', 'gold', 'maps/scenes/hud/healthbarburner.vmap');
        }

        ButtonStats.visible = true;
        ButtonInventory.visible = true;
        ExpBarContainer.visible = true;

        ['#str_stats', '#agi_stats', '#vit_stats', '#eng_stats'].forEach((id) => {
            $(id).visible = true;
        });
    } else {
        ButtonStats.visible = false;
        ButtonInventory.visible = false;
        ExpBarContainer.visible = false;
        ButtonStatsEffect.visible = false;

        updateStatLabel('#DamageLabel', Entities.GetDamageMin(current_selected_player), ' - ' + Entities.GetDamageMax(current_selected_player));
        updateStatLabel('#AttackSpeedLabel', Entities.GetAttackSpeed(current_selected_player));
        updateStatLabel('#ArmorLabel', Entities.GetBonusPhysicalArmor(current_selected_player));
        updateStatLabel('#MoveSpeedLabel', Entities.GetBaseMoveSpeed(current_selected_player));

        ['#str_stats', '#agi_stats', '#vit_stats', '#eng_stats'].forEach((id) => {
            $(id).visible = false;
        });
    }

    if (HpBar) {
        HpBar.style.width = Entities.GetHealthPercent(current_selected_player) + '%';
        updateStatLabel('#HpLabel', Entities.GetHealth(current_selected_player), ' / ' + Entities.GetMaxHealth(current_selected_player));
    }

    if (MpBar) {
        const maxMana = Math.max(Entities.GetMaxMana(current_selected_player), 1);
        const currentMana = Math.max(Entities.GetMana(current_selected_player), 0);
        const manaPercent = (currentMana / maxMana) * 100;

        MpBar.style.width = manaPercent + '%';
        updateStatLabel('#MpLabel', Entities.GetMana(current_selected_player), ' / ' + Entities.GetMaxMana(current_selected_player));
    }

    if (ExpBar) {
        const levelData = getLevelAndRemainderXP(CustomNetTables.GetTableValue('hero_hud_stats', playerId)?.exp || 0);
        ExpBar.style.width = levelData.percent + '%';
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

    if (level == 400){
		return { level: 400, percent: 0 };
	}

    return { level: 0, percent: 0 };
}

// -------------------------------------------------------------------------------

var invopened = false;
var player_stats_menu_main = $("#player_stats_menu_main")


function OpenStatsMenu() {
	invopened = !invopened
	player_stats_menu_main.SetHasClass("open_stats_menu", invopened)
}

function hero_show_stats(data){
    var HeroClass = GameUI.CustomUIConfig().HeroClass
    var hero_class = HeroClass[data.hero_name]['class'];

    player_stats_menu_main.FindChildTraverse("free_points_count_label").text = $.Localize('#free_points')+ ": "+ data.points

    player_stats_menu_main.FindChildTraverse("HeroName").text = $.Localize('#'+ data.hero_name)
    player_stats_menu_main.FindChildTraverse("HeroClass").text = $.Localize('#'+ hero_class)
    player_stats_menu_main.FindChildTraverse("HeroLevel").text = $.Localize('#level') + ": " + data.level + " (" + data.resets + ")" 
    player_stats_menu_main.FindChildTraverse("stats_panels_label_str").text = data.str

    player_stats_menu_main.FindChildTraverse("stats_panels_label_str").text = data.str
	player_stats_menu_main.FindChildTraverse("stats_panels_label_agi").text = data.agi
	player_stats_menu_main.FindChildTraverse("stats_panels_label_vit").text = data.vit
	player_stats_menu_main.FindChildTraverse("stats_panels_label_eng").text = data.eng    

    var effects = player_stats_menu_main.FindChildrenWithClassTraverse("full")
    effects.forEach((id) => {
        id.visible = data.points > 0 ? true : false
    });
}

function AddPoints(data){
	GameEvents.SendCustomGameEventToServer("hero_add_stats", {type:data});
}

function OpenInventory(){
	GameUI.CustomUIConfig.OpenInventory();
}

function OpenTeleport(){
	GameUI.CustomUIConfig.OpenTeleport();
}

(function() {
	main();
})();





