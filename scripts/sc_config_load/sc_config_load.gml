function sc_config_load() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
global.sound_level=10;
global.music_level=10;
// ^new
display_reset(0,false);
global.vsync=false;
window_set_fullscreen(false);
global.fullscreen=false;
global.gamescaling=2;
global.textureredraw=0;
global.texturefilter=false;
global.weathereffects=true;
global.musiclevel=5;
global.soundlevel=10;
global.autosave=true;
global.textfont=0;
global.textspeed=3;
global.windowcolor_id=0;
//————————————————————————————————————————————————————————————————————————————————————————————————————
if file_exists(config_file) {
	var savemap=ds_map_secure_load(config_file);
	//
	if !is_undefined(ds_map_find_value(savemap,"vsync")) {
		if ds_map_find_value(savemap,"vsync")=true {
			display_reset(0,true);
			global.vsync=true;
		}
		else {
			display_reset(0,false);
			global.vsync=false;
		}
	}
	if !is_undefined(ds_map_find_value(savemap,"fullscreen")) {
		global.fullscreen=ds_map_find_value(savemap,"fullscreen");
		if global.fullscreen=true {
			window_set_fullscreen(true);
		}
		else {
			window_set_fullscreen(false);
		}
	}
	if !is_undefined(ds_map_find_value(savemap,"window_scaling")) { global.gamescaling=ds_map_find_value(savemap,"window_scaling"); }
	if !is_undefined(ds_map_find_value(savemap,"texture_redraw")) { global.textureredraw=ds_map_find_value(savemap,"texture_redraw"); }
	if !is_undefined(ds_map_find_value(savemap,"texture_filter")) { global.texturefilter=ds_map_find_value(savemap,"texture_filter"); }
	if !is_undefined(ds_map_find_value(savemap,"weather_effects")) { global.weathereffects=ds_map_find_value(savemap,"weather_effects"); }
	if !is_undefined(ds_map_find_value(savemap,"music_level")) { global.musiclevel=ds_map_find_value(savemap,"music_level"); }
	if !is_undefined(ds_map_find_value(savemap,"sound_level")) { global.soundlevel=ds_map_find_value(savemap,"sound_level"); }
	if !is_undefined(ds_map_find_value(savemap,"autosave")) { global.autosave=ds_map_find_value(savemap,"autosave"); }
	if !is_undefined(ds_map_find_value(savemap,"text_font")) { global.textfont=ds_map_find_value(savemap,"text_font"); }
	if !is_undefined(ds_map_find_value(savemap,"text_speed")) { global.textspeed=ds_map_find_value(savemap,"text_speed"); }
	if !is_undefined(ds_map_find_value(savemap,"window_color")) { global.windowcolor_id=ds_map_find_value(savemap,"window_color"); }
	//
	if !is_undefined(ds_map_find_value(savemap,"key_01")) { global.k01=ds_map_find_value(savemap,"key_01"); }
	if !is_undefined(ds_map_find_value(savemap,"key_02")) { global.k02=ds_map_find_value(savemap,"key_02"); }
	if !is_undefined(ds_map_find_value(savemap,"key_03")) { global.k03=ds_map_find_value(savemap,"key_03"); }
	if !is_undefined(ds_map_find_value(savemap,"key_04")) { global.k04=ds_map_find_value(savemap,"key_04"); }
	if !is_undefined(ds_map_find_value(savemap,"key_05")) { global.k05=ds_map_find_value(savemap,"key_05"); }
	if !is_undefined(ds_map_find_value(savemap,"key_06")) { global.k06=ds_map_find_value(savemap,"key_06"); }
	if !is_undefined(ds_map_find_value(savemap,"key_07")) { global.k07=ds_map_find_value(savemap,"key_07"); }
	if !is_undefined(ds_map_find_value(savemap,"key_08")) { global.k08=ds_map_find_value(savemap,"key_08"); }
	if !is_undefined(ds_map_find_value(savemap,"key_09")) { global.k09=ds_map_find_value(savemap,"key_09"); }
	if !is_undefined(ds_map_find_value(savemap,"key_up")) { global.kup=ds_map_find_value(savemap,"key_up"); }
	if !is_undefined(ds_map_find_value(savemap,"key_down")) { global.kdown=ds_map_find_value(savemap,"key_down"); }
	if !is_undefined(ds_map_find_value(savemap,"key_left")) { global.kleft=ds_map_find_value(savemap,"key_left"); }
	if !is_undefined(ds_map_find_value(savemap,"key_right")) { global.kright=ds_map_find_value(savemap,"key_right"); }
	//
	ds_map_destroy(savemap);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}