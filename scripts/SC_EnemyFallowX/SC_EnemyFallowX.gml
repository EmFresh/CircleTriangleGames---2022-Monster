// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SC_EnemyFallowX( player,enemy=id, spd=10){
       
    tmpx = player.x - enemy.x;
	
    length = sqrt((tmpx * tmpx ));

    //vector toward player
    tmpx = (tmpx / length) * spd;
   
	//physics_apply_force(x,y,tmpx,tmpy);
	enemy.x+= tmpx;
	
	
}