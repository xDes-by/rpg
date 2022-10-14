
abiData = {
    0 : {
        active : {
            desc : "Описание способности можно менять после прокачки талантов. Описание способности можно менять после прокачки талантов.",
            params : [
                {design : "УРОН: ", value : [10, 15, 20, 25, 30]},
                {design : "ДИСТАНЦИЯ: ", value : [1000]},
                {design : "ДЛИТЕЛЬНОСТЬ: ", value : [1.5, 2, 2.5, 3, 3.5]},
                {design : "СКОРОСТЬ: ", value : [600]},
            ],
            cost : {
                cooldown : [50, 40, 30, 20 ,10],
                mana : [100, 200, 300, 400, 500]
            }
        },
        pasive : {
            desc : "Описание пасивной способности, которую можно получить как дополнение к активке, из талантов.",
            params : [
                {design : "БОНУС БРОНИ: ", value : [2, 5, 8, 11, 15]},
                {design : "БОНУС ЗДОРОВЬЯ: ", value : [6000]},
                {design : "ШАНС СРАБАТЫВАНИЯ: ", value : ["17%"]},
                {design : "ВРЕМЯ ДЕЙСТВИЯ: ", value : ["10s"]},
            ],
            cost : {}
        }
    }
}


function handler(pan){
    return
    panId = pan.GetParent().GetParent().GetParent().GetParent().GetParent().id
    tooltipManager = FindDotaHudElement("Tooltips")
    abilityTooltip = tooltipManager.FindChildTraverse("DOTAAbilityTooltip")
    TooltipContents = abilityTooltip.FindChildTraverse("Contents")
    details = TooltipContents.FindChildTraverse("AbilityDetails")
    AbilityCoreDetails = details.FindChildTraverse("AbilityCoreDetails")
    if(panId == "Ability0" || panId == "Ability1" || panId == "Ability2" || panId == "Ability3" || panId == "Ability4" || panId == "Ability5"){
        AbilityCoreDetails.visible = false
    }else{
        AbilityCoreDetails.visible = true
        CustomActive.visible = false
        CustomPasive.visible = false
        return
    }
    index = Players.GetPlayerHeroEntityIndex(0)
    abIndex = Entities.GetAbility( index, 0 )
    ab = Abilities.GetLevel( abIndex )


    CustomActive = details.FindChildTraverse("CustomActive")
    CustomPasive = details.FindChildTraverse("CustomPasive")
    if(!CustomActive){
        CustomActive = $.CreatePanel("Panel", details, "CustomActive")
    }
    if(!CustomPasive){
        CustomPasive = $.CreatePanel("Panel", details, "CustomPasive")
    }

    // pan.RemoveAndDeleteChildren()
    CustomActive.BLoadLayout("file://{resources}/layout/custom_game/tooltips/AbilityTooltip/active.xml", true, true)
    CustomPasive.BLoadLayout("file://{resources}/layout/custom_game/tooltips/AbilityTooltip/pasive.xml", true, true)
    obj = abiData[0]
    if(obj.active){
        CustomActive.visible = true
        CustomActive.FindChildTraverse("AbilityActivePanel").FindChildTraverse("AbilityParams").RemoveAndDeleteChildren()
        CustomActive.FindChildTraverse("CooldownValues").RemoveAndDeleteChildren()
        CustomActive.FindChildTraverse("ManaValues").RemoveAndDeleteChildren()
        CustomActive.FindChildTraverse("AbilityActiveDescLabel").text = obj.active.desc
        for(p of obj.active.params){
            pan = $.CreatePanelWithProperties("Panel", CustomActive.FindChildTraverse("AbilityActivePanel").FindChildTraverse("AbilityParams"), "", {class:"AbilityParamsActive"})
            $.CreatePanelWithProperties("Label", pan, "", {text:p.design})
            for(i in p.value){
                if(i != 0) $.CreatePanelWithProperties("Label", pan, "", {text:"/"})
                c = $.CreatePanelWithProperties("Label", pan, i, {text:p.value[i]})
                if(i == ab-1 || p.value.length == 1){
                    c.AddClass("Active")
                }
            }
        }
        if(!obj.active.cost.cooldown){
            CustomActive.FindChildTraverse("CooldownPanel").visible = false
        }else{
            CustomActive.FindChildTraverse("CooldownPanel").visible = true
            pan = CustomActive.FindChildTraverse("CooldownValues")
            pan.RemoveAndDeleteChildren()
            for(i in obj.active.cost.cooldown){
                if(i != 0) $.CreatePanelWithProperties("Label", pan, "", {text:"/"})
                c = $.CreatePanelWithProperties("Label", pan, i, {text:obj.active.cost.cooldown[i]})
                if(i == ab-1 || obj.active.cost.cooldown.length == 1){
                    c.AddClass("Active")
                }
            }
        }
        if(!obj.active.cost.mana){
            CustomActive.FindChildTraverse("ManaPanel").visible = false
        }else{
            CustomActive.FindChildTraverse("ManaPanel").visible = true
            pan = CustomActive.FindChildTraverse("ManaValues")
            pan.RemoveAndDeleteChildren()
            for(i in obj.active.cost.mana){
                if(i != 0) $.CreatePanelWithProperties("Label", pan, "", {text:"/"})
                c = $.CreatePanelWithProperties("Label", pan, i, {text:obj.active.cost.mana[i]})
                if(i == ab-1 || obj.active.cost.mana.length == 1){
                    c.AddClass("Active")
                }
            }
        }
    }else{
        CustomActive.visible = false 
    }
    if(obj.pasive){ 
        CustomPasive.visible = true
        CustomPasive.FindChildTraverse("AbilityParams").RemoveAndDeleteChildren()
        CustomPasive.FindChildTraverse("CooldownValues").RemoveAndDeleteChildren()
        CustomPasive.FindChildTraverse("ManaValues").RemoveAndDeleteChildren()
        CustomPasive.FindChildTraverse("AbilityPasiveDescLabel").text = obj.pasive.desc
        for(p of obj.pasive.params){
            pan = $.CreatePanelWithProperties("Panel", CustomPasive.FindChildTraverse("AbilityParams"), "", {class:"AbilityParamsPasive"})
            $.CreatePanelWithProperties("Label", pan, "", {text:p.design})
            for(i in p.value){
                if(i != 0) $.CreatePanelWithProperties("Label", pan, "", {text:"/"})
                c = $.CreatePanelWithProperties("Label", pan, i, {text:p.value[i]})
                if(i == ab-1 || p.value.length == 1){
                    c.AddClass("Active")
                }
            }
        }
        if(!obj.pasive.cost.cooldown){
            CustomPasive.FindChildTraverse("CooldownPanel").visible = false
        }else{
            CustomPasive.FindChildTraverse("CooldownPanel").visible = true
            pan = CustomPasive.FindChildTraverse("CooldownValues")
            pan.RemoveAndDeleteChildren()
            for(i in obj.asive.cost.cooldown){
                if(i != 0) $.CreatePanelWithProperties("Label", pan, "", {text:"/"})
                c = $.CreatePanelWithProperties("Label", pan, i, {text:obj.pasive.cost.cooldown[i]})
                if(i == ab-1 || obj.asive.cost.cooldown.length == 1){
                    c.AddClass("Active")
                }
            }
        }
        if(!obj.pasive.cost.mana){
            CustomPasive.FindChildTraverse("ManaPanel").visible = false
        }else{
            CustomPasive.FindChildTraverse("ManaPanel").visible = true
            pan = CustomPasive.FindChildTraverse("ManaValues")
            pan.RemoveAndDeleteChildren()
            for(i in obj.pasive.cost.mana){
                if(i != 0) $.CreatePanelWithProperties("Label", pan, "", {text:"/"})
                c = $.CreatePanelWithProperties("Label", pan, i, {text:obj.pasive.cost.mana[i]})
                if(i == ab-1 || obj.pasive.cost.mana.length == 1){
                    c.AddClass("Active")
                }
            }
        }
    }else{
        CustomPasive.visible = false 
    }



    return

    
    AbilityDescriptionOuterContainer = AbilityCoreDetails.FindChildTraverse("AbilityDescriptionOuterContainer")
    nPan = AbilityDescriptionOuterContainer.FindChildTraverse("DopInfo")
    if(!nPan){
        nPan = $.CreatePanelWithProperties("Panel", AbilityDescriptionOuterContainer, "DopInfo", {style:"flow-children: down;"})
    }
    nPan.RemoveAndDeleteChildren()
    for(let i = 0; i < 5; i++){
        $.CreatePanelWithProperties("Label", nPan, "", {style:"color:red;", text:"{s:cooldown}"})
    }
    // details.FindChildTraverse("AbilityCosts").FindChildTraverse("AbilityCooldown").text = "234567"
}
$.RegisterForUnhandledEvent("DOTAShowAbilityTooltip", handler);
$.RegisterForUnhandledEvent("DOTAShowAbilityTooltipForEntityIndex", handler);
$.RegisterForUnhandledEvent("DOTAShowAbilityTooltipForLevel", handler);
$.RegisterForUnhandledEvent("DOTAShowAbilityTooltipForGuide", handler);
$.RegisterForUnhandledEvent("DOTAShowAbilityTooltipForHero", handler);

$.RegisterForUnhandledEvent("DOTAHideAbilityTooltip", () => {
    tooltipManager = FindDotaHudElement("Tooltips")
    abilityTooltip = tooltipManager.FindChildTraverse("DOTAAbilityTooltip")
    TooltipContents = abilityTooltip.FindChildTraverse("Contents")
    details = TooltipContents.FindChildTraverse("AbilityDetails")
    AbilityCoreDetails = details.FindChildTraverse("AbilityCoreDetails")
    
    AbilityCoreDetails.visible = true

    CustomActive = details.FindChildTraverse("CustomActive")
    if(CustomActive){
        CustomActive.visible = false
    }
    CustomPasive = details.FindChildTraverse("CustomPasive")
    if(CustomPasive){
        CustomPasive.visible = false
    }
});
// $("#HeroPreferredScenePanel").style.marginTop = "200px"
// $("#HeroPreferredScenePanel").SetUnit("npc_dota_hero_tiny", "" ,false)

data = {
    map_name : "map_gaveyard_1",
    x : 100,
    y : 100,
    size : -100,
    scale : 1.1,
}
// $( '#OverlayMap' ).fixedoffsetenabled = true
// $( '#OverlayMap' ).SetFixedOffset( data[ "x" ] , data[ "y" ] );
// $( '#OverlayMap' ).mapscale =  data[ "scale" ];
// $( '#OverlayMap' ).SetFixedBackgroundTexturePosition( data[ "size" ], data[ "x" ] , data[ "y" ] );
// $( "#OverlayMap" ).maptexture = "materials/overviews/" + data['map_name'] + ".vtex"

var Menu = {
    isOpen : true,
    closedBySystem : null,
    arrowAction : function(){
        if(this.isOpen){
            this.isOpen = false
            $("#MenuArrowImg").style.transform = "rotateZ(0deg)"
            $("#MenuBarPanel").style.position = "-100px 0 0"
        }else if(!this.isOpen){
            this.isOpen = true
            $("#MenuArrowImg").style.transform = "rotateZ(180deg)"
            $("#MenuBarPanel").style.position = "0px 0 0"
        }
        this.closedBySystem = false
    },
    ActionClose : function(){
        if(this.isOpen){
            this.closedBySystem = true
        }
        this.isOpen = false
        $("#MenuArrowImg").style.transform = "rotateZ(0deg)"
        $("#MenuBarPanel").style.position = "-100px 0 0"
    },
    ActionOpen : function(){
        if(!this.closedBySystem){return}
        this.isOpen = true
        this.closedBySystem = false
        $("#MenuArrowImg").style.transform = "rotateZ(180deg)"
        $("#MenuBarPanel").style.position = "0px 0 0"
    }
}
$("#MenuArrowPanel").SetPanelEvent("onmouseactivate", ()=>{
    Menu.arrowAction()
})


var Windows = {
    lastAction : null,
    closeOther : function(){
        for(n of ["GameTalantPanel", "GameBPPanel", "GameShopPanel", "GameRatingPanel", "GameAchieve", "GameHeroAchieve", "GameContacts"]){
            $("#" + n).visible = false
        }
        for(n of ["TopMenuBarShopLabel", "TopMenuBarBPLabel", "TopMenuBarTalantLabel", "TopMenuBarRatingLabel", "TopMenuBarAccountAchieveLabel", "TopMenuBarHeroLabel", "TopMenuBarHeroAchieveLabel", "TopMenuBarAccountLabel", "TopMenuBarContactsLabel"]){
            $("#" + n).GetChild(0).RemoveClass("TabUnderline")
        }
        for(n of ["MenuImgShop", "MenuImgPass", "MenuImgTalant", "MenuImgRating", "MenuBarAchieve"]){
            $("#" + n).RemoveClass("MenuImgActive")
        }
        ShopUtility.ActionHide()
    },
    ActionShop : function(b){
        return ()=>{
            if(this.LastActionCheck("ActionShop") && b == 2){ return }
            if(b == 2){ Menu.ActionClose() }
            this.closeOther()
            $("#GameShopPanel").visible = true
            $("#GameUIPanel").visible = true
            $("#TopMenuBarShopLabel").GetChild(0).AddClass("TabUnderline")
            $("#MenuImgShop").AddClass("MenuImgActive")
            this.lastAction = "ActionShop"
        }
    },
    ActionBP : function(b){
        return ()=>{
            if(this.LastActionCheck("ActionBP") && b == 2){ return }
            if(b == 2){ Menu.ActionClose() }
            this.closeOther()
            $("#GameBPPanel").visible = true
            $("#GameUIPanel").visible = true
            $("#TopMenuBarBPLabel").GetChild(0).AddClass("TabUnderline")
            $("#TopMenuBarAccountLabel").GetChild(0).AddClass("TabUnderline")
            $("#MenuImgPass").AddClass("MenuImgActive")
            ShopUtility.ActionShow('bp')
            this.lastAction = "ActionBP"
        }
    },
    ActionTalant : function(b){
        return ()=>{
            if(this.LastActionCheck("ActionTalant") && b == 2){ return }
            if(b == 2){ Menu.ActionClose() }
            this.closeOther()
            $("#GameTalantPanel").visible = true
            $("#GameUIPanel").visible = true
            $("#TopMenuBarTalantLabel").GetChild(0).AddClass("TabUnderline")
            $("#TopMenuBarHeroLabel").GetChild(0).AddClass("TabUnderline")
            $("#MenuImgTalant").AddClass("MenuImgActive")
            ShopUtility.ActionShow('talent')
            this.lastAction = "ActionTalant"
        }
    },
    ActionRating : function(b){
        return ()=>{
            if(this.LastActionCheck("ActionRating") && b == 2){ return }
            if(b == 2){ Menu.ActionClose() }
            this.closeOther()
            $("#GameRatingPanel").visible = true
            $("#GameUIPanel").visible = true
            $("#TopMenuBarRatingLabel").GetChild(0).AddClass("TabUnderline")
            $("#MenuImgRating").AddClass("MenuImgActive")
            this.lastAction = "ActionRating"
        }
    },
    ActionAchieve : function(b){
        return ()=>{
            if(this.LastActionCheck("ActionAchieve") && b == 2){ return }
            if(b == 2){ Menu.ActionClose() }
            this.closeOther()
            $("#GameAchieve").visible = true
            $("#GameUIPanel").visible = true
            $("#TopMenuBarAccountAchieveLabel").GetChild(0).AddClass("TabUnderline")
            $("#TopMenuBarAccountLabel").GetChild(0).AddClass("TabUnderline")
            this.lastAction = "ActionAchieve"
        }
    },
    ActionHeroAchieve : function(b){
        return ()=>{
            if(this.LastActionCheck("ActionHeroAchieve") && b == 2){ return }
            if(b == 2){ Menu.ActionClose() }
            this.closeOther()
            $("#GameHeroAchieve").visible = true
            $("#GameUIPanel").visible = true
            $("#TopMenuBarHeroAchieveLabel").GetChild(0).AddClass("TabUnderline")
            $("#TopMenuBarHeroLabel").GetChild(0).AddClass("TabUnderline")
            this.lastAction = "ActionHeroAchieve"
        }
    },
    ActionContacts : function(b){
        return ()=>{
            if(this.LastActionCheck("ActionContacts") && b == 2){ return }
            if(b == 2){ Menu.ActionClose() }
            this.closeOther()
            $("#GameContacts").visible = true
            $("#GameUIPanel").visible = true
            $("#TopMenuBarContactsLabel").GetChild(0).AddClass("TabUnderline")
            this.lastAction = "ActionContacts"
        }
    },
    ActionClose : function(){
        return ()=>{
            this.closeOther()
            $("#GameUIPanel").visible = false
            this.lastAction = null
            Menu.ActionOpen()
        }
    },
    LastActionCheck : function(act){
        if(act == this.lastAction){
            c = this.ActionClose()
            c()
            return true
        }
        return false
    }
}
$("#TopMenuBarShopLabel").SetPanelEvent("onmouseactivate", Windows.ActionShop(1))
$("#MenuBarShop").SetPanelEvent("onmouseactivate", Windows.ActionShop(2))

$("#TopMenuBarBPLabel").SetPanelEvent("onmouseactivate", Windows.ActionBP(1))
$("#MenuBarPass").SetPanelEvent("onmouseactivate", Windows.ActionBP(2))

$("#TopMenuBarTalantLabel").SetPanelEvent("onmouseactivate", Windows.ActionTalant(1))
$("#MenuBarTalant").SetPanelEvent("onmouseactivate", Windows.ActionTalant(2))

$("#TopMenuBarRatingLabel").SetPanelEvent("onmouseactivate", Windows.ActionRating(1))
$("#MenuBarRating").SetPanelEvent("onmouseactivate", Windows.ActionRating(2))

$("#TopMenuBarAccountAchieveLabel").SetPanelEvent("onmouseactivate", Windows.ActionAchieve(1))
$("#MenuBarAchieve").SetPanelEvent("onmouseactivate", Windows.ActionAchieve(2))

$("#TopMenuBarHeroAchieveLabel").SetPanelEvent("onmouseactivate", Windows.ActionHeroAchieve(1))

$("#TopMenuBarContactsLabel").SetPanelEvent("onmouseactivate", Windows.ActionContacts(1))

$("#CloseImage").SetPanelEvent("onmouseactivate", Windows.ActionClose())

var ShopUtility = {
    isOpen : false,
    ActionHide : function(){
        $("#ShopUtilityPanel").visible = false
        $("#ShopUtilityPanel").style.transitionDuration = "0s"
        $("#ShopUtilityPanel").style.position = "270px 235px 0"
        $("#ArrowImage").style.transform = "rotateZ( 0deg )"
        
        this.isOpen = false
    },
    ActionShow : function(tabName){
        $("#ShopUtilityPanel").style.transitionDuration = "0.2s"
        $("#ShopUtilityPanel").visible = true
        for(i in Shop.UtilPanel){
            for(j in Shop.UtilPanel[i]){
                if(i == tabName){
                    Shop.UtilPanel[i][j].visible = true
                }else{
                    Shop.UtilPanel[i][j].visible = false
                }
            }
        }
    },
    active : function(){
        if(this.isOpen){
            $("#ShopUtilityPanel").style.position = "270px 235px 0"
            $("#ArrowImage").style.transform = "rotateZ( 0deg )"
            this.isOpen = false
        }else{
            $("#ShopUtilityPanel").style.position = "20px 235px 0"
            $("#ArrowImage").style.transform = "rotateZ( 180deg )"
            this.isOpen = true
        }
    }
}

$("#ArrowPanel").SetPanelEvent("onmouseactivate", function(){
    ShopUtility.active()
})



$("#GameUIPanel").visible = false
$("#ShopUtilityPanel").visible = false

$.Msg($.Language(0))