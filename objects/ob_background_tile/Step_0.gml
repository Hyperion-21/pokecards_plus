//ob_background_tile
//————————————————————————————————————————————————————————————————————————————————————————————————————
if ob_main.option_state[ob_main.opt_bg_type]=0 {
	x-=0.5;
	if x<=ob_control.cam_x-32 { x+=512+64; }
	//
	//y-=0.5;
	//if y<=ob_control.cam_y-32 { y+=288+32; }
}