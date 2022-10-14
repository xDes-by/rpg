var HeroBackgroundColor = {
    druid : "86, 67, 10",
    nekro : "88, 40, 116",
    inferno : "138, 50, 32",
    gnom : "150, 140, 31",
    zveri : "67, 150, 31",
    troll : "42, 133, 91",
}

function FindDotaHudElement(panel) {
    return $.GetContextPanel().GetParent().GetParent().GetParent().FindChildTraverse(panel);
}

function RankImage(panImg, panCon, panLabel, level){
    if(level > 0){
        panCon.visible = true
        panLabel.text = level
        if(level <= 5){
            panImg.style.backgroundImage = "url('s2r://panorama/images/hero_badges/hero_badge_rank_0_png.vtex')"
        }else if(level <= 10){
            panImg.style.backgroundImage = "url('s2r://panorama/images/hero_badges/hero_badge_rank_1_png.vtex')"
        }else if(level <= 15){
            panImg.style.backgroundImage = "url('s2r://panorama/images/hero_badges/hero_badge_rank_2_png.vtex')"
        }else if(level <= 20){
            panImg.style.backgroundImage = "url('s2r://panorama/images/hero_badges/hero_badge_rank_3_png.vtex')"
        }else if(level <= 25){
            panImg.style.backgroundImage = "url('s2r://panorama/images/hero_badges/hero_badge_rank_4_png.vtex')"
        }else{
            panImg.style.backgroundImage = "url('s2r://panorama/images/hero_badges/hero_badge_rank_5_png.vtex')"
        }
    }else{
        panCon.visible = false
    }
}

function CompCheck(){
    let race = {}
    let player = []
    for(let i = 0; i < 4; i++){
        player.push(CustomNetTables.GetTableValue("hero_selection", i))
    }
    for(let i in player){
        if(!player[i]) continue
        if(!player[i]['process']) continue
        if(!player[i]['process']['race']) continue
        player[i]['process'].index = i

        if(!race[player[i]['process']['race']]){
            race[player[i]['process']['race']] = [player[i]['process']]
        }else{
            race[player[i]['process']['race']].push(player[i]['process'])
        }
    }

    for(let i in race){
        race_color = HeroBackgroundColor[i]
        // цыкл по игрокам одной расы
        for(let player of race[i]){
            if(race[i].length > 1 && player.confirmed){
                var pColor = race_color + ", 0.7"
            }else if(race[i].length > 1 && !player.confirmed){
                var pColor = race_color + ", 0.5"
            }else if(race[i].length == 1 && player.confirmed){
                var pColor = race_color + ", 0.6"
            }else if(race[i].length == 1 && !player.confirmed){
                var pColor = race_color + ", 0.2"
            }
            $("#HeroPreferredPanel").GetChild(Number(player.index)).FindChildTraverse("HeroPreferredScenePanel").style.backgroundColor = "gradient( radial, 50% 50%, 0% 0%, 50% 50%, from( rgba("+pColor+") ), to( rgba(95, 95, 158, 0) ) )"
        }
    }
}

function ScenePanelUtil(n, heroname, color){
    let object = $("#HeroPreferredPanel").GetChild(Number(n))
    if(heroname){
        object.FindChildTraverse("ScenePanelPanel").RemoveAndDeleteChildren()
        $.CreatePanelWithProperties("DOTAScenePanel",object.FindChildTraverse("ScenePanelPanel"),"HeroPreferredScenePanel",{class:"",particleonly:false,allowrotation:true,rendershadows:true,unit:heroname})
    }
    if(color){
        object.FindChildTraverse("HeroPreferredScenePanel").style.backgroundColor = "gradient( radial, 50% 50%, 0% 0%, 50% 50%, from( rgba("+color+") ), to( rgba(95, 95, 158, 0) ) )"
    }
}

function TableListener(_, key, data){
    if(key == 'timer'){
        $("#PickTimerCounter").text = data['time']
        if(Number(data['time']) == 0){
            $("#HeroSelection").visible = false
            $("#ToolBar").visible = false
        }
        return
    }
    if(key == "chat"){
        HeroSelection.PrintChat(data)
        return
    }


    if(!HeroSelection.confirmed){
        $("#HeroPreferredPanel").GetChild(Number(key)).FindChildTraverse("HeroPreferredScenePanel").SetScenePanelToLocalHero(Number(data['process']['hero_id']))
        $("#HeroPreferredPanel").GetChild(Number(key)).FindChildTraverse("HeroPreferredHeroRace").text = data['process']['race']
        RankImage(
            $("#HeroPreferredPanel").GetChild(Number(key)).FindChildTraverse("HeroPreferredBadgeStatus"),
            $("#HeroPreferredPanel").GetChild(Number(key)).FindChildTraverse("HeroPreferredBadgeStatus"),
            $("#HeroPreferredPanel").GetChild(Number(key)).FindChildTraverse("HeroPreferredBadgeLevel"), 
            data['process']['level'])
        $("#HeroPreferredPanel").GetChild(Number(key)).FindChildTraverse("HeroPreferredRaceIcon").style.backgroundImage = `url("file://{images}/custom_game/race_icon/${data['process']['race']}.png")`
    }
    // HeroPreferredScenePanel
    // $("#DOTAScenePanelTest").
    // $("#DOTAScenePanelTest").SetScenePanelToLocalHero(0)

    let HeroPreferredPanel = $("#HeroPreferredPanel")
    let object = HeroPreferredPanel.GetChild(Number(key))

    if(key == Players.GetLocalPlayer() && data['process']['confirmed']){
        // CompCheck(data)
        $("#LockInButton").AddClass("inactivePickButton")
        HeroSelection.confirmed = true
    }
    CompCheck()
}

var HeroSelection = {
    list : null,
    chat : [],
    PrintChat : (data)=>{
        if(!this.chat) this.chat = []

        let chat = $("#ChatLinesWrapper")
        for(let i in data){
            if(!this.chat[i]){
                let text = Players.GetPlayerName(data[i].PlayerID) + ": " + data[i].text
                $.CreatePanelWithProperties("Label", chat, "", {class:"ChatLabel", text : text})
                this.chat[i] = data[i]
            }
        }
        $.Schedule(0.1, ()=>{
            $("#ChatLinesContainer").ScrollToBottom()
        })
    },
    OnChat : ()=>{
        let pan = $("#ChatTextEntry")
        if(pan.text.split(' ').join('') == "") return
        GameEvents.SendCustomGameEventToServer("PlayerChat", {text:pan.text});
        pan.text = ""
    },
    ActionClickOnHero : (heroname, categoryId)=>{
        return ()=>{
            $("#HeroMovie").heroname = heroname
            $("#HeroInspectHeroName").text = $.Localize("#"+heroname)
            $("#PickButtonHeroName").text = $.Localize("#"+heroname)
            $("#PickDescriptiop").visible = false
            $("#HeroInspectHeader").visible = true
            if(!HeroSelection.confirmed){
                $("#LockInButton").RemoveClass("inactivePickButton")
            }
            $("#HeroInspectPrimaryAttributeIcon").style.backgroundImage = `url("file://{images}/custom_game/race_icon/${categoryId}.png")`
            GameEvents.SendCustomGameEventToServer("ClickOnHero", {heroname:heroname});
        }
    },
    init : ()=>{
        this.list = CustomNetTables.GetTableValue("hero_selection", "list")
        this.player = CustomNetTables.GetTableValue("hero_selection", Players.GetLocalPlayer())
        if(!this.list || !this.player){
            $.Schedule(0.5, ()=>{HeroSelection.init()})
            return
        }
        HeroSelection.confirmed = this.player['process']['confirmed']
        for(let i = 0; i < 4; i++){
            $("#HeroPreferredPanel").GetChild(i).FindChildTraverse("HeroPreferredPlayerName").text = Players.GetPlayerName(i) || ""
        }
        $("#HeroPickLeftColumn").RemoveAndDeleteChildren()
        for(let categoryId in this.list){
            let created = $.CreatePanel("Panel", $("#HeroPickLeftColumn"), "HeroCategory_"+categoryId)
            created.BLoadLayoutSnippet("rasaCategory")
            created.FindChildTraverse("HeroCategoryName").text = "HeroCategory_"+categoryId
            created.FindChildTraverse("CategoryImage").style.backgroundImage =  `url("file://{images}/custom_game/race_icon/${categoryId}.png")`
            // значок i 
            let InfoIcon = created.FindChildTraverse("InfoIcon")
            InfoIcon.SetPanelEvent("onmouseover", function(){
                $.DispatchEvent( "DOTAShowTextTooltip", InfoIcon, $.Localize('#HeroCategoryInfoIconTooltip_'+categoryId));
            })
            InfoIcon.SetPanelEvent("onmouseout", function(){
                $.DispatchEvent("DOTAHideTitleTextTooltip");
                $.DispatchEvent( "DOTAHideTextTooltip");
            })
            // цыкл по героям
            for(let i in this.list[categoryId]){
                let name = this.list[categoryId][i]['name']
                let available = this.player['available'][name]
                let level = this.player['talents'][name] ? this.player['talents'][name]['level'] : 0

                let IconPanel = $.CreatePanel("Panel", created.FindChildTraverse("HeroList"), "HeroCategory_druid_"+name)
                IconPanel.BLoadLayoutSnippet("HeroPickSample")
                IconPanel.FindChildTraverse("HeroImage").heroname = name
                // тултип героя
                IconPanel.SetPanelEvent("onmouseover", function(){
                    $.DispatchEvent( "UIShowCustomLayoutParametersTooltip", IconPanel, "ChcItemTooltip", "file://{resources}/layout/custom_game/tooltips/HeroPickTooltip/HeroPickTooltip.xml", "heroname="+name+"&level="+level);
                    FindDotaHudElement("ChcItemTooltip").FindChildTraverse("LeftArrow").style.visibility = "collapse";
                    FindDotaHudElement("ChcItemTooltip").FindChildTraverse("Contents").style.backgroundColor = "transparent";
                    FindDotaHudElement("ChcItemTooltip").FindChildTraverse("Contents").style.border = "2px solid transparent";
                    FindDotaHudElement("ChcItemTooltip").FindChildTraverse("Contents").style.boxShadow = "transparent 0px 0px 8px 0px";
                })
                IconPanel.SetPanelEvent("onmouseout", function(){
                    $.DispatchEvent("UIHideCustomLayoutTooltip", "ChcItemTooltip")
                })
                // клик на героя
                IconPanel.SetPanelEvent("onmouseactivate", HeroSelection.ActionClickOnHero(name, categoryId))
                // уровень героя
                let HeroBadgeIcon = IconPanel.FindChildTraverse("HeroBadgeIcon"),
                    HeroBadgeStatus = IconPanel.FindChildTraverse("HeroBadgeStatus")
                RankImage(HeroBadgeIcon, HeroBadgeStatus, IconPanel.FindChildTraverse("HeroBadgeLevel"), level)
    
                if(!available){
                    IconPanel.AddClass("SearchActive")
                    IconPanel.FindChildTraverse("BannedOverlay").style.opacity = "1.0"
                }
            }
        }
        let data = CustomNetTables.GetTableValue("hero_selection", "chat")
        if(data){
            HeroSelection.PrintChat(data)
        }
    }
}


function init(){
    HeroSelection.init()
    $("#LockInButton").SetPanelEvent("onmouseactivate", function(){
        GameEvents.SendCustomGameEventToServer("ConfirmHero", {});
    })
    $("#RandomButton").SetPanelEvent("onmouseactivate", function(){
        GameEvents.SendCustomGameEventToServer("GetRandomHero", {});
    })
    CustomNetTables.SubscribeNetTableListener("hero_selection", TableListener)
    $("#HeroInspectHeader").visible = false
    $("#TeamBar").visible = false
    $("#HeroSelection").visible = true
    $("#ToolBar").visible = true

    // test
    // $("#DOTAScenePanelTest").SetScenePanelToLocalHero(113)
    // $.CreatePanelWithProperties("DOTAScenePanel",$("#HeroPreferredPanel").GetChild(0).FindChildTraverse("ScenePanelPanel"),"HeroPreferredScenePanel",{class:"",particleonly:false,allowrotation:true,rendershadows:true,unit:""})
    
}
init()







// (()=>{
    
    
//     // GameEvents.SendCustomGameEventToServer("initPickJS_lua", {});
//     // GameEvents.Subscribe("initPickJS", SetupHeroList);
//     // CustomNetTables.SubscribeNetTableListener("info", TableListener_Info)


    
// })();




// Timer 

// PickTimer(1+ 15)