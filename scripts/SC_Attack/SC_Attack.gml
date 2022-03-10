// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SC_Attack(){
	instance_create_layer(OB_Player.x +32 ,OB_Player.y,"GameInstances", OB_Attack);
	
	//OB_Enemy.EHealth -= 50;
}