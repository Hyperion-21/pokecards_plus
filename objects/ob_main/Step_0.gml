if type_chart_toggle=true {
	type_chart=true;
	type_chart_toggle=false;
}
else if type_chart=true and (mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_right)) {
	type_chart=false;
}
//
if mouse_check_button(mb_middle) or instance_exists(ob_splash) or type_chart=true or textbox_string[textbox_current]!="" { cursor_hide=true; }
else { cursor_hide=false; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
if effect_money_error>0 { effect_money_error-=0.1; }
//
if music_beat_margin>0 { music_beat_margin--; }
if !instance_exists(ob_splash) and sc_music_sync()=true {
	moving_hud--;
	if moving_hud<=-1 { moving_hud=1; }
}
//
if !instance_exists(ob_control) {
	if money_show<money { var money_speed=ceil((money-money_show)/100); }
	if money_show>money { var money_speed=ceil((money_show-money)/100); }
	//
	if money_show<money { money_show+=money_speed; }
	else if money_show>money { money_show-=money_speed; }
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if area_zone=area_zone_max-1 and zone_first_lap=true { roadmap_current_max=roadmap_road_max+roadmap_league_max; }
else if area_zone=area_zone_max-1 and zone_first_lap=false { roadmap_current_max=roadmap_outskirts_max+roadmap_league_max; }
else if area_zone=0 and zone_first_lap=true { roadmap_current_max=roadmap_road_max+roadmap_lab_max; }
else if area_zone>0 and zone_first_lap=true { roadmap_current_max=roadmap_road_max; }
else if zone_first_lap=false { roadmap_current_max=roadmap_outskirts_max; }
//
card_level_player_limit=area_zone+2; //2 3 4 5 6 7 8 9 (10)
if card_level_player_limit>10 { card_level_player_limit=10; }
card_level_spawn_limit=floor((area_zone+1)/1.5)+1; //1 2 3 3 4 5 5 6 (7)
//
card_level_enemy_min=area_zone; //1 1 2 3 4 5 6 7 (8)
if card_level_enemy_min<=0 { card_level_enemy_min=1; }
if area_zone>0 or zone_first_lap=false or roadmap_area=roadmap_current_max-1 { card_level_enemy_limit=card_level_player_limit; }
else { card_level_enemy_limit=1; } //first zone, first lap
//————————————————————————————————————————————————————————————————————————————————————————————————————
if audio_is_playing(ms_main) and area_zone=area_zone_max-1 and roadmap_area>=roadmap_current_max-roadmap_league_max {
	music_player=sc_playsound(ms_league,100,true,true);
}
else if audio_is_playing(ms_league) and !(area_zone=area_zone_max-1 and roadmap_area>=roadmap_current_max-roadmap_league_max) {
	music_player=sc_playsound(ms_main,100,true,true);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
maindeck_size_max=10+area_zone*5; //10 15 20 25 30 35 40 45 (50)
if zone_first_lap=false { enemy_maindeck_size=maindeck_size_max; }
else {
	enemy_maindeck_size=round((maindeck_size_max-5)+(5*roadmap_area/(roadmap_current_max-1)));
	if enemy_maindeck_size<5 { enemy_maindeck_size=5; } //not possible anymore, but just in case
}
if maindeck_size_max>50 { //not possible anymore, but just in case
	maindeck_size_max=50;
	enemy_maindeck_size=50;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
money_payout=money_payout_base+money_payout_area_bonus*area_zone;
//
if area_zone=area_zone_max-1 { battle_hp=100; } //victory road & league: 100
else {
	if playing_tutorial=true { battle_hp=5; }
	else if roadmap_area<roadmap_current_max-1 { battle_hp=10+area_zone*10; } //10 20 30 40 50 60 70 80
	else { battle_hp=20+area_zone*10; } //gyms: 20 30 40 50 60 70 80 90
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if textbox_string[textbox_current]!="" {
	if textbox_show!=textbox_string[textbox_current] {
		if textbox_timer=textbox_timer_max {
			//sc_playsound(sn_text,50,false,false,false);
			textbox_char_pos++;
			textbox_show=textbox_show+string_char_at(textbox_string[textbox_current],textbox_char_pos);
			//
			textbox_timer=0;
		}
		else { textbox_timer++; }
		//
		if textbox_char_pos>10 and (mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_right)) {
			//sc_playsound(sn_text,50,false,false,false);
			textbox_show=textbox_string[textbox_current];
		}
	}
	else {
		if mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_right) {
			textbox_show="";
			textbox_char_pos=0;
			textbox_timer=0;
			textbox_current++;
			//
			if textbox_string[textbox_current]="" {
				for (var i=0; i<=textbox_total; i++;) {
					textbox_string[i]="";
				}
				textbox_current=0;
			}
			//
			if event_transition_standby!=-1 {
				event_transition=event_transition_standby;
				event_transition_standby=-1;
				//
				if event_transition=ref_event_tutorial { playing_tutorial=true; }
				if event_transition=ref_event_gymbattle or event_transition=ref_event_tutorial { music_player=sc_playsound(ms_battle_intro,100,false,true); }
			}
		}
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if roadmap_generated=false {
	var i=0, var_event_num;
	repeat (roadmap_current_max) {
		var_event_num[i]=choose(2,3,3);
		i++;
	}
	//
	var i=0;
	repeat (roadmap_current_max) {
		do {
			location_type[i]=irandom(21);
		} until (location_type[i]!=13 and location_type[i]!=15); //lab & city
		//
		trainer_sprite[i]=irandom(playericon_max);
		trainer_skin[i]=floor(irandom(8)/8);
		trainer_hair_color[i]=make_colour_rgb(irandom_range(140,240),irandom_range(140,240),irandom_range(140,240));
		//
		var ace_trainer_chance=irandom(9);
		if ace_trainer_chance=0 { trainer_kind[i]=100; } //ACE TRAINER (10%)
		else {
			switch (location_type[i]) {
				//forest: CAMPER/PICNICKER, FISHER, BUG CATCHER, BIRD KEEPER, YOUNGSTER, LAD/LASS, AROMA MAN/AROMA LADY, RANGER
					case 00: trainer_kind[i]=choose(00,01,03,05,08,09,24,25); break;
				//cave (forest): CAMPER/PICNICKER, HIKER, BUG CATCHER, BIRD KEEPER, BLACK BELT, RANGER
					case 01: trainer_kind[i]=choose(00,02,03,05,15,25); break;
				//cave (rocky): CAMPER/PICNICKER, FISHER, HIKER
					case 02: trainer_kind[i]=choose(00,01,02); break;
				//cave (dark forest): BUG CATCHER, ROUGHNECK, PSYCHIC, CHANNELER
					case 03: trainer_kind[i]=choose(03,11,14,20); break;
				//cave (mountain): CAMPER/PICNICKER, HIKER
					case 04: trainer_kind[i]=choose(00,02); break;
				//factory: SUPER NERD, PUNK GUY/PUNK GIRL, GUITARIST, SCIENTIST, BURGLAR, ENGINEER
					case 05: trainer_kind[i]=choose(07,12,13,16,18,19); break;
				//mansion ruins: YOUNGSTER, LAD/LASS, ROUGHNECK, PSYCHIC, RUIN MANIAC, BURGLAR, CHANNELER
					case 06: trainer_kind[i]=choose(08,09,11,14,17,18,20); break;
				//cave (forest road): CAMPER/PICNICKER, FISHER, HIKER, BUG CATCHER, BIRD KEEPER, YOUNGSTER, LAD/LASS, RANGER
					case 07: trainer_kind[i]=choose(00,01,02,03,05,08,09,25); break;
				//cave (volcano): HIKER, BIKER, ROUGHNECK, DRAGON TAMER, KINDLER
					case 08: trainer_kind[i]=choose(02,10,11,21,23); break;
				//forest (poison): CAMPER/PICNICKER, FISHER, BUG CATCHER, BIRD KEEPER, YOUNGSTER, LAD/LASS, PSYCHIC, AROMA MAN/AROMA LADY, RANGER
					case 09: trainer_kind[i]=choose(00,01,03,05,08,09,14,24,25); break;
				//cave (ice): CAMPER/PICNICKER, FISHER, HIKER, SKIER
					case 10: trainer_kind[i]=choose(00,01,02,06); break;
				//warehouse: SUPER NERD, ROUGHNECK, PUNK GUY/PUNK GIRL, SCIENTIST, BURGLAR, ENGINEER
					case 11: trainer_kind[i]=choose(07,11,12,16,18,19); break;
				//tower: BIKER, ROUGHNECK, PSYCHIC, BLACK BELT, RUIN MANIAC
					case 12: trainer_kind[i]=choose(10,11,14,15,17); break;
				//grassland: CAMPER/PICNICKER, FISHER, BUG CATCHER, BIRD KEEPER, YOUNGSTER, LAD/LASS, KINDLER, RANGER
					case 14: trainer_kind[i]=choose(00,01,03,05,08,09,23,25); break;
				//cave (island 1): FISHER, HIKER, SWIMMER
					case 16: trainer_kind[i]=choose(01,02,04); break;
				//cave (foggy): FISHER, HIKER, SWIMMER, BLACK BELT
					case 17: trainer_kind[i]=choose(01,02,04,15); break;
				//forest (same a 00): CAMPER/PICNICKER, FISHER, BUG CATCHER, BIRD KEEPER, YOUNGSTER, LAD/LASS, SPRITE BOY/FAIRY GIRL, AROMA MAN/AROMA LADY, RANGER
					case 18: trainer_kind[i]=choose(00,01,03,05,08,09,22,24,25); break;
				//cave (island 2): FISHER, HIKER, SWIMMER
					case 19: trainer_kind[i]=choose(01,02,04); break;
				//cave (ruins): CAMPER/PICNICKER, HIKER, BIKER, BLACK BELT
					case 20: trainer_kind[i]=choose(00,02,10,15); break;
				//ancient ruins: HIKER, RUIN MANIAC
					case 21: trainer_kind[i]=choose(02,17); break;
			}
		}
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
				else if event_kind[ii][i]<400 and i=0 { event_kind[ii][i]=ref_event_battle; free_event=true; } //40% (ensures at least 1 battle in zone)
				else if event_kind[ii][i]<300 { event_kind[ii][i]=ref_event_battle; free_event=true; } //30%
				else if event_kind[ii][i]<375 { event_kind[ii][i]=ref_event_payout; free_event=true; } //7.5%
				else if event_kind[ii][i]<400 { event_kind[ii][i]=ref_event_freecard; free_event=true; } //2.5%
				else if event_kind[ii][i]<550 { event_kind[ii][i]=ref_event_cardpack; } //15%
				else if event_kind[ii][i]<700 { event_kind[ii][i]=ref_event_berry; } //15%
				else if event_kind[ii][i]<850 { event_kind[ii][i]=ref_event_levelup; } //15%
				else if event_kind[ii][i]<900 { event_kind[ii][i]=ref_event_evolution; } //5%
				else if event_kind[ii][i]<980 { event_kind[ii][i]=ref_event_glyph; } //8%
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
	if area_zone=0 and zone_first_lap=true {
		event_kind[0][0]=ref_event_grass;
		event_kind[1][0]=ref_event_fire;
		event_kind[2][0]=ref_event_water;
		location_type[0]=13; //lab
		//
		event_kind[0][1]=ref_event_tutorial;
		trainer_sprite[1]=playericon_max+1;
		trainer_kind[1]=101; //TUTORIAL
		event_kind[1][1]=ref_event_payout;
		event_kind[2][1]=-1;
		location_type[1]=13; //lab
		//
		event_kind[0][2]=ref_event_levelup;
		event_kind[1][2]=ref_event_cardpack;
		event_kind[2][2]=ref_event_freecard;
		location_type[2]=13; //lab
		//
		event_kind[0][3]=ref_event_glyph;
		event_glyph_add[0][3]=ref_glyph_harvest;
		event_kind[1][3]=ref_event_battle;
		trainer_kind[3]=03; //BUG CATCHER
		event_kind[2][3]=ref_event_berry;
		location_type[3]=00; //forest
	}
	//
	if area_zone=area_zone_max-1 {
		event_kind[0][roadmap_current_max-5]=ref_event_gymbattle;
		trainer_kind[roadmap_current_max-5]=208; //ELITE
		location_type[roadmap_current_max-5]=15; //city
		//
		event_kind[0][roadmap_current_max-4]=ref_event_gymbattle;
		trainer_kind[roadmap_current_max-4]=209; //ELITE
		location_type[roadmap_current_max-4]=15; //city
		//
		event_kind[0][roadmap_current_max-3]=ref_event_gymbattle;
		trainer_kind[roadmap_current_max-3]=210; //ELITE
		location_type[roadmap_current_max-3]=15; //city
		//
		event_kind[0][roadmap_current_max-2]=ref_event_gymbattle;
		trainer_kind[roadmap_current_max-2]=211; //ELITE
		location_type[roadmap_current_max-2]=15; //city
		//
		event_kind[0][roadmap_current_max-1]=ref_event_gymbattle;
		trainer_kind[roadmap_current_max-1]=212; //ELITE
		location_type[roadmap_current_max-1]=15; //city
	}
	else {
		event_kind[0][roadmap_current_max-1]=ref_event_gymbattle;
		trainer_kind[roadmap_current_max-1]=200+area_zone; //GYM LEADER
		trainer_sprite[roadmap_current_max-1]=area_zone+playericon_max+2;
		event_kind[1][roadmap_current_max-1]=ref_event_loop;
		event_kind[2][roadmap_current_max-1]=-1;
		location_type[roadmap_current_max-1]=15; //city
	}
	//
	roadmap_generated=true;
	roadmap_get_details=true;
	sc_data_save();
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if roadmap_get_details=true {
	var i=0;
	repeat (roadmap_current_max) {
		var trainer_name;
		switch (trainer_kind[i]) {
			case 00:
				if (trainer_sprite[i] mod 2)=0 { trainer_name[i]="Camper"; }
				else if (trainer_sprite[i] mod 2)=1 { trainer_name[i]="Picnicker"; } break;
			case 01: trainer_name[i]="Fisher"; break;
			case 02: trainer_name[i]="Hiker"; break;
			case 03: trainer_name[i]="Bug Catcher"; break;
			case 04: trainer_name[i]="Swimmer"; break;
			case 05: trainer_name[i]="Bird Keeper"; break;
			case 06: trainer_name[i]="Skier"; break;
			case 07: trainer_name[i]="Super Nerd"; break;
			case 08: trainer_name[i]="Youngster"; break;
			case 09:
				if (trainer_sprite[i] mod 2)=0 { trainer_name[i]="Lad"; }
				else if (trainer_sprite[i] mod 2)=1 { trainer_name[i]="Lass"; } break;
			case 10: trainer_name[i]="Biker"; break;
			case 11: trainer_name[i]="Roughneck"; break;
			case 12:
				if (trainer_sprite[i] mod 2)=0 { trainer_name[i]="Punk Guy"; }
				else if (trainer_sprite[i] mod 2)=1 { trainer_name[i]="Punk Girl"; } break;
			case 13: trainer_name[i]="Guitarist"; break;
			case 14: trainer_name[i]="Psychic"; break;
			case 15: trainer_name[i]="Black Belt"; break;
			case 16: trainer_name[i]="Scientist"; break;
			case 17: trainer_name[i]="Ruin Maniac"; break;
			case 18: trainer_name[i]="Burglar"; break;
			case 19: trainer_name[i]="Engineer"; break;
			case 20: trainer_name[i]="Channeler"; break;
			case 21: trainer_name[i]="Dragon Tamer"; break;
			case 22:
				if (trainer_sprite[i] mod 2)=0 { trainer_name[i]="Sprite Boy"; }
				else if (trainer_sprite[i] mod 2)=1 { trainer_name[i]="Fairy Girl"; } break;
			case 23: trainer_name[i]="Kindler"; break;
			case 24:
				if (trainer_sprite[i] mod 2)=0 { trainer_name[i]="Aroma Man"; }
				else if (trainer_sprite[i] mod 2)=1 { trainer_name[i]="Aroma Lady"; } break;
			case 25: trainer_name[i]="Ranger"; break;
			case 100: trainer_name[i]="Ace Trainer"; break;
			//
			case 101: trainer_name[i]="Prof. Aspen"; break;
			case 200: trainer_name[i]="Ian"; break;
			case 201: trainer_name[i]="Cammie"; break;
			case 202: trainer_name[i]="Benny"; break;
			case 203: trainer_name[i]="Madison"; break;
			case 204: trainer_name[i]="Zoe"; break;
			case 205: trainer_name[i]="Vincent"; break;
			case 206: trainer_name[i]="Penny"; break;
			case 207: trainer_name[i]="Lake"; break;
			case 208: trainer_name[i]="Emily"; break;
			case 209: trainer_name[i]="Finn"; break;
			case 210: trainer_name[i]="Dion"; break;
			case 211: trainer_name[i]="April"; break;
			case 212: trainer_name[i]="Duncan"; break;
		}
		//
		var ii=0;
		repeat (3) {
			event_description[ii][i]="";
			//
			if event_kind[ii][i]=ref_event_battle { event_name[ii][i]="Battle:\n" + trainer_name[i]; }
			else if event_kind[ii][i]=ref_event_payout { event_name[ii][i]="Payout\n($" + string(money_payout) + ")"; }
			else if event_kind[ii][i]=ref_event_freecard { event_name[ii][i]="Free Card"; }
			else if event_kind[ii][i]=ref_event_cardpack { event_name[ii][i]="Card Pack\n$" + string(event_cost[ref_event_cardpack]); }
			else if event_kind[ii][i]=ref_event_berry { event_name[ii][i]="Berry Pack\n$" + string(event_cost[ref_event_berry]); }
			else if event_kind[ii][i]=ref_event_levelup { event_name[ii][i]="Level Up\n$" + string(event_cost[ref_event_levelup]); }
			else if event_kind[ii][i]=ref_event_evolution { event_name[ii][i]="Evolution\n$" + string(event_cost[ref_event_evolution]); }
			else if event_kind[ii][i]=ref_event_tribute { event_name[ii][i]="Tribute"; }
			else if event_kind[ii][i]=ref_event_loop { event_name[ii][i]="Not\nReady"; }
			else if event_kind[ii][i]=ref_event_grass { event_name[ii][i]="Grass\nSt. Deck"; }
			else if event_kind[ii][i]=ref_event_fire { event_name[ii][i]="Fire\nSt. Deck"; }
			else if event_kind[ii][i]=ref_event_water { event_name[ii][i]="Water\nSt. Deck"; }
			else if event_kind[ii][i]=ref_event_gymbattle { event_name[ii][i]="Gym Battle:\n" + trainer_name[i]; }
			else if event_kind[ii][i]=ref_event_tutorial { event_name[ii][i]="Tutorial:\n" + trainer_name[i]; }
			else if event_kind[ii][i]=ref_event_glyph {
				event_name[ii][i]="Glyph\n$" + string(event_cost[ref_event_glyph]);
				event_description[ii][i]=sc_glyph_text(event_glyph_add[ii][i]);
			}
			ii++;
		}
		i++;
	}
	//
	roadmap_get_details=false;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if area_zone=0 and roadmap_area<roadmap_lab_max and zone_first_lap=true { zone_name="Whitebud Town: Prof. Aspen's Lab"; }
else if area_zone=0 { zone_name="Iris Town"; }
else if area_zone=1 { zone_name="Camellia City"; }
else if area_zone=2 { zone_name="Bluestar City"; }
else if area_zone=3 { zone_name="Marigold City"; }
else if area_zone=4 { zone_name="Zinnia Town"; }
else if area_zone=5 { zone_name="Verbena City"; }
else if area_zone=6 { zone_name="Candytuft City"; }
else if area_zone=7 { zone_name="Lupine City"; }
else if area_zone=8 and roadmap_area<roadmap_current_max-roadmap_league_max { zone_name="Victory Road"; }
else if area_zone=8 { zone_name="Crystal League"; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
var mouse_in_event=-1;
//
if !instance_exists(ob_control) and !instance_exists(ob_event) {
	for (var i=0; i<=2; i++;) {
		if event_kind[2][roadmap_area]=-1 {
			event_button_x[i]=road_win_x+55-9+(104*i);
			event_button_y[i]=road_win_y+35-9;
			if i<2 and mouse_x>event_button_x[i] and mouse_y>event_button_y[i] and mouse_x<=event_button_x[i]+42 and mouse_y<=event_button_y[i]+42 and cursor_hide=false {
				mouse_in_event=i;
			}
		}
		else {
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
	if event_transition=ref_event_victory or event_transition=ref_event_defeat or event_transition=ref_event_exitbattle { fade_black+=0.0025; }
	else if event_transition=ref_mainmenu or event_transition=ref_event_battle or event_transition=ref_event_gymbattle or event_transition=ref_event_tutorial
	or event_transition=ref_event_loop { fade_black+=0.012; }
	else { fade_black+=0.04; }
}
else if event_transition=-1 and event_transition_standby=-1 and fade_black>0 {
	fade_black-=0.04;
}
else if event_transition>-1 and fade_black>=1 {
	if instance_exists(ob_event) {
		if ob_event.event_cancelled=false { money-=event_cost_standby; }
		event_cost_standby=0;
	}
	//
	if event_transition=ref_mainmenu {
		with (ob_splash) { instance_destroy(); }
		with (ob_card_splash) { instance_destroy(); }
		with (ob_background_tile) { instance_destroy(); }
		//
		if area_zone=0 and roadmap_area=0 { sc_textbox(0); }
	}
	else if event_transition=ref_event_loop {
		roadmap_area=0;
		roadmap_generated=false;
		zone_first_lap=false;
		sc_data_save();
	}
	else if event_transition=ref_event_payout {
		money+=money_payout;
		roadmap_area++;
		sc_data_save();
	}
	else if event_transition=ref_event_battle or event_transition=ref_event_gymbattle or event_transition=ref_event_tutorial {
		instance_create_layer(x,y,"instances",ob_control);
		money_prize=irandom_range((money_add_base+money_add_area_bonus*area_zone)*0.9,(money_add_base+money_add_area_bonus*area_zone)*1.1);
		if event_transition=ref_event_battle { music_player=sc_playsound(ms_battle,100,true,true); }
		else if event_transition=ref_event_gymbattle { music_player=sc_playsound(ms_battle_2,100,true,true); }
		else if event_transition=ref_event_tutorial { music_player=sc_playsound(ms_tutorial,100,true,true); }
	}
	else if event_transition=ref_event_victory or event_transition=ref_event_defeat or event_transition=ref_event_exitbattle {
		//destroy everything except ob_main and ob_background
		with (ob_control) { instance_destroy(); }
		with (ob_card) { instance_destroy(); }
		with (ob_card_space) { instance_destroy(); }
		with (ob_button_16x16) { instance_destroy(); }
		with (ob_button_15x16) { instance_destroy(); }
		with (ob_button_31x24) { instance_destroy(); }
		with (ob_background_tile) { instance_destroy(); }
		with (ob_damage_num) { instance_destroy(); }
		//
		if event_transition!=ref_event_victory and area_zone=area_zone_max-1 and roadmap_area>=roadmap_current_max-roadmap_league_max {
			roadmap_area=roadmap_current_max-roadmap_league_max;
		}
		else if (event_transition=ref_event_victory and roadmap_area=roadmap_current_max-1) or roadmap_area<roadmap_current_max-1 {
			roadmap_area++;
		}
		//
		music_player=sc_playsound(ms_main,100,true,true);
		if event_transition=ref_event_victory { money+=money_prize; }
		money_prize=0;
		fade_black_exit=0;
		type_chart=false;
		if playing_tutorial=true { playing_tutorial=false; }
		if roadmap_area<roadmap_current_max { sc_data_save(); }
	}
	else {
		if !instance_exists(ob_event) {
			instance_create_layer(x,y,"instances",ob_event);
		}
		else {
			if event_transition=ref_event_grass or event_transition=ref_event_fire or event_transition=ref_event_water { sc_textbox(1); }
			else if option_state[opt_autodeck]=true and (event_transition=ref_event_freecard or event_transition=ref_event_cardpack or event_transition=ref_event_berry) {
				auto_deck_transition=true;
			}
			if ob_event.event_cancelled=false { roadmap_area++; }
			//
			with (ob_event) { instance_destroy(); }
			with (ob_card) { instance_destroy(); }
			with (ob_card_space) { instance_destroy(); }
			with (ob_button_31x24) { instance_destroy(); }
			sc_data_save();
		}
	}
	//
	event_transition=-1;
}
else if event_transition=-1 and event_transition_standby=-1 and fade_black<=0 {
	if mouse_check_button_pressed(mb_left) and mouse_in_event>-1 and screen_transition=-1 {
		if money>=event_cost[event_kind[mouse_in_event][roadmap_area]] {
			var event_conditions=true;
			if event_kind[mouse_in_event][roadmap_area]=ref_event_tutorial {
				for (var i=0; i<5; i++;) {
					if main_card_indeck[i][0]=false { event_conditions=false; }
				}
				if berry_num_used[0][0]<5 { event_conditions=false; }
			}
			//
			if event_conditions=true {
				event_cost_standby=event_cost[event_kind[mouse_in_event][roadmap_area]];
				event_transition_standby=event_kind[mouse_in_event][roadmap_area];
				//
				if event_transition_standby=ref_event_tutorial { sc_textbox(3); }
				else if event_transition_standby=ref_event_gymbattle { sc_textbox(); }
				else {
					event_transition=event_transition_standby;
					event_transition_standby=-1;
					//
					if event_transition=ref_event_glyph { current_glyph_add=event_glyph_add[mouse_in_event][roadmap_area]; }
					if event_transition=ref_event_battle { music_player=sc_playsound(ms_battle_intro,100,false,true); }
				}
			}
			else {
				if event_kind[mouse_in_event][roadmap_area]=ref_event_tutorial { sc_textbox(2); }
			}
		}
		else if money<event_cost[event_kind[mouse_in_event][roadmap_area]] {
			effect_money_error=1;
		}
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
//CHEATS
if keyboard_check_pressed(vk_multiply) { game_restart(); }
if keyboard_check_pressed(vk_add) { roadmap_area++; }
if keyboard_check_pressed(vk_numpad0) { money+=10000; }
//
if instance_exists(ob_control) and keyboard_check_pressed(vk_numpad8) {
	ob_control.player_hp++;
	ob_control.enemy_hp--;
}
if instance_exists(ob_control) and keyboard_check_pressed(vk_numpad7) {
	ob_control.player_hp--;
	ob_control.enemy_hp++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if roadmap_area=roadmap_current_max {
	area_zone++;
	roadmap_area=0;
	roadmap_generated=false;
	zone_first_lap=true;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if !instance_exists(ob_control) and !instance_exists(ob_event) {
	var screen_x=camera_get_view_x(view_camera[0]);
	//
	if screen_x=screen_main_x and event_transition=-1 and event_transition_standby=-1 and screen_transition=-1 and cursor_hide=false and
	(keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A")) or
	(mouse_x>=screen_main_x+32-2 and mouse_y>=screen_main_y+126-2 and mouse_x<=screen_main_x+32+17 and mouse_y<=screen_main_y+126+17)) {
		menu_options_hover=true;
		mouse_cursor=1;
		if mouse_check_button_pressed(mb_left) or keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A")) {
			button_exit_game=instance_create_layer(screen_options_x+cam_w-20,screen_main_y+4,"instances",ob_button_16x16);
			button_exit_game.button_id=100;
			button_reset_config=instance_create_layer(screen_options_x+cam_w-40,screen_main_y+4,"instances",ob_button_16x16);
			button_reset_config.button_id=101;
			button_delete_data=instance_create_layer(screen_options_x+cam_w-60,screen_main_y+4,"instances",ob_button_16x16);
			button_delete_data.button_id=102;
			screen_transition=0;
		}
	}
	else {
		menu_options_hover=false;
	}
	//
	if screen_x=screen_main_x and ((event_transition=-1 and event_transition_standby=-1 and screen_transition=-1 and cursor_hide=false and
	(keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D")) or
	(mouse_x>=screen_main_x+cam_w-48-2 and mouse_y>=screen_main_y+126-2 and mouse_x<=screen_main_x+cam_w-48+17 and mouse_y<=screen_main_y+126+17))) or auto_deck_transition=true) {
		menu_deck_hover=true;
		mouse_cursor=1;
		if mouse_check_button_pressed(mb_left) or keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D")) or auto_deck_transition=true {
			instance_create_layer(screen_deck_x,screen_main_y,"instances",ob_deckbuild);
			screen_transition=1;
			auto_deck_transition=false;
		}
	}
	else {
		menu_deck_hover=false;
	}
	//
	if screen_x=screen_options_x and event_transition=-1 and event_transition_standby=-1 and screen_transition=-1 and cursor_hide=false and
	(keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D")) or
	(mouse_x>=screen_options_x+cam_w-32-2 and mouse_y>=screen_main_y+136-2 and mouse_x<=screen_options_x+cam_w-32+17 and mouse_y<=screen_main_y+136+17)) {
		menu_back_options_hover=true;
		mouse_cursor=1;
		if mouse_check_button_pressed(mb_left) or keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D")) {
			with (ob_button_16x16) { instance_destroy(); }
			button_exit_game=-1;
			button_reset_config=-1;
			button_delete_data=-1;
			fade_black_exit=0;
			fade_red_delete=0;
			screen_transition=2;
			sc_config_save();
		}
	}
	else {
		menu_back_options_hover=false;
	}
	//
	if screen_x=screen_deck_x and event_transition=-1 and event_transition_standby=-1 and screen_transition=-1 and cursor_hide=false and
	(keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A")) or
	(mouse_x>=screen_deck_x+16-2 and mouse_y>=screen_main_y+136-2 and mouse_x<=screen_deck_x+16+17 and mouse_y<=screen_main_y+136+17)) {
		menu_back_deck_hover=true;
		mouse_cursor=1;
		if mouse_check_button_pressed(mb_left) or keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A")) {
			with (ob_deckbuild) { instance_destroy(); }
			with (ob_card) { instance_destroy(); }
			with (ob_button_16x16) { instance_destroy(); }
			with (ob_button_15x16) { instance_destroy(); }
			screen_transition=2;
			sc_data_save();
		}
	}
	else {
		menu_back_deck_hover=false;
	}
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	if screen_transition=0 {
		if screen_x>screen_options_x {
			camera_set_view_pos(view_camera[0],screen_x-16,y);
		}
		else { screen_transition=-1; }
	}
	//
	else if screen_transition=1 {
		if screen_x<screen_deck_x {
			camera_set_view_pos(view_camera[0],screen_x+16,y);
		}
		else { screen_transition=-1; }
	}
	//
	else if screen_transition=2 {
		if screen_x<screen_main_x {
			camera_set_view_pos(view_camera[0],screen_x+16,y);
		}
		else if screen_x>screen_main_x {
			camera_set_view_pos(view_camera[0],screen_x-16,y);
		}
		else {
			screen_transition=-1;
		}
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if button_exit_game!=-1 {
	if button_exit_game.button_state>=1 {
		sc_config_save();
		game_end();
	}
}
if button_reset_config!=-1 {
	if button_reset_config.button_state>=1 {
		var restart_music=false;
		if option_state[opt_music]=false { restart_music=true; }
		//
		if file_exists(config_file) { file_delete(config_file); }
		sc_config_load();
		sc_config_save();
		//
		if restart_music=true { music_player=sc_playsound(ms_main,100,true,true); }
	}
}
if button_delete_data!=-1 {
	if button_delete_data.button_state>=1 {
		sc_config_save();
		if file_exists(data_file) { file_delete(data_file); }
		game_restart();
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
				window_set_size(512*(option_state[opt_scaling]),288*(option_state[opt_scaling]));
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
			else if i=opt_playericon {
				if mouse_check_button_pressed(mb_left) {
					option_state[i]++;
					if option_state[i]>playericon_max { option_state[i]=0; }
				}
				else if mouse_check_button_pressed(mb_right) {
					option_state[i]--;
					if option_state[i]<0 { option_state[i]=playericon_max; }
				}
			}
			else if i=opt_music {
				if option_state[i]=false {
					option_state[i]=true;
				}
				else {
					option_state[i]=false;
				}
				//still plays at volume 0 to keep the beat animations
				music_player=sc_playsound(ms_main,100,true,true);
			}
			else if i=opt_bg_type {
				if mouse_check_button_pressed(mb_left) {
					option_state[i]++;
					if option_state[i]>3 { option_state[i]=0; }
				}
				else if mouse_check_button_pressed(mb_right) {
					option_state[i]--;
					if option_state[i]<0 { option_state[i]=3; }
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
		option_state_text[i]="x" + string(option_state[i]);
	}
	else if i=opt_autodeck {
		if option_state[i]=true { option_state_text[i]="GO TO DECK"; }
		else { option_state_text[i]="DO NOTHING"; }
	}
	else if i=opt_playericon {
		option_state_text[i]="   ";
	}
	else if i=opt_edge {
		option_state_text[i]=string(option_state[i]) + "%";
	}
	else if i=opt_bg_type {
		if option_state[i]=0 { option_state_text[i]="MOVING TILES (HORIZONTAL)"; }
		else if option_state[i]=1 { option_state_text[i]="MOVING TILES (VERTICAL)"; }
		else if option_state[i]=2 { option_state_text[i]="IDLE TILES"; }
		else if option_state[i]=3 { option_state_text[i]="LOCATION"; } //also referenced in draw for alpha of bg preview
	}
	//
	i++;
}
//
var i=0;
repeat (colorsetup_total) {
	if mouse_x>=colorsetup_r_x[i] and mouse_y>=colorsetup_y[i]+2 and
	mouse_x<=colorsetup_r_x[i]+string_width("R " + string(colorsetup_r[i])) and mouse_y<=colorsetup_y[i]+10 and cursor_hide=false {
		mouse_cursor=1;
		colorsetup_focus_r[i]=true;
		if mouse_check_button(mb_left) and colorsetup_r[i]<255 { colorsetup_r[i]++; }
		else if mouse_check_button(mb_right) and colorsetup_r[i]>0 { colorsetup_r[i]--; }
	}
	else { colorsetup_focus_r[i]=false; }
	//
	if mouse_x>=colorsetup_g_x[i] and mouse_y>=colorsetup_y[i]+2 and
	mouse_x<=colorsetup_g_x[i]+string_width("G " + string(colorsetup_g[i])) and mouse_y<=colorsetup_y[i]+10 and cursor_hide=false {
		mouse_cursor=1;
		colorsetup_focus_g[i]=true;
		if mouse_check_button(mb_left) and colorsetup_g[i]<255 { colorsetup_g[i]++; }
		else if mouse_check_button(mb_right) and colorsetup_g[i]>0 { colorsetup_g[i]--; }
	}
	else { colorsetup_focus_g[i]=false; }
	//
	if mouse_x>=colorsetup_b_x[i] and mouse_y>=colorsetup_y[i]+2 and
	mouse_x<=colorsetup_b_x[i]+string_width("B " + string(colorsetup_b[i])) and mouse_y<=colorsetup_y[i]+10 and cursor_hide=false {
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
global.color_character=make_colour_rgb(colorsetup_r[opt_c_char],colorsetup_g[opt_c_char],colorsetup_b[opt_c_char]);
//
var progress_r=colorsetup_r[opt_c_char]*1.5, progress_g=colorsetup_g[opt_c_char]*1.5, progress_b=colorsetup_b[opt_c_char]*1.5;
if progress_r>255 { progress_r=255; }
if progress_g>255 { progress_g=255; }
if progress_b>255 { progress_b=255; }
global.color_roadmap_bar=make_colour_rgb(progress_r,progress_g,progress_b);
