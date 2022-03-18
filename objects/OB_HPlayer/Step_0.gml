

MoveJump		= gamepad_button_check_pressed(global.gamepad, gp_face1);
Move			= gamepad_axis_value(global.gamepad, gp_axislh);
UseInterattack		= gamepad_button_check_pressed(global.gamepad, gp_face3) or keyboard_check_pressed(vk_enter);
//SwitchActiveUP	= gamepad_button_check_pressed(global.gamepad, gp_face4) or keyboard_check_pressed(vk_shift);
UseRun = gamepad_button_check_pressed(global.gamepad, gp_face2);
				
if Hstate = HStates.HIdle{
}
if Hstate = HStates.HWalk{



if Hstate = HStates.HInteract{



if Hstate = HStates.HJump{


if OB_Clock.Counter==7 {
Hstate = HStates.HNight
}
state =  HStates.HNight{
	}
	if (state == HStates.HNight){
	instance_activate_object(OB_HPlayer)
	position_meeting(OB_HPlayer.x,OB_HPlayer.y,OB_Player)
	instance_deactivate_object(OB_Player)
