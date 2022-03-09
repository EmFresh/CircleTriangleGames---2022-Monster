/// @description Insert description here
screendiv = 4;

View_Width	= 1920/screendiv;
View_height = 1080/screendiv;

Window_Scale = screendiv;

window_set_size(View_Width*Window_Scale,View_height*Window_Scale);
alarm[0]=1;

surface_resize(application_surface,View_Width*Window_Scale,View_height*Window_Scale);