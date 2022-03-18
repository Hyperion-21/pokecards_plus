if ob_main.cam_w<(deck_build_stored_total*60) {
	var stored_bar_x=ob_main.screen_deck_x+((stored_x-4)*(ob_main.cam_w-26)/(ob_main.cam_w-(deck_build_stored_total*60)-5));
	sc_drawrectangle(ob_main.screen_deck_x+4,ob_main.screen_main_y+86,ob_main.screen_deck_x+ob_main.cam_w-6,ob_main.screen_main_y+90,c_black,c_white,0,0.2,0,0);
	sc_drawrectangle(stored_bar_x+4,ob_main.screen_main_y+86,stored_bar_x+20,ob_main.screen_main_y+90,global.color_white,c_white,0,0.5,0,0);
}