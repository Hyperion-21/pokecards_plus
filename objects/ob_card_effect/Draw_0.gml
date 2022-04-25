if effect_type=0 {
	draw_sprite_general(sp_sheet,0,16*33+4,16*5,sprite_width,sprite_height,x-(scale_add*29),y-(scale_add*40),1+scale_add,1+scale_add,0,c_white,c_white,c_white,c_white,effect_alpha);
}
else if effect_type=1 {
	draw_sprite_general(sp_sheet,0,16*37+4,16*5,sprite_width,sprite_height,x,y,1,1,0,c_white,c_white,c_white,c_white,effect_alpha);
}
