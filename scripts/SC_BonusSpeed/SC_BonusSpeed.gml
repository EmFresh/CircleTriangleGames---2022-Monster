// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SC_BonusSpeed(){
	OB_Player.BonusSpeed = 10;
	if OB_Player.PTimer < 0 {
	OB_Player.BonusSpeed = 0
	}
	//alarm[1] = room_speed * 1;
}