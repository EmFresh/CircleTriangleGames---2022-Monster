//getting player input
MoveJump		= gamepad_button_check_pressed(4, gp_face1);
//Move			= gamepad_axis_value(4, gp_axislh);
UseActive		= keyboard_check_pressed(vk_enter);
SwitchActive	= keyboard_check_pressed(vk_shift);
Move = 0.5;
//movement speed setting
HorSpeed = Move * (WalkSpeed + BonusSpeed);
VertSpeed = VertSpeed + Grav;

if(UseActive){
	SC_PowersSwitch(Powers[PowersSpot]);
}
if(SwitchActive){
	show_debug_message(PowersSpot);
	if(PowersSpot == (array_length(Powers)-1)){
		PowersSpot = 0;
	}else{
		PowersSpot += 1;	
	}
}

if(place_meeting(x, y + 1, OB_Ground)) && (MoveJump){
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
