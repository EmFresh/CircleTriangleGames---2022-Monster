instance_deactivate_object(OB_HPlayer)

//movement stats
HorSpeed	= 0;
VertSpeed	= 0;
Grav		= 0.3;
Move		= 0;
WalkSpeed	= 5;
BonusSpeed	= 0;
//BlinkDist = 6;
//Blinking = false;
Jumping = false;
Attack = false;
Grounded = true;
Running = false
Ptimer = 0

//player Stats 

Gold		= 50;
enum HStates {
	HIdle,
	HWalk,
	HInteract,
	HJump,
	HNight,
}
Hstate = HStates.HIdle

global.gamepad = 0;
for(var i = 0; i<11; i++){
	if(gamepad_is_connected(i)){
		global.gamepad = i;
		break;
	}else{
		global.gamepad = 4;
	}
}
if gamepad_get_axis_deadzone(global.gamepad) != 0.5
{
    gamepad_set_axis_deadzone(global.gamepad, 0.5);
}
