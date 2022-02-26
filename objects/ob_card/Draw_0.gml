draw_set_alpha(1);
//————————————————————————————————————————————————————————————————————————————————————————————————————
if effect_damaged>0 { var draw_x=x+irandom_range(-2,2), draw_y=y+irandom_range(-2,2); }
else { var draw_x=x, draw_y=y; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_cat=0 and card_face=true {
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
	if card_enigma=false and card_secret=false { draw_sprite_general(sp_sheet,0,16*5+4,16*0,sprite_width,sprite_height,draw_x,draw_y,1,1,0,c_white,c_white,c_white,c_white,1); }
	else { draw_sprite_general(sp_sheet,0,16*13+4,16*0,sprite_width,sprite_height,draw_x,draw_y,1,1,0,c_white,c_white,c_white,c_white,1); }
	//
	draw_sprite_general(sp_sheet,0,16*1,16*2,53,10,draw_x+2,draw_y+41,1,1,0,namebar_color,make_colour_rgb(230,230,230),make_colour_rgb(230,230,230),namebar_color,1);
	//
	draw_sprite_general(card_sheet,0,65*(card_grid_x-1)+1,33*(card_grid_y-1)+1,64,32,draw_x-4,draw_y+3,1,1,0,c_white,c_white,c_white,c_white,1);
	//
	draw_sprite_general(sp_sheet,0,16*(card_type_a+1),16*5,12,11,draw_x+2,draw_y+2,1,1,0,c_white,c_white,c_white,c_white,1);
	if card_type_b>=0 { draw_sprite_general(sp_sheet,0,16*(card_type_b+1),16*5,12,11,draw_x+2,draw_y+12,1,1,0,c_white,c_white,c_white,c_white,1); }
	//
	if card_glyph_a>=0 and card_glyph_a<=17 { draw_sprite_general(sp_sheet,0,16*(card_glyph_a+1),16*6,12,11,draw_x+43,draw_y+2,1,1,0,c_white,c_white,c_white,c_white,1); }
	else if card_glyph_a>=18 { draw_sprite_general(sp_sheet,0,16*(18+1),16*6,12,11,draw_x+43,draw_y+2,1,1,0,c_white,c_white,c_white,c_white,1); }
	if card_glyph_b>=0 and card_glyph_b<=17 { draw_sprite_general(sp_sheet,0,16*(card_glyph_b+1),16*6,12,11,draw_x+43,draw_y+12,1,1,0,c_white,c_white,c_white,c_white,1); }
	else if card_glyph_b>=18 { draw_sprite_general(sp_sheet,0,16*(18+1),16*6,12,11,draw_x+43,draw_y+12,1,1,0,c_white,c_white,c_white,c_white,1); }
	if card_glyph_c>=0 and card_glyph_c<=17 { draw_sprite_general(sp_sheet,0,16*(card_glyph_c+1),16*6,12,11,draw_x+43,draw_y+22,1,1,0,c_white,c_white,c_white,c_white,1); }
	else if card_glyph_c>=18 { draw_sprite_general(sp_sheet,0,16*(18+1),16*6,12,11,draw_x+43,draw_y+22,1,1,0,c_white,c_white,c_white,c_white,1); }
	//
	var i=0;
	repeat (3) {
		if card_cost[i]>=0 { draw_sprite_general(sp_sheet,0,16*(card_cost[i]+1),16*3,4,4,draw_x+3+4*i,draw_y+35,1,1,0,c_white,c_white,c_white,c_white,1); }
		i+=1;
	}
	//
	draw_set_font(fn_m3x6);
	draw_set_halign(fa_center);
	draw_healthbar(draw_x+4,draw_y+56,draw_x+52,draw_y+57,0,make_colour_rgb(205,198,181),c_white,c_white,0,true,false);
	sc_drawtext(draw_x+29,draw_y+39,card_name,make_colour_rgb(230,230,230),make_colour_rgb(40,40,40),1,0.6,0,-1);
	sc_drawtext(draw_x+29,draw_y+50,"lv " + string(card_level),make_colour_rgb(190,190,190),make_colour_rgb(40,40,40),1,0.5,0,-1);
	//sc_drawtext(draw_x+29,draw_y+4,string(card_rarity),c_aqua,make_colour_rgb(40,40,40),1,0.6,0,-1);
	//
	var num_color=c_white;
	draw_set_halign(fa_left);
	if card_atk<card_full_atk { num_color=make_colour_rgb(225,168,160); }
	else if card_atk>card_full_atk { num_color=make_colour_rgb(160,193,225); }
	else { num_color=make_colour_rgb(230,230,230); }
	sc_drawtext(draw_x+5,draw_y+66,string(card_atk),num_color,make_colour_rgb(40,40,40),1,0.5,0,-1);
	draw_set_halign(fa_center);
	if card_hp<card_full_hp { num_color=make_colour_rgb(225,168,160); }
	else { num_color=make_colour_rgb(176,223,159); }
	sc_drawtext(draw_x+29,draw_y+60,string(card_hp),num_color,make_colour_rgb(40,40,40),1,0.5,0,-1);
	draw_set_halign(fa_right);
	if card_def<card_full_def { num_color=make_colour_rgb(225,168,160); }
	else if card_def>card_full_def { num_color=make_colour_rgb(160,193,225); }
	else { num_color=make_colour_rgb(230,230,230); }
	sc_drawtext(draw_x+53,draw_y+66,string(card_def),num_color,make_colour_rgb(40,40,40),1,0.5,0,-1);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if card_cat=1 and card_face=true {
	draw_sprite_general(sp_sheet,0,16*9+4,16*0,sprite_width,sprite_height,draw_x,draw_y,1,1,0,c_white,c_white,c_white,c_white,1);
	draw_sprite_general(sp_sheet,0,16*1,16*2,53,10,draw_x+2,draw_y+41,1,1,0,
	make_colour_rgb(205,198,181),make_colour_rgb(233,230,222),make_colour_rgb(233,230,222),make_colour_rgb(205,198,181),1);
	draw_sprite_general(sp_berries,0,32*(card_id-3000)+1,1,32,32,draw_x+12,draw_y+4,1,1,0,c_white,c_white,c_white,c_white,1);
	//
	draw_set_font(fn_m3x6);
	draw_set_halign(fa_center);
	sc_drawtext(draw_x+29,draw_y+39,card_name,make_colour_rgb(230,230,230),make_colour_rgb(40,40,40),1,0.6,0,-1);
	//
	draw_sprite_general(sp_sheet,0,16*(card_id-3000+1),16*3,4,4,draw_x+26,draw_y+63,1,1,0,c_white,c_white,c_white,c_white,1);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if card_face=false {
	if card_trash=false { var overlay_color=c_white; } else { var overlay_color=make_colour_rgb(170,170,170); }
	if card_cat=0 or card_enemy=true {
		draw_sprite_general(sp_sheet,0,16*25+4,16*0,sprite_width,sprite_height,draw_x,draw_y,1,1,0,overlay_color,overlay_color,overlay_color,overlay_color,1);
	}
	else if card_cat=1 {
		draw_sprite_general(sp_sheet,0,16*29+4,16*0,sprite_width,sprite_height,draw_x,draw_y,1,1,0,overlay_color,overlay_color,overlay_color,overlay_color,1);
	}
}