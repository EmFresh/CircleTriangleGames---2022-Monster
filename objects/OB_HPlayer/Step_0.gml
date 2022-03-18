

HMoveJump		= gamepad_button_check_pressed(global.gamepad, gp_face1);
HMove			= gamepad_axis_value(global.gamepad, gp_axislh);
UseInterattack		= gamepad_button_check_pressed(global.gamepad, gp_face3) or keyboard_check_pressed(vk_enter);
//SwitchActiveUP	= gamepad_button_check_pressed(global.gamepad, gp_face4) or keyboard_check_pressed(vk_shift);
//UseRun = gamepad_button_check_pressed(global.gamepad, gp_face2);

//Movement
//if Running == true{
//Ptimer += 1;
//}
HHorSpeed = HMove * (HWalkSpeed);
HVertSpeed = HVertSpeed + Grav;





if !place_meeting(x,y+1,OB_Ground){
	HGrounded = false;
}
else HGrounded = true;
if (HGrounded == true) and (HMoveJump == true){
	HJumping = true;
	}



if (Hstate == PStates.PIdle){ // Idle
	//Animation
		sprite_index = SP_PlayerIdle
			image_speed = 0.5;
	//State Changes
	if abs(HMove) > 0 and (HGrounded == true){
		Hstate = HStates.HWalk
	}
	if (HJumping = true){
		Hstate = HStates.HJump

	}
	
	if (Interact == true){
		Hstate = HStates.HInteract
	}
}
if (Hstate == HStates.HWalk){ //Walking
	if HMove == 0 and (HGrounded == true) {
		Hstate = HStates.HIdle
		}
	
		sprite_index = SP_PHumanWalk
	image_speed = 1
	if (HMove > 0) {
	image_xscale = 1;

	}
	 if (HMove < 0) {
		image_xscale = -1;
		}
		//State Changes
		
	if (HJumping == true and HGrounded == true){
		Hstate = PStates.PJump
	}
	if (Interact == true){
		Hstate = HStates.HInteract
	}


if UseInterattack = true{
	Interact = true}
if Hstate = HStates.HInteract{



if (Hstate == HStates.HJump){	
		sprite_index = SP_PHumanJump
		image_speed = 1
		if (image_index >= 4) {
			image_speed = 0 
			HVertSpeed = -8  
	if (HMove > 0) {
	image_xscale = 1;

	}
	 if (HMove < 0) {
		image_xscale = -1;
		}
		
		 Hstate = HStates.HFall
	}
}


if Hstate = HStates.HFall{
			
		sprite_index = SP_PHumanFall
		image_speed = .5
		if (image_index >= 4) {
			image_speed = 0 }
		
		if (HMove > 0) {
	image_xscale = 1;

	}
	 if (HMove < 0) {
		image_xscale = -1;
		}
	
	if instance_nearest(x,y,OB_Ground).y {
	HJumping = false
}
if (HJumping == false) and (HGrounded == true) {
		Hstate = HStates.HIdle
		}	

if OB_Clock.Counter==1 
{
Hstate = HStates.HNight
}
Hstate =  HStates.HNight{
	}
	if (Hstate == HStates.HNight){
	
	
	instance_activate_object(OB_Player)
	OB_Player.x = x
	OB_Player.y = y
	instance_deactivate_object(OB_HPlayer)
	}
}
}
}