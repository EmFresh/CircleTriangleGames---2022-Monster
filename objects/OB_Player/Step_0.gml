//getting player input
MoveJump = gamepad_button_check_pressed(4, gp_face1);
Move = gamepad_axis_value(4, gp_axislh);

//movement speed setting
HorSpeed = Move * WalkSpeed;
VertSpeed = VertSpeed + Grav;

if(place_meeting(x, y + 1, OB_Ground)) && (MoveJump){
	VertSpeed = -3;
}

//moving
//vertical collision
if(place_meeting(x+HorSpeed,y,OB_Ground)){
	while(!place_meeting(x+sign(HorSpeed),y,OB_Ground)){
		x = x + sign(HorSpeed);	
	}
	HorSpeed = 0;
}
x = x + HorSpeed;
//vertical collision
if(place_meeting(x,y+VertSpeed,OB_Ground)){
	while(!place_meeting(x,y+sign(VertSpeed),OB_Ground)){
		y = y + sign(VertSpeed);	
	}
	VertSpeed = 0;
}
y = y + VertSpeed;