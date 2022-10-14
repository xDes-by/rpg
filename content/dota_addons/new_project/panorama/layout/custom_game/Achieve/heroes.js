var pid = Players.GetLocalPlayer()
var HeroesAchieve = {
    FirstBuild : ()=>{
        this.tab_panel = {}
        this.achieve_pabel = {}
        let tabs_pan = $("#AchieveHeroListPanel")
        let achi_pan = $("#HeroAchievePanel")
        tabs_pan.RemoveAndDeleteChildren()
        achi_pan.RemoveAndDeleteChildren()
        for(let hero_name in this.HeroClassList){
            let hero_class = this.HeroClassList[hero_name]
            // Создание вкладки для перехода на героя
            this.tab_panel[hero_name] = $.CreatePanel("Panel", tabs_pan, "")
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
                this.achieve_pabel[hero_name][obj.id] =  $.CreatePanelWithProperties("Panel", achi_pan, "", {class:"AchieveContainerBg"})
                this.achieve_pabel[hero_name][obj.id].BLoadLayoutSnippet("Achieve")
                HeroesAchieve.BuildAchiBox(hero_name, obj)
                if(Players.GetPlayerSelectedHero( Players.GetLocalPlayer() ) != hero_name){
                    this.achieve_pabel[hero_name][obj.id].visible = false
                }else{
                    this.tab_panel[hero_name].AddClass("ShopTabActive")
                    this.tab_panel[hero_name].ScrollParentToMakePanelFit(3, false)
                }
            }
        }
    },
    BuildAchiBox : (hero_name, obj)=>{
        let pan = this.achieve_pabel[hero_name][obj.id]
        if(!obj.premium || this.premium){
            pan.FindChildTraverse("AchieveLock").visible = false
        }
        pan.FindChildTraverse("TrackPanel").AddClass("AchieveBtnBg")
        pan.FindChildTraverse("AwardPanel").AddClass("AchieveBtnBg")
        // Set Description Of Task
        pan.FindChildTraverse("AchieveLabel").text = obj['full_desc']
        // Set Progress Bar 
        pan.FindChildTraverse("AchieveProgress").max = Number(obj['amount'])
        pan.FindChildTraverse("AchieveProgress").value = Number(this.info[hero_name][pid][obj.id]['count'])
        // Set Count / Amount
        pan.FindChildTraverse("ProgressCounterLabel").text = this.info[hero_name][pid][obj.id]['count'] + "/" + obj['amount']
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
            pan.FindChildTraverse("AchieveGold").SetPanelEvent("onmouseover", HeroesAchieve.ActionMouseOverMoney(hero_name, obj))
        }
        // // Award == gems
        if(obj['reward'][1] == 'gems'){
            pan.FindChildTraverse("AchieveGems").visible = true
            pan.FindChildTraverse("AchieveGemsLabel").text = obj['reward'][2]
            pan.FindChildTraverse("AchieveGems").SetPanelEvent("onmouseover", HeroesAchieve.ActionMouseOverMoney(hero_name, obj))
        }
        // Award == exp
        if(obj['reward'][1] == 'exp'){
            pan.FindChildTraverse("AchieveExp").visible = true
            pan.FindChildTraverse("AchieveExpLabel").text = obj['reward'][2]
            pan.FindChildTraverse("AchieveExp").SetPanelEvent("onmouseover", HeroesAchieve.ActionMouseOverMoney(hero_name, obj))
        }
        pan.FindChildTraverse("AchieveGet").SetPanelEvent("onmouseout", HeroesAchieve.ActionMouseOutMoney(hero_name, obj))
        pan.FindChildTraverse("AchieveNotAvailable").SetPanelEvent("onmouseout", HeroesAchieve.ActionMouseOutMoney(hero_name, obj))
        pan.FindChildTraverse("AchieveGet").SetPanelEvent("onmouseactivate", HeroesAchieve.ActionGetReward(hero_name, obj))

        // Received Gold
        if(this.info[hero_name][pid][obj.id]['received'] && obj['reward'][1] == 'gold'){
            pan.FindChildTraverse("AchieveGold").AddClass("AwardReceived")
            pan.FindChildTraverse("AchieveReceived").visible = true
        }
        // Received Gems
        if(this.info[hero_name][pid][obj.id]['received'] && obj['reward'][1] == 'gems'){
            pan.FindChildTraverse("AchieveGems").AddClass("AwardReceived")
            pan.FindChildTraverse("AchieveReceived").visible = true
        }
        // Received Exp
        if(this.info[hero_name][pid][obj.id]['received'] && obj['reward'][1] == 'exp'){
            pan.FindChildTraverse("AchieveExp").AddClass("AwardReceived")
            pan.FindChildTraverse("AchieveReceived").visible = true
        }
        // Left Button
        pan.FindChildTraverse("TrackPanelCenter").visible = false
        pan.FindChildTraverse("CancelTrackPanelCenter").visible = false
        pan.FindChildTraverse("AchieveFinishedPanelCenter").visible = false
        pan.FindChildTraverse("TrackPanelCenter").SetPanelEvent("onmouseactivate", Achieve.ActionTrack(hero_name, obj['id']))
        pan.FindChildTraverse("CancelTrackPanelCenter").SetPanelEvent("onmouseactivate", Achieve.ActionCancelTrack(hero_name, obj['id']))

        pan.FindChildTraverse("AchieveFinishedPanelCenter").SetPanelEvent("onmouseover", HeroesAchieve.ActionMouseOverFinishedPanel(hero_name, obj))
        pan.FindChildTraverse("CancelTrackPanelCenter").SetPanelEvent("onmouseout", HeroesAchieve.ActionMouseOutFinishedPanel(hero_name, obj))

        // Track Button visible = true
        pan.FindChildTraverse("TrackPanelCenter").visible = true
    },
    init : ()=>{
        let hero_achieve = CustomNetTables.GetAllTableValues("hero_achieve")
        this.HeroClassList = CustomNetTables.GetTableValue('hero_selection',"class")
        this.core = CustomNetTables.GetTableValue('achieve','core')
        this.support = CustomNetTables.GetTableValue('achieve','support')
        let hero_selection = CustomNetTables.GetTableValue('hero_selection', Players.GetLocalPlayer())
        let shop = CustomNetTables.GetTableValue('shop',Players.GetLocalPlayer())
        this.track = []
        if(!hero_achieve || !this.core || !this.support || !shop || !this.HeroClassList || !hero_selection){
            $.Schedule(0.5, ()=>{
                HeroesAchieve.init()
            })
            return
        }
        this.info = {}
        for(let hero of hero_achieve){
            let key = hero['key']
            let value = hero['value']
            this.info[key] = value
        }
        this.talents = hero_selection['talents']
        this.premium = shop['premium']
        HeroesAchieve.FirstBuild()
    },
    ActionMouseOverMoney : (hero_name, obj)=>{
        return ()=>{
            if(this.info[hero_name][pid][obj.id]['received']) return
            
            let pan = this.achieve_pabel[hero_name][obj.id]
            
            if(obj['amount'] == this.info[hero_name][pid][obj.id]['count']){
                pan.FindChildTraverse("AchieveGet").visible = true
            }else{
                pan.FindChildTraverse("AchieveNotAvailable").visible = true
            }
            pan.FindChildTraverse("AchieveGold").AddClass("AwardReceived")
            pan.FindChildTraverse("AchieveGems").AddClass("AwardReceived")
            pan.FindChildTraverse("AchieveExp").AddClass("AwardReceived")
            
        }
    },
    ActionMouseOutMoney : (hero_name, obj)=>{
        return ()=>{
            if(this.info[hero_name][pid][obj.id]['received']) return
            let pan = this.achieve_pabel[hero_name][obj.id]
            pan.FindChildTraverse("AchieveNotAvailable").visible = false
            pan.FindChildTraverse("AchieveGet").visible = false
            pan.FindChildTraverse("AchieveGold").RemoveClass("AwardReceived")
            pan.FindChildTraverse("AchieveGems").RemoveClass("AwardReceived")
            pan.FindChildTraverse("AchieveExp").RemoveClass("AwardReceived")
        }
    },
    ActionGetReward : (hero_name, obj)=>{
        return ()=>{
            if(obj['amount'] != this.info[hero_name][pid][obj.id]['count']) return
            GameEvents.SendCustomGameEventToServer("GetHeroAchieveReward", {
                hero_name : hero_name,
                achieve_id : obj.id
            })
        }
    },
    ActionMouseOverFinishedPanel : (hero_name, obj)=>{
        return ()=>{
            let pan = this.achieve_pabel[hero_name][obj.id]
            if(Achieve.IsTraking(hero_name, obj.id)){
                pan.FindChildTraverse("CancelTrackPanelCenter").visible = true
                pan.FindChildTraverse("AchieveFinishedPanelCenter").visible = false
            }
        }
    },
    ActionMouseOutFinishedPanel : (hero_name, obj)=>{
        return ()=>{
            if(obj['amount'] != this.info[hero_name][pid][obj.id]['count']) return
            let pan = this.achieve_pabel[hero_name][obj.id]
            pan.FindChildTraverse("CancelTrackPanelCenter").visible = false
            pan.FindChildTraverse("AchieveFinishedPanelCenter").visible = true
        }
    },

}

CustomNetTables.SubscribeNetTableListener("achieve", (_, key, data)=>{
    // if(key != Players.GetLocalPlayer()) return
    // Achieve.UpdateInfo(data)
    // for(let i in data['daily']){
    //     Achieve.UpdateCounter('daily', i)
    // }
    // for(let i in data['account']){
    //     Achieve.UpdateCounter('account', i)
    // }
})

HeroesAchieve.init()