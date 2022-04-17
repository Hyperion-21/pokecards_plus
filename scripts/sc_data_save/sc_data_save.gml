function sc_data_save() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
var savemap=ds_map_create();
//
ds_map_add(savemap,"area_zone",area_zone);
ds_map_add(savemap,"first_zone_lap",first_zone_lap);
ds_map_add(savemap,"roadmap_area",roadmap_area);
ds_map_add(savemap,"roadmap_generated",roadmap_generated);
ds_map_add(savemap,"money",money);
//
var i=0;
repeat (roadmap_area_max) {
	var value_name="location_type_" + string(i);
	ds_map_add(savemap,value_name,location_type[i]);
	var value_name="trainer_kind_" + string(i);
	ds_map_add(savemap,value_name,trainer_kind[i]);
	var value_name="trainer_sprite_" + string(i);
	ds_map_add(savemap,value_name,trainer_sprite[i]);
	var value_name="trainer_skin_" + string(i);
	ds_map_add(savemap,value_name,trainer_skin[i]);
	var value_name="trainer_hair_color_" + string(i);
	ds_map_add(savemap,value_name,trainer_hair_color[i]);
	//
	var ii=0;
	repeat (3) {
		var value_name="event_kind_" + string(ii) + "_" + string(i);
		ds_map_add(savemap,value_name,event_kind[ii][i]);
		ii++;
	}
	i++;
}
//
ds_map_add(savemap,"maindeck_total",maindeck_total);
ds_map_add(savemap,"berrydeck_total",berrydeck_total);
ds_map_add(savemap,"serial_count",serial_count);
//
var i=0;
repeat (maindeck_total) {
	var value_name="main_card_id_" + string(i);
	ds_map_add(savemap,value_name,main_card_id[i]);
	var value_name="main_card_level_" + string(i);
	ds_map_add(savemap,value_name,main_card_level[i]);
	var value_name="main_card_glyph_a_" + string(i);
	ds_map_add(savemap,value_name,main_card_glyph_a[i]);
	var value_name="main_card_glyph_b_" + string(i);
	ds_map_add(savemap,value_name,main_card_glyph_b[i]);
	var value_name="main_card_glyph_c_" + string(i);
	ds_map_add(savemap,value_name,main_card_glyph_c[i]);
	var value_name="main_card_innate_" + string(i);
	ds_map_add(savemap,value_name,main_card_innate[i]);
	var value_name="main_card_form_value_" + string(i);
	ds_map_add(savemap,value_name,main_card_form_value[i]);
	var value_name="main_card_serial_" + string(i);
	ds_map_add(savemap,value_name,main_card_serial[i]);
	//
	var ii=0;
	repeat (deck_setup_max+1) {
		var value_name="main_card_indeck_" + string(i) + "_" + string(ii);
		ds_map_add(savemap,value_name,main_card_indeck[i][ii]);
		ii++;
	}
	i++;
}
//
var i=0;
repeat (berrydeck_total) {
	var value_name="berry_card_id_" + string(i);
	ds_map_add(savemap,value_name,berry_card_id[i]);
	i++;
}
//
var i=0;
repeat (4) {
	var ii=0;
	repeat (deck_setup_max+1) {
		var value_name="berry_num_used_" + string(i) + "_" + string(ii);
		ds_map_add(savemap,value_name,berry_num_used[i][ii]);
		ii++;
	}
	i++;
}
//
ds_map_secure_save(savemap,data_file);
ds_map_destroy(savemap);
//————————————————————————————————————————————————————————————————————————————————————————————————————
}