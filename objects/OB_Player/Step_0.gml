//getting player input
MoveJump		= gamepad_button_check_pressed(gamepad, gp_face1);
Move			= gamepad_axis_value(gamepad, gp_axislh);
UseActive		= gamepad_button_check_pressed(gamepad, gp_face3) or keyboard_check_pressed(vk_enter);
SwitchActiveUP	= gamepad_button_check_pressed(gamepad, gp_face4) or keyboard_check_pressed(vk_shift);
SwitchActiveDown= gamepad_button_check_pressed(gamepad, gp_face2);

//Movement

HorSpeed = Move * (WalkSpeed + BonusSpeed);
VertSpeed = VertSpeed + Grav;

//Flag Checks
if !place_meeting(x,y+1,OB_Ground){
	Grounded = false;
}
else Grounded = true;
if (Grounded == true) and (MoveJump == true){
	Jumping = true;
	}

if (HorSpeed == 0) {
	state = PStates.PIdle
}
while (state == PStates.PIdle){ // Idle
	//Animation
		sprite_index = SP_PlayerIdle
			image_speed = 0.5;
	//State Changes
	if (HorSpeed > 0 or HorSpeed < 0){
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
	else if (Blinking = true){
			state = PStates.PBlink
	}
}
if (state == PStates.PWalk){ //Walking
	if (HorSpeed == 0) {
		state = PStates.PIdle
		}
	if (Move < 0) {
	image_xscale = -1;
	sprite_index = SP_PlayerWalk
	image_speed = 1

	}
	 if (Move > 0) {
		image_xscale = 1;
		}
		//State Changes
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
	else if (Blinking = true){
			state = PStates.PBlink
	}
}
if (state == PStates.PJump){
	if (HorSpeed == 0) and (Jumping == false) {
		state = PStates.PIdle
		}
		
		sprite_index = SP_PlayerJump
		image_speed = 0.1
		if image_index <= 5 {
			image_speed = 0 
			VertSpeed = -8 
			state = PStates.pFall
		}
		if (HorSpeed > 0 or HorSpeed < 0) and (Jumping == false)
		{
		state = PStates.PWalk
	}
}
if (state = PStates.pFall){
			
		if VertSpeed >= 0 {
		sprite_index = SP_PlayerFall
		image_speed = 0.1
		if image_index <= 5 {
			image_speed = 0 }
			VertSpeed = (VertSpeed + Grav)
		if place_meeting(x,y+1,OB_Ground){
		Jumping = false
		}
	}
if (HorSpeed == 0) and (Jumping == false) {
		state = PStates.PIdle
		}
		if (HorSpeed > 0 or HorSpeed < 0) and (Jumping == false)
		{
		state = PStates.PWalk
	}
}
show_debug_message(VertSpeed)

//what todo when input is given
if(UseActive){ // uses the currently selected power by calling the SC_PowerSwitch script and passes a power as a string
	SC_PowersSwitch(Powers[PowersSpot]);
}
if(SwitchActiveUP){//moves the powers array up a step, if its at the top it will set it to 0
	if(PowersSpot == (array_length(Powers)-1)){
		PowersSpot = 0;
	}else{
		PowersSpot += 1;	
	}
}else if(SwitchActiveDown){// moves the powers array down a step, if its at the bottom it will set it to the top
	if(PowersSpot == 0){
		PowersSpot = (array_length(Powers)-1);	
	}else{
		PowersSpot -= 1;	
	}
}




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
	 if(place_meeting(x,y+VertSpeed,OB_Wall))
		{
		
		//repeat(abs(VertSpeed)){
			while (!place_meeting(x,y+sign(VertSpeed),OB_Wall))
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
