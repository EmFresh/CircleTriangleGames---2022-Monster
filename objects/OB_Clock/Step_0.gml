/// @description 
if(Timer == 0){
	Counter ++;
	if(Counter==7){
		layer_background_sprite(BBg,SP_NightBackground);
	}
	if(Counter==14){
		Counter = 0;
		layer_background_sprite(BBg,SP_DayBackground);
	}
	Timer = room_speed * Seconds;
}
Timer --;
