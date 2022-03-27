if mouse_check_button(mb_right) { cursor_hide=true; }
else { cursor_hide=false; }
//
if keyboard_check_pressed(vk_f5) { game_restart(); } //< delete later, testing
if keyboard_check_pressed(vk_f4) { //< delete later, testing
	if file_exists(config_file) { file_delete(config_file); }
	if file_exists(data_file) { file_delete(data_file); }
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if effect_money_error>0 { effect_money_error-=0.1; }
//
if !instance_exists(ob_control) and money_add>0 {
	money++;
	money_add--;
}
if money_subtract>0 {
	money--;
	money_subtract--;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if roadmap_generated=false {
	var i=0, var_event_num;
	repeat (roadmap_area_max) {
		var_event_num[i]=choose(2,3,3,3,3);
		i++;
	}
	//
	var i=0;
	repeat (3) {
		var ii=0;
		repeat (roadmap_area_max) {
			if var_event_num[ii]=2 {
				if i<2 { event_kind[i][ii]=irandom_range(0,6); }
				else { event_kind[i][ii]=-1; }
			}
			else if var_event_num[ii]=3 {
				event_kind[i][ii]=irandom_range(0,6);
			}
			//
			if i=0 {
				do {
					location_type[ii]=irandom(21);
				} until (location_type[ii]!=13 and location_type[ii]!=15); //lab & city
			}
			//
			ii++;
		}
		i++;
	}
	//
	if area_zone=0 {
		event_kind[0][0]=ref_event_grass;
		event_kind[1][0]=ref_event_fire;
		event_kind[2][0]=ref_event_water;
		location_type[0]=13;
	}
	//
	var i=0;
	repeat (3) {
		var ii=0;
		repeat (roadmap_area_max) {
			if event_kind[i][ii]=ref_event_battle { event_name[i][ii]="Trainer\nBattle"; }
			else if event_kind[i][ii]=ref_event_freecard { event_name[i][ii]="Pick a Card\n(Free)"; }
			else if event_kind[i][ii]=ref_event_cardpack { event_name[i][ii]="Card Pack\n$" + string(event_cost[ref_event_cardpack]); }
			else if event_kind[i][ii]=ref_event_levelup { event_name[i][ii]="Level Up\n$" + string(event_cost[ref_event_levelup]); }
			else if event_kind[i][ii]=ref_event_evolution { event_name[i][ii]="Evolution\n$" + string(event_cost[ref_event_evolution]); }
			else if event_kind[i][ii]=ref_event_glyph { event_name[i][ii]="Glyph\n$" + string(event_cost[ref_event_glyph]); }
			else if event_kind[i][ii]=ref_event_sacrifice { event_name[i][ii]="Sacrifice"; }
			else if event_kind[i][ii]=ref_event_grass { event_name[i][ii]="Grass\nSt. Deck"; }
			else if event_kind[i][ii]=ref_event_fire { event_name[i][ii]="Fire\nSt. Deck"; }
			else if event_kind[i][ii]=ref_event_water { event_name[i][ii]="Water\nSt. Deck"; }
			else if event_kind[i][ii]=ref_event_gymbattle { event_name[i][ii]="Gym\nBattle"; }
			ii++;
		}
		i++;
	}
	//
	roadmap_generated=true;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
var mouse_in_event=-1;
//
if !instance_exists(ob_control) and !instance_exists(ob_event) {
	if event_kind[2][roadmap_area]=-1 {
		for (var i=0; i<=1; i++;) {
			event_button_x[i]=road_win_x+55-9+(104*i);
			event_button_y[i]=road_win_y+35-9;
			if mouse_x>event_button_x[i] and mouse_y>event_button_y[i] and mouse_x<=event_button_x[i]+42 and mouse_y<=event_button_y[i]+42 {
				mouse_in_event=i;
			}
		}
	}
	else {
		for (var i=0; i<=2; i++;) {
			event_button_x[i]=road_win_x+36-9+(71*i);
			event_button_y[i]=road_win_y+35-9;
			if mouse_x>event_button_x[i] and mouse_y>event_button_y[i] and mouse_x<=event_button_x[i]+42 and mouse_y<=event_button_y[i]+42 {
				mouse_in_event=i;
			}
		}
	}
	//
	if mouse_in_event>-1 and cursor_hide=false { mouse_cursor=1; }
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if event_transition>-1 and fade_black<1 {
	if money_add>0 {
		money+=money_add;
		money_add=0;
	}
	if event_transition=ref_event_victory or event_transition=ref_event_defeat { fade_black+=0.005; }
	else { fade_black+=0.02; }
}
else if event_transition=-1 and fade_black>0 {
	fade_black-=0.02;
}
else if event_transition>-1 and fade_black>=1 {
	if event_transition=ref_event_battle {
		money_add=irandom_range(75*0.9,75*1.1);
		instance_create_layer(x,y,"instances",ob_control);
	}
	else if event_transition=ref_event_victory or event_transition=ref_event_defeat {
		//destroy everything except ob_main and ob_background
		with (ob_control) { instance_destroy(); }
		with (ob_card) { instance_destroy(); }
		with (ob_card_space) { instance_destroy(); }
		with (ob_button_16x16) { instance_destroy(); }
		with (ob_button_31x24) { instance_destroy(); }
		with (ob_background_tile) { instance_destroy(); }
		with (ob_damage_num) { instance_destroy(); }
		//
		if event_transition=ref_event_defeat { money_add=0; }
		roadmap_area++;
		//sc_data_save();
	}
	else {
		if !instance_exists(ob_event) {
			instance_create_layer(x,y,"instances",ob_event);
		}
		else {
			with (ob_event) { instance_destroy(); }
			with (ob_card) { instance_destroy(); }
			roadmap_area++;
			//sc_data_save();
		}
	}
	event_transition=-1;
}
else if event_transition=-1 and fade_black<=0 {
	if mouse_check_button_pressed(mb_left) and mouse_in_event>-1 and money>=event_cost[event_kind[mouse_in_event][roadmap_area]] and screen_transition=-1 {
		event_transition=event_kind[mouse_in_event][roadmap_area];
		money_subtract=event_cost[event_kind[mouse_in_event][roadmap_area]];
	}
	else if mouse_check_button_pressed(mb_left) and mouse_in_event>-1 and money<event_cost[event_kind[mouse_in_event][roadmap_area]] and screen_transition=-1 {
		effect_money_error=1;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if keyboard_check_pressed(vk_up) and roadmap_area<roadmap_area_max-1 { roadmap_area++; } //< delete later, testing
if keyboard_check_pressed(vk_right) { roadmap_area=roadmap_area_max; } //< delete later, testing
if keyboard_check_pressed(vk_numpad0) { money_add+=1000; } //< delete later, testing
//————————————————————————————————————————————————————————————————————————————————————————————————————
if roadmap_area=roadmap_area_max {
	area_zone++;
	roadmap_area=0;
	roadmap_generated=false;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if !instance_exists(ob_control) and !instance_exists(ob_event) {
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
			instance_create_layer(screen_deck_x,screen_main_y,"instances",ob_deckbuild);
			screen_transition=1;
		}
	}
	else {
		menu_deck_hover=false;
	}
	//
	if event_transition=-1 and screen_transition=-1  and cursor_hide=false and
	mouse_x>=screen_options_x+cam_w-32-2 and mouse_y>=screen_main_y+136-2 and mouse_x<=screen_options_x+cam_w-32+17 and mouse_y<=screen_main_y+136+17 {
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
	mouse_x>=screen_deck_x+16-2 and mouse_y>=screen_main_y+136-2 and mouse_x<=screen_deck_x+16+17 and mouse_y<=screen_main_y+136+17 {
		menu_back_deck_hover=true;
		mouse_cursor=1;
		if mouse_check_button_pressed(mb_left) {
			with (ob_deckbuild) { instance_destroy(); }
			with (ob_card) { instance_destroy(); }
			with (ob_button_15x16) { instance_destroy(); }
			screen_transition=2;
			//sc_data_save();
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
		else {
			screen_transition=-1;
		}
	}
}