// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SC_EnemyFallow( player, spd=10){
       
    tmpx = player.x - x;
    tmpy = player.y - y;
	
    length = sqrt(abs(tmpx * tmpx + tmpy * tmpy));

    //vector toward player
    tmpx = (tmpx / length) * spd;
    tmpy = (tmpy / length) * spd;
	
	//physics_apply_force(x,y,tmpx,tmpy);
	x+= tmpx;
	y+= tmpy;
}