if ob_main.cam_w<(deck_build_stored_total*60) {
	var stored_pos=stored_x-4, mouse_pos_max=ob_main.cam_w-16-10, stored_pos_max=ob_main.cam_w-(deck_build_stored_total*60)-5;
	var stored_x_percent=stored_pos*100/stored_pos_max;
	var stored_bar_x=ob_main.screen_deck_x+round(stored_x_percent*mouse_pos_max/100)+4;
	sc_drawrectangle(ob_main.screen_deck_x+4,ob_main.screen_main_y+stored_y+82,ob_main.screen_deck_x+ob_main.cam_w-6,ob_main.screen_main_y+stored_y+86,c_black,c_white,0,0.2,0,0);
	sc_drawrectangle(stored_bar_x,ob_main.screen_main_y+stored_y+82,stored_bar_x+16,ob_main.screen_main_y+stored_y+86,global.color_white,c_white,0,0.5,0,0);
}
if ob_main.cam_w<(deck_build_used_total*60) {
	var used_pos=used_x-4, mouse_pos_max=ob_main.cam_w-16-10, used_pos_max=ob_main.cam_w-(deck_build_used_total*60)-5;
	var used_x_percent=used_pos*100/used_pos_max;
	var used_bar_x=ob_main.screen_deck_x+round(used_x_percent*mouse_pos_max/100)+4;
	sc_drawrectangle(ob_main.screen_deck_x+4,ob_main.screen_main_y+used_y-8,ob_main.screen_deck_x+ob_main.cam_w-6,ob_main.screen_main_y+used_y-4,c_black,c_white,0,0.2,0,0);
	sc_drawrectangle(used_bar_x,ob_main.screen_main_y+used_y-8,used_bar_x+16,ob_main.screen_main_y+used_y-4,global.color_white,c_white,0,0.5,0,0);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_set_font(fn_m3x6);
draw_set_halign(fa_left);
//
var var_text="Deck: " + string(deck_build_used_total) + "/" + string(deck_build_used_max);
sc_drawtext(ob_main.screen_deck_x+6,ob_main.screen_main_y+used_y-21,var_text,global.color_white,global.color_black,1,1,0,-1);
//
if deck_build_all_total=ob_main.maindeck_total_max {
	sc_drawtext(ob_main.screen_deck_x+6,ob_main.screen_main_y+stored_y+86,"max. number of cards",global.color_white,global.color_black,0.5,0.5,0,-1);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
//ob_control, ob_event & ob_deckbuild
if tooltip_text!="" {
	draw_set_font(fn_m3x6);
	if mouse_x+17+string_width(tooltip_text)<ob_main.screen_deck_x+ob_main.cam_w {
		draw_set_halign(fa_left);
		sc_drawrectangle(mouse_x+9,mouse_y-4,mouse_x+18+string_width(tooltip_text),mouse_y+12,global.color_black,global.color_white,1,0.8,1,0);
		sc_drawtext(mouse_x+15,mouse_y-2,tooltip_text,global.color_white,global.color_black,1,0.5,0,-1);
	}
	else {
		draw_set_halign(fa_right);
		sc_drawrectangle(mouse_x-14-string_width(tooltip_text),mouse_y-4,mouse_x-5,mouse_y+12,global.color_black,global.color_white,1,0.8,1,0);
		sc_drawtext(mouse_x-8,mouse_y-2,tooltip_text,global.color_white,global.color_black,1,0.5,0,-1);
	}
}
tooltip_text="";