var xSensitivity = 1/7;
var ySensitivity = 1/5;
var pitch = 1;
var yaw = 90;
var prevCursorPos;
var old_pitch;
var pitch_updater = 320;

function test(){
	$.Schedule(0.03, function()
    {
		// GameEvents.SendEventClientSide( "dota2_deadlock_console_command", { Command : "dota_camera_distance 100"} )
		// GameEvents.SendEventClientSide( "dota2_deadlock_console_command", { Command : "dota_camera_disable_zoom 1"} )
		GameUI.SetCameraDistance(60)
		
		
		let screen_height = (Game.GetScreenHeight() / 2) * 0.8
		let screen_width = (Game.GetScreenWidth() / 2) *0.8
		
		cursorPos = GameUI.GetCursorPosition()
		
		if (prevCursorPos == null)
        {
            prevCursorPos = cursorPos;
        }
		
		var deltaX = cursorPos[0] - prevCursorPos[0];
        var deltaY = cursorPos[1] - prevCursorPos[1];

        prevCursorPos = cursorPos;

		predel = 5
		
		let y_difference = cursorPos[1] - screen_height;

        let ofset = 0;
        if (y_difference !== 0) {
            ofset = (y_difference / screen_height) * predel;
            if (ofset > predel) ofset = predel;
            if (ofset < -predel) ofset = -predel;
        }

        // $.Msg('of value: ', ofset);
		// GameUI.SetCameraPitchMin(9+ofset)
		// GameUI.SetCameraPitchMax(9+ofset)
		
		
			
		// GameUI.WorldToScreenXYClamped(1)	
		
		pitch += deltaY * ySensitivity;
        let new_pitch = pitch+ 320
        if (old_pitch == null)
        {
            old_pitch = new_pitch
        }
        if (new_pitch > old_pitch)
        {
            pitch_updater = pitch_updater + Math.abs(new_pitch-old_pitch)
            old_pitch = new_pitch
        }
        else
        {
            pitch_updater = pitch_updater - Math.abs(new_pitch-old_pitch)
            old_pitch = new_pitch
        }
        if (pitch_updater <= 320)
        {
            pitch_updater = 320;
        }
        if (pitch_updater > 390 )
        {
            pitch_updater = 390 ;
        }
		
		yaw -= deltaX * xSensitivity;

        while (yaw <= 0)
            yaw += 360;
        while (yaw >= 360)
            yaw -= 360;

        //////////////////////////////////////

        // if (!no_changes)
        // {
            GameUI.SetCameraPitchMin(pitch_updater);
            GameUI.SetCameraPitchMax(pitch_updater);
            GameUI.SetCameraYaw(yaw);
        // }
		GameUI.SetCameraLookAtPositionHeightOffset(220);
		test()
	})
}

test()

// GameUI.SetRenderBottomInsetOverride( 0 );
// GameUI.SetRenderTopInsetOverride( 0 );
// GameUI.SetCameraTerrainAdjustmentEnabled( false )
// GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_TOP_TIMEOFDAY, false );
// GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_TOP_HEROES, false );
// GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_FLYOUT_SCOREBOARD, false );
// GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_PREGAME_STRATEGYUI, false );
// GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_ENDGAME, false );
// GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_HERO_SELECTION_TEAMS, false );
// GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_ACTION_MINIMAP, false );
// GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_INVENTORY_SHOP, false );
// GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_INVENTORY_ITEMS, false );
// GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_INVENTORY_QUICKBUY, false );
// GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_INVENTORY_COURIER, false );
// GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_ACTION_PANEL, false );


// var lookatOff = 140;
// var pitch = 1;
// var yaw = 90;
// var targetHeightOffset = 200;
// var currentHeightOffset = 200;
// var currentDistanceCamera_updater = 0;
// var currentDistanceCamera_now = 190;
// var PITCH_MIN = 1
// var distance = 250;
// var xSensitivity = 1/7;
// var ySensitivity = 1/5;
// var camActivate = true;
// var prevCursorPos = null;
// var cursor_enabled = false;
// var tab_pressed = false;
// var abilities_price_count = [1, 1, 2, 5]
// var SHOP_OPEN_STAGE = false
// var INIT_SHOP_DONE = false
// var pitch_updater = 320
// var old_pitch = null
// var SELECTED_ITEM_TO_SELL = null
// var BUY_ITEM_PRE_SELL = null
// var FAST_RELOAD = false
// var LOSE_RELOAD = false

// Camera()

// function Camera()
// {
    // var ent = Players.GetPlayerHeroEntityIndex( Players.GetLocalPlayer() );
    // if (ent == -1 || ent == undefined || ent == null)
    // {
        // $.Schedule(1/200, Camera);
        // return
    // }

    // if (camActivate)
    // {
        // var cursorPos = GameUI.GetCursorPosition();
        // if (prevCursorPos == null)
        // {
            // prevCursorPos = cursorPos;
        // }

        // var deltaX = cursorPos[0] - prevCursorPos[0];
        // var deltaY = cursorPos[1] - prevCursorPos[1];

        // if (cursor_enabled)
        // {
            // UpdateCameraDistanceAndHeight(ent)
            // prevCursorPos = cursorPos;
            // $.Schedule(1/200, Camera);
            // return
        // }

        // if ((cursorPos[0] <= 0 || cursorPos[0] >= (Game.GetScreenWidth()-10)) || (cursorPos[1] <= 0 || cursorPos[1] >= (Game.GetScreenHeight()-10)))
        // {
            // GameEvents.SendEventClientSide( "dota2_deadlock_console_command", { Command : "dota_camera_allow_freecam 1"} )
            // GameEvents.SendEventClientSide( "dota2_deadlock_console_command", { Command : "dota_toggle_free_camera"} )
            // GameEvents.SendEventClientSide( "dota2_deadlock_console_command", { Command : "dota_toggle_free_camera"} )
        // }

        // let screen_width = (Game.GetScreenWidth() / 2) * 0.8
        // let screen_height = (Game.GetScreenHeight() / 2) * 0.8
        // let no_changes = false
        // if ((deltaX > screen_width || deltaX < -screen_width) || (deltaY > screen_height || deltaY < -screen_height))
        // {
            // UpdateCameraDistanceAndHeight(ent)
            // prevCursorPos = cursorPos;
            // $.Schedule(1/200, Camera);
            // return
        // }
        
        // prevCursorPos = cursorPos;
      

        // yaw -= deltaX * xSensitivity;

        // while (yaw <= 0)
            // yaw += 360;
        // while (yaw >= 360)
            // yaw -= 360;


        // pitch += deltaY * ySensitivity;
        // let new_pitch = pitch+ 320
        // if (old_pitch == null)
        // {
            // old_pitch = new_pitch
        // }
        // if (new_pitch > old_pitch)
        // {
            // pitch_updater = pitch_updater + Math.abs(new_pitch-old_pitch)
            // old_pitch = new_pitch
        // }
        // else
        // {
            // pitch_updater = pitch_updater - Math.abs(new_pitch-old_pitch)
            // old_pitch = new_pitch
        // }
        // if (pitch_updater <= 320)
        // {
            // pitch_updater = 320;
        // }
        // if (pitch_updater > 390 )
        // {
            // pitch_updater = 390 ;
        // }

        //////////////////////////////////////

        // if (!no_changes)
        // {
            // GameUI.SetCameraPitchMin(pitch_updater);
            // GameUI.SetCameraPitchMax(pitch_updater);
            // GameUI.SetCameraYaw(yaw);
        // }
    // }

    // UpdateCameraDistanceAndHeight(ent)
    
    // $.Schedule(1/200, Camera);
// }

// function FindModifier(unit, modifier) 
// {
    // for (var i = 0; i < Entities.GetNumBuffs(unit); i++) 
    // {
        // if (Buffs.GetName(unit, Entities.GetBuff(unit, i)) == modifier)
        // {
            // return Entities.GetBuff(unit, i);
        // }
    // }
    // return "none"
// }

// function UpdateCameraDistanceAndHeight(ent)
// {
    // let modifier_viscous_4 = FindModifier(ent, "modifier_viscous_4");
    // if (modifier_viscous_4 == "none")
    // {
        // modifier_viscous_4 = FindModifier(ent, "modifier_dynamo_4");
    // }
    // if (modifier_viscous_4 == "none")
    // {
        // modifier_viscous_4 = FindModifier(ent, "modifier_seven_4");
    // }
    // if (modifier_viscous_4 == "none")
    // {
        // modifier_viscous_4 = FindModifier(ent, "modifier_bebopp_4");
    // }
    // if (modifier_viscous_4 != "none")
    // {
        // currentDistanceCamera_updater = 600;
        // GameUI.SetCameraDistance(600);
    // }
    // else
    // {
        // currentDistanceCamera_updater = (currentDistanceCamera_updater + ((currentDistanceCamera_now - currentDistanceCamera_updater) * 0.05))
        // GameUI.SetCameraDistance(currentDistanceCamera_updater);
    // }

    // let modifier_deadlock_jump = FindModifier(ent, "modifier_deadlock_jump");
    // if (modifier_deadlock_jump == "none")
    // {
        // modifier_deadlock_jump = FindModifier(ent, "modifier_zipline_movement");
    // }
    // if (modifier_deadlock_jump != "none") 
    // {
        // let height_count = Buffs.GetStackCount(ent, modifier_deadlock_jump);
        // targetHeightOffset = 190 + height_count;
    // } 
    // else 
    // {
        // targetHeightOffset = 190;
    // }
    
    // currentHeightOffset = (currentHeightOffset + ((targetHeightOffset - currentHeightOffset) * 0.05))
    // GameUI.SetCameraLookAtPositionHeightOffset(currentHeightOffset);
// }

// function CursorUpdater()
// {
    // let current_cursor = Game.GetConvarInt( "dota_hide_cursor" )
    // if (IsTabPressed() || SHOP_OPEN_STAGE) 
    // {
        // if (current_cursor == 1)
        // {
            // GameEvents.SendEventClientSide( "dota2_deadlock_console_command", { Command : "dota_hide_cursor 0"} )
            // cursor_enabled = true
        // }
    // }
    // else
    // {
        // if (current_cursor == 0)
        // {
            // GameEvents.SendEventClientSide( "dota2_deadlock_console_command", { Command : "dota_hide_cursor 1"} )
            // cursor_enabled = false
        // }
    // }
    // $.Schedule(1/200, CursorUpdater);
// }

// function Aim()
// {
    // var cross = $("#CrossHair");
    // var crossPos = [cross.actualxoffset + cross.actuallayoutwidth/2, cross.actualyoffset + cross.actuallayoutheight/2];
    // var spos = GameUI.GetScreenWorldPosition(crossPos);

    // if (spos == null)
    // {
        // let ent = Players.GetPlayerHeroEntityIndex( Players.GetLocalPlayer() );
        // if (ent == -1 || ent == undefined || ent == null)
        // {
            // $.Schedule(1/200, Aim);
            // return
        // }
        // var origin = Entities.GetAbsOrigin(ent);
        // var forwardVector = Entities.GetForward(ent);
        // var targetX = origin[0] + forwardVector[0] * distance;
        // var targetY = origin[1] + forwardVector[1] * distance;
        // var targetZ = origin[2] + forwardVector[2] * distance;
        // GameEvents.SendCustomGameEventToServer( "deadlock_set_mouse_camera", {"x":targetX, "y":targetY, "z":targetZ});
    // }
    // else
    // {
        // GameEvents.SendCustomGameEventToServer( "deadlock_set_mouse_camera", {"x":spos[0], "y":spos[1], "z":spos[2]});
    // }
    // $.Schedule(1/200, Aim);
// }  

// function GetAimPoint()
// {
    // var cross = $("#CrossHair");
    // var crossPos = [cross.actualxoffset + cross.actuallayoutwidth/2, cross.actualyoffset + cross.actuallayoutheight/2];
    // var spos = GameUI.GetScreenWorldPosition(crossPos);
    // if (spos == null)
    // {
        // let ent = Players.GetPlayerHeroEntityIndex( Players.GetLocalPlayer() );
        // if (ent == -1 || ent == undefined || ent == null)
        // {
            // $.Schedule(1/200, Aim);
            // return
        // }
        // var origin = Entities.GetAbsOrigin(ent);
        // var forwardVector = Entities.GetForward(ent);
        // var targetX = origin[0] + forwardVector[0] * distance;
        // var targetY = origin[1] + forwardVector[1] * distance;
        // var targetZ = origin[2] + forwardVector[2] * distance;
        // return [targetX, targetY, targetZ];
    // }
    // else
    // {
        // return [spos[0], spos[1], spos[2]];
    // }
// }

// function InitKeyBind()
// {
    // InitKeyBindButton("a", "A")
    // InitKeyBindButton("d", "D")
    // InitKeyBindButton("w", "W")
    // InitKeyBindButton("s", "S")
    // InitKeyBindButton("r", "R")
    // InitKeyBindButton("tab", "Tab", true)
    // InitKeyBindButton("1", "1", true)
    // InitKeyBindButton("2", "2", true)
    // InitKeyBindButton("3", "3", true)
    // InitKeyBindButton("4", "4", true)
    // InitKeyBindButton("b", "B", true)
    // InitKeyBindButton("Space", "Space")
    // InitKeyBindButton("shift", "Shift")
    // InitKeyBindButton("q", "Q")

// }

// function InitKeyBindButton(button_name, code_button, is_javacript)
// {
    // if (russian_language_button[button_name])
    // {
        // button_name = russian_language_button[button_name]
    // }
    // SetKeyBindEvent(button_name, code_button, is_javacript)
    // if (english_language_button[button_name])
    // {
        // SetKeyBindEvent(english_language_button[button_name], code_button, is_javacript)  
    // }
// }

// function SetKeyBindEvent(button_bind, code_button, is_javacript)
// {
    // const name_bind = "CustomBindEvent" + Math.floor(Math.random() * 99999999);
    // Game.AddCommand("+" + name_bind, () => SendGameEventBindPressed(code_button, is_javacript), "", 0);
    // Game.AddCommand("-" + name_bind, () => SendGameEventBindUnPressed(code_button, is_javacript), "", 0);
    // Game.CreateCustomKeyBind(button_bind, "+" + name_bind);
// }

// function SendGameEventBindPressed(code_button, is_javacript)
// {
    // if (is_javacript && code_button == "Tab")
    // {
        // tab_pressed = true
        // return
    // }
    // if (is_javacript && code_button == "1")
    // {
        // let ent = Players.GetPlayerHeroEntityIndex( Players.GetLocalPlayer() );
        // if (GameUI.IsAltDown())
        // {
            // UpgradeAlt(0, Entities.GetAbility( ent, 0 ))
            // return
        // }
        // Abilities.ExecuteAbility( Entities.GetAbility( ent, 0 ), ent, false )
        // return
    // }
    // if (is_javacript && code_button == "2")
    // {
        // let ent = Players.GetPlayerHeroEntityIndex( Players.GetLocalPlayer() );
        // if (GameUI.IsAltDown())
        // {
            // UpgradeAlt(1, Entities.GetAbility( ent, 1 ))
            // return
        // }
        // Abilities.ExecuteAbility( Entities.GetAbility( ent, 1 ), ent, false )
        // return
    // }
    // if (is_javacript && code_button == "3")
    // {
        // let ent = Players.GetPlayerHeroEntityIndex( Players.GetLocalPlayer() );
        // if (GameUI.IsAltDown())
        // {
            // UpgradeAlt(2, Entities.GetAbility( ent, 2 ))
            // return
        // }
        // Abilities.ExecuteAbility( Entities.GetAbility( ent, 2 ), ent, false )
        // return
    // }
    // if (is_javacript && code_button == "4")
    // {
        // let ent = Players.GetPlayerHeroEntityIndex( Players.GetLocalPlayer() );
        // if (GameUI.IsAltDown())
        // {
            // UpgradeAlt(5, Entities.GetAbility( ent, 5 ))
            // return
        // }
        // Abilities.ExecuteAbility( Entities.GetAbility( ent, 5 ), ent, false )
        // return
    // }
    // if (is_javacript && code_button == "B")
    // {
        // ToggleShop()
        // return
    // }
    // GameEvents.SendCustomGameEventToServer("RL_BUTTON_PRESSED", {button : code_button});
// }

// function SendGameEventBindUnPressed(code_button, is_javacript)
// {
    // if (is_javacript && code_button == "Tab")
    // {
        // tab_pressed = false
        // return
    // }
    // GameEvents.SendCustomGameEventToServer("RL_BUTTON_UNPRESSED", {button : code_button});
// }

// function IsTabPressed()
// {
    // return tab_pressed
// }

// var MOUSE_PRESSED_NAME =
// {
    // 0 : "left",
    // 2 : "center",
    // 1 : "right",
// }
 
// function OnMousePressed(StatusPressed, MouseID)
// {
    // let mouse_name = MOUSE_PRESSED_NAME[MouseID]
    // if (mouse_name == "left")
    // {
        // AttackSystemPressedMouse()
    // }
// }

// var attack_schedule = -1

// GameUI.SetMouseCallback(OnMousePressed);
// function AttackSystemPressedMouse()
// {
    // if (attack_schedule != -1)
    // {
        // $.CancelScheduled(attack_schedule)
        // attack_schedule = -1
    // }
    // StartAttack()
    // GameEvents.SendCustomGameEventToServer( "deadlock_test_mouse", {});
// }

// function StartAttack()
// {
    // let point = GetAimPoint()
    // var cross = $("#CrossHair");
    // var crossPos = [cross.actualxoffset + cross.actuallayoutwidth/2, cross.actualyoffset + cross.actuallayoutheight/2];
    // var mouseEntities = GameUI.FindScreenEntities( crossPos );
    // var localHeroIndex = Players.GetPlayerHeroEntityIndex( Players.GetLocalPlayer() );
    // var targetIndex = -1;
    // mouseEntities = mouseEntities.filter( function(e) { return e.entityIndex !== localHeroIndex; } );
    // for ( var e of mouseEntities )
    // {
        // if ( !e.accurateCollision)
            // continue;
  
        // targetIndex = e.entityIndex;
        // break;  
    // }
    // if (GameUI.IsMouseDown( 0 ))
    // {
        // GameEvents.SendCustomGameEventToServer( "RL_BUTTON_MOUSE_ATTACK_LEFT", {"x":point[0], "y":point[1], "z":point[2], targetIndex : targetIndex, is_attack : true});
        // attack_schedule = $.Schedule(0.03, StartAttack);
    // } else
    // {
        // GameEvents.SendCustomGameEventToServer( "RL_BUTTON_MOUSE_ATTACK_LEFT", {"x":point[0], "y":point[1], "z":point[2], targetIndex : targetIndex, is_attack : false});
        // attack_schedule = -1
    // }
// }