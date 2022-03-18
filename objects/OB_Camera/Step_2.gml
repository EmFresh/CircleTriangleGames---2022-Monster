/// @description Insert description here
// You can write your code in this editor
camera_set_view_size(view,View_Width,View_height);

if(instance_exists(OB_Player)){
	var CamX = clamp(OB_Player.x-View_Width/2,0,room_width-View_Width);
	var CamY = clamp(OB_Player.y-View_height/2,0,room_height-View_height);
	camera_set_view_pos(view,CamX,CamY);
}
else if(instance_exists(OB_HPlayer)){
	var CamX = clamp(OB_HPlayer.x-View_Width/2,0,room_width-View_Width);
	var CamY = clamp(OB_HPlayer.y-View_height/2,0,room_height-View_height);
	camera_set_view_pos(view,CamX,CamY);
}