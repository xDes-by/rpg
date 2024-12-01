var InventoryPanel = $("#InventoryPanel")
$("#InventoryPanelContent").SetHasClass('CloseInventory', true)
InventoryPanel.visible = true 

var percent = ['lifesteal', 'magic_lifesteal', 'reflect', 'spell_amplify', 'magic_desolator', 'hp_regen', 'legs', 'shield', 'manacost', 'hp_regen_amp', 'crit', 'multicast'];
var int_num = ['head', 'legs', 'weapon'];


--------------------------------ПОМЕНЯТЬ ВЕЗДЕ НА PANTS HELM

var current_selected_player = null // Выбранный текущий герой
var default_inventory_slots = 72 // Дефолтное количество слотов
var is_local_inventory = true // локальный ли инвентарь
var EQUIP_ITEMS_TYPES = ["helm", "armor", "gloves", "pants", "boots", "weapon", "shield", "ring", "ring_2", "pendant"] // Первая колонка слотов, в которые можно надевать предметы
var TABLE_HERO = null
var decription_attributes = CustomNetTables.GetTableValue( "set_attributes", 'set_attributes');
var boost_attributes = CustomNetTables.GetTableValue( "boost_attributes", 'boost_attributes');


$.Msg(decription_attributes)

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
	$.Msg(data)
	TABLE_HERO = data
	
	current_selected_player = Players.GetLocalPlayerPortraitUnit()
	
    $("#InventorySlots").RemoveAndDeleteChildren()
	UpdateInventorySlots()
	UpdateInventoryItems(TABLE_HERO.user_inventory)

    EquipCreateSlots()
    UpdateEquipItems(TABLE_HERO.hero_enquip)
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


function UpdateInventoryItems(inventory_list) // Апдейт всех предметов инвентаря
{
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
                let item_icon = item_info.set_type + "/" + item_info.item_type
                
                let find_slot = $("#InventorySlots").FindChildTraverse("inventory_slot_"+inventory_key_slot)
    
                let item_panel = $.CreatePanel("Panel", find_slot, "")
                item_panel.AddClass("item_panel")

				if (item_info.set_type == 'jewell'){
					item_panel.style.backgroundImage = "url('file://{resources}/images/sets/"+item_info.item_type+".png')";
				}else{
					$.Msg(item_info.item_type)
					// item_panel.style.backgroundImage = "url('file://{resources}/images/sets/" + item_info.set_type + "/" + item_info.item_type +".png')";
					item_panel.style.backgroundImage = "url('file://{resources}/images/inventory/boots.png')";
				}

                item_panel.style.backgroundSize = "100%"
                item_panel.item_icon = item_icon
                item_panel.hittest = false
                find_slot.item_in_slot = item_panel
            }
        }
    }
}

function UpdateEquipItems(equip_list) // Обновить экипированные предметы
{
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
                let item_icon = item_info.set_type + "/" + item_info.item_type
                
               
                let item_panel = $.CreatePanel("Panel", find_slot, "")
                item_panel.AddClass("item_panel")
                item_panel.style.backgroundImage = "url('file://{resources}/images/sets/" + item_info.set_type + "/" + item_info.item_type +".png')";
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
		// update_description()
		GameEvents.SendCustomGameEventToServer("update_hero_inventory", {data:TABLE_HERO})
	}
}























function CheckFullSet() {
    var data = TABLE_HERO.hero_enquip;
    var filledItems = 0;
    var setType = null;

    for (const itemKey in data) {
        const itemData = data[itemKey];
        if (itemData != null) {
            filledItems++;
            if (setType == null) {
                setType = itemData.set_type;
            } else if (setType !== itemData.set_type) {
                return false;
            }
        }
    }
    return filledItems === 6;
}

const can_use_sets = {
	1: {min: 1},
	2: {min: 4},
	3: {min: 8},
	4: {min: 12},
	5: {min: 16},
};
	
function update_description(){
	var data = TABLE_HERO.hero_enquip
	description_panel =	$("#QuipDescription")
	description_panel.RemoveAndDeleteChildren()

	const attributeSum = {};
	
	for (const itemKey in data) {
		const itemData = data[itemKey];
		if (itemData == null){
			continue
		}
		for (const attributesKey of ["bonus_attribute", "base_attribute"]) {
			const attributes = itemData[attributesKey];
			
			for (const attrKey in attributes) {
				const value = decription_attributes[attrKey]
				
				// if (GAME_DIFF < can_use_sets[itemData.set_number].min + 1) {
                    // continue;
                // }
				
				if (attributesKey == "base_attribute"){
					if (!attributeSum[attrKey]) {
						attributeSum[attrKey] = itemData.level * itemData.set_number * value
					}
				}else{
					if (!attributeSum[attrKey]) {
						attributeSum[attrKey] = value * itemData.set_number +  boost_attributes[attrKey][itemData.set_number] * (itemData.level - 1)
						// attributeSum[attrKey] = value + (itemData.set_number * 0.1 * itemData.level) - itemData.set_number * 0.1
					}else{
						attributeSum[attrKey] = attributeSum[attrKey] + value * itemData.set_number +  boost_attributes[attrKey][itemData.set_number] * (itemData.level - 1)
						// attributeSum[attrKey] = attributeSum[attrKey] + value + (itemData.set_number * 0.1 * itemData.level) - itemData.set_number * 0.1
					}
				// $.Msg(attributeSum[attrKey], attrKey)
				}
			}
		}
	}
	
	var simple_color = ['head', 'legs', 'armor', 'boots', 'weapon', 'shield'];
	
	for (const attrKey in attributeSum) {
		let label = $.CreatePanel("Label", description_panel, "")
		label.AddClass('font_desr')
		
		if (simple_color.includes(attrKey)){
			color = "gold"
		}else{
			color = '#00f704'
		}
		
		if (percent.includes(attrKey)){
			perc = '%'
		}else{
			perc = ''
		}
		if (int_num.includes(attrKey)){
			num = 0
		}else{
			num = 1
		}
		if (CheckFullSet()){
			mult = 2
		}else{
			mult = 1
		}
		
		label.text = $.Localize("#"+attrKey+"_description") + " " + (attributeSum[attrKey].toFixed(num) * mult) + perc
		label.style.color = color
		let hr = $.CreatePanel("Panel", description_panel, "hr") 
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
    displayPanel.style.backgroundImage = "url('file://{resources}/images/sets/" + panelId.item_in_slot.item_icon +".png')";
    // displayPanel.style.backgroundImage = 'url("' + panelId.item_in_slot.item_icon + '")';
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
	
	if (new_panel.id == 'InventoryDust')
    {
		let old_panel_item = old_panel.GetChild(0) // Переносимый итем
		dust_item(old_panel, new_panel, old_panel_item)
		return
    }
	
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

function dust_item(old_panel, new_panel, old_panel_item)
{
    let old_slot_num = old_panel.slot_count
    let old_item_info = TABLE_HERO['user_inventory'][old_slot_num]
	// $.Msg(old_item_info)  {"bonus_attribute":{},"base_attribute":{"armor":1},"item_type":"armor","set_type":"set_1","level":2,"set_number":1}
	old_panel_item.GetParent().RemoveAndDeleteChildren()
    old_panel.item_in_slot = null

    TABLE_HERO['user_inventory'][old_slot_num] = null
	
	Game.EmitSound("Hero_ObsidianDestroyer.projectileImpact")
	
	update_description()
	GameEvents.SendCustomGameEventToServer("update_hero_inventory", {data:TABLE_HERO, target:old_item_info}) //---------------------------------------DUST ITEM 
}

function SwapItemsInventoryOnly(old_panel, new_panel, old_panel_item, new_panel_item) // Если перенос из инвентаря в инвентарь
{
    // Номера слотов
    let old_slot_num = old_panel.slot_count
    let new_slot_num = new_panel.slot_count

    // Информация слотов
    let old_item_info = TABLE_HERO['user_inventory'][old_slot_num]
    let new_item_info = TABLE_HERO['user_inventory'][new_slot_num]

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
    TABLE_HERO['user_inventory'][old_slot_num] = new_item_info
    TABLE_HERO['user_inventory'][new_slot_num] = old_item_info
	send_update_hero()
}

function SwapItemsFromEquipToInventory(old_panel, new_panel, old_panel_item, new_panel_item)
{
    let new_slot_num = new_panel.slot_count
    let old_slot_type = old_panel.type_slot
    
    if (TABLE_HERO['user_inventory'][new_slot_num] != null) // Если слот занят
    {
        return
    }

    // Перенос предмета
    old_panel_item.SetParent(new_panel)
    new_panel.item_in_slot = old_panel_item
    old_panel.item_in_slot = null

    let old_item_info = TABLE_HERO['hero_enquip'][old_slot_type]
    TABLE_HERO['user_inventory'][new_slot_num] = old_item_info
    TABLE_HERO['hero_enquip'][old_slot_type] = null
	send_update_hero()
}

function SwapItemsFromInventoryToEquip(old_panel, new_panel, old_panel_item, new_panel_item)
{
	
    let old_slot_num = old_panel.slot_count
    let new_slot_type = new_panel.type_slot
    let old_item_info = TABLE_HERO['user_inventory'][old_slot_num]
	
    if (old_item_info.item_type != new_slot_type) // Если не тот тип экипировки
    {
        return
    }
    if (TABLE_HERO['hero_enquip'][new_slot_type] != null) // Если слот занят
    {
        return
    }
    old_panel_item.SetParent(new_panel)
    new_panel.item_in_slot = old_panel_item
    old_panel.item_in_slot = null

    TABLE_HERO['hero_enquip'][new_slot_type] = old_item_info
    TABLE_HERO['user_inventory'][old_slot_num] = null
	send_update_hero()
}



function showTooltip(panel, data) {
    if (data) {
        let params = `&item_data=` + JSON.stringify(data) + 
					`&all_data=` + JSON.stringify(TABLE_HERO);
        $.DispatchEvent("UIShowCustomLayoutParametersTooltip", panel, "SetCreepTooltip", "file://{resources}/layout/custom_game/custom_tooltip/custom_tooltip.xml", params);
    }
}

function onAbilityMouseOver(panel) {
    if (panel.type_slot) {
        let data = TABLE_HERO.hero_enquip[panel.type_slot];
        showTooltip(panel, data);
    }
    
    if (panel.slot_count) {
        let data = TABLE_HERO.user_inventory[panel.slot_count];
        showTooltip(panel, data);
    }
}

function onAbilityMouseOut(panel) {
	$.DispatchEvent("UIHideCustomLayoutTooltip", panel, "SetCreepTooltip");
}

// function AddButtonUpgradeInventory()
// {
    // let upgrade_inventory = $.CreatePanel("Panel", $("#InventorySlots"), "upgrade_inventory")
    // upgrade_inventory.AddClass("upgrade_inventory")
    // upgrade_inventory.SetPanelEvent('onactivate', function()
    // {
        // $.Schedule( 0.5, function()
        // {
            // UpdateInventoryMain()
        // })
    // })
// }




function show_item_reward(data){
	
	InventoryPanel.visible = true
	
	Game.EmitSound("Item.PickUpGemWorld")
	
	
	let panel = $.CreatePanel("Panel", InventoryPanel, "dynamicItemPanel");
	panel.BLoadLayoutSnippet("reward")
	panel.AddClass("content")
	
	
	
	if (data.level < 3){
		color = "#b0c3d9"
	}else if(data.level == 3 || data.level == 4){
		color = "#5e98d9"
	}else if(data.level == 5 || data.level == 6){
		color = "#4b69ff"
	}else if(data.level == 7 || data.level == 8){
		color = "#8847ff"
	}else if(data.level == 9 ){
		color = "#d32ce6"
	}else if(data.level == 10 ){
		color = "#e4ae39"
	}else if(data.level == 11 ){
		color = "#ed0c2e"
	}
	
	if (percent.includes(data.item_type)){
		perc = '%'
	}else{
		perc = ''
	}
	if (int_num.includes(data.item_type)){
		num = 0
	}else{
		num = 1
	}
	
	// panel.FindChildTraverse("TooltipImage").style.height = "90px"
	
	if (data.set_type == 'jewell'){
		panel.FindChildTraverse("TooltipImage").SetImage('file://{resources}/images/sets/'+data.item_type+'.png');
		panel.FindChildTraverse("TooltipName").text = $.Localize("#"+data.set_type+"_"+data.item_type)
		panel.FindChildTraverse("TooltipName").style.color = 'violet'
		panel.FindChildTraverse("MainInfo").style.backgroundColor = "gradient(linear, 50% 0%, 50% 100%, from(" + "#8847ff" + "), to(transparent))";
		panel.FindChildTraverse("BaseAttribute").text = $.Localize("#"+data.item_type+"_description") + ": " + data.level
		panel.FindChildTraverse("Descr").visible = false
	}else{
		panel.FindChildTraverse("TooltipImage").SetImage('file://{resources}/images/sets/' + data.set_type + '/' + data.item_type + '.png');
		panel.FindChildTraverse("TooltipName").text = $.Localize("#"+data.set_type+"_"+data.item_type) + " " + data.level
		panel.FindChildTraverse("TooltipName").style.color = 'white'
		panel.FindChildTraverse("MainInfo").style.backgroundColor = "gradient(linear, 50% 0%, 50% 100%, from(" + color + "), to(transparent))";
		panel.FindChildTraverse("BaseAttribute").text = $.Localize("#"+data.item_type+"_description") + (decription_attributes[[data.item_type]] * data.level * data.set_number) + perc
		panel.FindChildTraverse("Descr").visible = true
		panel.FindChildTraverse("Descr").text = $.Localize("#min_level_use") + can_use_sets[data.set_number].min
	}
	
	bonus_attr = panel.FindChildTraverse("BonusAttribute")
	bonus_attr.RemoveAndDeleteChildren()
	
	for (const attrKey in data.bonus_attribute) {
		let label = $.CreatePanel("Label", bonus_attr, "")
		label.AddClass('bonus_label')
	
		if (percent.includes(attrKey)){
			perc = '%'
		}else{
			perc = ''
		}
		if (int_num.includes(attrKey)){
			num = 0
		}else{
			num = 1
		}

		label.text = $.Localize("#"+attrKey+"_description") + " " + (decription_attributes[attrKey] + (data.set_number * 0.1 * data.level) - data.set_number * 0.1).toFixed(num) + perc;
		let hr = $.CreatePanel("Panel", bonus_attr, "hr") 

	}
	panel.DeleteAsync(5)
	// $.Schedule(2, function(){
		// InventoryPanel.visible = false
    // });
}

function TipsOver(message, pos)
{
    if ($("#"+pos) != undefined)
    {
       $.DispatchEvent( "DOTAShowTextTooltip", $("#"+pos), $.Localize("#"+message));
    }
}

function TipsOut()
{
    $.DispatchEvent( "DOTAHideTitleTextTooltip");
    $.DispatchEvent( "DOTAHideTextTooltip");
}

(function() {
	GameUI.CustomUIConfig.OpenInventory = Open;
   	GameEvents.Subscribe("show_item_reward", show_item_reward)
   	GameEvents.Subscribe("UpdateInventoryMain", UpdateInventoryMain)
})();
