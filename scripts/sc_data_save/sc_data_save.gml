function sc_data_save() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
var savemap=ds_map_create();
//
ds_map_add(savemap,"area_zone",area_zone);
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