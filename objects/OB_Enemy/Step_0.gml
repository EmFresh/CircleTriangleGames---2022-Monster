/// @description 

enemy = instance_find(OB_Enemy,object_index);

//im dead
if(EHealth <= 0)
	instance_destroy();

////Enemy in range to attack
//if(SC_InRange(id, instance_nearest(x,y,OB_Player), 5))
//	SC_Attack();
//
////Fallow player
//if(SC_InRange(instance_nearest(x,y,OB_Enemy), instance_nearest(x,y,OB_Player), 20))
//	SC_EnemyFallow(instance_nearest(x,y,OB_Player), 2);
//
////Enemy wander
//if(!SC_InRange(id, instance_nearest(x,y,OB_Player), 20))
	SC_EnemyWander(OB_WanderPoint, 2);
