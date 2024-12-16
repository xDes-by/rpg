var InventoryPanel = $("#InventoryPanel")
$("#InventoryPanelContent").SetHasClass('CloseInventory', true)
InventoryPanel.visible = true 

var percent = ['lifesteal', 'magic_lifesteal', 'reflect', 'spell_amplify', 'magic_desolator', 'hp_regen', 'pants', 'shield', 'manacost', 'hp_regen_amp', 'crit', 'multicast'];
var int_num = ['helm', 'pants', 'weapon'];

var current_selected_player = null // Выбранный текущий герой
var default_inventory_slots = 72 // Дефолтное количество слотов
var is_local_inventory = true // локальный ли инвентарь
var EQUIP_ITEMS_TYPES = ["helm", "armor", "gloves", "pants", "boots", "weapon", "shield", "ring", "ring_2", "pendant"] // Первая колонка слотов, в которые можно надевать предметы
var TABLE_HERO = null
var NAME;
var decription_attributes = CustomNetTables.GetTableValue( "set_attributes", 'set_attributes');
var boost_attributes = CustomNetTables.GetTableValue( "boost_attributes", 'boost_attributes');

function Open()
{	
    $("#InventoryPanelContent").ToggleClass("CloseInventory")
    if (!$("#InventoryPanelContent").BHasClass("CloseInventory"))
    {
		GameEvents.SendCustomGameEventToServer("Get_hero_inventory", {})
    }
}

function UpdateInventoryMain(data)
{
    NAME = Entities.GetUnitName(Players.GetPlayerHeroEntityIndex(Players.GetLocalPlayer()))
    $("#ZenCount").text = data.stats.zen

	TABLE_HERO = data

	current_selected_player = Players.GetLocalPlayerPortraitUnit()
    $("#InventorySlots").RemoveAndDeleteChildren()
	UpdateInventorySlots()
	UpdateInventoryItems()

    EquipCreateSlots()
    UpdateEquipItems()
	// update_description()
}

EquipCreateSlots()

function EquipCreateSlots(){
    $("#EquipMain").RemoveAndDeleteChildren()
    for (let i = 0; i < EQUIP_ITEMS_TYPES.length; i++)
    {
        CreateSlotEquip(i, $("#EquipMain"), EQUIP_ITEMS_TYPES[i])
    }
}

function CreateSlotEquip(i, main, type_name) // Создание слота для экипировки
{
    let equip_slot_main = $.CreatePanel("Panel", main, type_name)
    equip_slot_main.AddClass("equip_slot_main")

    let equip_slot = $.CreatePanel("Panel", equip_slot_main, "equip_slot_"+type_name)
    equip_slot.AddClass("equip_slot")
	equip_slot.style.backgroundImage = "url('file://{resources}/images/inventory/"+type_name+".png')";
	equip_slot.style.backgroundSize = "100%"
	
	equip_slot.SetPanelEvent("onmouseover", onAbilityMouseOver.bind(this, equip_slot));
	equip_slot.SetPanelEvent("onmouseout", onAbilityMouseOut.bind(this, equip_slot));

    equip_slot.SetDraggable(true)
    equip_slot.is_slot = true
    equip_slot.hittestchildren = false
    equip_slot.is_quip_slot = true
    equip_slot.type_slot = type_name

    $.RegisterEventHandler( 'DragStart', equip_slot, OnDragStart );
    $.RegisterEventHandler( 'DragEnd', equip_slot, OnDragEnd );
    $.RegisterEventHandler( 'DragEnter', equip_slot, OnDragEnter );
    $.RegisterEventHandler( 'DragDrop', equip_slot, OnDragDrop );
    $.RegisterEventHandler( 'DragLeave', equip_slot, OnDragLeave );
}

UpdateInventorySlots()

function UpdateInventorySlots() // Апдейт количество слотов, если вдруг у игроков они разные
{
    for (let i = 1; i <= default_inventory_slots; i++)
    {
        CreateSlot(i)
    }
}

function CreateSlot(i) // Создание слота для инвентаря
{
    let inventory_slot = $.CreatePanel("Panel", $("#InventorySlots"), "inventory_slot_"+i)
    inventory_slot.AddClass("inventory_slot")
	
	inventory_slot.SetPanelEvent("onmouseover", onAbilityMouseOver.bind(this, inventory_slot));
	inventory_slot.SetPanelEvent("onmouseout", onAbilityMouseOut.bind(this, inventory_slot));
	
    inventory_slot.SetDraggable(true)
    inventory_slot.is_slot = true
    inventory_slot.hittestchildren = false
    inventory_slot.slot_count = i
    inventory_slot.is_inventory_slot = true
    $.RegisterEventHandler( 'DragStart', inventory_slot, OnDragStart );
    $.RegisterEventHandler( 'DragEnd', inventory_slot, OnDragEnd );
    $.RegisterEventHandler( 'DragEnter', inventory_slot, OnDragEnter );
    $.RegisterEventHandler( 'DragDrop', inventory_slot, OnDragDrop );
    $.RegisterEventHandler( 'DragLeave', inventory_slot, OnDragLeave );
}


function UpdateInventoryItems() // Апдейт всех предметов инвентаря
{
    var inventory_list = TABLE_HERO.stats.user_inventory
    for (let i = 0; i <= Object.keys(inventory_list).length; i++)
    {
        if (Object.keys(inventory_list)[i] != null)
        {	
            let inventory_key_slot = Object.keys(inventory_list)[i]
            let item_info = inventory_list[inventory_key_slot]
            if (item_info != null)
            {
                let item_name = item_info.name
                let item_type = item_info.type
                let item_attributes = item_info.attributes
                let item_icon = item_info.set_name + " " + item_info.item_type
                
                let find_slot = $("#InventorySlots").FindChildTraverse("inventory_slot_"+inventory_key_slot)
    
                let item_panel = $.CreatePanel("Panel", find_slot, "")
                item_panel.AddClass("item_panel")
                
                // $.Msg(item_info)

				if (item_info.item_class == 'jewel'){
                    
					item_panel.style.backgroundImage = "url('file://{resources}/images/inventory/item_"+item_info.item_type+".png')";
				}else{
					item_panel.style.backgroundImage = "url('file://{resources}/images/items/"+ item_info.set_name + " " + item_info.item_type + ".png')";
				}

                item_panel.style.backgroundSize = "100%"
                item_panel.item_icon = item_icon
                item_panel.hittest = false
                find_slot.item_in_slot = item_panel
            }
        }
    }
}

function UpdateEquipItems() // Обновить экипированные предметы
{
    var equip_list = PLAYER_HERO_ENQUIP = TABLE_HERO.heroes[NAME].hero_enquip
    for (let i = 0; i <= Object.keys(equip_list).length; i++)
    {
        if (Object.keys(equip_list)[i] != null)
        {
            let equip_slot_name = Object.keys(equip_list)[i]
            let item_info = equip_list[equip_slot_name]
			let find_slot = $("#EquipMain").FindChildTraverse("equip_slot_"+equip_slot_name)
            if (item_info != null)
            {
                let item_name = item_info.name
                let item_type = item_info.type
                let item_attributes = item_info.attributes
                let item_icon = item_info.set_name + " " + item_info.item_type
                
                let item_panel = $.CreatePanel("Panel", find_slot, "")
                item_panel.AddClass("item_panel")
				item_panel.style.backgroundImage = "url('file://{resources}/images/items/"+ item_info.set_name + " " + item_info.item_type + ".png')";
                item_panel.style.backgroundSize = "100%"
                item_panel.item_icon = item_icon
                item_panel.hittest = false
                find_slot.item_in_slot = item_panel
            }
        }
    } 
}

function send_update_hero(){
	let player_id = Entities.GetPlayerOwnerID(current_selected_player)
    if (player_id == Players.GetLocalPlayer()){
		GameEvents.SendCustomGameEventToServer("update_hero_inventory", {data:TABLE_HERO})
	}
}

function OnDragStart( panelId, dragCallbacks )
{
	onAbilityMouseOut(panelId) 
    // Если нет предмета в слоте
    if (panelId.item_in_slot == null)
    {
        return
    }
    // Если инвентарь не локального игрока
    if (!is_local_inventory)
    {
        return
    }
	
	var displayPanel = $.CreatePanel( "Panel", $.GetContextPanel(), "dragImage" );
    displayPanel.AddClass("dragImage")
	displayPanel.style.backgroundImage = "url('file://{resources}/images/items/" + panelId.item_in_slot.item_icon + ".png')";
    displayPanel.style.backgroundSize = "100%"
    displayPanel.original_slot = panelId;
	dragCallbacks.displayPanel = displayPanel;
	dragCallbacks.offsetX = 0;
	dragCallbacks.offsetY = 0;
	return true;
}

function OnDragEnd( panelId, draggedPanel )
{
	draggedPanel.DeleteAsync( 0 );
	return true;
} 

function OnDragEnter( panelId, draggedPanel )
{
	return true;
}

function OnDragLeave( panelId, draggedPanel )
{
	return true;
}

function OnDragDrop( panelId, draggedPanel )
{
    let new_panel = panelId // Куда перенес
    let old_panel = draggedPanel.original_slot // Откуда перенес
	
	// Если инвентарь не локального игрока
    if (!is_local_inventory)
    {
        return
    }
	
    // Если перенос не в слот для предмета
    if (new_panel.is_slot == null)
    {
        return
    }

    // Если перносимый предмет вернулся в ту же ячейку
    if (new_panel == old_panel)
    {
        return
    }

    if (!old_panel.GetChild(0)){
        return
    }
    
    let old_panel_item = old_panel.GetChild(0) // Переносимый итем
    let new_panel_item = panelId.GetChild(0) // Есть ли уже предмет в переносимом слоте

    // Если перенос из инвентаря в инвентарь
    if (new_panel.is_inventory_slot != null && old_panel.is_inventory_slot != null)
    {
        SwapItemsInventoryOnly(old_panel, new_panel, old_panel_item, new_panel_item)
    }
    // Если перенос из инвентаря в слот экипировки
    else if (new_panel.is_quip_slot != null && old_panel.is_inventory_slot != null)
    {
        SwapItemsFromInventoryToEquip(old_panel, new_panel, old_panel_item, new_panel_item)
    }
    // Если перенос из экипировки в инвентарь
    else if (new_panel.is_inventory_slot != null && old_panel.is_quip_slot != null)
    {
        SwapItemsFromEquipToInventory(old_panel, new_panel, old_panel_item, new_panel_item)
    }

	return true;
}

function SwapItemsInventoryOnly(old_panel, new_panel, old_panel_item, new_panel_item) // Если перенос из инвентаря в инвентарь
{
    // Номера слотов
    let old_slot_num = old_panel.slot_count
    let new_slot_num = new_panel.slot_count

    // Информация слотов
    let old_item_info = TABLE_HERO.stats.user_inventory[old_slot_num]
    let new_item_info = TABLE_HERO.stats.user_inventory[new_slot_num]

    // Перенос предмета
    old_panel_item.SetParent(new_panel)
    new_panel.item_in_slot = old_panel_item

    // Если уже в новом слоте был итем
    if (new_panel_item != null)
    {
        new_panel_item.SetParent(old_panel)
        old_panel.item_in_slot = new_panel_item
    }
    else
    {
        old_panel.item_in_slot = null
    }

    // Апдейт массива
    TABLE_HERO.stats.user_inventory[old_slot_num] = new_item_info
    TABLE_HERO.stats.user_inventory[new_slot_num] = old_item_info
	send_update_hero()
}

function SwapItemsFromEquipToInventory(old_panel, new_panel, old_panel_item, new_panel_item)
{
    let new_slot_num = new_panel.slot_count
    let old_slot_type = old_panel.type_slot
    
    if (TABLE_HERO.stats.user_inventory[new_slot_num] != null) // Если слот занят
    {
        return
    }

    // Перенос предмета
    old_panel_item.SetParent(new_panel)
    new_panel.item_in_slot = old_panel_item
    old_panel.item_in_slot = null

    let old_item_info = TABLE_HERO.heroes[NAME].hero_enquip[old_slot_type]
	
    TABLE_HERO.stats.user_inventory[new_slot_num] = old_item_info
    TABLE_HERO.heroes[NAME].hero_enquip[old_slot_type] = null
	send_update_hero()
}

function SwapItemsFromInventoryToEquip(old_panel, new_panel, old_panel_item, new_panel_item)
{
    let old_slot_num = old_panel.slot_count
    let new_slot_type = new_panel.type_slot
    let old_item_info = TABLE_HERO.stats.user_inventory[old_slot_num]
	
    if (old_item_info.item_type != new_slot_type) // Если не тот тип экипировки
    {
        return
    }
	
    if (TABLE_HERO.heroes[NAME].hero_enquip[new_slot_type] != null) // Если слот занят
    {
        return
    }
	

	if (!can_enquip(old_item_info)){
		GameEvents.SendEventClientSide("dota_hud_error_message", {"splitscreenplayer": 0, "reason": 80, "message": "#cant_enquip"})
		return false
	}
	
	
    old_panel_item.SetParent(new_panel)
    new_panel.item_in_slot = old_panel_item
    old_panel.item_in_slot = null

    TABLE_HERO.heroes[NAME].hero_enquip[new_slot_type] = old_item_info
    TABLE_HERO.stats.user_inventory[old_slot_num] = null
	send_update_hero()
}


function can_enquip(item){
	var all_items_data = GameUI.CustomUIConfig().Items
	var HeroClass = GameUI.CustomUIConfig().HeroClass
	var hero = Players.GetPlayerSelectedHero(Players.GetLocalPlayer())
	var hero_class = HeroClass[hero]['class'];
	var can_use = all_items_data[item.item_class][item.set_name]['class'];
	var item_stats = all_items_data[item.item_class][item.set_name]['items'][item.item_type]['stats'][item.level]
	var data = CustomNetTables.GetTableValue("hero_hud_stats", Players.GetLocalPlayer());
	
	if (data.str < item_stats.required_str || data.agi < item_stats.required_agi){
		return false
	}
	
	if (!can_use.includes(hero_class)) {
		return false
	}
	return true
}


function showTooltip(panel, data) {
    if (data) {
        let params = `&item_data=` + JSON.stringify(data);
        $.DispatchEvent("UIShowCustomLayoutParametersTooltip", panel, "SetCreepTooltip", "file://{resources}/layout/custom_game/custom_tooltip/custom_tooltip.xml", params);
    }
}

function onAbilityMouseOver(panel) {
    if (panel.type_slot) {
        let data = TABLE_HERO.heroes[NAME].hero_enquip[panel.type_slot];
        showTooltip(panel, data);
    }
    
    if (panel.slot_count) {
        let data = TABLE_HERO.stats.user_inventory[panel.slot_count];
        showTooltip(panel, data);
    }
}

function onAbilityMouseOut(panel) {
	$.DispatchEvent("UIHideCustomLayoutTooltip", panel, "SetCreepTooltip");
}




(function() {
	GameUI.CustomUIConfig.OpenInventory = Open;
   	GameEvents.Subscribe("UpdateInventoryMain", UpdateInventoryMain)
})();
