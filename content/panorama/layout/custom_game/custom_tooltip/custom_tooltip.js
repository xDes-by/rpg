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
	const all_items_data = GameUI.CustomUIConfig().Items
	const item_data = CONTEXT.GetAttributeString(`item_data`, undefined);
	const all_data = CONTEXT.GetAttributeString(`all_data`, undefined);
	
	var data = JSON.parse(item_data)
	
	var item_stats = all_items_data[data.set_name]['items'][data.item_type]['stats'][data.level]
	
	var armor = (item_stats.armor / 100 * data.quality).toFixed(0)
	var required_str = item_stats.required_str
	var required_agi = item_stats.required_agi
	var can_use = all_items_data[data.set_name]['class']
	
	// $.Msg(data)
	
	
	var pre_text = ''
	var color = 'white'

		
	$("#Luck").visible = false;
	$("#Additional").visible = false;
	$("#ExcellentBonus").visible = false;
	
	if (data.set_type == 'jewell'){
		$("#TooltipImage").SetImage('file://{resources}/images/items/'+ data.set_name + " " + data.item_type + '.png');
		$("#TooltipName").text = data.set_name + " " + data.item_type + " +" + data.level
		// $("#TooltipName").style.color = 'violet'
		// $("#MainInfo").style.backgroundColor = "gradient(linear, 50% 0%, 50% 100%, from(" + "#8847ff" + "), to(transparent))";
		$("#BaseAttribute").text = $.Localize("#"+data.item_type+"_description") + ": " + data.level
		$("#Descr").visible = false
	}else{
		
		
		if (data.item_rarity == 'Excellent'){
			$("#ExcellentBonus").visible = true
			pre_text = 'Excellent'
			color = '#00f704'
			panel = $("#ExcellentBonus")
			panel.RemoveAndDeleteChildren()
			for (const attrKey in data.excellent_bonuses) {
				var label = $.CreatePanel("Label", panel, "")
				label.AddClass('bonus_label')
				label.text = attrKey
				
			}
		}
		
		$("#TooltipImage").SetImage('file://{resources}/images/items/'+ data.set_name + " " + data.item_type + '.png');
		$("#TooltipName").text = pre_text + " " + data.set_name + " " + data.item_type + " +" + data.level
		$("#TooltipName").style.color = color
		$("#armor").text = $.Localize("#Defense") +": "+ armor
		$("#quality").text = $.Localize("#quality") +": "+ data.quality + "%"
		$("#required_str").text = $.Localize("#required_str") +": "+ required_str
		$("#required_agi").text = $.Localize("#required_agi") +": "+ required_agi
		$("#can_use").text = $.Localize("#can_use") +": "+ can_use

		if(data.luck_option == 1){
			$("#Luck").visible = true;
		}
		
		if(data.additional_level > 0){
			$("#Additional").visible = true;
			if (data.item_type == 'weapon'){
				$("#Additional").text = $.Localize("#additional_damage") +": " + (data.additional_level * 4)  + "%"
			}else{
				$("#Additional").text = $.Localize("#additional_armor") +": " + (data.additional_level * 4)  + "%"
			}
		}
		
		$("#required_str").style.color = 'white'
		$("#required_agi").style.color = 'white'
		
		var hero_data = CustomNetTables.GetTableValue("hero_hud_stats", Players.GetLocalPlayerPortraitUnit());
		if (hero_data.str < item_stats.required_str){
			$("#required_str").style.color = 'red'
		}
		if (hero_data.agi < item_stats.required_agi){
			$("#required_agi").style.color = 'red'
		}
			
		
			// let label = $.CreatePanel("Label", panel, "")
			// label.AddClass('bonus_label')
		
			// if (percent.includes(attrKey)){
				// perc = '%'
			// }else{
				// perc = ''
			// }
			// if (int_num.includes(attrKey)){
				// num = 0
			// }else{
				// num = 1
			// }

			
			// label.text = $.Localize("#"+attrKey+"_description") + " " + (decription_attributes[attrKey] * data.set_number +  boost_attributes[attrKey][data.set_number] * (data.level - 1)).toFixed(num) + perc  
			// let hr = $.CreatePanel("Panel", panel, "hr") 

	}
}