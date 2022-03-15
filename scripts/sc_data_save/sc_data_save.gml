function sc_data_save() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
var savemap=ds_map_create();
//
ds_map_add(savemap,"area_zone",area_zone);
ds_map_add(savemap,"roadmap_area",roadmap_area);
ds_map_add(savemap,"roadmap_generated",roadmap_generated);
//
ds_map_add(savemap,"maindeck_total",maindeck_total);
ds_map_add(savemap,"berrydeck_total",berrydeck_total);
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
var i=0;
repeat (100) {
	var value_name="testvar_" + string(i);
	ds_map_add(savemap,value_name,testvar[i]);
	i++;
}
//
ds_map_secure_save(savemap,data_file);
ds_map_destroy(savemap);
//————————————————————————————————————————————————————————————————————————————————————————————————————
}