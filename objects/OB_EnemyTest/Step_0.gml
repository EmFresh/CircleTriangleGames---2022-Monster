/// @description 

player = instance_nearest(x,y,OB_Player);

lastx = x;
lasty = y;


fallspd = maxFallSpd;

playerFindDist = 32 * 3;

//im dead
if(EHealth <= 0)
	instance_destroy();

//Enemy in range to attack
if(SC_InRange(id, instance_nearest(x,y,OB_Player), 5))
	SC_Attack();

//player detected
if(SC_InRange(id, player, playerFindDist ))
{	SC_EnemyFallowX(player, id, spd);
//	show_debug_message("player found");
}

//Enemy wander
if(!SC_InRange(id, instance_nearest(x,y,OB_Player), playerFindDist))
{
	if(abs(x - movepoint.x) <= spd)
		movepoint = SC_EnemySelectWaypoint(
		SC_GetAllObjectIDs(OB_WanderPoint), 
		instance_number(OB_WanderPoint));
	
	SC_EnemyFallowX(movepoint, id, spd);
	show_debug_message("enemy wander");
}



	

//jump if obstical in way
if(jump ==0&& place_meeting(x,y,OB_Wall))
{
	jump = 8;
	show_debug_message("jumping");
}

	jump+= fallspd;
	jump = clamp(jump,0,jump);
	fallspd += (-fallspd * 1.2) * sign(jump);

	y -= fallspd;	
	//place on ground
	while (place_meeting(x,y - sign(fallspd),OB_Collisions) && 
	instance_nearest(x,y,OB_Collisions).y > y)
				y += sign(fallspd);
				
//horizontal collision
if(place_meeting(x,y,OB_Wall))
	x = lastx;





//vertical collision
//vertical collision
	





