var Talent = {
    open : true,
    info : null,
    ExpToLevelUp : null,
    portrait : Players.GetLocalPlayer(),
    panel : {},
    viewing : 0,
}
Talent.Build = function(){
    if(!this.ExpToLevelUp) this.ExpToLevelUp = CustomNetTables.GetTableValue('talent', "ExpToLevelUp")
    let pid = Talent.portrait
    Talent.info = CustomNetTables.GetTableValue('talent', pid)
    let level = Talent.info.level
    let exp = Talent.info.exp
    let free = Talent.info.free
    $("#TalantExpCounter").text = `Опыта накоплено: ${exp}/${this.ExpToLevelUp[level + 1]}`
    $("#TalantPointsCounter").text = `Осталось очков навыков: ${free}`
    $("#TalantLevel").text = `Уровень ${level}`
    $("#TalantLevelProgressBar").value = exp
    $("#TalantLevelProgressBar").max = this.ExpToLevelUp[level + 1]
    $("#TalantHeroName").text = $.Localize('#'+Players.GetPlayerSelectedHero(Number(pid)))
    
    if(Talent.info.own.list[1] && Talent.info.own.list[3]){
        $(`#TalantBar_${1}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${1}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${1}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${1}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[2] && Talent.info.own.list[4]){
        $(`#TalantBar_${2}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${2}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${2}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${2}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[3] && Talent.info.own.list[5]){
        $(`#TalantBar_${3}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${3}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${3}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${3}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[4] && Talent.info.own.list[5]){
        $(`#TalantBar_${4}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${4}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${4}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${4}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[5] && Talent.info.own.list[6]){
        $(`#TalantBar_${5}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${5}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${5}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${5}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[5] && Talent.info.own.list[7]){
        $(`#TalantBar_${6}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${6}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${6}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${6}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[5] && Talent.info.own.list[8]){
        $(`#TalantBar_${7}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${7}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${7}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${7}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[6] && Talent.info.own.list[9]){
        $(`#TalantBar_${8}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${8}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${8}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${8}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[7] && Talent.info.own.list[10]){
        $(`#TalantBar_${9}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${9}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${9}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${9}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[8] && Talent.info.own.list[11]){
        $(`#TalantBar_${10}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${10}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${10}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${10}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[9] && Talent.info.own.list[12]){
        $(`#TalantBar_${11}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${11}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${11}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${11}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[10] && Talent.info.own.list[12]){
        $(`#TalantBar_${12}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${12}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${12}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${12}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[10] && Talent.info.own.list[13]){
        $(`#TalantBar_${13}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${13}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${13}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${13}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[11] && Talent.info.own.list[13]){
        $(`#TalantBar_${14}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${14}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${14}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${14}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[12] && Talent.info.own.list[14]){
        $(`#TalantBar_${15}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${15}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${15}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${15}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[12] && Talent.info.own.list[15]){
        $(`#TalantBar_${16}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${16}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${16}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${16}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[13] && Talent.info.own.list[15]){
        $(`#TalantBar_${17}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${17}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${17}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${17}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[13] && Talent.info.own.list[16]){
        $(`#TalantBar_${18}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${18}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${18}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${18}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[14] && Talent.info.own.list[17]){
        $(`#TalantBar_${19}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${19}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${19}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${19}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[15] && Talent.info.own.list[18]){
        $(`#TalantBar_${20}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${20}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${20}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${20}`).AddClass("NotAvailableTalentBar")
    }
    if(Talent.info.own.list[16] && Talent.info.own.list[19]){
        $(`#TalantBar_${21}`).RemoveClass("NotAvailableTalentBar")
        $(`#TalantBar_${21}`).AddClass("AvailableTalentBar")
    }else{
        $(`#TalantBar_${21}`).RemoveClass("AvailableTalentBar")
        $(`#TalantBar_${21}`).AddClass("NotAvailableTalentBar")
    }

    // =====================================    Talant 1
    Talent.panel[1].available = false
    Talent.panel[1].selected = false
    if(Talent.info.own.list[1] > 0){
        Talent.panel[1].selected = true
    }else if(Talent.info.own.list[1]  == 0 && Talent.info.own.list[2] == 0){
        Talent.panel[1].available = true
    }
    // =====================================    Talant 2
    Talent.panel[2].available = false
    Talent.panel[2].selected = false
    if(Talent.info.own.list[2] > 0){
        Talent.panel[2].selected = true
    }else if(Talent.info.own.list[1]  == 0 && Talent.info.own.list[2] == 0){
        Talent.panel[2].available = true
    }
    // =====================================    Talant 3
    Talent.panel[3].available = false
    Talent.panel[3].selected = false
    if(Talent.info.own.list[3] > 0){
        Talent.panel[3].selected = true
    }else if(Talent.info.own.list[1]  > 0){
        Talent.panel[3].available = true
    }
    // =====================================    Talant 4
    Talent.panel[4].available = false
    Talent.panel[4].selected = false
    if(Talent.info.own.list[4] > 0){
        Talent.panel[4].selected = true
    }else if(Talent.info.own.list[2]  > 0){
        Talent.panel[4].available = true
    }
    // =====================================    Talant 5
    Talent.panel[5].available = false
    Talent.panel[5].selected = false
    if(Talent.info.own.list[5] > 0){
        Talent.panel[5].selected = true
    }else if(Talent.info.own.list[3]  > 0 || Talent.info.own.list[4]  > 0){
        Talent.panel[5].available = true
    }
    // =====================================    Talant 6
    Talent.panel[6].available = false
    Talent.panel[6].selected = false
    if(Talent.info.own.list[6] > 0){
        Talent.panel[6].selected = true
    }else if(Talent.info.own.list[5]  > 0 && Talent.info.own.list[6]  == 0 && Talent.info.own.list[7]  == 0 && Talent.info.own.list[8]  == 0){
        Talent.panel[6].available = true
    }
    // =====================================    Talant 7
    Talent.panel[7].available = false
    Talent.panel[7].selected = false
    if(Talent.info.own.list[7] > 0){
        Talent.panel[7].selected = true
    }else if(Talent.info.own.list[5]  > 0 && Talent.info.own.list[6]  == 0 && Talent.info.own.list[7]  == 0 && Talent.info.own.list[8]  == 0){
        Talent.panel[7].available = true
    }
    // =====================================    Talant 8
    Talent.panel[8].available = false
    Talent.panel[8].selected = false
    if(Talent.info.own.list[8] > 0){
        Talent.panel[8].selected = true
    }else if(Talent.info.own.list[5]  > 0 && Talent.info.own.list[6]  == 0 && Talent.info.own.list[7]  == 0 && Talent.info.own.list[8]  == 0){
        Talent.panel[8].available = true
    }
    // =====================================    Talant 9
    Talent.panel[9].available = false
    Talent.panel[9].selected = false
    if(Talent.info.own.list[9] > 0){
        Talent.panel[9].selected = true
    }else if(Talent.info.own.list[6]  > 0){
        Talent.panel[9].available = true
    }
    // =====================================    Talant 10
    Talent.panel[10].available = false
    Talent.panel[10].selected = false
    if(Talent.info.own.list[10] > 0){
        Talent.panel[10].selected = true
    }else if(Talent.info.own.list[7]  > 0){
        Talent.panel[10].available = true
    }
    // =====================================    Talant 11
    Talent.panel[11].available = false
    Talent.panel[11].selected = false
    if(Talent.info.own.list[11] > 0){
        Talent.panel[11].selected = true
    }else if(Talent.info.own.list[8]  > 0){
        Talent.panel[11].available = true
    }
    // =====================================    Talant 12
    Talent.panel[12].available = false
    Talent.panel[12].selected = false
    if(Talent.info.own.list[12] > 0){
        Talent.panel[12].selected = true
    }else if((Talent.info.own.list[9]  > 0 || Talent.info.own.list[10]  > 0) && Talent.info.own.list[13]  == 0){
        Talent.panel[12].available = true
    }
    // =====================================    Talant 13
    Talent.panel[13].available = false
    Talent.panel[13].selected = false
    if(Talent.info.own.list[13] > 0){
        Talent.panel[13].selected = true
    }else if((Talent.info.own.list[11]  > 0 || Talent.info.own.list[10]  > 0) && Talent.info.own.list[12]  == 0){
        Talent.panel[13].available = true
    }
    // =====================================    Talant 14
    Talent.panel[14].available = false
    Talent.panel[14].selected = false
    if(Talent.info.own.list[14] > 0){
        Talent.panel[14].selected = true
    }else if(Talent.info.own.list[12] > 0 && Talent.info.own.list[15] == 0){
        Talent.panel[14].available = true
    }
    // =====================================    Talant 15
    Talent.panel[15].available = false
    Talent.panel[15].selected = false
    if(Talent.info.own.list[15] > 0){
        Talent.panel[15].selected = true
    }else if((Talent.info.own.list[12] > 0 || Talent.info.own.list[13] > 0) && Talent.info.own.list[14] == 0 && Talent.info.own.list[16] == 0){
        Talent.panel[15].available = true
    }
    // =====================================    Talant 16
    Talent.panel[16].available = false
    Talent.panel[16].selected = false
    if(Talent.info.own.list[16] > 0){
        Talent.panel[16].selected = true
    }else if(Talent.info.own.list[13] > 0 && Talent.info.own.list[15] == 0){
        Talent.panel[16].available = true
    }
    // =====================================    Talant 17
    Talent.panel[17].available = false
    Talent.panel[17].selected = false
    if(Talent.info.own.list[17] > 0){
        Talent.panel[17].selected = true
    }else if(Talent.info.own.list[14] > 0){
        Talent.panel[17].available = true
    }
    // =====================================    Talant 18
    Talent.panel[18].available = false
    Talent.panel[18].selected = false
    if(Talent.info.own.list[18] > 0){
        Talent.panel[18].selected = true
    }else if(Talent.info.own.list[15] > 0){
        Talent.panel[18].available = true
    }
    // =====================================    Talant 19
    Talent.panel[19].available = false
    Talent.panel[19].selected = false
    if(Talent.info.own.list[19] > 0){
        Talent.panel[19].selected = true
    }else if(Talent.info.own.list[16] > 0){
        Talent.panel[19].available = true
    }

    for(let i = 1; i <= 19; i++){
        Talent.panel[i].RemoveClass("TalantAvailable")
        Talent.panel[i].RemoveClass("TalantSelected")
        Talent.panel[i].RemoveClass("TalantNotAvailable")
        Talent.panel[i].FindChildTraverse("talant_progress_bar").visible = false
        if(Talent.panel[i].selected){
            Talent.panel[i].FindChildTraverse("talant_progress_bar").visible = true
            Talent.panel[i].AddClass("TalantSelected")
        }else if(Talent.panel[i].available){
            Talent.panel[i].AddClass("TalantAvailable")
        }else{
            Talent.panel[i].AddClass("TalantNotAvailable")
        }
    }

    for(let i = 1; i <= 19; i++){
        Talent.panel[i].FindChildTraverse("talant_img").style.backgroundImage = "url('file://{images}/custom_game/" + Talent.info.visual[i].url + "')"
        if(Talent.info.own.list[i] == 0){
            Talent.panel[i].FindChildTraverse("talant_progress_bar").style.height = "100%"
        }else{
            if(Talent.info.own.list[i] == 1){
                Talent.panel[i].FindChildTraverse("talant_progress_bar").style.height = "66%"
            }else if(Talent.info.own.list[i] == 2){
                Talent.panel[i].FindChildTraverse("talant_progress_bar").style.height = "33%"
            }else if(Talent.info.own.list[i] == 3){
                Talent.panel[i].FindChildTraverse("talant_progress_bar").style.height = "0%"
            }
        }
    }
}


// git


Talent.ClickTalent = function(nTalent){
    return function(){
        let pid = Talent.portrait
        let visual = Talent.info.visual[nTalent]
        Talent.viewing = nTalent
        $("#TalantMainNameLabel").text = $.Localize('#'+visual.name)
        $("#TalantMainImage").style.backgroundImage = "url('file://{images}/custom_game/"+visual.url+"')"
        $("#TalantMainDescriptionLabel").text = $.Localize('#'+visual.description)
        $("#TalantExploreButton").visible = true
        if(Talent.panel[nTalent].available){
            $("#TalantExploreButtonLabel").text = "Изучить"
        }else if(Talent.panel[nTalent].selected && Talent.info.own.list[nTalent] < 3){
            $("#TalantExploreButtonLabel").text = "Улучшить"
        }else if(Talent.panel[nTalent].selected && Talent.info.own.list[nTalent] == 3){
            $("#TalantExploreButtonLabel").text = "Макс"
        }else{
            $("#TalantExploreButton").visible = false
            // $("#TalantExploreButtonLabel").text = "Не доступно"
        }
        if(Talent.info.free > 0 || Talent.info.own.list[nTalent] == 3){
            $("#TalantExploreButton").RemoveClass("ButtonNotAvailable")
        }else{
            $("#TalantExploreButton").AddClass("ButtonNotAvailable")
        }
        // if(!Talent.panel[nTalent].selected && !Talent.panel[nTalent].available){
        //     $("#TalantExploreButton").AddClass("ButtonNotAvailable")
        // }
        $("#TalantExploreButton").SetPanelEvent("onmouseactivate", Talent.ActiveButton(nTalent))
    }
}

Talent.ActiveButton = function(n){
    return function(){
        GameEvents.SendCustomGameEventToServer("ActiveTalentButton", { n : n })
    }
}

function TalentTableListener(_, key, data){
    if(key == "ExpToLevelUp") return
    if(key != Talent.portrait) return
    Talent.info = data
    Talent.Build()
}

function portrait(){
    var idx = Players.GetLocalPlayerPortraitUnit()
    let exist = false
    for(let i = 0; i < 4; i++){
        if(idx == Players.GetPlayerHeroEntityIndex( i )){
            exist = true
            Talent.portrait = i
        }
    }
    if(!exist) return
}



function init(){
    $("#TalantTreePanel").RemoveAndDeleteChildren()
    for(let i = 1; i <= 19; i++){
        pan = $.CreatePanel("Panel", $("#TalantTreePanel"), "Talant_"+i)
        pan.BLoadLayoutSnippet("TalantCircle")
        pan.SetPanelEvent("onmouseactivate", Talent.ClickTalent(i))
        Talent.panel[i] = pan
    }
    CustomNetTables.SubscribeNetTableListener("talent", TalentTableListener)
    GameEvents.Subscribe("dota_player_update_query_unit", portrait);
    GameEvents.Subscribe('dota_player_update_hero_selection', portrait);
    GameEvents.Subscribe('dota_player_update_selected_unit', portrait);
    if(CustomNetTables.GetTableValue("talent", Players.GetLocalPlayer())){
        Talent.Build()
    }
}
init()
