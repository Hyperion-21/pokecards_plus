function sc_data_save(backup) {
//————————————————————————————————————————————————————————————————————————————————————————————————————


var savemap=ds_map_create();
//
ds_map_add(savemap,"area_zone",area_zone);
ds_map_add(savemap,"latest_zone",latest_zone);
ds_map_add(savemap,"latest_city",latest_city);
ds_map_add(savemap,"zone_first_lap",zone_first_lap);
ds_map_add(savemap,"roadmap_area",roadmap_area);
ds_map_add(savemap,"roadmap_generated",roadmap_generated);
ds_map_add(savemap,"money",money);
ds_map_add(savemap,"lives",player_lives);
ds_map_add(savemap,"shinycharm",shinycharm);
ds_map_add(savemap,"coin_skin",coin_skin);
//
ds_map_add(savemap,"challenge_mode",option_state[opt_challenge]);
ds_map_add(savemap,"coin",option_state[opt_coin]);
//
var i=0;
repeat (roadmap_full_max) {
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
		var value_name="event_glyph_add_" + string(ii) + "_" + string(i);
		ds_map_add(savemap,value_name,event_glyph_add[ii][i]);
		ii++;
	}
	i++;
}
//
ds_map_add(savemap,"maindeck_total",maindeck_total);
ds_map_add(savemap,"maindeck_used_total",maindeck_used_total);
ds_map_add(savemap,"berrydeck_total",berrydeck_total);
ds_map_add(savemap,"serial_count",serial_count);
//



with (ob_main) {
    if (!variable_instance_exists(id, "main_card_shiny")) { ///this is crash prevention for users who started on an old save and don't have shinies.
        var i;
        for (i = 0; i < maindeck_total; i++) {
            main_card_shiny[i] = false;
        }
    }
	 if (!variable_instance_exists(id, "main_card_holo")) { ///this is crash prevention for users who started on an old save and don't have shinies.
        var i;
        for (i = 0; i < maindeck_total; i++) {
            main_card_holo[i] = false;
        }
    }
	 if (!variable_instance_exists(id, "main_card_delta")) { ///this is crash prevention for users who started on an old save and don't have shinies.
        var i;
        for (i = 0; i < maindeck_total; i++) {
            main_card_delta[i] = false;
        }
    }
	 if (!variable_instance_exists(id, "main_card_delta_type")) { ///this is crash prevention for users who started on an old save and don't have shinies.
        var i;
        for (i = 0; i < maindeck_total; i++) {
            main_card_delta_type[i] = false;
        }
    }	
	 if (!variable_instance_exists(id, "main_card_type_a")) { ///this is crash prevention for users who started on an old save and don't have shinies.
        var i;
        for (i = 0; i < maindeck_total; i++) {
            main_card_type_a[i] = -1;
        }
    }	
	 if (!variable_instance_exists(id, "main_card_type_b")) { ///this is crash prevention for users who started on an old save and don't have shinies.
        var i;
        for (i = 0; i < maindeck_total; i++) {
            main_card_type_b[i] = -1;
        }
    }	
}


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
	var value_name="main_card_shiny_" + string(i);
	ds_map_add(savemap,value_name,main_card_shiny[i]);
	var value_name="main_card_holo_" + string(i);
	ds_map_add(savemap,value_name,main_card_holo[i]);
	var value_name="main_card_delta_" + string(i);
	ds_map_add(savemap,value_name,main_card_delta[i]);
	var value_name="main_card_delta_type_" + string(i);
	ds_map_add(savemap,value_name,main_card_delta_type[i]);
	var value_name="main_card_type_a_" + string(i);
	ds_map_add(savemap,value_name,main_card_type_a[i]);
	var value_name="main_card_type_b_" + string(i);
	ds_map_add(savemap,value_name,main_card_type_b[i]);
	var value_name="main_card_form_value_" + string(i);
	ds_map_add(savemap,value_name,main_card_form_value[i]);
	var value_name="main_card_serial_" + string(i);
	ds_map_add(savemap,value_name,main_card_serial[i]);
	i++;
}
//
var i=0;
repeat (serial_count) {
	var ii=0;
	repeat (deck_setup_max+1) {
		var value_name="serial_card_indeck_" + string(i) + "_" + string(ii);
		ds_map_add(savemap,value_name,serial_card_indeck[i][ii]);
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
ds_map_secure_save(savemap, backup ? "backup/backup-" + string(current_year) + "-" + string(current_month) + "-" + string(current_day) + "-" + string(current_hour) + "-" + string(current_minute) + "-" + string(current_second) + ".sav" : ob_main.savedata[ob_main.savestate]);
ds_map_destroy(savemap);
//————————————————————————————————————————————————————————————————————————————————————————————————————
}