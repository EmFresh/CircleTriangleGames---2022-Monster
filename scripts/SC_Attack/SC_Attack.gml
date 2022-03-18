// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SC_Attack(){
	//OB_Player.Attack = true;
	//OB_Player.Health -= 50;
	if(  instance_number( OB_EnemyTest )>0 )
	instance_nearest(x,y, OB_EnemyTest).EHealth -= 50;
}