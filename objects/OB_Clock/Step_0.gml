/// @description 
if(Timer == 0){
	Counter ++;
	if(Counter==7){
		layer_background_sprite(Bg,SP_NightBackground);
	}
	if(Counter==14){
		Counter = 0;
		layer_background_sprite(Bg,SP_NightBackground);
	}
	Timer = room_speed * Seconds;
}
Timer --;
show_debug_message("clock counter:");