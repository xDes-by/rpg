$("#TeleportPanel").SetHasClass('CloseTeleport', true)

var content = $("#TeleportPanelContent")

function Open()
{	
    $("#TeleportPanel").ToggleClass("CloseTeleport")
    if (!$("#TeleportPanel").BHasClass("CloseTeleport"))
    {
		var data = GameUI.CustomUIConfig().Zones
        content.RemoveAndDeleteChildren()

        for (const [zone, details] of Object.entries(data)) {

            var panel = $.CreatePanel("Panel", content, zone)
            panel.BLoadLayoutSnippet("zone_panel")
            panel.AddClass("content")

            panel.FindChildTraverse("zone_name").text = $.Localize('#'+zone)
            panel.FindChildTraverse("zone_recommended_count").text = details.recommended;
            panel.FindChildTraverse("zone_tp_cost").text = details.zen;


            panel.SetPanelEvent('onmouseactivate', (function (zone, zen) {
                return function () {
                    try_teleport(zone, zen);
                };
            })(zone, details.zen));
            
        }
    }
}

function try_teleport(zone, zen){
    $.Msg(zone, zen)
    GameEvents.SendCustomGameEventToServer("try_teleport", {zone:zone, zen:zen});
}

(function() {
    GameEvents.Subscribe("hide_teleport", Open);
	GameUI.CustomUIConfig.OpenTeleport = Open;
})();
