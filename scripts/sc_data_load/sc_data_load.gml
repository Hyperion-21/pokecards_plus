function sc_data_load() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
area_zone=0;
roadmap_area=0;
roadmap_generated=false;
//
maindeck_total=50;
berrydeck_total=999;
//
var i=0;
repeat (3) {
	var ii=0;
	repeat (roadmap_area_max) {
		event[i][ii]=-1;
		event_name[i][ii]="";
		if i=0 {
			location_type[ii]=-1;
		}
		ii++;
	}
	i++;
}
//
var i=0;
repeat (100) {
	testvar[i]=-1;
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
	if !is_undefined(ds_map_find_value(savemap,"maindeck_total")) { maindeck_total=ds_map_find_value(savemap,"maindeck_total"); }
	if !is_undefined(ds_map_find_value(savemap,"berrydeck_total")) { berrydeck_total=ds_map_find_value(savemap,"berrydeck_total"); }
	//
	var i=0;
	repeat (3) {
		var ii=0;
		repeat (roadmap_area_max) {
			var value_name="event_" + string(i) + "_" + string(ii);
			if !is_undefined(ds_map_find_value(savemap,value_name)) { event[i][ii]=ds_map_find_value(savemap,value_name); }
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
	var i=0;
	repeat (100) {
		var value_name="testvar_" + string(i);
		if !is_undefined(ds_map_find_value(savemap,value_name)) { testvar[i]=ds_map_find_value(savemap,value_name); }
		i++;
	}
	//
	ds_map_destroy(savemap);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}