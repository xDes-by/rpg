var main = $("#Guild_container")
var guild_list_container = $("#Guild_list_container")
var guild_guild_container = $("#guild_guild_container")
var guild_loading = $("#Guild_loading")
var guild_list = $("#Guild_list")
var guild_loading_button = $("#Guild_loading_button")
var guild_create_button_container = $("#Guild_create_button_container")
var guild_create_button = $("#Guild_create_button")
var Guild_menu_member_leave_accept = $("#Guild_menu_member_leave_accept")
var guild_members_request = $("#guild_members_request")
var guild_members_request_list = $("#guild_members_request_list")
var Guild_menu_member_buy_accept = $("#Guild_menu_member_buy_accept")
var guild_membersbuy_slot = $("#guild_membersbuy_slot")
var DiscountModeActivateFX = $("#DiscountModeActivateFX")

main.visible = false
Guild_menu_member_leave_accept.visible = false
Guild_menu_member_buy_accept.visible = false

var guild_image = 1
var availableIndexTable = [1, 2, 3, 4, 5, 6, 7, 8]
var invopened = false

const MAX_GUILD_MEMBERS = 20

const states = {
	FIRST:  'first',
    MAIN:	'mian',
    LIST:	'list',
    // BOSS:	'boss',
	// INVITE:	'invite'
};

let currentState = states.FIRST;

function changeState(newState) {
    hideAllPanels()
    currentState = newState
    showPanel(currentState)
}

function hideAllPanels() {
	guild_loading.visible = true
	guild_guild_container.visible = false
	guild_list_container.visible = false
	Guild_menu_member_leave_accept.visible = false
	guild_members_request_list.visible = false
	//добавить остальные 
}

function showPanel(state) {
	guild_loading.visible = false
    switch (state) {
        case states.MAIN:
            guild_guild_container.visible = true
            break;
        case states.LIST:
            guild_list_container.visible = true
            break;
		//добавить остальные 
    }
}

function open() {
    invopened = !invopened
	hideAllPanels()
    main.visible = invopened
    if (invopened) {
        GameEvents.SendCustomGameEventToServer("get_game_guilds", {})
    }
}

// ---------------------------------------------------------------------------

function GetGuildLevel(experience){
	var experienceNeeded = 1000
	var pervLevel = 0
	var nextLevel = 1000
	var now_exp = experience
	var level = 1
	while (experience >= experienceNeeded){
		experience = experience - experienceNeeded
		level = level + 1
		pervLevel = pervLevel + experienceNeeded
		experienceNeeded = experienceNeeded + 500
		nextLevel = nextLevel + experienceNeeded
	}	
	need = nextLevel  -pervLevel
	next = now_exp - pervLevel
	var percent = Math.floor(now_exp-pervLevel)/(nextLevel-pervLevel)*100
	return {level:level, percent:percent, need:need, next:next}
}

// ---------------------------------------------------------------------------

function GuildInit(data){
	guild_loading.visible = false
	guild_create_button_container.visible = true
	guild_loading_button.visible = false
	
	guild_create_button.SetPanelEvent('onmouseactivate', create_guild_request);
		
	var all_guilds = data.all_guilds;
	var user_guild = data.user_guild;
	
	if (Object.keys(user_guild).length > 0) {
		UpdateGuildMain(user_guild)
	}else{
		UpdateGuildList(all_guilds)
	}
}

function UpdateGuildMain(user_guild) {
    changeState(states.MAIN);

    var guild_master_permission = false;
    var steamID = Game.GetPlayerInfo(Game.GetLocalPlayerID()).player_steamid;
    if (steamID == user_guild.guild_master) {
        guild_master_permission = true;
    }

    var description_text = $("#Guild_description_label_text");
	description_text.text = user_guild.guild_description
	
    var member_count = $("#Guild_menu_members_count");
	member_count.text = $.Localize("#members_count") + ": " + user_guild.members_count + "/" + user_guild.guild_max_members
	
    var member_list = $("#Guild_menu_member_list");
    var members = user_guild.members;
    member_list.RemoveAndDeleteChildren();

    let sortedMembers = [];
    if (members.hasOwnProperty(user_guild.guild_master)) {
        sortedMembers.push([user_guild.guild_master, members[user_guild.guild_master]]);
    }

    for (let steamId in members) {
        if (members.hasOwnProperty(steamId) && steamId !== user_guild.guild_master) {
            sortedMembers.push([steamId, members[steamId]]);
        }
    }

    for (let [steamId, member_data] of sortedMembers) {
        $.Msg("Steam ID: " + steamId, "Member Data:", member_data);
        var MemberList = $.CreatePanel("Panel", member_list, steamId);
		MemberList.BLoadLayoutSnippet("member_list");
		MemberList.FindChildInLayoutFile("member_card_icon").steamid = steamId;
		MemberList.FindChildInLayoutFile("member_card_name").steamid = steamId;
		MemberList.FindChildInLayoutFile("member_card_remove").visible = guild_master_permission;
		MemberList.FindChildInLayoutFile("member_card_remove").SetPanelEvent('onmouseactivate', (function (Member) {
		return function () {remove_member(Member.FindChildInLayoutFile("member_card_remove"))};
		})(MemberList));
		if (steamId == user_guild.guild_master){
			MemberList.FindChildInLayoutFile("member_card_remove").visible = false;
		}
		MemberList.FindChildInLayoutFile("member_card_date").text = date_conv(member_data.last_start)
		MemberList.FindChildInLayoutFile("member_card_op").text = member_data.earned_points
    }
	

	var panel = $("#guild_right_side_progress");
	var creep_bar = $.CreatePanel("ProgressBar", panel, "Energy_bar");
	creep_bar.AddClass('bar')	
	
	RegenBurner = $.CreatePanel(`DOTAScenePanel`, creep_bar, "RegenBurner", {class: `RegenBurner`, camera: `camera_1`, particleonly: `false`, map: `maps/scenes/hud/healthbarburner.vmap`, hittest: `false`});
	RegenBurner.style.width = "100%"
	RegenBurner.style.height = "26px"
	RegenBurner.style.backgroundColor = '#30bf30'
	RegenBurner.style.width = user_guild.boss_hp + '%'
	
	var text_panel = $.CreatePanel("Label", creep_bar, "creep_bar_count");
	text_panel.text = $.Localize('#boss_hp')+ ": " + user_guild.boss_hp + "%"
	text_panel.AddClass('label_16')

	
	guild_members_request.visible = guild_master_permission
	guild_members_request.SetPanelEvent('onmouseactivate', function() {
		show_requests(user_guild);
	});
	
	guild_membersbuy_slot.SetPanelEvent('onmouseactivate', function() {
		buy_slot(user_guild.guild_max_members);
	});

	var guild_exp_data = GetGuildLevel(user_guild.guild_exp);
	guild_guild_container.FindChildInLayoutFile("Guild_menu_icon").style.backgroundImage = "url('file://{resources}/images/guild/icons/" + user_guild.guild_image + ".png')";
	guild_guild_container.FindChildInLayoutFile("Guild_menu_name").text = user_guild.guild_name
	guild_guild_container.FindChildInLayoutFile("Guild_menu_icon_lvl_text").text = guild_exp_data.level
	guild_guild_container.FindChildInLayoutFile("Guild_menu_icon_pr_bar").style.width = (263/100 * guild_exp_data.percent) + "px";
	
	
	$("#Guild_menu_exp_icon").SetPanelEvent("onmouseover", function() { $.DispatchEvent("DOTAShowTextTooltip", $("#Guild_menu_exp_icon"), guild_exp_data.next + "/" + guild_exp_data.need )});
	$("#Guild_menu_exp_icon").SetPanelEvent("onmouseout", TipsOut)
	
	create_guild_rewards(user_guild.rewards)
}

function create_guild_rewards(rewards){
	var reward_panel = $("#guild_rewards_list");
	reward_panel.RemoveAndDeleteChildren();
	
	let sortedKeys = Object.keys(rewards).sort((a, b) => {
		return parseInt(a.split('_')[1]) - parseInt(b.split('_')[1]);
	});
	for (let key of sortedKeys) {
		$.Msg(key + ": " + rewards[key]);
		var reward = $.CreatePanel("Panel", reward_panel, key);
		reward.AddClass('reward_item')
		reward.style.backgroundImage = "url('file://{resources}/images/guild/menus/" + key + ".png')";
	}
}

function UpdateGuildList(all_guilds){
	guild_list.RemoveAndDeleteChildren();
	changeState(states.LIST)

	const sorted_guilds = Object.values(all_guilds).sort((a, b) => b.experience - a.experience);
	for (let i = 0; i < sorted_guilds.length; i++) {
		const guild = sorted_guilds[i];
		var guild_level = GetGuildLevel(guild.experience);

		var GuildList = $.CreatePanel("Panel", guild_list, "Guild_list_card_" + i);
		GuildList.BLoadLayoutSnippet("guild_list");		
		GuildList.FindChildInLayoutFile("Guild_menu_container_list_icon").style.backgroundImage = "url('file://{resources}/images/guild/icons/" + guild.guild_image + ".png')";
		GuildList.FindChildInLayoutFile("Guild_menu_container_list_name").text = guild.name;
		GuildList.FindChildInLayoutFile("Guild_menu_container_list_level").text = $.Localize("#level") + " " + guild_level.level;
		GuildList.FindChildInLayoutFile("Guild_menu_container_list_count").text = $.Localize("#members") + "<br>" + guild.members_count + "/" + guild.max_members;
		
		if (!guild.free_input){
			GuildList.FindChildInLayoutFile("Guild_menu_container_list_card_button_label").text  = $.Localize('#free_input')
			GuildList.FindChildInLayoutFile("Guild_menu_container_list_card_button").SetPanelEvent('onmouseactivate', (function (Guild) {
				return function () {add_member(guild.id)};
			})(GuildList));
		}else{
			GuildList.FindChildInLayoutFile("Guild_menu_container_list_card_button_label").text  = $.Localize('#apply_to_members')
			GuildList.FindChildInLayoutFile("Guild_menu_container_list_card_button").SetPanelEvent('onmouseactivate', (function (Guild) {
				return function () {apply_to_member(guild.id)};
			})(GuildList));
		}
	}
}

function date_conv(dateString){
	let date = new Date(dateString);
	let year = date.getFullYear();
	let month = String(date.getMonth() + 1).padStart(2, '0');
	let day = String(date.getDate()).padStart(2, '0');
	let formattedDate = `${year}-${month}-${day}`;
	return formattedDate	
}

function NextImage() {
	guild_image++;
	if (guild_image > availableIndexTable.length) {
		guild_image = 1;
	}
	$("#Guild_image_contant").style.backgroundImage = "url('file://{resources}/images/guild/icons/" + guild_image + ".png')";
}

function PrevImage() {
	guild_image--;
	if (guild_image < 1) {
		guild_image = availableIndexTable.length;
	}
	$("#Guild_image_contant").style.backgroundImage = "url('file://{resources}/images/guild/icons/" + guild_image + ".png')";
}

function create_guild_request(){
	var guild_input_name = $("#guild_name_input")
	var toggle = $("#toggle")
	var guild_description_input = $("#guild_description_input")
	var guild_description_input_text = guild_description_input.text
	
	
	var guild_name = guild_input_name.text
	if (guild_name.length < 1 || guild_name == $.Localize("#input_guild_name") || guild_name == ''){
		guild_input_name.text = $.Localize("#input_guild_name")
	}else{	
		guild_create_button.ClearPanelEvent('onmouseactivate');
		GameEvents.SendCustomGameEventToServer("create_game_guild", {name:guild_name, image:guild_image, description:guild_description_input_text, toggle:toggle.checked})
		guild_create_button_container.visible = false
		guild_loading_button.visible = true
		Game.EmitSound('ui.crafting_gem_create')
	}
	
	guild_input_name.text = ''
	guild_description_input.text = ''
}

function leave_guild(text, player_id){
	$("#Guild_menu_member_leave_yes").ClearPanelEvent('onmouseactivate');
	if(text){
		$("#leave_menu").text = $.Localize(text)
		$("#Guild_menu_member_leave_yes").SetPanelEvent('onmouseactivate', function() {
            remove_event('yes', player_id);
        });
	}else{
		$("#leave_menu").text = $.Localize('#leave')
	}
	Guild_menu_member_leave_accept.visible = true;
}

function remove_member(t){
	var parent = t.GetParent()
	var player_id = parent.FindChildInLayoutFile("member_card_name").steamid
	leave_guild('#remove_member', player_id)
}

function leave_event(event){	
	if(event == 'yes'){
		var steamID = Game.GetPlayerInfo(Game.GetLocalPlayerID()).player_steamid;
		$.Msg('leave', steamID)
		GameEvents.SendCustomGameEventToServer("leave_guild", {sid:steamID})
	}
	Guild_menu_member_leave_accept.visible = false;
}

function remove_event(event, player_id){	
	if(event == 'yes'){
		var steamID = Game.GetPlayerInfo(Game.GetLocalPlayerID()).player_steamid;
		if (player_id){
			steamID = player_id
			$.Msg('remove', steamID)
		}
		GameEvents.SendCustomGameEventToServer("remove_member", {sid:steamID})
	}
	Guild_menu_member_leave_accept.visible = false;
}

function add_member(guild_id){
	GameEvents.SendCustomGameEventToServer("add_member", {guild_id:guild_id})
}

function apply_to_member(guild_id){
	GameEvents.SendCustomGameEventToServer("apply_to_member", {guild_id:guild_id})
}

function buy_event(event){	
	if(event == 'yes'){
		GameEvents.SendCustomGameEventToServer("buy_slot", {})
	}
	Guild_menu_member_buy_accept.visible = false;
}

function buy_slot(max){
	if (max < MAX_GUILD_MEMBERS){
		Guild_menu_member_buy_accept.visible = true;
	}else{
		ErrorMessage('#cant_buy_more_slots')
	}
}

function start_boss(){
	$.Msg("start boss")
	// open()
}

function sound_events(data){
	Game.EmitSound(data.sound)
}

////////////////////////////////////////////////////////////////////////////////////

function close_requests(){
	guild_members_request_list.visible = false
}
function show_requests(user_guild) {
	var membership_requests = user_guild.membership_requests
	var guild_id = user_guild.guild_id

    guild_members_request_list.visible = true
    guild_members_request_content = guild_members_request_list.FindChildInLayoutFile("guild_members_request_content")
	guild_members_request_content.RemoveAndDeleteChildren();


    for (let [steamId, member_data] of Object.entries(membership_requests)) {
        var request_list = $.CreatePanel("Panel", guild_members_request_content, steamId);
        request_list.BLoadLayoutSnippet("request_list");
		
		request_list.FindChildInLayoutFile("request_card_icon").steamid = steamId;
		request_list.FindChildInLayoutFile("request_card_name").steamid = steamId;
		request_list.FindChildInLayoutFile("request_card_date").text = date_conv(member_data)
	
		request_list.FindChildInLayoutFile("request_card_yes").SetPanelEvent('onmouseactivate', (function (Member) {
		return function () {approve(steamId, guild_id)};
		})(request_list));

		request_list.FindChildInLayoutFile("request_card_no").SetPanelEvent('onmouseactivate', (function (Member) {
		return function () {reject(steamId, guild_id)};
		})(request_list));
		
		$("#reject_all").SetPanelEvent('onmouseactivate', (function (Member) {
		return function () {reject_all(steamId, guild_id)};
		})(request_list));
    }
}

function approve(sid, guild_id){
	$.Msg(sid, "--", guild_id)	
	GameEvents.SendCustomGameEventToServer("approve_member", {sid:sid, guild_id:guild_id})
}

function reject(sid, guild_id){
	$.Msg(sid, "--", guild_id)	
	GameEvents.SendCustomGameEventToServer("reject_member", {sid:sid, guild_id:guild_id})
}

function reject_all(sid, guild_id){
	$.Msg("reject_all")
	GameEvents.SendCustomGameEventToServer("reject_all", {sid:sid, guild_id:guild_id})	
}

function update_request_list(data){
	UpdateGuildMain(data.user_guild)
	show_requests(data.user_guild)
}

////////////////////////////////////////TIPS//////////////////////////////////////////

function TipsOver(message, pos)
{
    if ($("#"+pos) != undefined){
		if (pos == "Guild_menu_exp_icon"){
			$.DispatchEvent( "DOTAShowTextTooltip", $("#"+pos), $.Localize(next + " / " + need));
		}else{
			$.DispatchEvent( "DOTAShowTextTooltip", $("#"+pos), $.Localize('#'+message));
		}
    }
}

function TipsOut()
{
    $.DispatchEvent( "DOTAHideTitleTextTooltip");
    $.DispatchEvent( "DOTAHideTextTooltip");
}

function ErrorMessage(message){
	GameEvents.SendEventClientSide("dota_hud_error_message",
	{
		"splitscreenplayer": 0,
		"reason": 80,
		"message": message
	})
}






////////////////////////////////////////////////////////


(function(){
	GameEvents.Subscribe( "guild_init", GuildInit)
	GameEvents.Subscribe( "sound_events", sound_events)
	GameEvents.Subscribe( "update_request_list", update_request_list)
})();