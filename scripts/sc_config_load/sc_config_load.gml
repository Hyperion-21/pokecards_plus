function sc_config_load() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
option_state[opt_fullscreen]=false;
window_set_fullscreen(option_state[opt_fullscreen]);
//
option_state[opt_vsync]=true;
display_reset(0,option_state[opt_vsync]);
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
option_state[opt_music]=true;
option_state[opt_sound]=true;
option_state[opt_autodeck]=true;
option_state[opt_edge]=10;
option_state[opt_bg_type]=0;
//
colorsetup_r[opt_bg_a]=59*bg_rgb_divisor;
colorsetup_g[opt_bg_a]=57*bg_rgb_divisor;
colorsetup_b[opt_bg_a]=53*bg_rgb_divisor;
colorsetup_r[opt_bg_b]=59*bg_rgb_divisor;
colorsetup_g[opt_bg_b]=57*bg_rgb_divisor;
colorsetup_b[opt_bg_b]=53*bg_rgb_divisor;
colorsetup_r[opt_bg_tile]=64*bg_rgb_divisor;
colorsetup_g[opt_bg_tile]=62*bg_rgb_divisor;
colorsetup_b[opt_bg_tile]=58*bg_rgb_divisor;
//————————————————————————————————————————————————————————————————————————————————————————————————————
if file_exists(config_file) {
	var savemap=ds_map_secure_load(config_file);
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
	if !is_undefined(ds_map_find_value(savemap,"window_scaling")) { option_state[opt_scaling]=ds_map_find_value(savemap,"window_scaling"); }
	if !is_undefined(ds_map_find_value(savemap,"music")) { option_state[opt_music]=ds_map_find_value(savemap,"music"); }
	if !is_undefined(ds_map_find_value(savemap,"sound")) { option_state[opt_sound]=ds_map_find_value(savemap,"sound"); }
	if !is_undefined(ds_map_find_value(savemap,"autodeck")) { option_state[opt_autodeck]=ds_map_find_value(savemap,"autodeck"); }
	if !is_undefined(ds_map_find_value(savemap,"edge_shading")) { option_state[opt_edge]=ds_map_find_value(savemap,"edge_shading"); }
	if !is_undefined(ds_map_find_value(savemap,"background_type")) { option_state[opt_bg_type]=ds_map_find_value(savemap,"background_type"); }
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
	//
	ds_map_destroy(savemap);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}