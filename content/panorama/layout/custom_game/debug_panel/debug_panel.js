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