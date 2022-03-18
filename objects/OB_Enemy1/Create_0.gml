/// @description intalization of enemy
EHealth		= 100;
EMaxHealth	= 100;
spd = .3;
jump = 0;
maxFallSpd = -.5;

movepoint = SC_EnemySelectWaypoint(
SC_GetAllObjectIDs(OB_WanderPoint), 
instance_number(OB_WanderPoint));