if show_deck=true {
	
	if cam_w<(card_event_inventory_total*60) {
		var inventory_pos=inventory_x-4, mouse_pos_max=cam_w-16-10, inventory_pos_max=cam_w-(card_event_inventory_total*60)-5;
		var inventory_x_percent=inventory_pos*100/inventory_pos_max;
		var inventory_bar_x=screen_main_x+round(inventory_x_percent*mouse_pos_max/100)+4;
		sc_drawrectangle(screen_main_x+4,screen_main_y+inventory_y+82,screen_main_x+cam_w-6,screen_main_y+inventory_y+86,c_black,c_white,0,0.2,0,0);
		sc_drawrectangle(inventory_bar_x,screen_main_y+inventory_y+82,inventory_bar_x+16,screen_main_y+inventory_y+86,global.color_white,c_white,0,0.5,0,0);
	}
	if cam_w<(card_event_total*60) {
		var deck_pos=deck_x-4, mouse_pos_max=cam_w-16-10, deck_pos_max=cam_w-(card_event_total*60)-5;
		var deck_x_percent=deck_pos*100/deck_pos_max;
		var deck_bar_x=screen_main_x+round(deck_x_percent*mouse_pos_max/100)+4;
		sc_drawrectangle(screen_main_x+4,screen_main_y+deck_y-8,screen_main_x+cam_w-6,screen_main_y+deck_y-4,c_black,c_white,0,0.2,0,0);
		sc_drawrectangle(deck_bar_x,screen_main_y+deck_y-8,deck_bar_x+16,screen_main_y+deck_y-4,global.color_white,c_white,0,0.5,0,0);
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
sc_draw_tooltip_text(screen_main_x+cam_w);