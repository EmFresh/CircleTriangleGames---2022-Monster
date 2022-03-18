// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SC_EnemyFallowY( player,enemy=id, spd=10){
       
	   
    tmpy = player.y - enemy.y;
	
    length = sqrt(( tmpy * tmpy));

    //vector toward player
     tmpy = (tmpy / length) * spd;
	
	//physics_apply_force(x,y,tmpx,tmpy);
	enemy.y+= tmpy;
	
	
}