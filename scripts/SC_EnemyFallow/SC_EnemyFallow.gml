// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SC_EnemyFallow( player, spd=10){
   
   show_debug_message(player.x)
   
    
    tmpx = player.x - x;
    tmpy = player.y - y;
	
    length = sqrt(abs(tmpx * tmpx + tmpy * tmpy));

    //vector toward player
    tmpx = (tmpx / length) * spd;
    tmpy = (tmpy / length) * spd;
	
    //move enemy
    x += tmpx;
    y += tmpy;

}