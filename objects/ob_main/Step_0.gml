if mouse_check_button(mb_right) { cursor_hide=true; }
else { cursor_hide=false; }
//
if keyboard_check_pressed(vk_f5) { game_restart(); } //< delete later, testing
if keyboard_check_pressed(vk_f4) { //< delete later, testing
	if file_exists(config_file) { file_delete(config_file); }
	if file_exists(data_file) { file_delete(data_file); }
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if roadmap_create=true {
	if area_zone=0 {
		event[0][0]=100;
		event[1][0]=101;
		event[2][0]=102;
	}
	//
	var i=0;
	repeat (3) {
		var ii=0;
		repeat (roadmap_area_max) {
			if area_zone!=0 or roadmap_area!=0 {
				if i<2 { event[i][ii]=irandom_range(0,1); }
				else { event[i][ii]=irandom_range(-1,1); }
			}
			//
			if event[i][ii]=0 { event_name[i][ii]="Battle"; }
			else if event[i][ii]=1 { event_name[i][ii]="Card Pack"; }
			else if event[i][ii]=100 { event_name[i][ii]="Bulbasaur"; }
			else if event[i][ii]=101 { event_name[i][ii]="Charmander"; }
			else if event[i][ii]=102 { event_name[i][ii]="Squirtle"; }
			//
			do {
				location_type[ii]=irandom(21);
			} until (location_type[ii]!=11 and location_type[ii]!=13 and location_type[ii]!=15); //rocket HQs & city
			ii++;
		}
		i++;
	}
	roadmap_create=false;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if event_transition>-1 and fade_black<1 {
	if event_transition=0 { fade_black+=0.02; }
	else if event_transition=1 or event_transition=2 { fade_black+=0.005; }
}
else if event_transition=-1 and fade_black>0 {
	fade_black-=0.02;
}
else if event_transition>-1 and fade_black>=1 {
	if event_transition=0 {
		instance_create_layer(x,y,"instances",ob_control);
	}
	else if event_transition=1 or event_transition=2 {
		//destroy everything except ob_main
		with (ob_control) { instance_destroy(); }
		with (ob_card) { instance_destroy(); }
		with (ob_card_space) { instance_destroy(); }
		with (ob_button_16x16) { instance_destroy(); }
		with (ob_button_31x24) { instance_destroy(); }
		with (ob_background) { instance_destroy(); }
		with (ob_background_tile) { instance_destroy(); }
		with (ob_damage_num) { instance_destroy(); }
		//
		roadmap_area++;
	}
	event_transition=-1;
}
else if event_transition=-1 and fade_black<=0 {
	if keyboard_check_pressed(vk_space) and !instance_exists(ob_control) {
		event_transition=0;
	}
}