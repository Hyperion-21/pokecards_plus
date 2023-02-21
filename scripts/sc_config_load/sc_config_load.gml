function sc_config_load() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
option_state[opt_fullscreen]=false;
window_set_fullscreen(option_state[opt_fullscreen]);
//
option_state[opt_vsync]=true;
display_reset(0,option_state[opt_vsync]);
//
option_state[opt_filter]=false;
gpu_set_tex_filter(false);
//
var screen_w=display_get_width(), screen_h=display_get_height();
var i=0, biggest_screen_size_found=false;
do {
	i++;
	if 512*i>=screen_w or 288*i>=screen_h {
		biggest_screen_size_found=true;
	}
} until (biggest_screen_size_found=true);
window_set_size(512*(i-1),288*(i-1));
option_state[opt_scaling]=i-1;
//
option_state[opt_music]=20;
option_state[opt_sound]=100;
option_state[opt_autodeck]=true;
option_state[opt_jumping]=0;
option_state[opt_edge]=10;
option_state[opt_playericon]=0;
option_state[opt_bg_type]=0;
//
colorsetup_r[opt_bg_a]=67*bg_rgb_divisor;
colorsetup_g[opt_bg_a]=73*bg_rgb_divisor;
colorsetup_b[opt_bg_a]=77*bg_rgb_divisor;
colorsetup_r[opt_bg_b]=59*bg_rgb_divisor;
colorsetup_g[opt_bg_b]=66*bg_rgb_divisor;
colorsetup_b[opt_bg_b]=71*bg_rgb_divisor;
colorsetup_r[opt_bg_tile]=75*bg_rgb_divisor;
colorsetup_g[opt_bg_tile]=81*bg_rgb_divisor;
colorsetup_b[opt_bg_tile]=86*bg_rgb_divisor;
colorsetup_r[opt_c_char]=118;
colorsetup_g[opt_c_char]=145;
colorsetup_b[opt_c_char]=172;
//————————————————————————————————————————————————————————————————————————————————————————————————————
if file_exists(ob_main.saveconf[ob_main.savestate]) {
	var savemap=ds_map_secure_load(ob_main.saveconf[ob_main.savestate]);
	//
	if !is_undefined(ds_map_find_value(savemap,"fullscreen")) {
		option_state[opt_fullscreen]=ds_map_find_value(savemap,"fullscreen");
		window_set_fullscreen(option_state[opt_fullscreen]);
	}
	//
	if !is_undefined(ds_map_find_value(savemap,"vsync")) {
		option_state[opt_vsync]=ds_map_find_value(savemap,"vsync");
		display_reset(0,option_state[opt_vsync]);
	}
	//
	if !is_undefined(ds_map_find_value(savemap,"filter")) {
		option_state[opt_filter]=ds_map_find_value(savemap,"filter");
		gpu_set_tex_filter(option_state[opt_filter]);
	}
	//
	if !is_undefined(ds_map_find_value(savemap,"window_scaling")) {
		option_state[opt_scaling]=ds_map_find_value(savemap,"window_scaling");
		window_set_size(512*(option_state[opt_scaling]),288*(option_state[opt_scaling]));
	}
	//
	if !is_undefined(ds_map_find_value(savemap,"music")) { option_state[opt_music]=ds_map_find_value(savemap,"music"); }
	if !is_undefined(ds_map_find_value(savemap,"sound")) { option_state[opt_sound]=ds_map_find_value(savemap,"sound"); }
	if !is_undefined(ds_map_find_value(savemap,"autodeck")) { option_state[opt_autodeck]=ds_map_find_value(savemap,"autodeck"); }
	if !is_undefined(ds_map_find_value(savemap,"jumping")) { option_state[opt_jumping]=ds_map_find_value(savemap,"jumping"); }
	if !is_undefined(ds_map_find_value(savemap,"edge_shading")) { option_state[opt_edge]=ds_map_find_value(savemap,"edge_shading"); }
	if !is_undefined(ds_map_find_value(savemap,"player_icon")) { option_state[opt_playericon]=ds_map_find_value(savemap,"player_icon"); }
	if !is_undefined(ds_map_find_value(savemap,"background_type")) { option_state[opt_bg_type]=ds_map_find_value(savemap,"background_type"); }
	if !is_undefined(ds_map_find_value(savemap,"savestate")) { savestate=ds_map_find_value(savemap,"savestate"); }
	//
	if !is_undefined(ds_map_find_value(savemap,"color_a_r")) { colorsetup_r[opt_bg_a]=ds_map_find_value(savemap,"color_a_r"); }
	if !is_undefined(ds_map_find_value(savemap,"color_a_g")) { colorsetup_g[opt_bg_a]=ds_map_find_value(savemap,"color_a_g"); }
	if !is_undefined(ds_map_find_value(savemap,"color_a_b")) { colorsetup_b[opt_bg_a]=ds_map_find_value(savemap,"color_a_b"); }
	if !is_undefined(ds_map_find_value(savemap,"color_b_r")) { colorsetup_r[opt_bg_b]=ds_map_find_value(savemap,"color_b_r"); }
	if !is_undefined(ds_map_find_value(savemap,"color_b_g")) { colorsetup_g[opt_bg_b]=ds_map_find_value(savemap,"color_b_g"); }
	if !is_undefined(ds_map_find_value(savemap,"color_b_b")) { colorsetup_b[opt_bg_b]=ds_map_find_value(savemap,"color_b_b"); }
	if !is_undefined(ds_map_find_value(savemap,"color_tile_r")) { colorsetup_r[opt_bg_tile]=ds_map_find_value(savemap,"color_tile_r"); }
	if !is_undefined(ds_map_find_value(savemap,"color_tile_g")) { colorsetup_g[opt_bg_tile]=ds_map_find_value(savemap,"color_tile_g"); }
	if !is_undefined(ds_map_find_value(savemap,"color_tile_b")) { colorsetup_b[opt_bg_tile]=ds_map_find_value(savemap,"color_tile_b"); }
	if !is_undefined(ds_map_find_value(savemap,"color_char_r")) { colorsetup_r[opt_c_char]=ds_map_find_value(savemap,"color_char_r"); }
	if !is_undefined(ds_map_find_value(savemap,"color_char_g")) { colorsetup_g[opt_c_char]=ds_map_find_value(savemap,"color_char_g"); }
	if !is_undefined(ds_map_find_value(savemap,"color_char_b")) { colorsetup_b[opt_c_char]=ds_map_find_value(savemap,"color_char_b"); }
	//
	ds_map_destroy(savemap);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}