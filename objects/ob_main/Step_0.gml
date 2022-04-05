if mouse_check_button(mb_middle) or instance_exists(ob_splash) { cursor_hide=true; }
else { cursor_hide=false; }
//
/*if !instance_exists(ob_splash) and audio_is_playing(ms_azalea_intro) {
	var music_pos=audio_sound_get_track_position(ob_main.music_player), music_length=audio_sound_length(ob_main.music_player);
	if music_pos<=music_length*0.005 {
		music_player=sc_playsound(ms_azalea,100,true,true);
	}
}*/
//————————————————————————————————————————————————————————————————————————————————————————————————————
if keyboard_check_pressed(vk_f5) { game_restart(); } //< delete later, testing
if keyboard_check_pressed(vk_f4) { //< delete later, testing
	if file_exists(config_file) { file_delete(config_file); }
	if file_exists(data_file) { file_delete(data_file); }
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if effect_money_error>0 { effect_money_error-=0.1; }
//
if music_beat_margin>0 { music_beat_margin--; }
if !instance_exists(ob_splash) and sc_music_sync()=true {
	moving_hud--;
	if moving_hud<=-1 { moving_hud=1; }
}
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
		var_event_num[i]=choose(2,3,3);
		i++;
	}
	//
	var i=0;
	repeat (roadmap_area_max) {
		do {
			location_type[i]=irandom(21);
		} until (location_type[i]!=13 and location_type[i]!=15); //lab & city
		//
		do {
			var ii=0, free_event=false;
			repeat (3) {
				if var_event_num[i]=2 {
					if ii<2 { event_kind[ii][i]=irandom(999); }
					else { event_kind[ii][i]=-1; }
				}
				else if var_event_num[i]=3 {
					event_kind[ii][i]=irandom(999);
				}
				//
				if event_kind[ii][i]=-1 { event_kind[ii][i]=-1; }
				else if event_kind[ii][i]<400 and i=0 { event_kind[ii][i]=ref_event_battle; free_event=true; } //40% (same as battle+freecard, ensures at least 1 battle in zone)
				else if event_kind[ii][i]<300 { event_kind[ii][i]=ref_event_battle; free_event=true; } //30%
				else if event_kind[ii][i]<400 { event_kind[ii][i]=ref_event_freecard; free_event=true; } //10%
				else if event_kind[ii][i]<550 { event_kind[ii][i]=ref_event_cardpack; } //15%
				else if event_kind[ii][i]<650 { event_kind[ii][i]=ref_event_berry; } //10%
				else if event_kind[ii][i]<800 { event_kind[ii][i]=ref_event_levelup; } //15%
				else if event_kind[ii][i]<850 { event_kind[ii][i]=ref_event_evolution; } //5%
				else if event_kind[ii][i]<980 { event_kind[ii][i]=ref_event_glyph; } //13%
				else if event_kind[ii][i]<1000 { event_kind[ii][i]=ref_event_tribute; } //2%
				//
				if event_kind[ii][i]=ref_event_glyph { event_glyph_add[ii][i]=sc_glyph_random(); }
				else { event_glyph_add[ii][i]=-1; }
				//
				ii++;
			}
			//
			var repeating_event=true;
			if (event_kind[0][i]!=event_kind[1][i] or event_glyph_add[0][i]!=event_glyph_add[1][i]) and
			(event_kind[0][i]!=event_kind[2][i] or event_glyph_add[0][i]!=event_glyph_add[2][i]) and
			(event_kind[1][i]!=event_kind[2][i] or event_glyph_add[1][i]!=event_glyph_add[2][i]) {
				repeating_event=false;
			}
		} until (free_event=true and repeating_event=false);
		//
		i++;
	}
	//
	if area_zone=0 {
		event_kind[0][0]=ref_event_grass;
		event_kind[1][0]=ref_event_fire;
		event_kind[2][0]=ref_event_water;
		location_type[0]=13; //lab
		event_kind[0][1]=ref_event_cardpack;
		event_kind[1][1]=ref_event_battle;
		event_kind[2][1]=ref_event_levelup;
		location_type[1]=00; //forest
	}
	//
	location_type[roadmap_area_max-1]=15; //city
	//
	roadmap_generated=true;
	roadmap_get_details=true;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if roadmap_get_details=true {
	var i=0;
	repeat (roadmap_area_max) {
		switch (location_type[i]) {
			case 00: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //forest
			case 01: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //cave (forest)
			case 02: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //cave (rocky)
			case 03: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //cave (dark)
			case 04: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //cave (mountain)
			case 05: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //factory
			case 06: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //mansion ruins
			case 07: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //cave (forest road)
			case 08: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //cave (volcano)
			case 09: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //forest (poison)
			case 10: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //cave (ice)
			case 11: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //warehouse
			case 12: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //tower
			case 14: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //grassland
			case 16: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //cave (island 1)
			case 17: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //cave (foggy)
			case 18: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //forest (same a 00)
			case 19: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //cave (island 2)
			case 20: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //cave (ruins)
			case 21: trainer_kind[0][i]=00; trainer_kind[1][i]=00; trainer_kind[2][i]=00; break; //ancient ruins
			default: trainer_kind[0][i]=-1; trainer_kind[1][i]=-1; trainer_kind[2][i]=-1;
		}
		//
		var ii=0;
		repeat (3) {
			event_description[ii][i]="";
			//
			if event_kind[ii][i]=ref_event_battle { event_name[ii][i]="Trainer\nBattle"; }
			else if event_kind[ii][i]=ref_event_freecard { event_name[ii][i]="Free Card"; }
			else if event_kind[ii][i]=ref_event_cardpack { event_name[ii][i]="Card Pack\n$" + string(event_cost[ref_event_cardpack]); }
			else if event_kind[ii][i]=ref_event_berry { event_name[ii][i]="Berry Pack\n$" + string(event_cost[ref_event_berry]); }
			else if event_kind[ii][i]=ref_event_levelup { event_name[ii][i]="Level Up\n$" + string(event_cost[ref_event_levelup]); }
			else if event_kind[ii][i]=ref_event_evolution { event_name[ii][i]="Evolution\n$" + string(event_cost[ref_event_evolution]); }
			else if event_kind[ii][i]=ref_event_tribute { event_name[ii][i]="Tribute"; }
			else if event_kind[ii][i]=ref_event_grass { event_name[ii][i]="Grass\nSt. Deck"; }
			else if event_kind[ii][i]=ref_event_fire { event_name[ii][i]="Fire\nSt. Deck"; }
			else if event_kind[ii][i]=ref_event_water { event_name[ii][i]="Water\nSt. Deck"; }
			else if event_kind[ii][i]=ref_event_gymbattle { event_name[ii][i]="Gym\nBattle"; }
			else if event_kind[ii][i]=ref_event_glyph {
				event_name[ii][i]="Glyph\n$" + string(event_cost[ref_event_glyph]);
				event_description[ii][i]=sc_glyph_text(event_glyph_add[ii][i]);
			}
			ii++;
		}
		i++;
	}
roadmap_get_details=false;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
var mouse_in_event=-1;
//
if !instance_exists(ob_control) and !instance_exists(ob_event) {
	if event_kind[2][roadmap_area]=-1 {
		for (var i=0; i<=1; i++;) {
			event_button_x[i]=road_win_x+55-9+(104*i);
			event_button_y[i]=road_win_y+35-9;
			if mouse_x>event_button_x[i] and mouse_y>event_button_y[i] and mouse_x<=event_button_x[i]+42 and mouse_y<=event_button_y[i]+42 and cursor_hide=false {
				mouse_in_event=i;
			}
		}
	}
	else {
		for (var i=0; i<=2; i++;) {
			event_button_x[i]=road_win_x+36-9+(71*i);
			event_button_y[i]=road_win_y+35-9;
			if mouse_x>event_button_x[i] and mouse_y>event_button_y[i] and mouse_x<=event_button_x[i]+42 and mouse_y<=event_button_y[i]+42 and cursor_hide=false {
				mouse_in_event=i;
			}
		}
	}
	//
	if mouse_in_event>-1 {
		mouse_cursor=1;
		//
		tooltip_text=event_description[mouse_in_event][roadmap_area];
		tooltip_lines=2;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if event_transition>-1 and fade_black<1 {
	if money_add>0 and !instance_exists(ob_control) {
		money+=money_add;
		money_add=0;
	}
	if event_transition=ref_event_victory or event_transition=ref_event_defeat { fade_black+=0.0025; }
	else if event_transition=ref_mainmenu or event_transition=ref_event_battle { fade_black+=0.012; }
	else { fade_black+=0.04; }
}
else if event_transition=-1 and fade_black>0 {
	fade_black-=0.04;
}
else if event_transition>-1 and fade_black>=1 {
	if event_transition=ref_mainmenu {
		with (ob_splash) { instance_destroy(); }
		with (ob_card_splash) { instance_destroy(); }
		with (ob_background_tile) { instance_destroy(); }
	}
	else if event_transition=ref_event_battle {
		money_add=irandom_range(150*0.8,150*1.2);
		instance_create_layer(x,y,"instances",ob_control);
		music_player=sc_playsound(ms_battle,100,true,true);
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
		music_player=sc_playsound(ms_main,100,true,true);
		roadmap_area++;
		//sc_data_save();
	}
	else {
		if !instance_exists(ob_event) {
			instance_create_layer(x,y,"instances",ob_event);
		}
		else {
			if option_state[opt_autodeck]=true and (event_transition=ref_event_freecard or event_transition=ref_event_cardpack or event_transition=ref_event_berry or
			event_transition=ref_event_grass or event_transition=ref_event_fire or event_transition=ref_event_water) {
				auto_deck_transition=true;
			}
			//
			with (ob_event) { instance_destroy(); }
			with (ob_card) { instance_destroy(); }
			with (ob_card_space) { instance_destroy(); }
			with (ob_button_31x24) { instance_destroy(); }
			roadmap_area++;
			//sc_data_save();
		}
	}
	event_transition=-1;
}
else if event_transition=-1 and fade_black<=0 {
	if mouse_check_button_pressed(mb_left) and mouse_in_event>-1 and screen_transition=-1 {
		if money>=event_cost[event_kind[mouse_in_event][roadmap_area]] {
			event_transition=event_kind[mouse_in_event][roadmap_area];
			money_subtract=event_cost[event_kind[mouse_in_event][roadmap_area]];
			//
			if event_transition=ref_event_glyph { current_glyph_add=event_glyph_add[mouse_in_event][roadmap_area]; }
			if event_transition=ref_event_battle { music_player=sc_playsound(ms_battle_intro,100,false,true); }
		}
		else if money<event_cost[event_kind[mouse_in_event][roadmap_area]] {
			effect_money_error=1;
		}
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
	if (event_transition=-1 and screen_transition=-1  and cursor_hide=false and
	mouse_x>=screen_main_x+cam_w-48-2 and mouse_y>=screen_main_y+126-2 and mouse_x<=screen_main_x+cam_w-48+17 and mouse_y<=screen_main_y+126+17) or
	auto_deck_transition=true {
		menu_deck_hover=true;
		mouse_cursor=1;
		if mouse_check_button_pressed(mb_left) or auto_deck_transition=true {
			instance_create_layer(screen_deck_x,screen_main_y,"instances",ob_deckbuild);
			screen_transition=1;
			auto_deck_transition=false;
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
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_set_font(fn_matchup);
//
var i=0;
repeat (options_total) {
	if mouse_x>=option_x[i] and mouse_y>=option_y[i]+2 and mouse_x<=option_x[i]+string_width(option_name[i] + option_state_text[i]) and mouse_y<=option_y[i]+10 and cursor_hide=false {
		mouse_cursor=1;
		option_focus[i]=true;
		if mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_right) {
			if i=opt_fullscreen {
				if option_state[i]=false { option_state[i]=true; }
				else { option_state[i]=false; }
				window_set_fullscreen(option_state[i]);
			}
			else if i=opt_vsync {
				if option_state[i]=false { option_state[i]=true; }
				else { option_state[i]=false; }
				display_reset(0,option_state[i]);
			}
			else if i=opt_filter {
				if option_state[i]=false { option_state[i]=true; }
				else { option_state[i]=false; }
				gpu_set_tex_filter(option_state[i]);
			}
			else if i=opt_scaling {
				if mouse_check_button_pressed(mb_left) and 512*(option_state[i]+1)<display_get_width() and 288*(option_state[i]+1)<display_get_height() {
					option_state[i]++;
				}
				else if mouse_check_button_pressed(mb_right) and option_state[i]>1 {
					option_state[i]--;
				}
				window_set_size(512*(option_state[i]),288*(option_state[i]));
			}
			else if i=opt_autodeck or i=opt_sound {
				if option_state[i]=false { option_state[i]=true; }
				else { option_state[i]=false; }
			}
			else if i=opt_music {
				if option_state[i]=false {
					option_state[i]=true;
					music_player=sc_playsound(ms_main,100,true,true);
				}
				else {
					option_state[i]=false;
					//still plays at volume 0 to keep the beat animations
					music_player=sc_playsound(ms_main,100,true,true);
				}
			}
			else if i=opt_bg_type {
				if mouse_check_button_pressed(mb_left) {
					option_state[i]++;
					if option_state[i]>2 { option_state[i]=0; }
				}
				else if mouse_check_button_pressed(mb_right) {
					option_state[i]--;
					if option_state[i]<0 { option_state[i]=2; }
				}
			}
		}
		else if mouse_check_button(mb_left) or mouse_check_button(mb_right) {
			if i=opt_edge {
				if mouse_check_button(mb_left) and option_state[i]<100 {
					option_state[i]++;
				}
				else if mouse_check_button(mb_right) and option_state[i]>0 {
					option_state[i]--;
				}
			}
		}
	}
	else { option_focus[i]=false; }
	//
	if i=opt_fullscreen or i=opt_vsync or i=opt_filter or i=opt_music or i=opt_sound {
		if option_state[i]=true { option_state_text[i]="ON"; }
		else { option_state_text[i]="OFF"; }
	}
	else if i=opt_scaling {
		option_state_text[i]=string(option_state[i]);
	}
	else if i=opt_autodeck {
		if option_state[i]=true { option_state_text[i]="GO TO DECK"; }
		else { option_state_text[i]="DO NOTHING"; }
	}
	else if i=opt_edge {
		option_state_text[i]=string(option_state[i]) + "%";
	}
	else if i=opt_bg_type {
		if option_state[i]=0 { option_state_text[i]="MOVING TILES"; }
		else if option_state[i]=1 { option_state_text[i]="IDLE TILES"; }
		else if option_state[i]=2 { option_state_text[i]="LOCATION"; }
	}
	//
	i++;
}
//
var i=0;
repeat (colorsetup_total) {
	if mouse_x>=colorsetup_r_x[i] and mouse_y>=colorsetup_y[i]+2 and
	mouse_x<=colorsetup_r_x[i]+string_width("R " + string(colorsetup_r[i])) and mouse_y<=colorsetup_y[i]+10 and option_state[opt_bg_type]!=2 and cursor_hide=false {
		mouse_cursor=1;
		colorsetup_focus_r[i]=true;
		if mouse_check_button(mb_left) and colorsetup_r[i]<255 { colorsetup_r[i]++; }
		else if mouse_check_button(mb_right) and colorsetup_r[i]>0 { colorsetup_r[i]--; }
	}
	else { colorsetup_focus_r[i]=false; }
	//
	if mouse_x>=colorsetup_g_x[i] and mouse_y>=colorsetup_y[i]+2 and
	mouse_x<=colorsetup_g_x[i]+string_width("G " + string(colorsetup_g[i])) and mouse_y<=colorsetup_y[i]+10 and option_state[opt_bg_type]!=2 and cursor_hide=false {
		mouse_cursor=1;
		colorsetup_focus_g[i]=true;
		if mouse_check_button(mb_left) and colorsetup_g[i]<255 { colorsetup_g[i]++; }
		else if mouse_check_button(mb_right) and colorsetup_g[i]>0 { colorsetup_g[i]--; }
	}
	else { colorsetup_focus_g[i]=false; }
	//
	if mouse_x>=colorsetup_b_x[i] and mouse_y>=colorsetup_y[i]+2 and
	mouse_x<=colorsetup_b_x[i]+string_width("B " + string(colorsetup_b[i])) and mouse_y<=colorsetup_y[i]+10 and option_state[opt_bg_type]!=2 and cursor_hide=false {
		mouse_cursor=1;
		colorsetup_focus_b[i]=true;
		if mouse_check_button(mb_left) and colorsetup_b[i]<255 { colorsetup_b[i]++; }
		else if mouse_check_button(mb_right) and colorsetup_b[i]>0 { colorsetup_b[i]--; }
	}
	else { colorsetup_focus_b[i]=false; }
	//
	i++;
}
//
global.color_background_a=make_colour_rgb(colorsetup_r[opt_bg_a]/bg_rgb_divisor,colorsetup_g[opt_bg_a]/bg_rgb_divisor,colorsetup_b[opt_bg_a]/bg_rgb_divisor);
global.color_background_b=make_colour_rgb(colorsetup_r[opt_bg_b]/bg_rgb_divisor,colorsetup_g[opt_bg_b]/bg_rgb_divisor,colorsetup_b[opt_bg_b]/bg_rgb_divisor);
global.color_background_tile=make_colour_rgb(colorsetup_r[opt_bg_tile]/bg_rgb_divisor,colorsetup_g[opt_bg_tile]/bg_rgb_divisor,colorsetup_b[opt_bg_tile]/bg_rgb_divisor);