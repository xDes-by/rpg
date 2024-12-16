const CONTEXT = $.GetContextPanel();
// var decription_attributes = CustomNetTables.GetTableValue( "set_attributes", 'set_attributes')
// var boost_attributes = CustomNetTables.GetTableValue( "boost_attributes", 'boost_attributes')


function CheckFullSet(all_data) {
    var data = all_data.hero_enquip;
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

function setTooltip(){
	const item_data = CONTEXT.GetAttributeString(`item_data`, undefined);
	var data = JSON.parse(item_data)
	set_description(data)
}

function set_description(data, panel){
	var panel_image = panel ? panel.FindChildTraverse('TooltipImage') : $("#TooltipImage") 
	var panel_name = panel ? panel.FindChildTraverse('TooltipName') : $("#TooltipName") 
	var panel_armor = panel ? panel.FindChildTraverse('armor') : $("#armor") 
	var panel_quality = panel ? panel.FindChildTraverse('quality') : $("#quality") 
	var panel_required_str = panel ? panel.FindChildTraverse('required_str') : $("#required_str") 
	var panel_required_agi = panel ? panel.FindChildTraverse('required_agi') : $("#required_agi") 
	var panel_can_use = panel ? panel.FindChildTraverse('can_use') : $("#can_use") 
	var panel_luck = panel ? panel.FindChildTraverse('Luck') : $("#Luck") 
	var panel_additional = panel ? panel.FindChildTraverse('Additional') : $("#Additional") 
	var panel_excellent = panel ? panel.FindChildTraverse('ExcellentBonus') : $("#ExcellentBonus") 

	panel_quality.visible = true
	panel_required_str.visible = true
	panel_required_agi.visible = true
	panel_can_use.visible = true
	panel_armor.visible = true


	const all_items_data = GameUI.CustomUIConfig().Items
	
	var pre_text = ''
	var color = 'white'
	
	panel_luck.visible = false;
	panel_additional.visible = false;
	panel_excellent.visible = false;

	$.Msg(data)
	if (data){
	
		if (data.item_class == 'jewel'){
			$.Msg("S")
			$.Msg(data.item_type)
			$.Msg(data.level)
			$.Msg("S")
			panel_image.SetImage('file://{resources}/images/inventory/item_'+ data.item_type +'.png');
			panel_name.text = $.Localize('#item_'+data.item_type)
			panel_name.style.color = color
			panel_can_use.text = $.Localize('#item_'+data.item_type+"_desc")
			panel_quality.text = $.Localize('#quantity') + ": " + data.level

			// panel_quality.visible = false
			panel_required_str.visible = false
			panel_required_agi.visible = false
			panel_armor.visible = false

		}else if (data.item_class == 'zen'){
			panel_image.SetImage('file://{resources}/images/inventory/zen.png');
			panel_name.text = "Zen"
			panel_name.style.color = color
			panel_armor.text = data.level

			panel_quality.visible = false
			panel_required_str.visible = false
			panel_required_agi.visible = false
			panel_can_use.visible = false

		}else{
			// $.Msg(data)

			var item_stats = all_items_data[data.item_class][data.set_name]['items'][data.item_type]['stats'][data.level]
			var armor = Math.ceil(item_stats.armor / 100 * data.quality)
			var required_str = item_stats.required_str
			var required_agi = item_stats.required_agi
			var can_use = all_items_data[data.item_class][data.set_name]['class']

			if (data.item_rarity == 'Excellent'){
				panel_excellent.visible = true
				pre_text = 'Excellent'
				color = '#00f704'
				panel_excellent.RemoveAndDeleteChildren()
				for (const attrKey in data.excellent_bonuses) {
					var label = $.CreatePanel("Label", panel_excellent, "")
					label.AddClass('bonus_label')
					label.text = attrKey
					
				}
			}

			panel_image.SetImage('file://{resources}/images/items/'+ data.set_name + " " + data.item_type + '.png');
			panel_name.text = pre_text + " " + data.set_name + " " + data.item_type + " +" + data.level
			panel_name.style.color = color
			panel_armor.text = $.Localize("#Defense") +": "+ armor
			panel_quality.text = $.Localize("#quality") +": "+ data.quality + "%"
			panel_required_str.text = $.Localize("#required_str") +": "+ required_str
			panel_required_agi.text = $.Localize("#required_agi") +": "+ required_agi
			panel_can_use.text = $.Localize("#can_use") +": "+ can_use

			if(data.luck_option == 1){
				panel_luck.visible = true;
			}
			
			if(data.additional_level > 0){
				panel_additional.visible = true;
				if (data.item_type == 'weapon'){
					panel_additional.text = $.Localize("#additional_damage") +": " + (data.additional_level * 4)  + "%"
				}else{
					panel_additional.text = $.Localize("#additional_armor") +": " + (data.additional_level * 4)  + "%"
				}
			}
			
			panel_required_str.style.color = 'white'
			panel_required_agi.style.color = 'white'
			
			var hero_data = CustomNetTables.GetTableValue("hero_hud_stats", Players.GetLocalPlayer());
			if (hero_data.str < item_stats.required_str){
				panel_required_str.style.color = 'red'
			}
			if (hero_data.agi < item_stats.required_agi){
				panel_required_agi.style.color = 'red'
			}
		}
	}
}

if(!$.DbgIsReloadingScript()){
	$.RegisterForUnhandledEvent("DOTAShowDroppedItemTooltip", OnDroppedItemTooltip);
	$.RegisterForUnhandledEvent("DOTAHideDroppedItemTooltip", OffDroppedItemTooltip);
}

function GetDotaHud() {
    let p = $.GetContextPanel();
    while (p !== null && p.id !== 'Hud') {
        p = p.GetParent();
    }
    if (p === null) {
        throw new Error('Could not find Hud root as parent of panel with id: ' + $.GetContextPanel().id);
    } else {
        return p;
    }
}

var hud = GetDotaHud();
const tooltipManager = hud.FindChildTraverse('Tooltips');
var show = false;
var custom_panel = null;
var drop_data;

function change_custom_panel(tooltip, name, index) {
    if (!custom_panel || !custom_panel.IsValid()) {
        let desc_container = tooltip.FindChildTraverse("AbilityDetails");
        let core_details = tooltip.FindChildTraverse("Contents");
		let item = tooltip.FindChildTraverse("ItemImage");
		if (item) {
			// $.Msg(name)
			if (name === 'item_zen' || name === 'item_bless' || name === 'item_soul' || name === 'item_set_item') {
				desc_container.visible = false
			}
		}
        if (core_details) {
			drop_data = CustomNetTables.GetTableValue("drop", index);
            custom_panel = $.CreatePanel("Panel", core_details, "custom_panel");
            custom_panel.BLoadLayout("file://{resources}/layout/custom_game/custom_tooltip/custom_tooltip.xml", false, false);
			set_description(drop_data, custom_panel)
            // $.Msg("Custom panel created:", custom_panel);
        }
    }
    return custom_panel;
}

function OnDroppedItemTooltip(panel, x, y, name) {
	var entities = GameUI.FindScreenEntities([x, y])
	var index;
	for (const item in entities) {
		index = entities[item].entityIndex
		if (Entities.IsItemPhysical(index)){
			show = true;
			function tooltip_show(name) {
				if (!show) {
					return;
				}

				let tooltip = tooltipManager.FindChildTraverse('DOTAAbilityTooltip');
				if (tooltip && tooltip.BHasClass("TooltipVisible")) {
					change_custom_panel(tooltip, name, index);
				}
				$.Schedule(0.01, () => tooltip_show(name));
			}
			tooltip_show(name);
		}
	}
}

function OffDroppedItemTooltip() {
	let tooltip = tooltipManager.FindChildTraverse('DOTAAbilityTooltip');
	let desc_container = tooltip.FindChildTraverse("AbilityDetails");
	desc_container.visible = true
    show = false;
    if (custom_panel && custom_panel.IsValid()) {
        custom_panel.DeleteAsync(0);
        custom_panel = null;
    }
}