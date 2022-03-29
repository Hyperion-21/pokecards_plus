if show_deck=true {
	if ob_main.cam_w<(card_event_total*60) {
		var deck_pos=deck_x-4, mouse_pos_max=ob_main.cam_w-16-10, deck_pos_max=ob_main.cam_w-(card_event_total*60)-5;
		var deck_x_percent=deck_pos*100/deck_pos_max;
		var deck_bar_x=ob_main.screen_main_x+round(deck_x_percent*mouse_pos_max/100)+4;
		sc_drawrectangle(ob_main.screen_main_x+4,ob_main.screen_main_y+deck_y-8,ob_main.screen_main_x+ob_main.cam_w-6,ob_main.screen_main_y+deck_y-4,c_black,c_white,0,0.2,0,0);
		sc_drawrectangle(deck_bar_x,ob_main.screen_main_y+deck_y-8,deck_bar_x+16,ob_main.screen_main_y+deck_y-4,global.color_white,c_white,0,0.5,0,0);
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
//ob_control, ob_event & ob_deckbuild
if tooltip_text!="" {
	draw_set_font(fn_m3x6);
	if mouse_x+17+string_width(tooltip_text)<ob_main.screen_deck_x+ob_main.cam_w {
		draw_set_halign(fa_left);
		sc_drawrectangle(mouse_x+9,mouse_y-4,mouse_x+18+string_width(tooltip_text),mouse_y+12+(14*(tooltip_lines-1)),global.color_black,global.color_white,1,0.8,1,0);
		sc_drawtext(mouse_x+15,mouse_y-2,tooltip_text,global.color_white,global.color_black,1,0.5,0,-1);
	}
	else {
		draw_set_halign(fa_right);
		sc_drawrectangle(mouse_x-14-string_width(tooltip_text),mouse_y-4,mouse_x-5,mouse_y+12+(14*(tooltip_lines-1)),global.color_black,global.color_white,1,0.8,1,0);
		sc_drawtext(mouse_x-8,mouse_y-2,tooltip_text,global.color_white,global.color_black,1,0.5,0,-1);
	}
}
tooltip_text="";