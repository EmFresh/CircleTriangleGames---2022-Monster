//getting player input
MoveJump		= gamepad_button_check_pressed(gamepad, gp_face1);
Move			= gamepad_axis_value(gamepad, gp_axislh);
UseActive		= gamepad_button_check_pressed(gamepad, gp_face3);
SwitchActiveUP	= gamepad_button_check_pressed(gamepad, gp_face4);
SwitchActiveDown= gamepad_button_check_pressed(gamepad, gp_face2);



//movement speed setting
HorSpeed = Move * (WalkSpeed + BonusSpeed);
VertSpeed = VertSpeed + Grav;

if(BonusSpeed > 0){
	sprite_index = SP_PlayerRun;
	if(Move < 0){
		image_xscale = -1;	
	}else{
		image_xscale = 1;	
	}
}else if(Move == 0){
	image_speed = 0.3;
	sprite_index = SP_PlayerIdle;
}else{
	sprite_index = SP_PlayerWalk;
	if(Move < 0){
		image_xscale = -1;	
	}else{
		image_xscale = 1;	
	}
}

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
//horiztonal collision
if((place_meeting(x+HorSpeed,y,OB_Wall))){
	repeat(abs(HorSpeed)){
		if(!place_meeting(x+sign(HorSpeed),y,OB_Wall)){
			x = x + sign(HorSpeed);	
			if((place_meeting(x+HorSpeed,y,OB_Ramp))){
				y = y - sign(VertSpeed);
			}
		}else{
			HorSpeed = 0;
		}
	}
}
x = x + HorSpeed;
//vertical collision
if(place_meeting(x,y+VertSpeed,OB_Wall)){
	repeat(abs(VertSpeed)){
		if(!place_meeting(x,y+sign(VertSpeed),OB_Wall)){
			y = y + sign(VertSpeed);	
		}else{
			VertSpeed = 0;
		}
	}
	VertSpeed = 0;
}
y = y + VertSpeed;

HorSpeed = 0;
