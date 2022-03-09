//getting player input
MoveJump		= gamepad_button_check_pressed(4, gp_face1);
//Move			= gamepad_axis_value(4, gp_axislh);
UseActive		= keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(4, gp_face3);
SwitchActiveUP	= keyboard_check_pressed(vk_shift) or gamepad_button_check_pressed(4, gp_face4);
SwitchActiveDown= gamepad_button_check_pressed(4, gp_face2);


Move = 0.5;
//movement speed setting
HorSpeed = Move * (WalkSpeed + BonusSpeed);
VertSpeed = VertSpeed + Grav;

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

if(place_meeting(x, y + 1, OB_Ground)) && (MoveJump){// checks if there is space above the players head, if there is than jump
	VertSpeed = -8;
}

//moving
//vertical collision
if((place_meeting(x+HorSpeed,y,all))){
	repeat(abs(HorSpeed)){
		if(!place_meeting(x+sign(HorSpeed),y,all)){
			x = x + sign(HorSpeed);	
		}else{
			HorSpeed = 0;
		}
	}
}
x = x + HorSpeed;
//vertical collision
if(place_meeting(x,y+VertSpeed,all)){
	repeat(abs(VertSpeed)){
		if(!place_meeting(x,y+sign(VertSpeed),all)){
			y = y + sign(VertSpeed);	
		}else{
			VertSpeed = 0;
		}
	}
	VertSpeed = 0;
}
y = y + VertSpeed;

HorSpeed = 0;
