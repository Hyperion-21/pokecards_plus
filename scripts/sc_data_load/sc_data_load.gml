function sc_data_load() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
area_zone=0;
roadmap_area=0;
roadmap_generated=false;
//
var i=0;
repeat (3) {
	var ii=0;
	repeat (roadmap_area_max) {
		event_kind[i][ii]=-1;
		event_name[i][ii]="";
		if i=0 {
			location_type[ii]=-1;
		}
		ii++;
	}
	i++;
}
//
maindeck_total=0;
berrydeck_total=0;
//
var i=0;
repeat (maindeck_total) {
	main_card_id[i]=-1;
	main_card_level[i]=-1;
	main_card_glyph_a[i]=-1;
	main_card_glyph_b[i]=-1;
	main_card_glyph_c[i]=-1;
	main_card_indeck[i]=false;
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
	berry_num_used[i]=0;
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if file_exists(data_file) {
	var savemap=ds_map_secure_load(data_file);
	//
	if !is_undefined(ds_map_find_value(savemap,"area_zone")) { area_zone=ds_map_find_value(savemap,"area_zone"); }
	if !is_undefined(ds_map_find_value(savemap,"roadmap_area")) { roadmap_area=ds_map_find_value(savemap,"roadmap_area"); }
	if !is_undefined(ds_map_find_value(savemap,"roadmap_generated")) { roadmap_generated=ds_map_find_value(savemap,"roadmap_generated"); }
	//
	var i=0;
	repeat (3) {
		var ii=0;
		repeat (roadmap_area_max) {
			var value_name="event_kind_" + string(i) + "_" + string(ii);
			if !is_undefined(ds_map_find_value(savemap,value_name)) { event_kind[i][ii]=ds_map_find_value(savemap,value_name); }
			var value_name="event_name_" + string(i) + "_" + string(ii);
			if !is_undefined(ds_map_find_value(savemap,value_name)) { event_name[i][ii]=ds_map_find_value(savemap,value_name); }
			if i=0 {
				var value_name="location_type_" + string(ii);
				if !is_undefined(ds_map_find_value(savemap,value_name)) { location_type[ii]=ds_map_find_value(savemap,value_name); }
			}
			ii++;
		}
		i++;
	}
	//
	if !is_undefined(ds_map_find_value(savemap,"maindeck_total")) { maindeck_total=ds_map_find_value(savemap,"maindeck_total"); }
	if !is_undefined(ds_map_find_value(savemap,"berrydeck_total")) { berrydeck_total=ds_map_find_value(savemap,"berrydeck_total"); }
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
		var value_name="main_card_indeck_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { main_card_indeck[i]=ds_map_find_value(savemap,value_name); }
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
		var value_name="berry_num_used_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { berry_num_used[i]=ds_map_find_value(savemap,value_name); }
		i++;
	}
	//
	ds_map_destroy(savemap);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}