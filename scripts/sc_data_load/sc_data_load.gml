function sc_data_load() {
//————————————————————————————————————————————————————————————————————————————————————————————————————



area_zone=0;
latest_zone=0;
latest_city=-1;
zone_first_lap=true;
roadmap_area=0;
roadmap_generated=false;
money=0;
shinycharm=0;
player_lives=0;
coin_skin=0;
newgameplus = false;
//
option_state[opt_challenge]=0;
option_state[opt_coin]=0;

//if option_state[opt_fullscreen]=false { option_state[opt_fullscreen]=true; }
//else { option_state[opt_fullscreen]=false; }
//window_set_fullscreen(option_state[opt_fullscreen]);
//window_set_size(512*(option_state[opt_scaling]),288*(option_state[opt_scaling]));
//
var i=0;
repeat (roadmap_full_max) {
	location_type[i]=-1;
	trainer_kind[i]=-1;
	trainer_sprite[i]=-1;
	trainer_skin[i]=-1;
	trainer_hair_color[i]=c_white;
	//
	var ii=0;
	repeat (3) {
		event_kind[ii][i]=-1;
		event_glyph_add[ii][i]=-1;
		ii++;
	}
	i++;
}
//
maindeck_total=0;
maindeck_used_total=0;
berrydeck_total=0;
serial_count=0;
//
var i=0;
repeat (maindeck_total) {
	main_card_id[i]=-1;
	main_card_level[i]=-1;
	main_card_glyph_a[i]=-1;
	main_card_glyph_b[i]=-1;
	main_card_glyph_c[i]=-1;
	main_card_innate[i]=-1;
	main_card_shiny[i]=-1;
	main_card_holo[i]=-1;
	main_card_delta[i]=-1;
	main_card_delta_type[i]=-1;
	main_card_type_a[i]=-1;
	main_card_type_b[i]=-1;
	main_card_form_value[i]=-1;
	main_card_serial[i]=-1;
	i++;
}
//
var i=0;
repeat (serial_count) {
	var ii=0;
	repeat (deck_setup_max+1) {
		serial_card_indeck[i][ii]=false;
		ii++;
	}
	i++;
}
//
var i=0;
repeat (berrydeck_total) {
	berry_card_id[i]=-1;
	i++;
}
//
var i=0;
repeat (4) {
	var ii=0;
	repeat (deck_setup_max+1) {
		berry_num_used[i][ii]=0;
		ii++;
	}
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if file_exists(ob_main.savedata[ob_main.savestate]) {
	var savemap=ds_map_secure_load(ob_main.savedata[ob_main.savestate]);
if !is_undefined(ds_map_find_value(savemap,"version")) { version=ds_map_find_value(savemap,"version"); 
	if !is_undefined(ds_map_find_value(savemap,"area_zone")) { area_zone=ds_map_find_value(savemap,"area_zone"); }
	if !is_undefined(ds_map_find_value(savemap,"latest_zone")) { latest_zone=ds_map_find_value(savemap,"latest_zone"); }
	if !is_undefined(ds_map_find_value(savemap,"latest_city")) { latest_city=ds_map_find_value(savemap,"latest_city"); }
	if !is_undefined(ds_map_find_value(savemap,"zone_first_lap")) { zone_first_lap=ds_map_find_value(savemap,"zone_first_lap"); }
	if !is_undefined(ds_map_find_value(savemap,"roadmap_area")) { roadmap_area=ds_map_find_value(savemap,"roadmap_area"); }
	if !is_undefined(ds_map_find_value(savemap,"roadmap_generated")) { roadmap_generated=ds_map_find_value(savemap,"roadmap_generated"); }
	if !is_undefined(ds_map_find_value(savemap,"money")) { money=ds_map_find_value(savemap,"money"); }
	if !is_undefined(ds_map_find_value(savemap,"lives")) { player_lives=ds_map_find_value(savemap,"lives"); }
	if !is_undefined(ds_map_find_value(savemap,"shinycharm")) { shinycharm=ds_map_find_value(savemap,"shinycharm"); }
	if !is_undefined(ds_map_find_value(savemap,"coin_skin")) { coin_skin=ds_map_find_value(savemap,"coin_skin"); }
	if !is_undefined(ds_map_find_value(savemap,"newgameplus")) { newgameplus=ds_map_find_value(savemap,"newgameplus"); }
	//
	if !is_undefined(ds_map_find_value(savemap,"challenge_mode")) { option_state[opt_challenge]=ds_map_find_value(savemap,"challenge_mode"); }
	if !is_undefined(ds_map_find_value(savemap,"coin")) && coin_skin >= (ds_map_find_value(savemap,"coin")){ option_state[opt_coin]=ds_map_find_value(savemap,"coin"); }
	else { option_state[opt_coin]=ds_map_find_value(savemap,"coin_skin"); }
	//
	var i=0;
	repeat (roadmap_full_max) {
		var value_name="location_type_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { location_type[i]=ds_map_find_value(savemap,value_name); }
		var value_name="trainer_kind_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { trainer_kind[i]=ds_map_find_value(savemap,value_name); }
		var value_name="trainer_sprite_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { trainer_sprite[i]=ds_map_find_value(savemap,value_name); }
		var value_name="trainer_skin_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { trainer_skin[i]=ds_map_find_value(savemap,value_name); }
		var value_name="trainer_hair_color_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { trainer_hair_color[i]=ds_map_find_value(savemap,value_name); }
		//
		var ii=0;
		repeat (3) {
			var value_name="event_kind_" + string(ii) + "_" + string(i);
			if !is_undefined(ds_map_find_value(savemap,value_name)) { event_kind[ii][i]=ds_map_find_value(savemap,value_name); }
			var value_name="event_glyph_add_" + string(ii) + "_" + string(i);
			if !is_undefined(ds_map_find_value(savemap,value_name)) { event_glyph_add[ii][i]=ds_map_find_value(savemap,value_name); }
			ii++;
		}
		i++;
	}
	//
	if !is_undefined(ds_map_find_value(savemap,"maindeck_total")) { maindeck_total=ds_map_find_value(savemap,"maindeck_total"); }
	if !is_undefined(ds_map_find_value(savemap,"maindeck_used_total")) { maindeck_used_total=ds_map_find_value(savemap,"maindeck_used_total"); }
	if !is_undefined(ds_map_find_value(savemap,"berrydeck_total")) { berrydeck_total=ds_map_find_value(savemap,"berrydeck_total"); }
	if !is_undefined(ds_map_find_value(savemap,"serial_count")) { serial_count=ds_map_find_value(savemap,"serial_count"); }
	//
	var i=0;
	repeat (maindeck_total) {
		var value_name="main_card_id_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { main_card_id[i]=ds_map_find_value(savemap,value_name); }
		var value_name="main_card_level_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { main_card_level[i]=ds_map_find_value(savemap,value_name); }
		var value_name="main_card_glyph_a_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { main_card_glyph_a[i]=ds_map_find_value(savemap,value_name); }		
		var value_name="main_card_glyph_b_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { main_card_glyph_b[i]=ds_map_find_value(savemap,value_name); }
		var value_name="main_card_glyph_c_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { main_card_glyph_c[i]=ds_map_find_value(savemap,value_name); }
		var value_name="main_card_innate_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { main_card_innate[i]=ds_map_find_value(savemap,value_name); }
		var value_name="main_card_shiny_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { main_card_shiny[i]=ds_map_find_value(savemap,value_name); }
		var value_name="main_card_holo_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { main_card_holo[i]=ds_map_find_value(savemap,value_name); }
		var value_name="main_card_delta_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { main_card_delta[i]=ds_map_find_value(savemap,value_name); }
		var value_name="main_card_delta_type_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { main_card_delta_type[i]=ds_map_find_value(savemap,value_name); }		
		var value_name="main_card_type_a_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { main_card_type_a[i]=ds_map_find_value(savemap,value_name); }
		var value_name="main_card_type_b_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { main_card_type_b[i]=ds_map_find_value(savemap,value_name); }
		var value_name="main_card_form_value_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { main_card_form_value[i]=ds_map_find_value(savemap,value_name); }
		var value_name="main_card_serial_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { main_card_serial[i]=ds_map_find_value(savemap,value_name); }
		i++;
	}
	//
	var i=0;
	repeat (serial_count) {
		var ii=0;
		repeat (deck_setup_max+1) {
			var value_name="serial_card_indeck_" + string(i) + "_" + string(ii);
			if !is_undefined(ds_map_find_value(savemap,value_name)) { serial_card_indeck[i][ii]=ds_map_find_value(savemap,value_name); }
			ii++;
		}
		i++;
	}
	//
	var i=0;
	repeat (berrydeck_total) {
		var value_name="berry_card_id_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { berry_card_id[i]=ds_map_find_value(savemap,value_name); }
		i++;
	}
	//
	var i=0;
	repeat (4) {
		var ii=0;
		repeat (deck_setup_max+1) {
			var value_name="berry_num_used_" + string(i) + "_" + string(ii);
			if !is_undefined(ds_map_find_value(savemap,value_name)) { berry_num_used[i][ii]=ds_map_find_value(savemap,value_name); }
			ii++;
		}
		i++;
	}
	//
	ds_map_destroy(savemap);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}
}
