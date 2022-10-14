for(let i = 0; i < 2; i++){
    $("#AchieveListPanel").GetChild(i).FindChildTraverse("AvhieveCloseBtn").visible = false
    $("#AchieveListPanel").GetChild(i).SetPanelEvent("onmouseover", ()=>{
        $("#AchieveListPanel").GetChild(i).FindChildTraverse("AvhieveCloseBtn").visible = true
    })
    $("#AchieveListPanel").GetChild(i).SetPanelEvent("onmouseout", ()=>{
        $("#AchieveListPanel").GetChild(i).FindChildTraverse("AvhieveCloseBtn").visible = false
    })
}


var Achieve = {
    daily : null,
    account : null,
    info : null,
    track : [],
    BuildAchievementPanel : (pan, obj, location, info)=>{
        pan.BLoadLayoutSnippet("Achieve")
        pan.FindChildTraverse("TrackPanel").AddClass("AchieveDayBtnBg")
        pan.FindChildTraverse("AwardPanel").AddClass("AchieveDayBtnBg")
        // Set Description Of Task
        pan.FindChildTraverse("AchieveLabel").text = obj['full_desc']
        // Set Progress Bar 
        pan.FindChildTraverse("AchieveProgress").max = Number(obj['amount'])
        pan.FindChildTraverse("AchieveProgress").value = Number(info[obj.id]['count'])
        // Set Count / Amount
        pan.FindChildTraverse("ProgressCounterLabel").text = info[obj.id]['count'] + "/" + obj['amount']
        // Set Button Award
        pan.FindChildTraverse("AchieveGold").visible = false
        pan.FindChildTraverse("AchieveGems").visible = false
        pan.FindChildTraverse("AchieveExp").visible = false
        pan.FindChildTraverse("AchieveReceived").visible = false
        pan.FindChildTraverse("AchieveGet").visible = false
        pan.FindChildTraverse("AchieveNotAvailable").visible = false
        // Award == Gold
        if(obj['reward'][1] == 'gold'){
            pan.FindChildTraverse("AchieveGold").visible = true
            pan.FindChildTraverse("AchieveGoldLabel").text = obj['reward'][2]
            pan.FindChildTraverse("AchieveGold").SetPanelEvent("onmouseover", Achieve.ActionMouseOverMoney(location, obj, info, pan))
        }
        // Award == gems
        if(obj['reward'][1] == 'gems'){
            pan.FindChildTraverse("AchieveGems").visible = true
            pan.FindChildTraverse("AchieveGemsLabel").text = obj['reward'][2]
            pan.FindChildTraverse("AchieveGems").SetPanelEvent("onmouseover", Achieve.ActionMouseOverMoney(location, obj, info, pan))
        }
        // Award == exp
        if(obj['reward'][1] == 'exp'){
            pan.FindChildTraverse("AchieveExp").visible = true
            pan.FindChildTraverse("AchieveExpLabel").text = obj['reward'][2]
            pan.FindChildTraverse("AchieveExp").SetPanelEvent("onmouseover", Achieve.ActionMouseOverMoney(location, obj, info, pan))
        }
        pan.FindChildTraverse("AchieveGet").SetPanelEvent("onmouseout", Achieve.ActionMouseOutMoney(location, obj, info, pan))
        pan.FindChildTraverse("AchieveNotAvailable").SetPanelEvent("onmouseout", Achieve.ActionMouseOutMoney(location, obj, info, pan))
        pan.FindChildTraverse("AchieveGet").SetPanelEvent("onmouseactivate", Achieve.ActionGetReward(location, obj, info, pan))
        // Received Gold
        if(info[obj.id]['received'] && obj['reward'][1] == 'gold'){
            pan.FindChildTraverse("AchieveGold").AddClass("AwardReceived")
            pan.FindChildTraverse("AchieveReceived").visible = true
            
        }
        // Received Gems
        if(info[obj.id]['received'] && obj['reward'][1] == 'gems'){
            pan.FindChildTraverse("AchieveGems").AddClass("AwardReceived")
            pan.FindChildTraverse("AchieveReceived").visible = true
        }

        // Left Button
        pan.FindChildTraverse("TrackPanelCenter").visible = false
        pan.FindChildTraverse("CancelTrackPanelCenter").visible = false
        pan.FindChildTraverse("AchieveFinishedPanelCenter").visible = false
        pan.FindChildTraverse("TrackPanelCenter").SetPanelEvent("onmouseactivate", Achieve.ActionTrack(location, obj, info, pan))
        pan.FindChildTraverse("CancelTrackPanelCenter").SetPanelEvent("onmouseactivate", Achieve.ActionCancelTrack(location, obj, info, pan))
        
        pan.FindChildTraverse("AchieveFinishedPanelCenter").SetPanelEvent("onmouseover", Achieve.ActionMouseOverFinishedPanel(location, obj, info, pan))
        pan.FindChildTraverse("CancelTrackPanelCenter").SetPanelEvent("onmouseout", Achieve.ActionMouseOutFinishedPanel(location, obj, info, pan))

        // Track Button visible = true
        pan.FindChildTraverse("TrackPanelCenter").visible = true
        if(!obj['premium'] || this.premium){
            pan.FindChildTraverse("AchieveLock").visible = false
        }
    },
    init : ()=>{
        // достижения
        this.info = CustomNetTables.GetTableValue('achieve',Players.GetLocalPlayer())
        this.account = CustomNetTables.GetTableValue('achieve','account')
        // дневные
        this.daily = CustomNetTables.GetTableValue('achieve','daily')
        // герои
        let hero_achieve = CustomNetTables.GetAllTableValues("hero_achieve")
        this.HeroClassList = CustomNetTables.GetTableValue('hero_selection',"class")
        this.core = CustomNetTables.GetTableValue('achieve','core')
        this.support = CustomNetTables.GetTableValue('achieve','support')
        let hero_selection = CustomNetTables.GetTableValue('hero_selection', Players.GetLocalPlayer())
        // магазин/премиум
        let shop = CustomNetTables.GetTableValue('shop',Players.GetLocalPlayer())
        this.track = []
        if(!this.info || !this.account || !this.daily || !shop || !hero_achieve || !this.core || !this.support || !hero_selection){
            $.Schedule(0.5, ()=>{
                Achieve.init()
            })
            return
        }
        this.talents = hero_selection['talents']
        for(let hero of hero_achieve){
            let key = hero['key']
            let value = hero['value'][Players.GetLocalPlayer()]
            this.info[key] = value
        }
        this.premium = shop['premium']

        this.daily_panel = []
        $("#DayQuestPanelContainer").RemoveAndDeleteChildren()
        for(let i in this.daily){
            let obj = this.daily[i]
            let pan = $.CreatePanelWithProperties("Panel", $("#DayQuestPanelContainer"), "", {class:"AchieveContainerDayBg"})
            Achieve.BuildAchievementPanel(pan, obj, 'daily', this.info['daily'])
            this.daily_panel[obj.id] = pan
        }

        this.account_panel = {}
        $("#GameAchieveScroll").RemoveAndDeleteChildren()
        for(let i in this.account){
            let obj = this.account[i]
            let pan = $.CreatePanelWithProperties("Panel", $("#GameAchieveScroll"), "", {class:"AchieveContainerBg"})
            Achieve.BuildAchievementPanel(pan, obj, 'account', this.info['account'])
            this.account_panel[obj.id] = pan
        }

        this.tab_panel = {}
        this.achieve_pabel = {}
        $("#AchieveHeroListPanel").RemoveAndDeleteChildren()
        $("#HeroAchievePanel").RemoveAndDeleteChildren()
        for(let hero_name in this.HeroClassList){
            let hero_class = this.HeroClassList[hero_name]
            // Создание вкладки для перехода на героя
            this.tab_panel[hero_name] = $.CreatePanel("Panel", $("#AchieveHeroListPanel"), "")
            this.tab_panel[hero_name].BLoadLayoutSnippet("HeroAchiTab")
            this.tab_panel[hero_name].FindChildTraverse("AchieveHeroName").text = $.Localize('#'+hero_name)
            if(!this.talents[hero_name] || this.talents[hero_name].level == 0){
                this.tab_panel[hero_name].FindChildTraverse("AchieveHeroLevel").text = $.Localize('0 ур')
            }else{
                this.tab_panel[hero_name].FindChildTraverse("AchieveHeroLevel").text = $.Localize(this.talents[hero_name].level + ' ур')
            }
            // Создание вкладки c заданиями героя
            this.achieve_pabel[hero_name] = []
            for(let i in this[hero_class]){
                let obj = this[hero_class][i]
                this.achieve_pabel[hero_name][obj.id] =  $.CreatePanelWithProperties("Panel", $("#HeroAchievePanel"), "", {class:"AchieveContainerBg"})
                this.achieve_pabel[hero_name][obj.id].BLoadLayoutSnippet("Achieve")
                Achieve.BuildAchievementPanel(this.achieve_pabel[hero_name][obj.id], obj, hero_name, this.info[hero_name])
                if(Players.GetPlayerSelectedHero( Players.GetLocalPlayer() ) != hero_name){
                    this.achieve_pabel[hero_name][obj.id].visible = false
                }else{
                    this.tab_panel[hero_name].AddClass("ShopTabActive")
                    this.tab_panel[hero_name].ScrollParentToMakePanelFit(3, false)
                }
            }
        }
    },

    ActionTrack : (location, obj, info, pan)=>{
        return ()=>{
            let trackNew = [{ obj : obj, location : location, info : info, pan : pan}]
            for(let i = 0; i < 2; i++){
                if(this.track[i] && this.track[i].obj != obj){
                    trackNew.push(this.track[i])
                }
            }
            this.track = trackNew
            if(this.track[2]){
                Achieve.TrackingButtonReplacement(this.track[2].location, this.track[2].obj, this.track[2].info, this.track[2].pan)
            }
            Achieve.TrackVisualization()
            Achieve.TrackingButtonReplacement(location, obj, info, pan)
        }
    },
    TrackVisualization : ()=>{
        if(!this.track[0] && !this.track[1]){
            $("#AchieveCunterPanel").visible = false
        }else{
            $("#AchieveCunterPanel").visible = true
        }
        for(let i = 0; i < 2; i++){
            pan = $("#AchieveListPanel").GetChild(i)
            // Panel visibility
            if(!this.track[i]){
                pan.visible = false
                continue
            }else{
                pan.visible = true
            }
            let obj = this.track[i].obj
            let location = this.track[i].location
            let info = this.info[location][obj.id]
            pan.FindChildTraverse("AchieveQuestTaskDescriptionLabel").text = obj['short_desc']
            pan.FindChildTraverse("AchieveQuestTaskCounterLabel").text = info['count'] + "/" + obj['amount']
            pan.FindChildTraverse("AvhieveCloseBtn").SetPanelEvent("onmouseactivate", Achieve.ActionCancelTrack( this.track[i].location, this.track[i].obj, this.track[i].info, this.track[i].pan ))
        }
    },
    ActionCancelTrack : (location, obj, info, pan)=>{
        return ()=>{

            trackNew = []
            this.track = this.track == undefined ? [] : this.track
            for(let i = 0; i < 2; i++){
                if(this.track[i] && (this.track[i].location != location || this.track[i].obj != obj)){
                    trackNew.push(this.track[i])
                }
            }
            this.track = trackNew
            Achieve.TrackVisualization()
            Achieve.TrackingButtonReplacement(location, obj, info, pan)
        }
    },
    TrackingButtonReplacement : (location, obj, info, pan)=>{
        pan.FindChildTraverse("TrackPanelCenter").visible = false
        pan.FindChildTraverse("CancelTrackPanelCenter").visible = false
        pan.FindChildTraverse("AchieveFinishedPanelCenter").visible = false
        let count = info[obj.id]['count']
        // Achieve finished
        if(obj['amount'] == count){
            pan.FindChildTraverse("AchieveFinishedPanelCenter").visible = true
            return
        }
        // Can Cancel Tracking
        if(Achieve.IsTraking(location, obj)){
            pan.FindChildTraverse("CancelTrackPanelCenter").visible = true
        }
        // Can Track
        else{
            pan.FindChildTraverse("TrackPanelCenter").visible = true
        }
    },
    UpdateAchieveInfo : (data)=>{
        if(!this.info) this.info = {}
        this.info['account'] = data['account']
        this.info['daily'] = data['daily']
    },
    UpdateDaily : (data)=>{
        this.daily = data
    },
    UpdateAccount : (data)=>{
        this.account = data
    },
    UpdateCounterDaily : (id)=>{
        let pan = this.daily_panel[id]
        let info = this.info['daily']
        let obj = this.daily[id]
        pan.FindChildTraverse("AchieveProgress").value = info[id]['count']
        pan.FindChildTraverse("ProgressCounterLabel").text = info[id]['count'] + "/" + obj['amount']
        // обновление отслеживаемного
        for(let i = 0; i < 2; i++){
            if(this.track[i] && this.track[i].location == 'daily' && this.track[i].obj['id'] == id){
                $("#AchieveListPanel").GetChild(i).FindChildTraverse("AchieveQuestTaskCounterLabel").text = info[id]['count'] + "/" + obj['amount']
            }
        }
        // обновление полученной награды
        if(info[id]['received']){
            pan.FindChildTraverse("AchieveGet").visible = false
            pan.FindChildTraverse("AchieveReceived").visible = true
            pan.FindChildTraverse("AchieveGems").AddClass("AwardReceived")
            pan.FindChildTraverse("AchieveGold").AddClass("AwardReceived")
        }
        Achieve.TrackingButtonReplacement('daily', obj, info, pan)
        if(this.premium){
            pan.FindChildTraverse("AchieveLock").visible = false
        }
    },
    UpdateCounterAccount : (id)=>{
        let pan = this.account_panel[id]
        let info = this.info['account']
        let obj = this.account[id]
        pan.FindChildTraverse("AchieveProgress").value = info[id]['count']
        pan.FindChildTraverse("ProgressCounterLabel").text = info[id]['count'] + "/" + obj['amount']
        // обновление отслеживаемного
        for(let i = 0; i < 2; i++){
            if(this.track[i] && this.track[i].location == 'account' && this.track[i].obj['id'] == id){
                $("#AchieveListPanel").GetChild(i).FindChildTraverse("AchieveQuestTaskCounterLabel").text = info[id]['count'] + "/" + obj['amount']
            }
        }
        // обновление полученной награды
        if(info[id]['received']){
            pan.FindChildTraverse("AchieveGet").visible = false
            pan.FindChildTraverse("AchieveReceived").visible = true
            pan.FindChildTraverse("AchieveGems").AddClass("AwardReceived")
            pan.FindChildTraverse("AchieveGold").AddClass("AwardReceived")
        }
        Achieve.TrackingButtonReplacement('account', obj, info, pan)
        if(this.premium){
            pan.FindChildTraverse("AchieveLock").visible = false
        }
    },
    // Следит ли игрок за квестом
    IsTraking : (location, obj, info, pan)=>{
        for(let i = 0; i < 2; i++){
            if(this.track[i] && this.track[i].location == location && this.track[i].obj == obj){
                return true
            }
        }
        return false
    },
    ActionMouseOverFinishedPanel : (location, obj, info, pan)=>{
        return ()=>{
            if(Achieve.IsTraking(location, obj.id)){
                pan.FindChildTraverse("CancelTrackPanelCenter").visible = true
                pan.FindChildTraverse("AchieveFinishedPanelCenter").visible = false
            }
        }
    },
    ActionMouseOutFinishedPanel : (location, obj, info, pan)=>{
        return ()=>{
            if(obj['amount'] != info[obj.id]['count']) return
            pan.FindChildTraverse("CancelTrackPanelCenter").visible = false
            pan.FindChildTraverse("AchieveFinishedPanelCenter").visible = true
        }
    },
    ActionMouseOverMoney : (location, obj, info, pan)=>{
        return ()=>{
            if(info[obj.id]['received']) return
            
            if(obj['amount'] == info[obj.id]['count']){
                pan.FindChildTraverse("AchieveGet").visible = true
            }else{
                pan.FindChildTraverse("AchieveNotAvailable").visible = true
            }
            pan.FindChildTraverse("AchieveGold").AddClass("AwardReceived")
            pan.FindChildTraverse("AchieveGems").AddClass("AwardReceived")
            
        }
    },
    ActionMouseOutMoney : (location, obj, info, pan)=>{
        return ()=>{
            if(info[obj.id]['received']) return
            pan.FindChildTraverse("AchieveNotAvailable").visible = false
            pan.FindChildTraverse("AchieveGet").visible = false
            pan.FindChildTraverse("AchieveGold").RemoveClass("AwardReceived")
            pan.FindChildTraverse("AchieveGems").RemoveClass("AwardReceived")
        }
    },
    ActionGetReward : (location, obj, info, pan)=>{
        return ()=>{
            if(obj['amount'] != info[obj.id]['count']) return
            GameEvents.SendCustomGameEventToServer("GetAccountReward", {
                location : location,
                achieve_id : obj.id,
            })
        }
    }
}


function TableListener(_, key, data){
    if(key != Players.GetLocalPlayer()) return
    Achieve.UpdateAchieveInfo(data)
    for(let i in data['daily']){
        Achieve.UpdateCounterDaily(i)
    }
    for(let i in data['account']){
        Achieve.UpdateCounterAccount(i)
    }
}




CustomNetTables.SubscribeNetTableListener("achieve", TableListener)

Achieve.init()
// GameEvents.SendCustomGameEventToServer("AchieveAndDailyRequest", {})
// GameEvents.Subscribe("AchieveAndDailyReturn", (t)=>{
//     Achieve.UpdateDaily(t.daily)
//     Achieve.UpdateAccount(t.account)
// });

// AchieveAndDailyReturn