function sc_data_save() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
var savemap=ds_map_create();
//
ds_map_add(savemap,"area_zone",area_zone);
ds_map_add(savemap,"roadmap_area",roadmap_area);
ds_map_add(savemap,"roadmap_generated",roadmap_generated);
//
var i=0;
repeat (3) {
	var ii=0;
	repeat (roadmap_area_max) {
		var value_name="event_" + string(i) + "_" + string(ii);
		ds_map_add(savemap,value_name,event[i][ii]);
		var value_name="event_name_" + string(i) + "_" + string(ii);
		ds_map_add(savemap,value_name,event_name[i][ii]);
		if i=0 {
			var value_name="location_type_" + string(ii);
			ds_map_add(savemap,value_name,location_type[ii]);
		}
		ii++;
	}
	i++;
}
//
ds_map_add(savemap,"maindeck_total",maindeck_total);
ds_map_add(savemap,"berrydeck_total",berrydeck_total);
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
ds_map_secure_save(savemap,data_file);
ds_map_destroy(savemap);
//————————————————————————————————————————————————————————————————————————————————————————————————————
}