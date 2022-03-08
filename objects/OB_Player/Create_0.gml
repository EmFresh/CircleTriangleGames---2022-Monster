HorSpeed = 0;
VertSpeed = 0;
Grav = 0.5;
Move = 0;
WalkSpeed = 5;
BonusSpeed = 0;
Powers = [1];
Powers[0] = "BonusSpeed";
Powers[1] = "Blink";
PowersSpot = 1;
//gamepad = 0;
//for(var i = 0; i<11; i++){
//	if(gamepad_is_connected(i)){
//		gamepad = i
//	}
//}

gamepad_set_axis_deadzone(4,0.05);