position_meeting(x,y,OB_HPlayer)

//getting player input
MoveJump		= gamepad_button_check_pressed(global.gamepad, gp_face1);
Move			= gamepad_axis_value(global.gamepad, gp_axislh);
UseInterattack		= gamepad_button_check_pressed(global.gamepad, gp_face3) or keyboard_check_pressed(vk_enter);
//SwitchActiveUP	= gamepad_button_check_pressed(global.gamepad, gp_face4) or keyboard_check_pressed(vk_shift);
UseRun = gamepad_button_check_pressed(global.gamepad, gp_face2);
				

//Movement
if Running == true{
Ptimer += 1;
}
HorSpeed = Move * (WalkSpeed + BonusSpeed);
VertSpeed += Grav;


//Flag Checks
if !place_meeting(x,y+1,OB_Ground){
	Grounded = false;
}
else Grounded = true;
if (Grounded == true) and (MoveJump == true){
	Jumping = true;
	}



if (state == PStates.PIdle){ // Idle
	//Animation
		sprite_index = SP_PlayerIdle
			image_speed = 0.5;
	//State Changes
	if abs(Move) > 0 and (Grounded == true){
		state = PStates.PWalk
	}
	if (Jumping = true){
		state = PStates.PJump
	}
	if (BonusSpeed > 0){
		state = PStates.PRun
	}
	if (Attack = true){
		state = PStates.PAttack
	}
	if (Health <= 0){
		state = PStates.PDeath
	}
	//else if (Blinking = true){
	//		state = PStates.PBlink
	//}
	
}
if (state == PStates.PWalk){ //Walking
	if Move == 0 and (Grounded == true) {
		state = PStates.PIdle
		}
	
		sprite_index = SP_PlayerWalk
	image_speed = 1
	if (Move > 0) {
	image_xscale = 1;

	}
	 if (Move < 0) {
		image_xscale = -1;
		}
		//State Changes
		
	if (Jumping == true and Grounded == true){
		state = PStates.PJump
	}
	if (Running = true){
		state = PStates.PRun
	}
	if (Attack = true){
		state = PStates.PAttack
	}
	if (Health <= 0){
		state = PStates.PDeath
	}
	//else if (Blinking = true){
	//		state = PStates.PBlink
//	}
}
if (state == PStates.PJump){	
		sprite_index = SP_PlayerJump
		image_speed = 1
		if (image_index >= 5) {
			image_speed = 0 
			VertSpeed = -8  
	if (Move > 0) {
	image_xscale = 1;

	}
	 if (Move < 0) {
		image_xscale = -1;
		}
		
		 state = PStates.pFall
	}
}
if (state = PStates.pFall){
			
		
		sprite_index = SP_PlayerFall
		image_speed = .5
		if (image_index >= 5) {
			image_speed = 0 }
		
		if (Move > 0) {
	image_xscale = 1;

	}
	 if (Move < 0) {
		image_xscale = -1;
		}
	
	if instance_nearest(x,y,OB_Ground).y {
	Jumping = false
}
if (Jumping == false) and (Grounded == true) {
		state = PStates.PIdle
		}	
}
if(UseInterattack){
	Attack = true
}
if (state = PStates.PAttack){
	SC_Attack()
	sprite_index = SP_PlayerAttack
	image_speed = 1
	if (image_index >= 5){
	Attack = false;
	}
	if Attack == false{
		state = PStates.PIdle
	}
}
	
//if (state = PStates.PBlink){
//	sprite_index = SP_PlayerBlink
//	image_speed = 1
//	if (image_index >= 5){
//	image_speed = 0
//	}
//	if Blinking == false{
//	state = PStates.PIdle
//	}
//}
if(UseRun){
	Running = true
}

if (state = PStates.PRun){ // Gotta look fast
	sprite_index = SP_PlayerRun
	image_speed = 1
	if(Move < 0){
		image_xscale = -1;	
	}else{
		image_xscale = 1;
		
	}
	if Running == true{ // Gotta go fast
		//SC_BonusSpeed();
		BonusSpeed = 10;
		if Ptimer >= 20{
			BonusSpeed = 0;
			Ptimer = 0;
	
	} //Change State
}
	if (BonusSpeed == 0) { 
		state = PStates.PIdle
		Running = false
		if (Jumping == true and Grounded == true){
		state = PStates.PJump
		}
	}
}

if (state = PStates.PDeath){ // Hes Dead Jim
	sprite_index = SP_PlayerDeath
	image_speed = 0.2
	if(image_index >= 5){
		image_speed = 0;
	}
	HorSpeed = 0
}
	//if OB_Clock.Counter==2 { // Human Teleport code
	//state =  PStates.PDay
	//}	
	//if (state == PStates.PDay){
	//sprite_index = SP_PlayerBlink
	//image_speed = 1
	//if (image_index >= 2)
	//image_speed = 0
	//instance_activate_object(OB_HPlayer)
	//OB_HPlayer.x = x
	//OB_HPlayer.y = y
	//instance_deactivate_object(OB_Player)
	//}
show_debug_message(Ptimer)

//what todo when input is given
//if(UseInterattack){
	
	// uses the currently selected power by calling the SC_PowerSwitch script and passes a power as a string
//	SC_PowersSwitch(Powers[PowersSpot]);
//}

	
	//moves the powers array up a step, if its at the top it will set it to 0
	//if(PowersSpot == (array_length(Powers)-1)){
	//	PowersSpot = 0;
	//}else{
	//	PowersSpot += 1;	
	//}

	
	// moves the powers array down a step, if its at the bottom it will set it to the top
//	if(PowersSpot == 0){
//		PowersSpot = (array_length(Powers)-1);	
//	}else{
//		PowersSpot -= 1;	
//	}
//}




//moving

//horiztonal collision
if(place_meeting(x+HorSpeed,y,OB_Wall))
{
	//repeat(abs(HorSpeed)){
		while (!place_meeting(x+sign(HorSpeed),y,OB_Wall))
		{
			x = x + sign(HorSpeed);	
			//if((place_meeting(x+HorSpeed,y,OB_Ramp))){
				//y = y - sign(VertSpeed);
		}
		//}else{
		HorSpeed = 0;
		}
	//}
//}
x = x + HorSpeed;
//vertical collision
	 if(place_meeting(x,y+VertSpeed,OB_Collisions))
		{
		
		//repeat(abs(VertSpeed)){
			while (!place_meeting(x,y+sign(VertSpeed),OB_Collisions))
			{
				y = y + sign(VertSpeed);
				
			}
			//}else{
				VertSpeed = 0;
			}
		//}
		//VertSpeed = 0;
		//}
		y = y + VertSpeed;
		
		//VertSpeed = 0;
