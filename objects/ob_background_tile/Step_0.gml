//ob_background_tile
//————————————————————————————————————————————————————————————————————————————————————————————————————
if ob_main.option_state[opt_bg_type]=0 or instance_exists(ob_splash) {
	x-=0.5;
	if x<=screen_main_x-32 { x+=512+64; }
}
else if ob_main.option_state[opt_bg_type]=1 {
	y+=0.5;
	if y>=screen_main_y+cam_h { y-=288+32; }
}
