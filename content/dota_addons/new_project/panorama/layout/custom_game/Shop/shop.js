var player = null
var Shop = {
    TabPanel : {},
    UtilPanel : {},
}
var premium = null

Shop.Open = function(tabName){
    $("#OwnItems").RemoveClass('ShopTabActive')
    $("#OwnItems").AddClass('ShopTabNewHover')
    for(let category in Shop.List){
        this.TabPanel[category].RemoveClass('ShopTabActive')
        this.TabPanel[category].AddClass('ShopTabNewHover')
        for(let i in Shop.List[category]){
            obj = Shop.List[category][i]
            if(category == tabName){
                $("#ShopItem_"+obj.ID).visible = true
            }else{
                $("#ShopItem_"+obj.ID).visible = false
            }
        }
    }
    if(this.TabPanel[tabName]){
        this.TabPanel[tabName].RemoveClass("ShopTabNewHover")
        this.TabPanel[tabName].AddClass('ShopTabActive')
    }
}
Shop.OwnItems = function(){
    Shop.Open()
    $("#OwnItems").AddClass('ShopTabActive')
    for(let category in Shop.List){
        this.TabPanel[category].RemoveClass('ShopTabActive')
        for(let i in Shop.List[category]){
            obj = Shop.List[category][i]
            if(player[obj.ID]['beginning'] > 0){
                $("#ShopItem_"+obj.ID).visible = true
            }else{
                $("#ShopItem_"+obj.ID).visible = false
            }
        }
    }
}

Shop.ProductStatus = function(obj, status){
    // Disable Buttons
    ProductPanel = $("#ShopItem_"+obj.ID)
    ProductPanel.FindChildTraverse("ShopButtonPanelType_buy_2_curency").visible = false
    ProductPanel.FindChildTraverse("ShopButtonPanelType_buy_gold").visible = false
    ProductPanel.FindChildTraverse("ShopButtonPanelType_buy_gem").visible = false
    if(!obj.consumable){
        ProductPanel.FindChildTraverse("ShopButtonPanelType_get").visible = false
        ProductPanel.FindChildTraverse("ShopButtonPanelType_issued").visible = false
        ProductPanel.FindChildTraverse("ShopButtonPanelType_return").visible = false
    }
    if(status == 'get'){
        ProductPanel.FindChildTraverse("ShopButtonPanelType_get").visible = true
    }
    if(status == 'issued'){
        ProductPanel.FindChildTraverse("ShopButtonPanelType_issued").visible = true
    }
}

Shop.FindByProdID = function(prodID){
    for(let category in Shop.List){
        for(let i in Shop.List[category]){
            if(Shop.List[category][i].ID == prodID){
                return Shop.List[category][i]
            }
        }
    }
}

Shop.Buy = function(obj, currency){
    return function(){
        if(!obj[currency] || obj[currency] > player[currency]) return
        // Set Product Image
        if(obj.image){
            $("#ConfirmGoodsImage").style.backgroundImage = "url('file://{images}/custom_game/"+obj.image+"')"
        }
        // Set Product Name
        $("#ConfirmGoodsNameLabel").text = obj.panorama_name || obj.name
        // Set Product Price    Gold
        if(currency == 'gold'){
            $("#ConfirmCurrencyGold").visible = true
            $("#ConfirmCurrencyGems").visible = false
            $("#ConfirmGoldLabel").text = obj.gold
            var dropCount = Math.round( player['gold'] / obj.gold )
        }
        // Set Product Price    Gems
        if(currency == 'gems'){
            $("#ConfirmCurrencyGold").visible = false
            $("#ConfirmCurrencyGems").visible = true
            $("#ConfirmGemLabel").text = obj.gems
            var dropCount = Math.round( player['gems'] / obj.gems )
        }
        let BuyAmount = 1
        // Set DropDown Params
        $("#ConfirmDropDown").visible = false
        if(obj.combinable){
            $("#ConfirmDropDown").visible = true
            $("#ConfirmDropDown").RemoveAllOptions()
            dropCount = dropCount <= 5 ? dropCount : 5
            for(let i = 1; i <= dropCount; i++){
                $("#ConfirmDropDown").AddOption($.CreatePanelWithProperties("Label", $("#ConfirmDropDown"), i, {text:i+" шт"}))
                $("#ConfirmDropDown").SetSelected("1")
            }
        }
        // DropDown Event
        $("#ConfirmDropDown").SetPanelEvent("oninputsubmit",function(){
            if($("#ConfirmDropDown").GetSelected()){
                BuyAmount = $("#ConfirmDropDown").GetSelected().id
            }
            if(currency == 'gold'){
                $("#ConfirmGoldLabel").text = BuyAmount * obj.gold
            }
            if(currency == 'gems'){
                $("#ConfirmGemLabel").text = BuyAmount * obj.gems
            }
        })
        
        $("#GameShopAccept").visible = true
        // Confirm Event
        $("#ShopConfirm").SetPanelEvent("onmouseactivate", function(){
            GameEvents.SendCustomGameEventToServer("BuyItem", {
                prodID : obj.ID, 
                category : obj.category, 
                amount : BuyAmount,
                currency : currency,
            })
            if(currency == 'gold'){
                $("#MenuTopBarGoldLabel").text = player['gold'] - BuyAmount * obj.gold
            }
            if(currency == 'gems'){
                $("#MenuTopBarGemsLabel").text = player['gems'] - BuyAmount * obj.gems
            }
            $('#GameShopAccept').visible = false
        })
    }
}

Shop.Get = function(obj){
    return function(){
        if(player[obj.ID]['now'] > 0){
            GameEvents.SendCustomGameEventToServer("GetItem", {
                prodID : obj.ID, 
                category : obj.category
            })
        }
    }
}

Shop.ЕxpandTabMenu = ()=>{
    return ()=>{
        // $("#ShopLeftSidePanel").RemoveClass("ShopLeftSidePanelClose")
        // $("#ShopLeftSidePanel").AddClass("ShopLeftSidePanelOpen")
    }
}

Shop.SqueezeTabMenu = ()=>{
    return ()=>{
        // $("#ShopLeftSidePanel").AddClass("ShopLeftSidePanelClose")
        // $("#ShopLeftSidePanel").RemoveClass("ShopLeftSidePanelOpen")
    }
}

function ShopInitJs(){
    $.Msg("ShopInitJs")
    $("#ShopTabsPanel").RemoveAndDeleteChildren()
    $("#ShopRightSidePanel").RemoveAndDeleteChildren()
    $("#ShopUtilityProductsPanel").RemoveAndDeleteChildren()
    // Init Gold Label
    $("#MenuTopBarGoldLabel").text = player['gold']
    // Init Gems Label
    $("#MenuTopBarGemsLabel").text = player['gems']
    for(let category in Shop.List){
        // Tabs Init
        if($("#ShopTabsPanel")){
            Shop.TabPanel[category] = $.CreatePanel("Panel", $("#ShopTabsPanel"), "");
            Shop.TabPanel[category].BLoadLayoutSnippet("ShopTabPanel")
            // AddClass("ShopTab");
            Shop.TabPanel[category].SetPanelEvent("onmouseactivate",()=>{Shop.Open(category)});
            Shop.TabPanel[category].FindChildTraverse("ShopTabLabel").text = $.Localize('#'+category);
            Shop.TabPanel[category].GetChild(0).SetPanelEvent("onmouseover", Shop.ЕxpandTabMenu())
            // Shop.TabPanel[category].AddClass("ShopLeftSidePanelOpen")
            // var TabPanelLabel = $.CreatePanel("Label", Shop.TabPanel[category], "");
            // TabPanelLabel.text = $.Localize('#'+category);
        }
        // 2th Cycle
        for(let ID in Shop.List[category]){
            obj = Shop.List[category][ID]

            var ProductPanel = $.CreatePanel("Panel", $("#ShopRightSidePanel"), "ShopItem_" + obj.ID)
            
            // Snippet
            if(!obj.consumable){
                ProductPanel.BLoadLayoutSnippet('shop_type_1')
            }else{
                ProductPanel.BLoadLayoutSnippet('shop_type_2')
            }
            // Product Name
            ProductPanel.FindChildTraverse("ShopGoodsNameLabel").text = obj.panorama_name || obj.name
            // Product Image
            if(obj.image){
                ProductPanel.FindChildTraverse("ShopGoodsImage").style.backgroundImage = `url('file://{images}/custom_game/${obj.image}')`
            }
            // Product Item Image
            if(obj.itemname){

            }
            // Disable Buttons
            ProductPanel.FindChildTraverse("ShopButtonPanelType_buy_2_curency").visible = false
            ProductPanel.FindChildTraverse("ShopButtonPanelType_buy_2_curency").FindChildTraverse('ShopButtonGoldPanel').SetPanelEvent('onmouseactivate', Shop.Buy(obj, 'gold'))
            ProductPanel.FindChildTraverse("ShopButtonPanelType_buy_2_curency").FindChildTraverse('ShopButtonGemPanel').SetPanelEvent('onmouseactivate', Shop.Buy(obj, 'gems'))
            ProductPanel.FindChildTraverse("ShopButtonPanelType_buy_gold").visible = false
            ProductPanel.FindChildTraverse("ShopButtonPanelType_buy_gold").FindChildTraverse('ShopButtonGoldPanel').SetPanelEvent('onmouseactivate', Shop.Buy(obj, 'gold'))
            ProductPanel.FindChildTraverse("ShopButtonPanelType_buy_gem").visible = false
            ProductPanel.FindChildTraverse("ShopButtonPanelType_buy_gem").FindChildTraverse('ShopButtonGemPanel').SetPanelEvent('onmouseactivate', Shop.Buy(obj, 'gems'))
            if(!obj.consumable){
                ProductPanel.FindChildTraverse("ShopButtonPanelType_get").visible = false
                ProductPanel.FindChildTraverse("ShopButtonPanelType_get").FindChildTraverse("ShopButtonGetPanel").SetPanelEvent("onmouseactivate", Shop.Get(obj))
                ProductPanel.FindChildTraverse("ShopButtonPanelType_issued").visible = false
                ProductPanel.FindChildTraverse("ShopButtonPanelType_return").visible = false
            }else{
                ProductPanel.FindChildTraverse("ShopButtonPanelType_get_2").FindChildTraverse("ShopButtonGetPanel").SetPanelEvent("onmouseactivate", Shop.Get(obj))
            }
            // Button Activation    Gold & Gems
            if(obj.gold && obj.gems){
                ProductPanel.FindChildTraverse("ShopButtonPanelType_buy_2_curency").visible = true
                ProductPanel.FindChildTraverse("ShopButtonPanelType_buy_2_curency").FindChildTraverse("ShopBuyGoldLabel").text = obj.gold
                ProductPanel.FindChildTraverse("ShopButtonPanelType_buy_2_curency").FindChildTraverse("ShopBuyGemLabel").text = obj.gems
            }
            // Button Activation    Gold
            if(obj.gold && !obj.gems){
                ProductPanel.FindChildTraverse("ShopButtonPanelType_buy_gold").visible = true
                ProductPanel.FindChildTraverse("ShopButtonPanelType_buy_gold").FindChildTraverse("ShopBuyGoldLabel").text = obj.gold
            }
            // Button Activation    Gems
            if(obj.gems && !obj.gold){
                ProductPanel.FindChildTraverse("ShopButtonPanelType_buy_gem").visible = true
                ProductPanel.FindChildTraverse("ShopButtonPanelType_buy_gem").FindChildTraverse("ShopBuyGemLabel").text = obj.gems
            }
            // Set Consumabl Amount
            if(obj.consumable){
                ProductPanel.FindChildTraverse("ShopGoodsCounterLabel").text = player[obj.ID]['now'] + " шт"
            }
            // Item Status
            $.Msg(player[obj.ID]['status'])
            if(player[obj.ID]['status'] != 'buy'){
                Shop.ProductStatus(obj, player[obj.ID]['status'])
            }
            // ShopUtil
            if(obj.fast_access){
                if(!Shop.UtilPanel[obj.fast_access]){
                    Shop.UtilPanel[obj.fast_access] = []
                }
                // Create Shop Util Panel
                pan = $.CreatePanel("Panel", $("#ShopUtilityProductsPanel"), "")
                pan.BLoadLayoutSnippet("ShopUtil")
                Shop.UtilPanel[obj.fast_access].push(pan)
                // Shop Util Name
                pan.FindChildTraverse("ShopUtilItemName").text = obj.panorama_name || obj.name
                // Gold And Gems Buttons
                if(obj.gold && obj.gems){
                    pan.FindChildTraverse("ShopUtilBuyGoldLabel").text = obj.gold
                    pan.FindChildTraverse("ShopUtilBuyGemLabel").text = obj.gems
                }
                // Gold Buttons
                if(obj.gold && !obj.gems){
                    pan.FindChildTraverse("ShopUtilBuyGoldLabel").text = obj.gold
                    pan.FindChildTraverse("ShopUtilGemsButtonPanel").visible = false
                }
                // Gems Buttons
                if(obj.gems && !obj.gold){
                    pan.FindChildTraverse("ShopUtilGoldButtonPanel").visible = false
                    pan.FindChildTraverse("ShopUtilBuyGemLabel").text = obj.gems
                }
                // Set Events
                pan.FindChildTraverse("ShopUtilGoldButtonPanel").SetPanelEvent("onmouseactivate", Shop.Buy(obj, 'gold'))
                pan.FindChildTraverse("ShopUtilGemsButtonPanel").SetPanelEvent("onmouseactivate", Shop.Buy(obj, 'gems'))
            }
        }
    }
    Shop.Open('pets')
}






function TableListener(_, key, data){
    if(key != Players.GetLocalPlayer()) return
    player = data

    // Update Gold Label
    $("#MenuTopBarGoldLabel").text = player['gold']
    // Update Gems Label
    $("#MenuTopBarGemsLabel").text = player['gems']

    for(let prodID in player){
        if(prodID != 'gold' && prodID != 'gems' && prodID != "premium"){
            let obj = Shop.FindByProdID(prodID)
            if(!obj) continue
            if(obj.consumable){
                $("#ShopItem_"+obj.ID).FindChildTraverse("ShopGoodsCounterLabel").text = player[prodID]['now'] + " шт"
            }else if(player[prodID]['status'] != 'buy'){
                Shop.ProductStatus(obj, player[obj.ID]['status'])
            }
        }
    }
}

function initShop(){
    player = CustomNetTables.GetTableValue("shop", Players.GetLocalPlayer())
    Shop.List = CustomNetTables.GetTableValue("shop", "list")
    if(!player || !Shop.List){
        $.Schedule(0.5, ()=>{
            init()
        })
        return
    }
    Shop.premium = player["premium"]
    if(Shop.premium){
        $("#SubscriptionActivePanel").visible = true
        $("#SubscriptionBuy").visible = false
    }else{
        $("#SubscriptionActivePanel").visible = false
        $("#SubscriptionBuy").visible = true
    }
    ShopInitJs()
    
}
$.Schedule(2, ()=>{
    initShop()
})



$("#GameShopAccept").visible = false
$("#ShopNoHittest").SetPanelEvent("onmouseactivate",()=>{})
$("#GameShopAccept").SetPanelEvent("onmouseactivate",()=>{})
$("#OwnItems").SetPanelEvent("onmouseactivate", ()=>{ Shop.OwnItems() })
$("#OwnItems").GetChild(0).SetPanelEvent("onmouseover", Shop.ЕxpandTabMenu())
$("#ShopLeftSidePanel").SetPanelEvent("onmouseout", Shop.SqueezeTabMenu())
CustomNetTables.SubscribeNetTableListener("shop", TableListener)