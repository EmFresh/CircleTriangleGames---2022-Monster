// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
enum ENEMY_TYPE
{
	ENEMY1,
	ENEMY2,
	ENEMY3,
	ENEMY4,	
}

function SC_EnemyAttack(enemy){

    //Ill figure this out later
    switch(enemy)
    {
    case ENEMY_TYPE.ENEMY1:
	
	if(sprite_index!= SP_LurkerSpike)
		sprite_index = SP_LurkerSpike;
		enemyAttacking = true;
	if(image_index == image_number -2)
	if(place_meeting(x,y,OB_Player))
		{		
			
			player = instance_nearest(x,y,OB_Player);
			player.Health -= 10;
		}
	
	if(image_index >= image_number - 1)
	{
		
		sprite_index = SP_LurkerIdle;
			enemyAttacking = true;

	}		
        
    break;
    case  ENEMY_TYPE.ENEMY2:
    break;
    case  ENEMY_TYPE.ENEMY3:
    break;
    case  ENEMY_TYPE.ENEMY4:
    break;   
    }

}