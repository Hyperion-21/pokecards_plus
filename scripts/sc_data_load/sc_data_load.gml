function sc_data_load() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
area_zone=0;
//
var i=0;
repeat (3) {
	var ii=0;
	repeat (roadmap_area_max) {
		event[i][ii]=-1;
		event_name[i][ii]="";
		location_type[ii]=-1;
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