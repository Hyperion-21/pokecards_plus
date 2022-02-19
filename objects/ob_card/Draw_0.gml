if card_cat=0 {
	var namebar_color=c_white;
	if card_type_a=00 { namebar_color=make_colour_rgb(169,182,214); }
	else if card_type_a=01 { namebar_color=make_colour_rgb(174,214,170); }
	else if card_type_a=02 { namebar_color=make_colour_rgb(214,189,170); }
	else if card_type_a=03 { namebar_color=make_colour_rgb(170,191,214); }
	else if card_type_a=04 { namebar_color=make_colour_rgb(214,207,170); }
	else if card_type_a=05 { namebar_color=make_colour_rgb(170,177,214); }
	else if card_type_a=06 { namebar_color=make_colour_rgb(214,170,183); }
	else if card_type_a=07 { namebar_color=make_colour_rgb(214,170,171); }
	else if card_type_a=08 { namebar_color=make_colour_rgb(214,170,210); }
	else if card_type_a=09 { namebar_color=make_colour_rgb(214,186,170); }
	else if card_type_a=10 { namebar_color=make_colour_rgb(214,202,170); }
	else if card_type_a=11 { namebar_color=make_colour_rgb(200,214,170); }
	else if card_type_a=12 { namebar_color=make_colour_rgb(199,170,213); }
	else if card_type_a=13 { namebar_color=make_colour_rgb(172,214,208); }
	else if card_type_a=14 { namebar_color=make_colour_rgb(173,196,214); }
	else if card_type_a=15 { namebar_color=make_colour_rgb(175,205,214); }
	else if card_type_a=16 { namebar_color=make_colour_rgb(176,186,214); }
	else if card_type_a=17 { namebar_color=make_colour_rgb(191,177,214); }
	//
	draw_sprite_general(sp_sheet,0,16*5+4,16*0,57,80,x,y,1,1,0,c_white,c_white,c_white,c_white,1);
	draw_sprite_general(sp_sheet,0,16*1,16*3,53,10,x+2,y+41,1,1,0,namebar_color,make_colour_rgb(230,230,230),make_colour_rgb(230,230,230),namebar_color,1);
	draw_sprite_general(card_sheet,0,65*(card_grid_x-1)+1,33*(card_grid_y-1)+1,64,32,x-4,y+3,1,1,0,c_white,c_white,c_white,c_white,1);
	draw_sprite_general(sp_sheet,0,16*(card_type_a+1),16*5,12,11,x+2,y+2,1,1,0,c_white,c_white,c_white,c_white,1);
	if card_type_b>=0 { draw_sprite_general(sp_sheet,0,16*(card_type_b+1),16*5,12,11,x+2,y+12,1,1,0,c_white,c_white,c_white,c_white,1); }
	if card_glyph_a>=0 { draw_sprite_general(sp_sheet,0,16*(card_glyph_a+1),16*6,12,11,x+43,y+2,1,1,0,c_white,c_white,c_white,c_white,1); }
	if card_glyph_b>=0 { draw_sprite_general(sp_sheet,0,16*(card_glyph_b+1),16*6,12,11,x+43,y+12,1,1,0,c_white,c_white,c_white,c_white,1); }
	if card_glyph_c>=0 { draw_sprite_general(sp_sheet,0,16*(card_glyph_c+1),16*6,12,11,x+43,y+22,1,1,0,c_white,c_white,c_white,c_white,1); }
	//
	var i=0;
	repeat (4) {
		if card_cost[i]>=0 { draw_sprite_general(sp_sheet,0,16*(card_cost[i]+1),16*4,4,4,x+3+4*i,y+35,1,1,0,c_white,c_white,c_white,c_white,1); }
		i+=1;
	}
	//
	draw_healthbar(x+4,y+56,x+52,y+57,card_exp,make_colour_rgb(205,198,181),make_colour_rgb(91,88,80),make_colour_rgb(91,88,80),0,true,false);
	//
	draw_set_font(fn_m3x6);
	draw_set_halign(fa_center);
	sc_drawtext(x+29,y+39,card_name,make_colour_rgb(230,230,230),make_colour_rgb(40,40,40),1,0.6,0,-1);
	sc_drawtext(x+29,y+50,"lv " + string(card_level),make_colour_rgb(190,190,190),make_colour_rgb(40,40,40),1,0.5,0,-1);
	//
	draw_set_halign(fa_left);
	sc_drawtext(x+5,y+66,string(card_atk),make_colour_rgb(230,230,230),make_colour_rgb(40,40,40),1,0.5,0,-1);
	draw_set_halign(fa_center);
	sc_drawtext(x+29,y+60,string(card_hp),make_colour_rgb(230,230,230),make_colour_rgb(40,40,40),1,0.5,0,-1);
	draw_set_halign(fa_right);
	sc_drawtext(x+53,y+66,string(card_def),make_colour_rgb(230,230,230),make_colour_rgb(40,40,40),1,0.5,0,-1);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if card_cat=1 {
	draw_sprite_general(sp_sheet,0,16*9+4,16*0,57,80,x,y,1,1,0,c_white,c_white,c_white,c_white,1);
	draw_sprite_general(sp_sheet,0,16*1,16*3,53,10,x+2,y+41,1,1,0,make_colour_rgb(205,198,181),make_colour_rgb(233,230,222),make_colour_rgb(233,230,222),make_colour_rgb(205,198,181),1);
	draw_sprite_general(sp_berries,0,32*(card_id-2001)+1,1,32,32,x+12,y+4,1,1,0,c_white,c_white,c_white,c_white,1);
	//
	draw_set_font(fn_m3x6);
	draw_set_halign(fa_center);
	sc_drawtext(x+29,y+39,card_name,make_colour_rgb(230,230,230),make_colour_rgb(40,40,40),1,0.6,0,-1);
	//
	draw_sprite_general(sp_sheet,0,16*(card_id-2000),16*4,4,4,x+26,y+63,1,1,0,c_white,c_white,c_white,c_white,1);
}