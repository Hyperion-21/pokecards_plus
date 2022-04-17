//ob_background
//————————————————————————————————————————————————————————————————————————————————————————————————————
if (instance_exists(ob_control) and (ob_main.option_state[opt_bg_type]=0 or ob_main.option_state[opt_bg_type]=1 or ob_main.option_state[opt_bg_type]=2)) or instance_exists(ob_splash) {
	draw_sprite_general(sprite_index,0,0,0,1,1,x-2,y-2,cam_w+4,cam_h+4,0,global.color_background_a,global.color_background_b,global.color_background_a,global.color_background_b,1);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if !instance_exists(ob_control) or ob_main.option_state[opt_bg_type]=3 {
	var area_sp_x=ob_main.location_type[ob_main.roadmap_area], area_sp_y=0;
	if area_sp_x>=6 and area_sp_x<=11 { area_sp_x-=6; area_sp_y=1; }
	else if area_sp_x>=12 and area_sp_x<=16 { area_sp_x-=12; area_sp_y=2; }
	else if area_sp_x>=17 { area_sp_x-=17; area_sp_y=3; }
	//
	var cam_x=camera_get_view_x(view_camera[0]), cam_y=camera_get_view_y(view_camera[0]);
	if instance_exists(ob_control) { var back_alpha=0.7; }
	else if instance_exists(ob_event) { var back_alpha=0.8; }
	else { var back_alpha=0.9; }
	//
	draw_sprite_general(sp_area,0,240*area_sp_x,112*area_sp_y,240,112,cam_x-104,cam_y-21,3,3,0,c_white,c_white,c_white,c_white,1);
	sc_drawrectangle(cam_x-2,cam_y-2,cam_x+cam_w+2,cam_y+cam_h+2,global.color_black,c_white,0,back_alpha,1,0);
}