//ob_background_tile
//————————————————————————————————————————————————————————————————————————————————————————————————————
if ob_main.option_state[ob_main.opt_bg_type]=0 or instance_exists(ob_splash) {
	x-=0.5;
	if x<=ob_main.screen_main_x-32 { x+=512+64; }
	//
	//y-=0.5;
	//if y<=ob_main.screen_main_y-32 { y+=288+32; }
}