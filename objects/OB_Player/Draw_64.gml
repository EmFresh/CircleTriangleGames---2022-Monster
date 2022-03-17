/// @description health bar, gold, powers

draw_sprite(SP_HealthBackground,0, HealthBarX, HealthBarY);
draw_sprite_stretched(SP_HealthBar,0,HealthBarX, HealthBarY, ((Health/HealthMax)*HealthBarW), HealthBarH);
draw_sprite(SP_HealthDontainer,0, HealthBarX, HealthBarY);
draw_text(x,y,Powers[PowersSpot]);

draw_sprite(SP_Clock,0,1800,100);