if mouse_check_button(mb_right) { cursor_hide=true; }
else { cursor_hide=false; }
//
if keyboard_check_pressed(vk_f5) { game_restart(); } //< delete later, testing
if keyboard_check_pressed(vk_f4) { //< delete later, testing
	if file_exists(config_file) { file_delete(config_file); }
	if file_exists(data_file) { file_delete(data_file); }
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if roadmap_generated=false {
	var i=0;
	repeat (3) {
		var ii=0;
		repeat (roadmap_area_max) {
			if i<2 { event[i][ii]=irandom_range(0,1); }
			else { event[i][ii]=irandom_range(-1,1); }
			//
			if i=0 {
				do {
					location_type[ii]=irandom(21);
				} until (location_type[ii]!=13 and location_type[ii]!=15); //lab & city
			}
			ii++;
		}
		i++;
	}
	//
	if area_zone=0 {
		event[0][0]=100;
		event[1][0]=101;
		event[2][0]=102;
		location_type[0]=13;
	}
	//
	var i=0;
	repeat (3) {
		var ii=0;
		repeat (roadmap_area_max) {
			if event[i][ii]=0 { event_name[i][ii]="Battle"; }
			else if event[i][ii]=1 { event_name[i][ii]="Card Pack"; }
			else if event[i][ii]=100 { event_name[i][ii]="Bulbasaur\nDeck"; }
			else if event[i][ii]=101 { event_name[i][ii]="Charmander\nDeck"; }
			else if event[i][ii]=102 { event_name[i][ii]="Squirtle\nDeck"; }
			ii++;
		}
		i++;
	}
	//
	roadmap_generated=true;
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
		//sc_data_save();
	}
	event_transition=-1;
}
else if event_transition=-1 and fade_black<=0 {
	if keyboard_check_pressed(vk_space) and !instance_exists(ob_control) and screen_transition=-1 {
		event_transition=0;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if event_transition=-1 and screen_transition=-1 and cursor_hide=false and
mouse_x>=screen_main_x+32-2 and mouse_y>=screen_main_y+126-2 and mouse_x<=screen_main_x+32+17 and mouse_y<=screen_main_y+126+17 {
	menu_options_hover=true;
	mouse_cursor=1;
	if mouse_check_button_pressed(mb_left) {
		screen_transition=0;
	}
}
else {
	menu_options_hover=false;
}
//
if event_transition=-1 and screen_transition=-1  and cursor_hide=false and
mouse_x>=screen_main_x+cam_w-48-2 and mouse_y>=screen_main_y+126-2 and mouse_x<=screen_main_x+cam_w-48+17 and mouse_y<=screen_main_y+126+17 {
	menu_deck_hover=true;
	mouse_cursor=1;
	if mouse_check_button_pressed(mb_left) {
		screen_transition=1;
	}
}
else {
	menu_deck_hover=false;
}
//
if event_transition=-1 and screen_transition=-1  and cursor_hide=false and
mouse_x>=screen_options_x+cam_w-48-2 and mouse_y>=screen_main_y+136-2 and mouse_x<=screen_options_x+cam_w-48+17 and mouse_y<=screen_main_y+136+17 {
	menu_back_options_hover=true;
	mouse_cursor=1;
	if mouse_check_button_pressed(mb_left) {
		screen_transition=2;
	}
}
else {
	menu_back_options_hover=false;
}
//
if event_transition=-1 and screen_transition=-1 and cursor_hide=false and
mouse_x>=screen_deck_x+32-2 and mouse_y>=screen_main_y+136-2 and mouse_x<=screen_deck_x+32+17 and mouse_y<=screen_main_y+136+17 {
	menu_back_deck_hover=true;
	mouse_cursor=1;
	if mouse_check_button_pressed(mb_left) {
		screen_transition=2;
	}
}
else {
	menu_back_deck_hover=false;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if screen_transition=0 {
	if camera_get_view_x(view_camera[0])>screen_options_x {
		camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])-16,y);
	}
	else { screen_transition=-1; }
}
//
else if screen_transition=1 {
	if camera_get_view_x(view_camera[0])<screen_deck_x {
		camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+16,y);
	}
	else { screen_transition=-1; }
}
//
else if screen_transition=2 {
	if camera_get_view_x(view_camera[0])<screen_main_x {
		camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+16,y);
	}
	else if camera_get_view_x(view_camera[0])>screen_main_x {
		camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])-16,y);
	}
	else { screen_transition=-1; }
}