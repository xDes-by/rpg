var Quest = {
    context : $("#QuestPanel"),
    SetDescription : function(data){
        this.context.FindChildTraverse("QuestTaskDescriptionLabel").text = $.Localize('#' + data['short'])
    },
    SetCounter : function(data){
        if(Number(data['goal']) > 1){
            this.context.FindChildTraverse("QuestTaskCounterLabel").text = data['now'] + "/" + data['goal']
            this.context.FindChildTraverse("QuestTaskDescription").RemoveClass("DescWithoutCounter")
            this.context.FindChildTraverse("QuestTaskDescription").AddClass("DescWithCounter")
        }else{
            this.context.FindChildTraverse("QuestTaskCounterLabel").text = ""
            this.context.FindChildTraverse("QuestTaskDescription").AddClass("DescWithoutCounter")
            this.context.FindChildTraverse("QuestTaskDescription").RemoveClass("DescWithCounter")
        }
    },
    SetTooltip : function(data){
        this.context.SetPanelEvent("onmouseover", function(){
            $.DispatchEvent( "UIShowCustomLayoutParametersTooltip", Quest.context, "QuestDescription", "file://{resources}/layout/custom_game/questsystem/tooltip/tooltip.xml", `desc=${data['full']}&lore=${data['lore']}`);
        })
        this.context.SetPanelEvent("onmouseout",function(){
            $.DispatchEvent("UIHideCustomLayoutTooltip", "QuestDescription")
        })
    }
}

function TableListener(_, key, data){
    if(key != 'quest') return
    Quest.SetDescription(data)
    Quest.SetCounter(data)
    Quest.SetTooltip(data)
}

CustomNetTables.SubscribeNetTableListener("info", TableListener)

let net = CustomNetTables.GetTableValue( 'info', 'quest' )
if(net){
    Quest.SetDescription(net)
    Quest.SetCounter(net)
    Quest.SetTooltip(net)
}

if(!Game.IsHUDFlipped()){
    Quest.context.style.horizontalAlign = "right"
}