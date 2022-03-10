// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SC_Blink(){
	test = false;
	if(OB_Player.Move >0){
		for(i = 0; i<101; i++){
			if((place_meeting(x+i,y,OB_Wall))){
				OB_Player.x += (i-32);
				break;
			}else if((place_meeting(x+HorSpeed,y,all))){
				OB_Player.x += 0;
				break;
			}else if(i == 100){
				test = true;
			}
		}
	
		if(test == true){
			OB_Player.x += 100;	
		}
	}
	if(OB_Player.Move < 0){
		for(i = 0; i<101; i++){
			if((place_meeting(x-i,y,OB_Wall))){
				OB_Player.x -= (i-32);
				break;
			}else if((place_meeting(x+HorSpeed,y,all))){
				OB_Player.x -= 0;
				break;
			}else if(i == 100){
				test = true;
			}
		}
	
		if(test == true){
			OB_Player.x -= 100;	
		}
	}
}