var BestTime = {}
function GetUniverseSteamID32(PID)
{
    var steamID64 = Game.GetPlayerInfo(PID).player_steamid,
    steamIDPart = Number(steamID64.substring(3)),
    steamID32 = String(steamIDPart - 61197960265728);

    return steamID32;
}



function RatingInit(t){
    // Top Init
    $("#TopTopRow").RemoveAndDeleteChildren()
    for(let i = 1; i <= Object.keys(t.top).length; i++){
        pan = $.CreatePanel("Panel", $("#TopTopRow"), "top_"+i)
        pan.BLoadLayoutSnippet("Top")
        pan.FindChildTraverse("RatingTopPlaceLabel").text = i
        pan.FindChildTraverse("RatingTopPlayerImage").accountid = t.top[i].sid
        pan.FindChildTraverse("TopPlayerName").accountid = t.top[i].sid
        pan.FindChildTraverse("TeamPlayerPointsAmount").text = t.top[i].rating
        pan.FindChildTraverse("TeamPlayerGamesAmount").text = t.top[i].games
        pan.FindChildTraverse("TeamPlayerRepAmount").text = t.top[i].reputation
        for(let h = 1; h <= 3; h++){
            if(t.top[i].heroes[h]){
                pan.FindChildTraverse("TopLastGameHeroesPanel").GetChild(h-1).heroname = t.top[i].heroes[h]
            }else{
                pan.FindChildTraverse("TopLastGameHeroesPanel").GetChild(h-1).visible = false
            }
        }
    }
    // Best Time Init
    $("#TopBestTime").RemoveAndDeleteChildren()
    for(let i = 1; i <= Object.keys(t.time).length; i++){
        pan = $.CreatePanel("Panel", $("#TopBestTime"), "")
        pan.BLoadLayoutSnippet("BestTime")
        if(!BestTime[t.time[i]['mode']]){
            BestTime[t.time[i]['mode']] = []
        }
        BestTime[t.time[i]['mode']].push(pan)
        pan.FindChildTraverse("TopMonthPlaceLabel").text = BestTime[t.time[i]['mode']].length + " место"
        pan.FindChildTraverse("TopMonthTimeLabel").text = Math.floor(t.time[i]['time'] / 60) + ' мин'
        for(let p = 1; p <= 4; p++){
            playerPanel = pan.FindChildTraverse("TopMonthPlayersRowPanel").GetChild(p-1)
            if(t.time[i]['players'][p]){
                playerPanel.FindChildTraverse("BestTimePlayerImage").accountid = t.time[i]['players'][p]['sid']
                playerPanel.FindChildTraverse("BestTimePlayerName").accountid = t.time[i]['players'][p]['sid']
                playerPanel.FindChildTraverse("BestTimeHeroImage").heroname = t.time[i]['players'][p]['heroname']
                for(let nItem = 1; nItem <= 6; nItem++){
                    playerPanel.FindChildTraverse("BestTimeRowItems").GetChild(nItem-1).itemname = t.time[i]['players'][p]['items'][nItem]
                }
            }else{
                playerPanel.visible = false
            }
        }
        if(t.time[i]['mode'] != 'normal'){
            pan.visible = false
        }
    }
    
}

function RatingBestTimeChanged(){
    if(!$("#RatingTimeModeSelection").GetSelected())return
    
    let mode = $("#RatingTimeModeSelection").GetSelected().id
    for(const [key, value] of Object.entries(BestTime)){
        for(let pan of value){
            if(key == mode){
                pan.visible = true
            }else{
                pan.visible = false
            }
        }
    }
}

var Rating = {
    player : {},
    ActionCreateTooltip : (pan, text)=>{
        return ()=>{
            $.DispatchEvent( "DOTAShowTextTooltip", pan, text);
        }
    },
    ActionDestroyTooltip : ()=>{
        return ()=>{
            $.DispatchEvent( "DOTAHideTextTooltip");
        }
    },
    TeamInit : ()=>{
        for(let i = 0; i < 4; i++){
            if(!Players.IsValidPlayerID(i)) continue
            this.player[i] = CustomNetTables.GetTableValue("rating", i)
            if(!this.player[i]){
                $.Schedule(1, ()=>{ Rating.TeamInit() })
                return
            }
        }
        // Init Team
        $("#TeamRow").RemoveAndDeleteChildren()
        playerID = Players.GetLocalPlayer(),
        steamID = GetUniverseSteamID32(playerID)
        for(let i = 0; i < 4; i++){
            if(!Players.IsValidPlayerID(i)) continue
            if(this.player[i]['sid'] != steamID){
                pan = $.CreatePanel("Panel", $("#TeamRow"), "")
                pan.BLoadLayoutSnippet("Team")
                pan.FindChildTraverse("RatingTeamPlayerImage").accountid = this.player[i]['sid']
                pan.FindChildTraverse("TeamPlayerName").accountid = this.player[i]['sid']
                pan.FindChildTraverse("TeamPlayerPointsAmount").text = this.player[i]['rating']
                pan.FindChildTraverse("TeamPlayerGamesAmount").text = this.player[i]['games']
                pan.FindChildTraverse("TeamPlayerRepAmount").text = this.player[i]['reputation']
                pan.FindChildTraverse("TeamPlayerHeroImage").heroname = this.player[i]['heroname']
            }else{
                pan = $("#TeamLocalPlayerPlanel")
                pan.FindChildTraverse("RatingTeamLocalPlayerImage").accountid = this.player[i]['sid']
                pan.FindChildTraverse("TeamPlayerName").accountid = this.player[i]['sid']
                pan.FindChildTraverse("TeamPlayerPointsAmount").text = this.player[i]['rating']
                pan.FindChildTraverse("TeamPlayerGamesAmount").text = this.player[i]['games']
                pan.FindChildTraverse("TeamPlayerRepAmount").text = this.player[i]['reputation']
                pan.FindChildTraverse("top_label").text = this.player[i]['top']
                pan.FindChildTraverse("WRAmount").text = this.player[i]['wr'] + "%"
                pan.FindChildTraverse("TeamPlayerHeroImage").heroname = this.player[i]['heroname']

                $("#LocalPlayerGamesRow").RemoveAndDeleteChildren()
                for(let h = 1; h <= 8; h++){
                    if(this.player[i]['last_game']['heroes'][h]){
                        pan = $.CreatePanelWithProperties("Panel", $("#LocalPlayerGamesRow"), "", {class:"last_heroes_panel"})
                        pan.BLoadLayoutSnippet("GameResultIcon")
                        pan.FindChildTraverse("TeamPlayerHeroImage").heroname = this.player[i]['last_game']['heroes'][h]
                        if(this.player[i]['last_game']['result'][h] > 0){
                            pan.FindChildTraverse("GameResultLose").visible = false
                        }else{
                            pan.FindChildTraverse("GameResultWin").visible = false
                        }
                        let ToolText = Math.round(this.player[i]['last_game']['time'][h] / 60) + "мин"
                        pan.SetPanelEvent("onmouseover", Rating.ActionCreateTooltip(pan, ToolText))
                        pan.SetPanelEvent("onmouseout", Rating.ActionDestroyTooltip())
                    }
                }
            }
        }
    }
}




function init(){
    Rating.TeamInit()
}




(function(){
    init()
    // GameEvents.Subscribe( "RatingInitJs", RatingInit)
    // GameEvents.SendCustomGameEventToServer("RatingInitLua", {})
})()