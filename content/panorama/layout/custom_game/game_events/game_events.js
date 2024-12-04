let lastNotification = null;

function ShowZoneEvent(zone) {
    let newNotification = true;

    Game.EmitSound('Conquest.capture_point_timer.Generic')
    
    if (lastNotification && zone.continue) {
        newNotification = false;
    }

    if (newNotification) {
        if (lastNotification && lastNotification.IsValid()) {
            lastNotification.DeleteAsync(0);
        }
        lastNotification = $.CreatePanel('Panel', $('#ShowZoneEvent'), '');
        lastNotification.BLoadLayoutSnippet("ZoneEvent");
        lastNotification.AddClass('show');
        lastNotification.hittest = false;

        lastNotification.FindChildInLayoutFile("ZoneEventName").text = $.Localize("#" + zone.zone_name);

        $.Schedule(2, function () {
            if (lastNotification && lastNotification.IsValid()) {
                lastNotification.DeleteAsync(0);
                lastNotification = null;
            }
        });
    }
}

(function () {
    GameEvents.Subscribe("ShowZoneEvent", ShowZoneEvent);
})();
