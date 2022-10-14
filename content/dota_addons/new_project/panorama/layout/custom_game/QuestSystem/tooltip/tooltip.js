function setupTooltip(){
    desc = $.GetContextPanel().GetAttributeString( "desc", "" );
    lore = $.GetContextPanel().GetAttributeString( "lore", "" );
    $("#Description").text = desc == "" ? "" : $.Localize("#"+desc)
    $("#Lore").text = lore == "" ? "" : $.Localize("#"+lore)
}