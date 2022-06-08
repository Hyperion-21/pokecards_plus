var rel_hud=ceil(ob_main.moving_hud);
//————————————————————————————————————————————————————————————————————————————————————————————————————
if cam_w<(deck_build_stored_total*60) {
	var stored_pos=stored_x-4, mouse_pos_max=cam_w-16-10, stored_pos_max=cam_w-(deck_build_stored_total*60)-5;
	var stored_x_percent=stored_pos*100/stored_pos_max;
	var stored_bar_x=screen_deck_x+round(stored_x_percent*mouse_pos_max/100)+4;
	sc_drawrectangle(screen_deck_x+4,screen_main_y+stored_y+82,screen_deck_x+cam_w-6,screen_main_y+stored_y+86,c_black,c_white,0,0.2,0,0);
	sc_drawrectangle(stored_bar_x,screen_main_y+stored_y+82,stored_bar_x+16,screen_main_y+stored_y+86,global.color_white,c_white,0,0.5,0,0);
}
if cam_w<(deck_build_used_total*60) {
	var used_pos=used_x-4, mouse_pos_max=cam_w-16-10, used_pos_max=cam_w-(deck_build_used_total*60)-5;
	var used_x_percent=used_pos*100/used_pos_max;
	var used_bar_x=screen_deck_x+round(used_x_percent*mouse_pos_max/100)+4;
	sc_drawrectangle(screen_deck_x+4,screen_main_y+used_y-8,screen_deck_x+cam_w-6,screen_main_y+used_y-4,c_black,c_white,0,0.2,0,0);
	sc_drawrectangle(used_bar_x,screen_main_y+used_y-8,used_bar_x+16,screen_main_y+used_y-4,global.color_white,c_white,0,0.5,0,0);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_sprite_general(sp_sheet,0,16*13,16*9,48,32,screen_deck_x+38,screen_main_y+110-rel_hud*2,1,1,0,c_white,c_white,c_white,c_white,0.5);
draw_sprite_general(sp_sheet,0,16*16,16*9,48,32,screen_deck_x+38,screen_main_y+110+36+rel_hud*2,1,1,0,c_white,c_white,c_white,c_white,0.5);
draw_sprite_general(sp_sheet,0,16*19,16*9,48,32,screen_deck_x+448+rel_hud,screen_main_y+109,1,1,0,c_white,c_white,c_white,c_white,0.5);
draw_sprite_general(sp_sheet,0,16*22,16*9,48,32,screen_deck_x+449-rel_hud,screen_main_y+109+38,1,1,0,c_white,c_white,c_white,c_white,0.5);
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_set_font(fn_m3x6);
draw_set_halign(fa_left);
//
if deck_build_used_total>0 {
	var var_text="Deck: " + string(deck_build_used_total) + "/" + string(ob_main.maindeck_size_max);
	sc_drawtext(screen_deck_x+6,screen_main_y+used_y-21,var_text,global.color_white,global.color_black,1,1,0,-1);
	//
	var var_text_berries=" (x" + string(berries_needed_deck[0]) + " Oran, x" + string(berries_needed_deck[1]) + " Leppa, x" + string(berries_needed_deck[2]) + " Lum";
	if berries_needed_deck[3]>0 { var_text_berries=var_text_berries + ", x" + string(berries_needed_deck[3]) + " Enigma)."; }
	else { var_text_berries=var_text_berries + ")."; }
	sc_drawtext(screen_deck_x+6+string_width(var_text),screen_main_y+used_y-21,var_text_berries,global.color_white,global.color_black,0.5,0.5,0,-1);
}
//
if deck_build_all_total<=ob_main.maindeck_size_min_full and deck_build_all_total>0 {
	sc_drawtext(screen_deck_x+6,screen_main_y+stored_y+86,"min. number of cards",global.color_white,global.color_black,0.5,0.5,0,-1);
}
else if deck_build_all_total=maindeck_total_max {
	sc_drawtext(screen_deck_x+6,screen_main_y+stored_y+86,"max. number of cards",global.color_white,global.color_black,0.5,0.5,0,-1);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
sc_draw_tooltip_text(screen_deck_x+cam_w);