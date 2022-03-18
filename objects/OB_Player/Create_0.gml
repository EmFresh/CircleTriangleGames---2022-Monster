

//movement stats
HorSpeed	= 0;
VertSpeed	= 0;
Grav		= 0.3;
Move		= 0;
WalkSpeed	= 5;
BonusSpeed	= 0;
BlinkDist = 6;
Blinking = false;
Jumping = false;
Attack = false;
Grounded = true;
Running = false
Ptimer = 0
//player stats
Health		= 100;
HealthMax	= 100;
Gold		= 50;
Damage		= 20;

//setting up the powers array
//Powers		= [];
//Powers[0]	= "Interact";
//Powers[1]	= "BonusSpeed";
//Powers[2]	= "Blink";
//Powers[3]	= "Attack";
//PowersSpot	= 1;

//setting up the player health bar
HealthBarW	= 306;
HealthBarH	= 42;
HealthBarX	= 50;
HealthBarY	= 50;

//States for movement
enum PStates {
	PIdle,
	PWalk,
	PRun,
	PDeath,
	PAttack,
	PJump,
	PDay,
	pFall,
}
state = PStates.PIdle

//detecting the gamepad and setting it up
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
