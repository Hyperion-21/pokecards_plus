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
sc_draw_tooltip_text(ob_main.screen_main_x+ob_main.cam_w);