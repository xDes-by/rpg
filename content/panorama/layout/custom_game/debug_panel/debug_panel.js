var DebugPanel = $("#DebugPanel");
var CreepPool = $("#CreepPool");
debug_vision = false
creep_pool_vision = false
CreepPool.visible = false
DebugPanel.visible = false

function Open(){
    
    debug_vision = !debug_vision
    DebugPanel.visible = debug_vision
    if (debug_vision == true){
        creep_pool_vision = false
        CreepPool.visible = false
    }
}

function ShowCreepPool() {
    
    creep_pool_vision = !creep_pool_vision
    CreepPool.visible = creep_pool_vision
    var Creeps = GameUI.CustomUIConfig().Creeps
    CreepPool.RemoveAndDeleteChildren()

    for (const zone in Creeps) {
        const monstersDict = Creeps[zone];
    
        const label = $.CreatePanel("Label", CreepPool, zone, {class : 'creep_zone_label'});
        label.text = zone

        for (const monsterName in monstersDict) {
            const label = $.CreatePanel("Label", CreepPool, monsterName, {class : 'creep_label'});
            label.text = monsterName;
            label.SetPanelEvent('onactivate', () => choise_creep(monsterName, zone));
        }
    }
}

function choise_creep(creep, zone){
    $("#CreateUnitName").text = creep
    $("#CreateUnitName").zone = zone
    ShowCreepPool()
}

function CreateUnitButton(){
    var text = $("#CreateUnitName").text
    var zone = $("#CreateUnitName").zone
    if (text != 'Нажми для выбора'){
        GameEvents.SendCustomGameEventToServer("spawn_creep", {creep_name:text, zone:zone})
    }
}

function up_hero(){
    GameEvents.SendCustomGameEventToServer("up_hero", {})
}

var min = 0.2;
var max = 1;
var offset = 0;
var STEP = 0.1;

var start_pos;
var current_offset_x = 0; // Текущее смещение по X
var current_offset_y = 0; // Текущее смещение по Y

// Ограничения на смещение
var max_offset_x = 2000; // Максимальное смещение по X
var min_offset_x = -2000; // Минимальное смещение по X
var max_offset_y = 2000; // Максимальное смещение по Y
var min_offset_y = -2000; // Минимальное смещение по Y

function fun(eventType, clickBehavior) {
    if (eventType === 'pressed') {
        start_pos = GameUI.GetCursorPosition();
    }

    if (eventType === 'wheeled') {
        if (clickBehavior > 0) {
            if ((1 + offset + STEP) <= max) {
                offset += STEP;
            }
        } else {
            if ((1 + offset - STEP) >= min) {
                offset -= STEP;
            }
        }

        // $.Msg(offset)
        $("#test2").style.transform = "scale3D(" + (1 + offset) + ", " + (1 + offset) + ", " + (1 + offset) + ")";

        if (offset < -0.75){
            $("#test2").SetPositionInPixels(0, 0, 20);
        }
    }
}

GameUI.SetMouseCallback(fun);

function Think() {
    if (GameUI.IsMouseDown(0)) {
        const t = GameUI.GetCursorPosition();
        var ofx = start_pos[0] - t[0];
        var ofy = start_pos[1] - t[1];

        // Рассчитываем новое смещение
        var new_offset_x = current_offset_x - ofx;
        var new_offset_y = current_offset_y - ofy;

        new_offset_x = Math.max(min_offset_x* (0.8+offset), Math.min(max_offset_x * (0.8+offset), new_offset_x));
        new_offset_y = Math.max(min_offset_y* (0.8+offset), Math.min(max_offset_y* (0.8+offset), new_offset_y));

        // Обновляем позицию элемента
        $("#test2").SetPositionInPixels(new_offset_x, new_offset_y, 20);

        // Сохраняем текущее смещение
        current_offset_x = new_offset_x;
        current_offset_y = new_offset_y;

        // Обновляем позицию курсора для следующего кадра
        start_pos = t;
    }
    $.Schedule(0.01, Think);
}

Think();


var parentPanel = $("#test2");

function createPanel(x, y, size, color) {
    var panel = $.CreatePanel("Panel", parentPanel, "");
    panel.style.marginTop = x-size/2 + "px";
    panel.style.marginLeft = y-size/2 + "px";
    panel.style.width = size+"px"; // Размер точки
    panel.style.height = size+"px"; // Размер точки
    panel.style.backgroundColor = color; // Цвет точки
    panel.style.borderRadius = "50%"; // Круглая форма
}

function createPattern() {
    var points = [
        { x: 2000, y: 2000, size: 50, id: 1, color: 'blue' },
        { x: 2000, y: 1800, size: 50, id: 2, color: 'red' },
        { x: 1820, y: 1900, size: 50, id: 3, color: 'yellow' },
        { x: 2180, y: 1900, size: 50, id: 4, color: 'violet' },
        { x: 2180, y: 2100, size: 50, id: 5, color: 'purple' },
        { x: 2000, y: 2200, size: 50, id: 7, color: 'white' },
        { x: 1820, y: 2100, size: 50, id: 8, color: 'black' },
		
		///////////////////// TOP ////////////////////////////
		
        { x: 1650, y: 2000, size: 50, id: 9, color: 'yellow'},
        { x: 1470, y: 2000, size: 50, id: 10, color: 'yellow'},
        { x: 1560, y: 1950, size: 50, id: 11, color: 'yellow'},
        { x: 1560, y: 2050, size: 50, id: 10, color: 'yellow'},
		
        { x: 1340, y: 2000, size: 50, id: 12, color: 'yellow'},
        { x: 1320, y: 1890, size: 50, id: 13, color: 'yellow'},
        { x: 1250, y: 1800, size: 50, id: 14, color: 'yellow'},
        { x: 1320, y: 2110, size: 50, id: 15, color: 'yellow'},
        { x: 1250, y: 2200, size: 50, id: 16, color: 'yellow'},
		
        { x: 1075, y: 2155, size: 50, id: 16, color: 'yellow'},
        { x: 975, y: 2205, size: 50, id: 16, color: 'yellow'},
        { x: 875, y: 2155, size: 50, id: 16, color: 'yellow'},
        { x: 730, y: 2110, size: 50, id: 16, color: 'yellow'},
        { x: 730, y: 2240, size: 50, id: 16, color: 'yellow'},
        { x: 730, y: 2370, size: 50, id: 16, color: 'yellow'},
        { x: 730, y: 2490, size: 50, id: 16, color: 'yellow'},
        { x: 730, y: 2720, size: 50, id: 16, color: 'yellow'},
        { x: 630, y: 2660, size: 50, id: 16, color: 'yellow'},
        { x: 830, y: 2660, size: 50, id: 16, color: 'yellow'},
        { x: 630, y: 2550, size: 50, id: 16, color: 'yellow'},
        { x: 830, y: 2550, size: 50, id: 16, color: 'yellow'},
		
        { x: 600, y: 2000, size: 50, id: 16, color: 'yellow'},
		
        { x: 495, y: 2055, size: 50, id: 16, color: 'yellow'},
        { x: 300, y: 2055, size: 50, id: 16, color: 'yellow'},
        { x: 395, y: 2110, size: 50, id: 16, color: 'yellow'},
        { x: 415, y: 2215, size: 50, id: 16, color: 'yellow'},
        { x: 375, y: 2325, size: 50, id: 16, color: 'yellow'},
        { x: 315, y: 2415, size: 50, id: 16, color: 'yellow'},
		
		{ x: 1075, y: 1845, size: 50, id: 16, color: 'yellow'},
        { x: 975, y: 1795, size: 50, id: 16, color: 'yellow'},
        { x: 875, y: 1845, size: 50, id: 16, color: 'yellow'},
        { x: 730, y: 1890, size: 50, id: 16, color: 'yellow'},
        { x: 730, y: 1760, size: 50, id: 16, color: 'yellow'},
        { x: 730, y: 1630, size: 50, id: 16, color: 'yellow'},
        { x: 730, y: 1510, size: 50, id: 16, color: 'yellow'},
        { x: 730, y: 1280, size: 50, id: 16, color: 'yellow'},
        { x: 630, y: 1340, size: 50, id: 16, color: 'yellow'},
        { x: 830, y: 1340, size: 50, id: 16, color: 'yellow'},
        { x: 630, y: 1450, size: 50, id: 16, color: 'yellow'},
        { x: 830, y: 1450, size: 50, id: 16, color: 'yellow'},
		
		{ x: 495, y: 1945, size: 50, id: 16, color: 'yellow'},
        { x: 300, y: 1945, size: 50, id: 16, color: 'yellow'},
        { x: 395, y: 1890, size: 50, id: 16, color: 'yellow'},
        { x: 415, y: 1785, size: 50, id: 16, color: 'yellow'},
        { x: 375, y: 1675, size: 50, id: 16, color: 'yellow'},
        { x: 315, y: 1585, size: 50, id: 16, color: 'yellow'},
		
		{ x: 1170, y: 2000, size: 100, id: 17, color: 'purple'},
        { x: 970, y: 2000, size: 100, id: 17, color: 'purple'},
        { x: 770, y: 2000, size: 100, id: 17, color: 'purple'},
        { x: 400, y: 2000, size: 100, id: 17, color: 'purple'},
        { x: 210, y: 2460, size: 100, id: 17, color: 'purple'},
        { x: 210, y: 1540, size: 100, id: 17, color: 'purple'},
        { x: 730, y: 1400, size: 100, id: 17, color: 'purple'},
        { x: 730, y: 2600, size: 100, id: 17, color: 'purple'},
		
		
		///////////////////// BOTTOM ////////////////////////////
		
        { x: 2515, y: 2000, size: 100, id: 17, color: 'purple'},
        { x: 2915, y: 2000, size: 100, id: 17, color: 'purple'},
        { x: 3450, y: 2000, size: 100, id: 17, color: 'purple'},
		{ x: 3640, y: 2460, size: 100, id: 17, color: 'purple'},
		{ x: 3640, y: 1540, size: 100, id: 17, color: 'purple'},
		{ x: 2730, y: 1540, size: 100, id: 17, color: 'purple'},
		{ x: 2730, y: 2460, size: 100, id: 17, color: 'purple'},		
		
		{ x: 2420, y: 1945, size: 50, id: 16, color: 'yellow'},
		{ x: 2420, y: 1845, size: 50, id: 16, color: 'yellow'},
		{ x: 2515, y: 1890, size: 50, id: 16, color: 'yellow'},
		{ x: 2515, y: 1790, size: 50, id: 16, color: 'yellow'},
		{ x: 2610, y: 1945, size: 50, id: 16, color: 'yellow'},
		{ x: 2610, y: 1845, size: 50, id: 16, color: 'yellow'},
		
		{ x: 2820, y: 1945, size: 50, id: 16, color: 'yellow'},
		{ x: 3010, y: 1945, size: 50, id: 16, color: 'yellow'},
		{ x: 2910, y: 1890, size: 50, id: 16, color: 'yellow'},
		{ x: 2910, y: 1890, size: 50, id: 16, color: 'yellow'},
		{ x: 2930, y: 1790, size: 50, id: 16, color: 'yellow'},
		{ x: 2890, y: 1680, size: 50, id: 16, color: 'yellow'},
		{ x: 2830, y: 1585, size: 50, id: 16, color: 'yellow'},
		
		{ x: 3120, y: 2000, size: 50, id: 16, color: 'yellow'},
		{ x: 3245, y: 2000, size: 50, id: 16, color: 'yellow'},
		
		{ x: 3350, y: 1945, size: 50, id: 16, color: 'yellow'},
		{ x: 3545, y: 1945, size: 50, id: 16, color: 'yellow'},
		{ x: 3445, y: 1890, size: 50, id: 16, color: 'yellow'},
		{ x: 3430, y: 1790, size: 50, id: 16, color: 'yellow'},
		{ x: 3470, y: 1680, size: 50, id: 16, color: 'yellow'},
		{ x: 3530, y: 1585, size: 50, id: 16, color: 'yellow'},
		
		
		
		
		
		
		
		
		

		

		
		// { x: 1740, y: 2445, size: 100, id: 17, color: 'purple'},
		// { x: 1240, y: 2400, size: 100, id: 17, color: 'purple'},
		// { x: 1540, y: 2790, size: 100, id: 17, color: 'purple'},
		// { x: 2030, y: 2855, size: 100, id: 17, color: 'purple'},
		// { x: 785, y: 3190, size: 100, id: 17, color: 'purple'},
		// { x: 1275, y: 3255, size: 100, id: 17, color: 'purple'},
		// { x: 1575, y: 3645, size: 100, id: 17, color: 'purple'},
		
		// { x: 1740, y: 1555, size: 100, id: 17, color: 'purple'},
		// { x: 1240, y: 1600, size: 100, id: 17, color: 'purple'},
		// { x: 1540, y: 1210, size: 100, id: 17, color: 'purple'},
		// { x: 2030, y: 1145, size: 100, id: 17, color: 'purple'},
		// { x: 785, y: 810, size: 100, id: 17, color: 'purple'},
		// { x: 1275, y: 745, size: 100, id: 17, color: 'purple'},
		// { x: 1575, y: 355, size: 100, id: 17, color: 'purple'},
		
		// { x: 2410, y: 1280, size: 100, id: 17, color: 'purple'},
		// { x: 2510, y: 1110, size: 100, id: 17, color: 'purple'},
		// { x: 2610, y: 940, size: 100, id: 17, color: 'purple'},
		// { x: 2800, y: 610, size: 100, id: 17, color: 'purple'},
		// { x: 2110, y: 600, size: 100, id: 17, color: 'purple'},
		// { x: 2500, y: 220, size: 100, id: 17, color: 'purple'},
		// { x: 3290, y: 675, size: 100, id: 17, color: 'purple'},
		// { x: 3160, y: 1205, size: 100, id: 17, color: 'purple'},
		
		// { x: 2410, y: 2720, size: 100, id: 17, color: 'purple'},
		// { x: 2510, y: 2890, size: 100, id: 17, color: 'purple'},
		// { x: 2610, y: 3060, size: 100, id: 17, color: 'purple'},
		// { x: 2800, y: 3390, size: 100, id: 17, color: 'purple'},
		// { x: 2110, y: 3400, size: 100, id: 17, color: 'purple'},
		// { x: 2500, y: 3780, size: 100, id: 17, color: 'purple'},
		// { x: 3290, y: 3325, size: 100, id: 17, color: 'purple'},
		// { x: 3160, y: 2795, size: 100, id: 17, color: 'purple'},
		
    ];
    points.forEach(function (point) {
        createPanel(point.x, point.y, point.size, point.color);
    });
}

createPattern();


// const talents = [
    // { id: 1, name: "Начало пути", cost: 1, requires: [] },
    // { id: 2, name: "Ледяной выстрел", cost: 1, requires: [1] },
    // { id: 3, name: "Критический удар", cost: 2, requires: [1] },
    // { id: 4, name: "Мастер заморозки", cost: 3, requires: [2] },
    // { id: 5, name: "Град стрел", cost: 3, requires: [2, 3] },
    // { id: 6, name: "Ледяной шторм", cost: 5, requires: [4, 5] }
// ];