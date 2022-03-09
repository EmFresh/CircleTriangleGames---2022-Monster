/// @description health bar

draw_sprite(SP_HealthBackground,0, HealthBarX, HealthBarY);
draw_sprite_stretched(SP_HealthBar,0,HealthBarX, HealthBarY, ((Health/HealthMax)*HealthBarW), HealthBarH);
draw_sprite(SP_HealthDontainer,0, HealthBarX, HealthBarY);