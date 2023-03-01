if current_time >= backup_speed * time_incrementer {
	time_incrementer++;
	sc_data_save(true);
}

if mouse_check_button(mb_middle) or instance_exists(ob_splash) or
type_chart=true or credits_screen=true or ending_screen=true or textbox_string[textbox_current]!="" { cursor_hide=true; }
else { cursor_hide=false; }
//
if type_chart_toggle=true {
	type_chart=true;
	type_chart_toggle=false;
}
else if type_chart=true and (mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_right)) {
	sc_playsound(sn_click,50,false,false);
	type_chart=false;
}
//
if credits_screen_toggle=true {
	credits_screen=true;
	credits_screen_toggle=false;
}
else if credits_screen=true and (mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_right)) {
	sc_playsound(sn_click,50,false,false);
	credits_screen=false;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————

if ending_static_timer = 1
{
	area_zone = area_zone_max; /// send you to mewtwo area
	roadmap_area=0;
	roadmap_generated=false;
	zone_first_lap=true;
	sc_data_save(false);
	sc_data_save(true);
	ending_static_timer-=0.003;
}
else if ending_static_timer>0 { ending_static_timer-=0.003; }
else if ending_screen=true and ending_static_timer<=0 and ending_static_timer!=-1 {
	game_restart();
	//ending_screen=false;
}

//————————————————————————————————————————————————————————————————————————————————————————————————————
if effect_money_error>0 { effect_money_error-=0.1; }
if fade_black<0 { fade_black=0; }
//
if music_beat_margin>0 { music_beat_margin--; }
if !instance_exists(ob_splash) and sc_music_sync()=true {
	moving_hud--;
	if moving_hud<=-1 { moving_hud=1; }
}

//————————————————————————————————————————————————————————————————————————————————————————————————————
if option_state[opt_challenge]=ch_resolution || option_state[opt_challenge]=ch_swiftness{ roadmap_road_max=roadmap_road_max_resolution; }
else { roadmap_road_max=roadmap_road_max_normal; }
//
if area_zone=area_zone_max and zone_first_lap=true { roadmap_current_max=roadmap_road_max; } ///check this
else if area_zone=area_zone_max-1 and zone_first_lap=true { roadmap_current_max=roadmap_road_max+roadmap_league_max-1; }
else if area_zone=area_zone_max-1 and zone_first_lap=false { roadmap_current_max=roadmap_outskirts_max+roadmap_league_max-1; } //roadmap_outskirts_max is also used when flying to league
else if area_zone=0 and zone_first_lap=true { roadmap_current_max=roadmap_road_max+roadmap_lab_max; }
else if area_zone>0 and zone_first_lap=true { roadmap_current_max=roadmap_road_max; }
else if zone_first_lap=false { roadmap_current_max=roadmap_outskirts_max; } //roadmap_outskirts_max is also used when flying to cities
//
card_level_player_limit=latest_zone+2; //2 3 4 5 6 7 8 9 (10), max level increase victory message for all gyms
if card_level_player_limit>10 { card_level_player_limit=10; }
card_level_spawn_min=floor(latest_zone/3)+1; //1 1 1 2 2 2 3 3 (3)
card_level_spawn_limit=floor((latest_zone+1)/1.5)+1; //1 2 3 3 4 5 5 6 (7)
//
card_level_enemy_min=area_zone; //1 1 2 3 4 5 6 7 (8)
if card_level_enemy_min<=0 { card_level_enemy_min=1; }
if area_zone>0 or zone_first_lap=false or playing_gym=true { card_level_enemy_limit=area_zone+2; } //2 3 4 5 6 7 8 9 (10), 2/3 chance to re-roll (first laps in ob_card)
else { card_level_enemy_limit=1; } //first zone, first lap
//————————————————————————————————————————————————————————————————————————————————————————————————————
if audio_is_playing(ms_main) and area_zone=area_zone_max-1 and roadmap_area>=roadmap_current_max-roadmap_league_max {
	music_player=sc_playsound(ms_league,100,true,true);
}
else if audio_is_playing(ms_league) and !(area_zone=area_zone_max-1 and roadmap_area>=roadmap_current_max-roadmap_league_max) {
	music_player=sc_playsound(ms_main,100,true,true);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
maindeck_size_max=10+latest_zone*4; //10 14 18 22 26 30 34 38 (40), deck size increase victory message for all gyms
enemy_maindeck_size=10+area_zone*4; //10 14 18 22 26 30 34 38 (40)
if zone_first_lap=true and playing_gym=false and playing_elite=false and playing_champion=false {
	enemy_maindeck_size=round((enemy_maindeck_size-5)+(5*roadmap_area/(roadmap_current_max-1)));
	if enemy_maindeck_size<5 { enemy_maindeck_size=5; } //not possible anymore, but just in case
}
if maindeck_size_max>40 {
	maindeck_size_max=40;
}
if enemy_maindeck_size>40 {
	enemy_maindeck_size=40;
}
//
if newgameplus = false
{
	var areabase = area_zone;
	var zonebase = latest_zone;
maindeck_size_min=6+areabase*3; //6 9 12 15 18 21 24 27 (30)
maindeck_size_min_full=6+zonebase*3;
}
else
{
	var areabase = 10;
	var zonebase = 10;	
maindeck_size_min=40; //6 9 12 15 18 21 24 27 (30)
maindeck_size_min_full=40;
}


//
money_payout=money_payout_base+money_payout_area_bonus*areabase-money_payout_penalty_multiplier*(zonebase-areabase);
money_prize_badge=money_badge_base+money_badge_area_bonus*areabase;
money_prize_min=round(0.9*(round(power(money_prize_power_base+money_prize_power_area_bonus*areabase,money_prize_power_n))-money_prize_penalty_multiplier*(zonebase-areabase)));
money_prize_max=round(1.1*(round(power(money_prize_power_base+money_prize_power_area_bonus*areabase,money_prize_power_n))-money_prize_penalty_multiplier*(zonebase-areabase)));
//
if option_state[opt_challenge]=ch_resolution || option_state[opt_challenge]=ch_swiftness{
	money_payout=round(money_payout*2);
	money_prize_badge=round(money_prize_badge*2);
	money_prize_min=round(money_prize_min*2);
	money_prize_max=round(money_prize_max*2);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if roadmap_generated=true and event_kind[0,roadmap_current_max-1]=-1 {
	roadmap_generated=false;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if textbox_string[textbox_current]!="" {
	if textbox_show!=textbox_string[textbox_current] {
		if textbox_timer=textbox_timer_max {
			sc_playsound(sn_text,50,false,false);
			//
			textbox_char_pos++;
			textbox_show=textbox_show+string_char_at(textbox_string[textbox_current],textbox_char_pos);
			//
			textbox_timer=0;
		}
		else { textbox_timer++; }
		//
		if textbox_char_pos>10 and (mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_right)) {
			sc_playsound(sn_text,50,false,false);
			textbox_show=textbox_string[textbox_current];
		}
	}
	else {
		if mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_right) {
			sc_playsound(sn_click,50,false,false);
			//
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
				//
				if ending_screen=true {
					ending_static_timer=1;
					
					sc_playsound(sn_noise,100,true,true);
				}
			}
			//
			if event_transition_standby!=-1 {
				event_transition=event_transition_standby;
				event_transition_standby=-1;
				//
				if event_transition=ref_event_gymbattle { playing_gym=true; }
				if event_transition=ref_event_elitebattle { playing_elite=true; }
				if event_transition=ref_event_championbattle { playing_champion=true; }
				//if event_transition=ref_event_legendarybattle { playing_champion=true; }
				if event_transition=ref_event_tutorial { playing_tutorial=true; }
				if event_transition=ref_event_gymbattle or event_transition=ref_event_elitebattle or event_transition=ref_event_championbattle or
				event_transition=ref_event_tutorial {
					music_player=sc_playsound(ms_battle_intro,100,false,true);
				}
			}
		}
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if roadmap_generated=false {
	var i=0, var_event_num;
	repeat (roadmap_current_max) {
		var_event_num[i]= 3; //choose(2,3,3);
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
			
		// [weight, event reference, free] Determine event odds.
		

		if newgameplus = true && coin_skin < 8
		{ /// 885 total
			var events = [
			[15, ref_event_megaevolve, false], //10
			[15, ref_event_changeform, false], //10
			[325, ref_event_battle, true], //330
			[35, ref_event_payout, true], //25
			[24, ref_event_freecard, true], // 25
			[1, ref_event_holo_freecard, true], //0
			[8-coin_skin, ref_event_coin, true],//0
			[1, ref_event_shinycharm, false], //0
			[4, ref_event_delta, false], //0
			[5, ref_event_cardpack_1, false], //0
			[5, ref_event_cardpack_2, false], //0
			[5, ref_event_cardpack_3, false], //0
			[5, ref_event_cardpack_4, false], //0
			[5, ref_event_cardpack_5, false], //0
			[5, ref_event_cardpack_6, false], //0
			[5, ref_event_cardpack_7, false], //0
			[5, ref_event_cardpack_8, false], //0
			[5, ref_event_cardpack_9, false], //0
			[50, ref_event_cardpack, false], //50
			[68, ref_event_berry, true], //100
			[159, ref_event_levelup, false],//200
			[50, ref_event_evolution, false], //50
			[35+coin_skin, ref_event_glyph, false], //35
			[10, ref_event_deglyph, false], //10
			[15, ref_event_tribute, false], //15
			[15, ref_event_sacrifice, false], //15
			[20, ref_event_campfire, true] //10
		];
		}
		else if newgameplus = true && area_zone = 0
		{ /// 885 total
			var events = [
			[30, ref_event_megaevolve, false], //10
			[30, ref_event_changeform, false], //10
			[250, ref_event_battle, true], //330
			[20, ref_event_candy, true], //330
			[55, ref_event_payout, true], //25
			[10, ref_event_freecard, true], // 25
			[10, ref_event_holo_freecard, true], //0
			[1, ref_event_shinycharm, false], //0
			[5, ref_event_delta, false], //0
			[85, ref_event_cardpack_1, false], //0
			[40, ref_event_cardpack, false], //50
			[10, ref_event_berry, true], //100
			[139, ref_event_levelup, false],//200
			[70, ref_event_evolution, false], //50
			[50, ref_event_glyph, false], //35
			[10, ref_event_deglyph, false], //10
			[15, ref_event_tribute, false], //15
			[15, ref_event_sacrifice, false], //15
			[40, ref_event_campfire, true] //10
		];
		}
		else if newgameplus = true && area_zone = 1
		{ /// 885 total
			var events = [
			[30, ref_event_megaevolve, false], //10
			[30, ref_event_changeform, false], //10
			[250, ref_event_battle, true], //330
			[20, ref_event_candy, true], //330
			[55, ref_event_payout, true], //25
			[10, ref_event_freecard, true], // 25
			[10, ref_event_holo_freecard, true], //0
			[1, ref_event_shinycharm, false],  //0
			[5, ref_event_delta, false], //0
			[85, ref_event_cardpack_2, false], //0
			[40, ref_event_cardpack, false], //50
			[10, ref_event_berry, true], //100
			[139, ref_event_levelup, false],//200
			[70, ref_event_evolution, false], //50
			[50, ref_event_glyph, false], //35
			[10, ref_event_deglyph, false], //10
			[15, ref_event_tribute, false], //15
			[15, ref_event_sacrifice, false], //15
			[40, ref_event_campfire, true] //10
		];
		}
		else if newgameplus = true && area_zone = 2
		{ /// 885 total
			var events = [
			[30, ref_event_megaevolve, false], //10
			[30, ref_event_changeform, false], //10
			[250, ref_event_battle, true], //330
			[20, ref_event_candy, true], //330
			[55, ref_event_payout, true], //25
			[10, ref_event_freecard, true], // 25
			[10, ref_event_holo_freecard, true], //0
			[1, ref_event_shinycharm, false],  //0
			[5, ref_event_delta, false], //0
			[85, ref_event_cardpack_3, false], //0
			[40, ref_event_cardpack, false], //50
			[10, ref_event_berry, true], //100
			[139, ref_event_levelup, false],//200
			[70, ref_event_evolution, false], //50
			[50, ref_event_glyph, false], //35
			[10, ref_event_deglyph, false], //10
			[15, ref_event_tribute, false], //15
			[15, ref_event_sacrifice, false], //15
			[40, ref_event_campfire, true] //10
		];
		}
		else if newgameplus = true && area_zone = 3
		{ /// 885 total
			var events = [
			[30, ref_event_megaevolve, false], //10
			[30, ref_event_changeform, false], //10
			[250, ref_event_battle, true], //330
			[20, ref_event_candy, true], //330
			[55, ref_event_payout, true], //25
			[10, ref_event_freecard, true], // 25
			[10, ref_event_holo_freecard, true], //0
			[1, ref_event_shinycharm, false],  //0
			[5, ref_event_delta, false], //0
			[85, ref_event_cardpack_4, false], //0
			[40, ref_event_cardpack, false], //50
			[10, ref_event_berry, true], //100
			[139, ref_event_levelup, false],//200
			[70, ref_event_evolution, false], //50
			[50, ref_event_glyph, false], //35
			[10, ref_event_deglyph, false], //10
			[15, ref_event_tribute, false], //15
			[15, ref_event_sacrifice, false], //15
			[40, ref_event_campfire, true] //10
		];
		}
		else if newgameplus = true && area_zone = 4
		{ /// 885 total
			var events = [
			[30, ref_event_megaevolve, false], //10
			[30, ref_event_changeform, false], //10
			[250, ref_event_battle, true], //330
			[20, ref_event_candy, true], //330
			[55, ref_event_payout, true], //25
			[10, ref_event_freecard, true], // 25
			[10, ref_event_holo_freecard, true], //0
			[1, ref_event_shinycharm, false],  //0
			[5, ref_event_delta, false], //0
			[85, ref_event_cardpack_5, false], //0
			[40, ref_event_cardpack, false], //50
			[10, ref_event_berry, true], //100
			[139, ref_event_levelup, false],//200
			[70, ref_event_evolution, false], //50
			[50, ref_event_glyph, false], //35
			[10, ref_event_deglyph, false], //10
			[15, ref_event_tribute, false], //15
			[15, ref_event_sacrifice, false], //15
			[40, ref_event_campfire, true] //10
		];
		}
		else if newgameplus = true && area_zone = 5
		{ /// 885 total
			var events = [
			[30, ref_event_megaevolve, false], //10
			[30, ref_event_changeform, false], //10
			[250, ref_event_battle, true], //330
			[20, ref_event_candy, true], //330
			[55, ref_event_payout, true], //25
			[10, ref_event_freecard, true], // 25
			[10, ref_event_holo_freecard, true], //0
			[1, ref_event_shinycharm, false],  //0
			[5, ref_event_delta, false], //0
			[85, ref_event_cardpack_6, false], //0
			[40, ref_event_cardpack, false], //50
			[10, ref_event_berry, true], //100
			[139, ref_event_levelup, false],//200
			[70, ref_event_evolution, false], //50
			[50, ref_event_glyph, false], //35
			[10, ref_event_deglyph, false], //10
			[15, ref_event_tribute, false], //15
			[15, ref_event_sacrifice, false], //15
			[40, ref_event_campfire, true] //10
		];
		}
		else if newgameplus = true && area_zone = 6
		{ /// 885 total
			var events = [
			[30, ref_event_megaevolve, false], //10
			[30, ref_event_changeform, false], //10
			[250, ref_event_battle, true], //330
			[20, ref_event_candy, true], //330
			[55, ref_event_payout, true], //25
			[10, ref_event_freecard, true],  // 25
			[10, ref_event_holo_freecard, true], //0
			[1, ref_event_shinycharm, false],  //0
			[5, ref_event_delta, false], //0
			[85, ref_event_cardpack_7, false], //0
			[40, ref_event_cardpack, false], //50
			[10, ref_event_berry, true], //100
			[139, ref_event_levelup, false],//200
			[70, ref_event_evolution, false], //50
			[50, ref_event_glyph, false], //35
			[10, ref_event_deglyph, false], //10
			[15, ref_event_tribute, false], //15
			[15, ref_event_sacrifice, false], //15
			[40, ref_event_campfire, true] //10
		];
		}
		else if newgameplus = true && area_zone = 7
		{ /// 885 total
			var events = [
			[30, ref_event_megaevolve, false], //10
			[30, ref_event_changeform, false], //10
			[250, ref_event_battle, true], //330
			[20, ref_event_candy, true], //330
			[55, ref_event_payout, true], //25
			[10, ref_event_freecard, true], // 25
			[10, ref_event_holo_freecard, true], //0
			[1, ref_event_shinycharm, false],  //0
			[5, ref_event_delta, false], //0
			[85, ref_event_cardpack_8, false], //0
			[40, ref_event_cardpack, false], //50
			[10, ref_event_berry, true], //100
			[139, ref_event_levelup, false],//200
			[70, ref_event_evolution, false], //50
			[50, ref_event_glyph, false], //35
			[10, ref_event_deglyph, false], //10
			[15, ref_event_tribute, false], //15
			[15, ref_event_sacrifice, false], //15
			[40, ref_event_campfire, true] //10
		];
		}
		else if newgameplus = true && area_zone = 8
		{ /// 885 total
			var events = [
			[30, ref_event_megaevolve, false], //10
			[30, ref_event_changeform, false], //10
			[250, ref_event_battle, true], //330
			[20, ref_event_candy, true], //330
			[55, ref_event_payout, true], //25
			[10, ref_event_freecard, true], // 25
			[10, ref_event_holo_freecard, true], //0
			[1, ref_event_shinycharm, false],  //0
			[5, ref_event_delta, false], //0
			[85, ref_event_cardpack_9, false], //0
			[40, ref_event_cardpack, false], //50
			[10, ref_event_berry, true], //100
			[139, ref_event_levelup, false],//200
			[70, ref_event_evolution, false], //50
			[50, ref_event_glyph, false], //35
			[10, ref_event_deglyph, false], //10
			[15, ref_event_tribute, false], //15
			[15, ref_event_sacrifice, false], //15
			[40, ref_event_campfire, true] //10
		];
		}
		else if area_zone < 2
		{ /// 885 total
			var events = [
			[330, ref_event_battle, true], //330
			[35, ref_event_payout, true], //25
			[25, ref_event_freecard, true], // 25
			[50, ref_event_cardpack, false], //50
			[100, ref_event_berry, true], //100
			[200, ref_event_levelup, false],//200
			[60, ref_event_evolution, false], //50
			[35, ref_event_glyph, false], //35
			[15, ref_event_tribute, false], //15
			[15, ref_event_sacrifice, false], //15
			[20, ref_event_campfire, true] //10
		];
		}
		else if area_zone < 9 && coin_skin < 8
		{ /// 885 total
			var events = [
			[15, ref_event_megaevolve, false], //10
			[15, ref_event_changeform, false], //10
			[325, ref_event_battle, true], //330
			[35, ref_event_payout, true], //25
			[24, ref_event_freecard, true], // 25
			[1, ref_event_holo_freecard, true], //0
			[8-coin_skin, ref_event_coin, true],//0
			[1, ref_event_shinycharm, false],  //0
			[4, ref_event_delta, false], //0
			[5, ref_event_cardpack_1, false], //0
			[5, ref_event_cardpack_2, false], //0
			[5, ref_event_cardpack_3, false], //0
			[5, ref_event_cardpack_4, false], //0
			[5, ref_event_cardpack_5, false], //0
			[5, ref_event_cardpack_6, false], //0
			[5, ref_event_cardpack_7, false], //0
			[5, ref_event_cardpack_8, false], //0
			[5, ref_event_cardpack_9, false], //0
			[50, ref_event_cardpack, false], //50
			[68, ref_event_berry, true], //100
			[159, ref_event_levelup, false],//200
			[50, ref_event_evolution, false], //50
			[35+coin_skin, ref_event_glyph, false], //35
			[10, ref_event_deglyph, false], //10
			[15, ref_event_tribute, false], //15
			[15, ref_event_sacrifice, false], //15
			[20, ref_event_campfire, true] //10
		];
		}
		else if area_zone < 9 && coin_skin >= 8
		{ /// 885 total
			var events = [
			[15, ref_event_megaevolve, false], //10
			[15, ref_event_changeform, false], //10
			[333, ref_event_battle, true], //330
			[35, ref_event_payout, true], //25
			[24, ref_event_freecard, true], // 25
			[1, ref_event_holo_freecard, true], //0
			[1, ref_event_shinycharm, false],  //0
			[4, ref_event_delta, false], //0
			[5, ref_event_cardpack_1, false], //0
			[5, ref_event_cardpack_2, false], //0
			[5, ref_event_cardpack_3, false], //0
			[5, ref_event_cardpack_4, false], //0
			[5, ref_event_cardpack_5, false], //0
			[5, ref_event_cardpack_6, false], //0
			[5, ref_event_cardpack_7, false], //0
			[5, ref_event_cardpack_8, false], //0
			[5, ref_event_cardpack_9, false], //0
			[50, ref_event_cardpack, false], //50
			[68, ref_event_berry, true], //100
			[159, ref_event_levelup, false],//200
			[50, ref_event_evolution, false], //50
			[35, ref_event_glyph, false], //35
			[10, ref_event_deglyph, false], //10
			[15, ref_event_tribute, false], //15
			[15, ref_event_sacrifice, false], //15
			[20, ref_event_campfire, true] //10
		];
		}
		else if  coin_skin < 8
		{ /// 885 total
			var events = [
			[30, ref_event_megaevolve, false], //10
			[30, ref_event_changeform, false], //10
			[279, ref_event_battle, true], //330
			[20, ref_event_candy, true], //330
			[35, ref_event_payout, true], //25
			[20, ref_event_freecard, true], // 25
			[4, ref_event_holo_freecard, true], //0
			[8-coin_skin, ref_event_coin, true],//0
			[1, ref_event_shinycharm, false],  //0
			[5, ref_event_delta, false], //0
			[5, ref_event_cardpack_1, false], //0
			[5, ref_event_cardpack_2, false], //0
			[5, ref_event_cardpack_3, false], //0
			[5, ref_event_cardpack_4, false], //0
			[5, ref_event_cardpack_5, false], //0
			[5, ref_event_cardpack_6, false], //0
			[5, ref_event_cardpack_7, false], //0
			[5, ref_event_cardpack_8, false], //0
			[5, ref_event_cardpack_9, false], //0
			[50, ref_event_cardpack, false], //50
			[53, ref_event_berry, true], //100
			[159, ref_event_levelup, false],//200
			[50, ref_event_evolution, false], //50
			[35+coin_skin, ref_event_glyph, false], //35
			[10, ref_event_deglyph, false], //10
			[15, ref_event_tribute, false], //15
			[15, ref_event_sacrifice, false], //15
			[20, ref_event_campfire, true] //10
		];
		}
		else
		{ /// 885 total
			var events = [
			[30, ref_event_megaevolve, false], //10
			[30, ref_event_changeform, false], //10
			[280, ref_event_battle, true], //330
			[20, ref_event_candy, true], //330
			[35, ref_event_payout, true], //25
			[20, ref_event_freecard, true], // 25
			[4, ref_event_holo_freecard, true], //0
			[1, ref_event_shinycharm, false],  //0
			[5, ref_event_delta, false], //0
			[5, ref_event_cardpack_1, false], //0
			[5, ref_event_cardpack_2, false], //0
			[5, ref_event_cardpack_3, false], //0
			[5, ref_event_cardpack_4, false], //0
			[5, ref_event_cardpack_5, false], //0
			[5, ref_event_cardpack_6, false], //0
			[5, ref_event_cardpack_7, false], //0
			[5, ref_event_cardpack_8, false], //0
			[5, ref_event_cardpack_9, false], //0
			[50, ref_event_cardpack, false], //50
			[53, ref_event_berry, true], //100
			[159, ref_event_levelup, false],//200
			[50, ref_event_evolution, false], //50
			[42, ref_event_glyph, false], //35
			[10, ref_event_deglyph, false], //10
			[15, ref_event_tribute, false], //15
			[15, ref_event_sacrifice, false], //15
			[20, ref_event_campfire, true] //10
		];
		}
		
		
		
		do {
			var ii=0;
				
			repeat (var_event_num[i]) {
				
				var event = sc_determine_events(events);
				event_kind[ii][i] = event[1];
				free_event = event[2];
				
				if event_kind[ii][i]=ref_event_glyph { event_glyph_add[ii][i]=sc_glyph_random(false); }
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
		//events referenced in dialogue after tutorial. needs at least 1 more card for minimum
		event_kind[0][2]=ref_event_cardpack;
		event_kind[1][2]=ref_event_freecard;
		event_kind[2][2]=-1;
		location_type[2]=13; //lab
		//
		event_kind[0][3]=ref_event_glyph;
		event_glyph_add[0][3]=ref_glyph_harvest;
		event_kind[1][3]=ref_event_levelup;
		event_kind[2][3]=ref_event_berry;
		location_type[3]=00; //forest
		//
		event_kind[0][4]=ref_event_battle;
		trainer_kind[4]=03; //BUG CATCHER
		event_kind[1][4]=ref_event_payout;
		event_kind[2][4]=-1;
		location_type[4]=00; //forest
	}
	else if area_zone>0 and zone_first_lap=true and latest_city<area_zone {
		//either increase their deck by 3 or already has the new minimum
		event_kind[0][0]=ref_event_battle;
		event_kind[1][0]=ref_event_cardpack;
		event_kind[2][0]=-1;
	}
	//
	if area_zone=area_zone_max-1 {
		event_kind[0][roadmap_current_max-5]=ref_event_elitebattle;
		trainer_kind[roadmap_current_max-5]=208; //ELITE
		trainer_sprite[roadmap_current_max-5]=playericon_max+10+0;
		event_kind[1][roadmap_current_max-5]=ref_event_loop;
		event_kind[2][roadmap_current_max-5]=-1;
		location_type[roadmap_current_max-5]=15; //city
		//
		event_kind[0][roadmap_current_max-4]=ref_event_elitebattle;
		trainer_sprite[roadmap_current_max-4]=playericon_max+10+1;
		trainer_kind[roadmap_current_max-4]=209; //ELITE
		event_kind[1][roadmap_current_max-4]=ref_event_loop;
		event_kind[2][roadmap_current_max-4]=-1;
		location_type[roadmap_current_max-4]=15; //city
		//
		event_kind[0][roadmap_current_max-3]=ref_event_elitebattle;
		trainer_sprite[roadmap_current_max-3]=playericon_max+10+2;
		trainer_kind[roadmap_current_max-3]=210; //ELITE
		event_kind[1][roadmap_current_max-3]=ref_event_loop;
		event_kind[2][roadmap_current_max-3]=-1;
		location_type[roadmap_current_max-3]=15; //city
		//
		event_kind[0][roadmap_current_max-2]=ref_event_elitebattle;
		trainer_sprite[roadmap_current_max-2]=playericon_max+10+3;
		trainer_kind[roadmap_current_max-2]=211; //ELITE
		event_kind[1][roadmap_current_max-2]=ref_event_loop;
		event_kind[2][roadmap_current_max-2]=-1;
		location_type[roadmap_current_max-2]=15; //city
		//
		event_kind[0][roadmap_current_max-1]=ref_event_championbattle;
		trainer_sprite[roadmap_current_max-1]=playericon_max+10+4;
		trainer_kind[roadmap_current_max-1]=212; //CHAMPION
		event_kind[1][roadmap_current_max-1]=ref_event_loop;
		event_kind[2][roadmap_current_max-1]=-1;
		location_type[roadmap_current_max-1]=15; //city
	}
	else if area_zone=area_zone_max {
		event_kind[0][roadmap_current_max-1]=ref_event_legendarybattle;
		trainer_kind[roadmap_current_max-1]=213; //GYM LEADER MEWTWO
		trainer_sprite[roadmap_current_max-1]=area_zone+playericon_max+6;
		event_kind[1][roadmap_current_max-1]=ref_event_loop;
		event_kind[2][roadmap_current_max-1]=-1;
		location_type[roadmap_current_max-1]=03; //cave
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
	sc_data_save(false);
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
			case 202: trainer_name[i]="Walker"; break;
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
			//
			case 213: trainer_name[i]="Mewtwo";  break;
		}
		//
		var ii=0;
		repeat (3) {
			event_description[ii][i]="";
			event_description_lines[ii][i]=0;
			//
			if event_kind[ii][i]=ref_event_battle { event_name[ii][i]="Battle:\n" + trainer_name[i]; }
			else if event_kind[ii][i]=ref_event_payout and area_zone=0 and zone_first_lap=true and i<roadmap_lab_max {
				event_name[ii][i]="Payout\n($" + string(tutorial_payout) + ")"; }
			else if event_kind[ii][i]=ref_event_payout { event_name[ii][i]="Payout\n($" + string(money_payout) + ")"; }
			else if event_kind[ii][i]=ref_event_freecard { event_name[ii][i]="Free Card"; }
			else if event_kind[ii][i]=ref_event_candy { event_name[ii][i]="Rare Candy"; }
			else if event_kind[ii][i]=ref_event_shinycharm { event_name[ii][i]="Shiny Charm\n$" + string(event_cost[ref_event_shinycharm]);}
			else if event_kind[ii][i]=ref_event_skip { event_name[ii][i]="Skip"; }
			else if event_kind[ii][i]=ref_event_holo_freecard { event_name[ii][i]="Holo!\n$" + string(event_cost[ref_event_holo_freecard]); }
			else if event_kind[ii][i]=ref_event_coin { event_name[ii][i]="New Coin!"; }		
			else if event_kind[ii][i]=ref_event_delta { event_name[ii][i]="Delta!\n$" + string(event_cost[ref_event_delta]);}			
			else if event_kind[ii][i]=ref_event_cardpack { event_name[ii][i]="Card Pack\n$" + string(event_cost[ref_event_cardpack]); }
			else if event_kind[ii][i]=ref_event_berry { event_name[ii][i]="Berry Pack"; }
			else if event_kind[ii][i]=ref_event_levelup { event_name[ii][i]="Level Up\n$" + string(event_cost[ref_event_levelup]) + " (*)"; }
			else if event_kind[ii][i]=ref_event_evolution { event_name[ii][i]="Evolution\n$" + string(event_cost[ref_event_evolution]); }
			
			else if event_kind[ii][i]=ref_event_sacrifice { event_name[ii][i]="Sacrifice"; }
			else if event_kind[ii][i]=ref_event_megaevolve { event_name[ii][i]="Transcend\n$" + string(event_cost[ref_event_megaevolve]); }
			else if event_kind[ii][i]=ref_event_campfire { event_name[ii][i]="Campfire"; }
			else if event_kind[ii][i]=ref_event_changeform { event_name[ii][i]="Change\nForm"; }
			else if event_kind[ii][i]=ref_event_deglyph { event_name[ii][i]="De-Glyph"; }
			
			else if event_kind[ii][i]=ref_event_cardpack_0 { event_name[ii][i]="Secret!\n$" + string(event_cost[ref_event_cardpack_0]); }
			else if event_kind[ii][i]=ref_event_cardpack_1 { event_name[ii][i]="Gen 1 Pack\n$" + string(event_cost[ref_event_cardpack_1]); }
			else if event_kind[ii][i]=ref_event_cardpack_2 { event_name[ii][i]="Gen 2 Pack\n$" + string(event_cost[ref_event_cardpack_2]); }
			else if event_kind[ii][i]=ref_event_cardpack_3 { event_name[ii][i]="Gen 3 Pack\n$" + string(event_cost[ref_event_cardpack_3]); }
			else if event_kind[ii][i]=ref_event_cardpack_4 { event_name[ii][i]="Gen 4 Pack\n$" + string(event_cost[ref_event_cardpack_4]); }
			else if event_kind[ii][i]=ref_event_cardpack_5 { event_name[ii][i]="Gen 5 Pack\n$" + string(event_cost[ref_event_cardpack_5]); }
			else if event_kind[ii][i]=ref_event_cardpack_6 { event_name[ii][i]="Gen 6 Pack\n$" + string(event_cost[ref_event_cardpack_6]); }
			else if event_kind[ii][i]=ref_event_cardpack_7 { event_name[ii][i]="Gen 7 Pack\n$" + string(event_cost[ref_event_cardpack_7]); }
			else if event_kind[ii][i]=ref_event_cardpack_8 { event_name[ii][i]="Gen 8 Pack\n$" + string(event_cost[ref_event_cardpack_8]); }
			else if event_kind[ii][i]=ref_event_cardpack_9 { event_name[ii][i]="Gen 9 Pack\n$" + string(event_cost[ref_event_cardpack_9]); }
			
			else if event_kind[ii][i]=ref_event_tribute { event_name[ii][i]="Tribute"; }
			else if event_kind[ii][i]=ref_event_loop { event_name[ii][i]="Not\nReady"; }
			else if event_kind[ii][i]=ref_event_loop { event_name[ii][i]="Return\nHome"; }
			else if event_kind[ii][i]=ref_event_grass { event_name[ii][i]="Grass\nSt. Deck"; }
			else if event_kind[ii][i]=ref_event_fire { event_name[ii][i]="Fire\nSt. Deck"; }
			else if event_kind[ii][i]=ref_event_water { event_name[ii][i]="Water\nSt. Deck"; }
			else if event_kind[ii][i]=ref_event_legendarybattle { event_name[ii][i]="Legendary Encounter:\n" + trainer_name[i]; }
			else if event_kind[ii][i]=ref_event_gymbattle { event_name[ii][i]="Gym Battle:\n" + trainer_name[i]; }
			else if event_kind[ii][i]=ref_event_elitebattle { event_name[ii][i]="Elite Battle:\n" + trainer_name[i]; }
			else if event_kind[ii][i]=ref_event_championbattle { event_name[ii][i]="Final Battle:\n" + trainer_name[i]; }
			else if event_kind[ii][i]=ref_event_tutorial { event_name[ii][i]="Tutorial:\n" + trainer_name[i]; }
			else if event_kind[ii][i]=ref_event_glyph {
				event_name[ii][i]="Glyph\n$" + string(event_cost[ref_event_glyph]);
				event_description[ii][i]=sc_glyph_text(event_glyph_add[ii][i],false);
				event_description_lines[ii][i]=sc_glyph_text(event_glyph_add[ii][i],true);
			}
			//
			if newgameplus = false
			{
				var battlehp = area_zone;
			}
			else
			{
				var battlehp = 9;
			}
			
			if ob_main.playing_tutorial=true { hp_max=ob_main.battle_hp[0]; }
			else if ob_main.newgameplus = true {hp_max=ob_main.battle_hp[10];}
			else if ob_main.playing_gym=false and ob_main.playing_elite=false and ob_main.playing_champion=false { hp_max=ob_main.battle_hp[ob_main.area_zone]; }
			else { hp_max=ob_main.battle_hp[ob_main.area_zone+1]; }
			//
			if ob_main.area_zone != area_zone_max
			{
				player_hp=hp_max;
				enemy_hp=hp_max;
			}
			else 
			{
				player_hp=hp_max-((hp_max*1.5)-hp_max);
				enemy_hp=hp_max+((hp_max*1.5)-hp_max);
			}			
			
			if event_kind[ii][i]=ref_event_battle {
				event_description[ii][i]="// " + string_upper(trainer_name[i]) + " //\nMinimum deck size: " + string(maindeck_size_min) + " cards" +
				"\nBattle HP: " + string(battle_hp[battlehp]*2) + " (" + string(battle_hp[battlehp]) + "/" + string(battle_hp[battlehp]) + ")" +
				"\nReward: $" + string(money_prize_min) + "-$" + string(money_prize_max);
				event_description_lines[ii][i]=4;
			}
			else if event_kind[ii][i]=ref_event_shinycharm {
				event_description[ii][i]="// SHINY CHARM //\nIncreases shiny encounters for\n10 turns.";
				event_description_lines[ii][i]=3;
			}
			else if event_kind[ii][i]=ref_event_coin {
				event_description[ii][i]="// NEW COIN! //\nSet your coin skin in the\noptions menu.";
				event_description_lines[ii][i]=3;
			}
			else if event_kind[ii][i]=ref_event_tutorial {
				event_description[ii][i]="// " + string_upper(trainer_name[i]) + " //\nBattle HP: " + string(battle_hp[area_zone]*2) +
				" (" + string(battle_hp[area_zone]) + "/" + string(battle_hp[area_zone]) + ")\nReward: $" + string(tutorial_payout);
				event_description_lines[ii][i]=3;
			}
			else if event_kind[ii][i]=ref_event_gymbattle or event_kind[ii][i]=ref_event_elitebattle {
				if latest_zone=area_zone { var reward_text="$" + string(money_prize_badge); }
				else { var reward_text="$" + string(money_prize_min) + "-$" + string(money_prize_max); }
				//
				event_description[ii][i]="// " + string_upper(trainer_name[i]) + " //\nMinimum deck size: " + string(maindeck_size_min) + " cards" +
				"\nBattle HP: " + string(battle_hp[battlehp+1]*2) + " (" + string(battle_hp[battlehp+1]) + "/" + string(battle_hp[battlehp+1]) + ")" +
				"\nReward: " + reward_text;
				event_description_lines[ii][i]=4;
			}
			else if event_kind[ii][i]=ref_event_championbattle {
				event_description[ii][i]="// " + string_upper(trainer_name[i]) + " //\nMinimum deck size: " + string(maindeck_size_min) + " cards" +
				"\nBattle HP: " + string(battle_hp[battlehp+1]*2) + " (" + string(battle_hp[battlehp+1]) + "/" + string(battle_hp[battlehp+1]) + ")";
				event_description_lines[ii][i]=3;
			}
			else if event_kind[ii][i]=ref_event_legendarybattle {
				event_description[ii][i]="// " + string_upper(trainer_name[i]) + " //\nMinimum deck size: " + string(maindeck_size_min) + " cards" +
				"\nBattle HP: " + string(battle_hp[battlehp+1]*2) + " (" + string(player_hp=hp_max-((hp_max*1.5)-hp_max)) + "/" + string(enemy_hp=hp_max+((hp_max*1.5)-hp_max)) + ")";
				event_description_lines[ii][i]=3;
			}
			//
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
else if area_zone=9 { zone_name="Mysterious Cave"; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
var mouse_in_event=-1, mouse_in_fly=-1;
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
		tooltip_lines=event_description_lines[mouse_in_event][roadmap_area];
	}
	//
	fly_prev_x=road_win_x-2;
	fly_prev_y=road_win_y+118;
	fly_next_x=road_win_x+227;
	fly_next_y=road_win_y+118;
	//
	if area_zone>0 and //same conditions as draw
	(((area_zone<area_zone_max-1 or newgameplus = true) and roadmap_area=roadmap_current_max-1) or ((area_zone=area_zone_max-1 or newgameplus = true) and roadmap_area>=roadmap_current_max-roadmap_league_max)) and
	mouse_x>=fly_prev_x and mouse_y>=fly_prev_y and mouse_x<fly_prev_x+16 and mouse_y<fly_prev_y+16 and cursor_hide=false {
		mouse_in_fly=0;
		//
		mouse_cursor=1;
		tooltip_text="Fly to previous city/area.";
		tooltip_lines=1;
	}
	else if (area_zone<area_zone_max-1 or newgameplus = true) and latest_zone>area_zone and //same conditions as draw
	((area_zone<area_zone_max-1 and roadmap_area=roadmap_current_max-1) or ((area_zone=area_zone_max-1 or newgameplus = true) and roadmap_area>=roadmap_current_max-roadmap_league_max)) and
	mouse_x>=fly_next_x and mouse_y>=fly_next_y and mouse_x<fly_next_x+16 and mouse_y<fly_next_y+16 and cursor_hide=false {
		mouse_in_fly=1;
		//
		mouse_cursor=1;
		tooltip_text="Fly to next city/area.";
		tooltip_lines=1;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if event_transition>-1 and fade_black<1 {
	if event_transition=ref_event_victory or event_transition=ref_event_defeat {
		if (mouse_check_button_pressed(mb_right) or keyboard_check_pressed(vk_space)) and
		cursor_hide=false and playing_gym=false and playing_elite=false and playing_champion=false {
			fade_black+=1;
		}
		else {
			fade_black+=0.004; //6.17s (slightly longer than ms_victory and ms_defeat)
		}
	}
	else if event_transition=ref_event_battle or event_transition=ref_event_gymbattle or event_transition=ref_event_elitebattle or event_transition=ref_event_championbattle or
	event_transition=ref_event_legendarybattle or event_transition=ref_event_tutorial or event_transition=ref_event_loop or event_transition=ref_fly_prev or event_transition=ref_fly_next or event_transition=ref_mainmenu {
		fade_black+=0.012;
	}
	else {
		fade_black+=0.04;
	}
}
else if event_transition=-1 and event_transition_standby=-1 and fade_black>0 {
	fade_black-=0.04;
}
else if event_transition>-1 and fade_black>=1 {
	money_show=money;
	//
	if instance_exists(ob_event) {
		if !ob_event.event_cancelled { money -= event_cost_standby; }
		event_cost_standby=0;
		event_cost_standby_levelup=0;
	}
	//
	if event_transition=ref_mainmenu {
		with (ob_splash) { instance_destroy(); }
		with (ob_card_splash) { instance_destroy(); }
		with (ob_background_tile) { instance_destroy(); }
		//
		if area_zone=0 and roadmap_area=0 and zone_first_lap=true { sc_textbox(0); }
	}
	else if event_transition=ref_fly_prev or event_transition=ref_fly_next {
		if event_transition=ref_fly_prev { area_zone--; }
		else if event_transition=ref_fly_next { area_zone++; }
		roadmap_generated=false;
		//
		if latest_city>=area_zone {
			roadmap_area=roadmap_outskirts_max-1;
			zone_first_lap=false;
		}
		else { //not possible anymore since you can't fly away from an area before reaching its city
			//roadmap_area=0;
			//zone_first_lap=true;
		}
		//
		sc_data_save(false);
	}
	else if event_transition=ref_event_loop {
		if area_zone=area_zone_max-1 and roadmap_area>roadmap_current_max-roadmap_league_max {
			roadmap_area=roadmap_current_max-roadmap_league_max;
		}
		else {
			roadmap_area=0;
			roadmap_generated=false;
			zone_first_lap=false;
		}
		//
		if area_zone<area_zone_max-1 or roadmap_area<=roadmap_current_max-roadmap_league_max { sc_data_save(false); }
	}
	else if event_transition=ref_event_loophome {
	if area_zone=area_zone_max-1 and roadmap_area>roadmap_current_max-roadmap_league_max {
		roadmap_area=0;
		zone_first_lap=false;
		//newgameplus = true;
		latest_zone=area_zone_max;
		roadmap_area=2;
		roadmap_generated=false;
	}
	else {
		roadmap_area=0;
		zone_first_lap=false;
		roadmap_generated=false;

	}
	//
	if area_zone<area_zone_max-1 or roadmap_area<=roadmap_current_max-roadmap_league_max { sc_data_save(false); }
	}	
	else if event_transition=ref_event_payout {
		if area_zone=0 and zone_first_lap=true and roadmap_area<roadmap_lab_max { money+=tutorial_payout; } //same conditions also when getting event name
		else { money+=money_payout; }
		if shinycharm >= 1
		{
			shinycharm -= 1;
		}
		roadmap_area++;
		//
		if area_zone<area_zone_max-1 or roadmap_area<=roadmap_current_max-roadmap_league_max { sc_data_save(false); }
	}
	else if event_transition=ref_event_shinycharm {
		sc_playsound(sn_shiny,50,false,false);
		shinycharm += 10;
		roadmap_area++;
		//
		if area_zone<area_zone_max-1 or roadmap_area<=roadmap_current_max-roadmap_league_max { sc_data_save(false); }
	}
	else if event_transition=ref_event_skip {
		roadmap_area++;
		//
		if area_zone<area_zone_max-1 or roadmap_area<=roadmap_current_max-roadmap_league_max { sc_data_save(false); }
	}
	else if event_transition=ref_event_coin {	
		coin_skin += 1;
		if shinycharm >= 1
		{
			shinycharm -= 1;
		}
		roadmap_area++;
		//
		if area_zone<area_zone_max-1 or roadmap_area<=roadmap_current_max-roadmap_league_max { sc_data_save(false); }
	}
	else if event_transition=ref_event_battle or event_transition=ref_event_gymbattle or event_transition=ref_event_elitebattle or event_transition=ref_event_championbattle or
	event_transition=ref_event_legendarybattle or event_transition=ref_event_tutorial {
		instance_create_layer(x,y,"instances",ob_control);
		if playing_tutorial=true { money_prize=tutorial_payout; } //also shown in battle description
		else if playing_champion=true { money_prize=0; } //also shown in battle description
		else if (playing_gym=true or playing_elite=true) and latest_zone=area_zone { money_prize=money_prize_badge; } //also shown in battle description
		else { money_prize=irandom_range(money_prize_min,money_prize_max); } //also shown in battle description
		//
		if event_transition=ref_event_battle {
			music_player=sc_playsound(ms_battle,100,true,true);
		}
		else if event_transition=ref_event_gymbattle {
			music_player=sc_playsound(ms_battle_2,100,true,true);
		}
		else if event_transition=ref_event_elitebattle {
			music_player=sc_playsound(ms_battle_3,100,true,true);
		}
		else if event_transition=ref_event_championbattle {
			music_player=sc_playsound(ms_battle_4,100,true,true);
		}
		else if event_transition=ref_event_legendarybattle {
			music_player=sc_playsound(ms_battle_4,100,true,true);
		}
		else if event_transition=ref_event_tutorial {
			music_player=sc_playsound(ms_tutorial,100,true,true);
		}
	}
	else if event_transition=ref_event_victory or event_transition=ref_event_defeat or event_transition=ref_event_exitbattle {
		//destroy everything except ob_main and ob_background
		with (ob_control) { instance_destroy(); }
		with (ob_card) { instance_destroy(); }
		with (ob_card_space) { instance_destroy(); }
		with (ob_card_effect) { instance_destroy(); }
		with (ob_button_16x16) { instance_destroy(); }
		with (ob_button_15x16) { instance_destroy(); }
		with (ob_button_31x24) { instance_destroy(); }
		with (ob_background_tile) { instance_destroy(); }
		with (ob_damage_num) { instance_destroy(); }
		//
		if (event_transition!=ref_event_victory and playing_elite=true) or playing_champion=true {
			roadmap_area=roadmap_current_max-roadmap_league_max;
		}
		else if (event_transition=ref_event_victory and (playing_gym=true or playing_elite=true)) or (playing_gym=false and playing_elite=false) {
			roadmap_area++;
		}
		//
		music_player=sc_playsound(ms_main,100,true,true);
		if event_transition=ref_event_victory { money+=money_prize; }
		money_prize=0;
		fade_black_exit=0;
		type_chart=false;
		if event_transition = ref_event_defeat && (option_state[opt_challenge]=ch_roguelite_easy || option_state[opt_challenge]=ch_roguelite_medium || 
		option_state[opt_challenge]=ch_roguelite_hard || option_state[opt_challenge]=ch_swiftness) {
			player_lives -= 1;

			if player_lives <=0 {
			button_delete_data=instance_create_layer(screen_options_x+cam_w-60,screen_main_y+4,"instances",ob_button_16x16);
			button_delete_data.button_id=102;
			button_delete_data.button_state = 1;
			}
		
		}
		//
		if playing_tutorial=true {
			sc_textbox(22);
			playing_tutorial=false;
		}
		if playing_gym=true { playing_gym=false; }
		if playing_elite=true { playing_elite=false; }
		if playing_champion=true {
			playing_champion=false;
			if event_transition=ref_event_victory {
				ending_screen=true;
				sc_textbox(50);
				music_player=sc_playsound(ms_ending,100,true,true);
			}
		}
		//
		if roadmap_area<roadmap_current_max {
			if area_zone<area_zone_max-1 or roadmap_area<=roadmap_current_max-roadmap_league_max { 
				sc_data_save(false);
				}}
	}
	else {
		if !instance_exists(ob_event) {
			instance_create_layer(x,y,"instances",ob_event);
		}
		else {
			if event_transition=ref_event_grass or event_transition=ref_event_fire or event_transition=ref_event_water { sc_textbox(1); }
			else if option_state[opt_autodeck]=true and (event_transition=ref_event_freecard or event_transition=ref_event_cardpack or event_transition=ref_event_berry or event_transition=ref_event_holo_freecard  or
			event_transition=ref_event_cardpack_1 or event_transition=ref_event_cardpack_2 or event_transition=ref_event_cardpack_3 or event_transition=ref_event_cardpack_4 or event_transition=ref_event_cardpack_5 or event_transition=ref_event_cardpack_6
			or event_transition=ref_event_cardpack_7 or event_transition=ref_event_cardpack_8 or event_transition=ref_event_cardpack_9) {
				auto_deck_transition=true;
			}
			if ob_event.event_cancelled=false { 
				if shinycharm >= 1
				{
					shinycharm -= 1;
				}
				roadmap_area++; }
			//
			with (ob_event) { instance_destroy(); }
			with (ob_card) { instance_destroy(); }
			with (ob_card_space) { instance_destroy(); }
			with (ob_card_effect) { instance_destroy(); }
			with (ob_button_16x16) { instance_destroy(); }
			with (ob_button_15x16) { instance_destroy(); }
			with (ob_button_31x24) { instance_destroy(); }
			//
			if area_zone<area_zone_max-1 or roadmap_area<=roadmap_current_max-roadmap_league_max { sc_data_save(false); show_debug_message("check1"); }
		}
	}
	//
	if area_zone>latest_city and
	((area_zone<area_zone_max-1 and roadmap_area=roadmap_current_max-1) or (area_zone=area_zone_max-1 and roadmap_area=roadmap_current_max-roadmap_league_max)) {
		latest_city=area_zone; }
	//
	event_transition=-1;
}
else if event_transition=-1 and event_transition_standby=-1 and fade_black<=0 {
	if mouse_check_button_pressed(mb_left) and screen_transition=-1 {
		if mouse_in_event>-1 {
			if money>=event_cost[event_kind[mouse_in_event][roadmap_area]] {
				var event_conditions=true;
				if event_kind[mouse_in_event][roadmap_area]=ref_event_tutorial {
                    for (var i=0; i<5; i++;) {
                        if serial_card_indeck[i][0]=false { event_conditions=false; } //checks serials 0-4 (first 5 cards acquired)
                    }
                    if berry_num_used[0][0]<5 { event_conditions=false; }
                    event_conditions=false;
                }
				else if event_kind[mouse_in_event][roadmap_area]=ref_event_battle or event_kind[mouse_in_event][roadmap_area]=ref_event_gymbattle or
				event_kind[mouse_in_event][roadmap_area]=ref_event_elitebattle or event_kind[mouse_in_event][roadmap_area]=ref_event_championbattle or event_kind[mouse_in_event][roadmap_area]=ref_event_legendarybattle {
					if maindeck_used_total<maindeck_size_min { event_conditions=false; }
				}
				//
				if event_kind[mouse_in_event][roadmap_area]=ref_event_loop and (option_state[opt_challenge]=ch_resolution || option_state[opt_challenge]=ch_swiftness) { event_conditions=false; }
				
				//
				if event_conditions=true {
					event_transition_standby=event_kind[mouse_in_event][roadmap_area];
					
					if (event_transition_standby == ref_event_levelup || event_transition_standby == ref_event_evolution) { event_cost_standby=0; }
					else { event_cost_standby=event_cost[event_transition_standby]; }
					
					sc_playsound(sn_event,50,false,false);
					if event_transition_standby=ref_event_battle { music_player=sc_playsound(ms_battle_intro,100,false,true); }
					
					if event_transition_standby=ref_event_tutorial { sc_textbox(3); }
					else if event_transition_standby=ref_event_gymbattle { sc_textbox(30+area_zone); }
					else if event_transition_standby=ref_event_elitebattle or event_transition_standby=ref_event_championbattle{
						sc_textbox(40+(roadmap_area-(roadmap_current_max-roadmap_league_max)));
					}
					else if event_transition_standby=ref_event_legendarybattle {sc_textbox(45);}
					else {
						event_transition=event_transition_standby;
						event_transition_standby=-1;
						//
						if event_transition=ref_event_glyph { current_glyph_add=event_glyph_add[mouse_in_event][roadmap_area]; }
					}
				}
				else {
					sc_playsound(sn_hurt,50,false,false);
					if event_kind[mouse_in_event][roadmap_area]=ref_event_tutorial { sc_textbox(2); }
					else if event_kind[mouse_in_event][roadmap_area]=ref_event_battle or event_kind[mouse_in_event][roadmap_area]=ref_event_gymbattle or
					event_kind[mouse_in_event][roadmap_area]=ref_event_elitebattle or event_kind[mouse_in_event][roadmap_area]=ref_event_championbattle or
					event_kind[mouse_in_event][roadmap_area]=ref_event_legendarybattle{
						sc_textbox(29); }
				}
			}
			else if money<event_cost[event_kind[mouse_in_event][roadmap_area]] {
				sc_playsound(sn_hurt,50,false,false);
				effect_money_error=1;
			}
		}
		//
		else if mouse_in_fly>-1 {
			if option_state[opt_challenge]!=ch_resolution && option_state[opt_challenge]!=ch_swiftness {
				sc_playsound(sn_event,50,false,false);
				//
				event_cost_standby=0;
				if mouse_in_fly=0 { event_transition=ref_fly_prev; }
				else if mouse_in_fly=1 { event_transition=ref_fly_next; }
			}
			else {
				sc_playsound(sn_hurt,50,false,false);
			}
		}
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————

//CHEATS
if (RUN_FROM_IDE) {	
	if keyboard_check_pressed(vk_f12) { game_restart(); }
	if keyboard_check_pressed(vk_f11) { roadmap_area++; }
	if keyboard_check_pressed(vk_f10) { money+=1000; }
	if keyboard_check_pressed(vk_f9) { 
		event_card_weight[event_card_group_secret] = 10000;
		event_card_weight[event_card_group_environment] = 0;
		event_card_weight[event_card_group_enigma] = 0;
		event_card_weight[event_card_group_stage_2] = 0;
		event_card_weight[event_card_group_stage_3] = 0;
		event_card_weight[event_card_group_common] = 0;
	}
	if keyboard_check_pressed(vk_f8) { 
		event_card_weight[event_card_group_secret] = 0;
		event_card_weight[event_card_group_environment] = 0;
		event_card_weight[event_card_group_enigma] = 10000;
		event_card_weight[event_card_group_stage_2] = 0;
		event_card_weight[event_card_group_stage_3] = 0;
		event_card_weight[event_card_group_common] = 0;
	}
	if keyboard_check_pressed(vk_f7) { 
		event_card_weight[event_card_group_secret] = 1;
		event_card_weight[event_card_group_environment] = 200;
		event_card_weight[event_card_group_enigma] = 15;
		event_card_weight[event_card_group_stage_2] = 250;
		event_card_weight[event_card_group_stage_3] = 50;
		event_card_weight[event_card_group_common] = 9484;
	}

	if instance_exists(ob_control) and keyboard_check_pressed(vk_numpad8) {
		ob_control.player_hp=(ob_control.hp_max*2)-1;
		ob_control.enemy_hp=1;
	}
	if instance_exists(ob_control) and keyboard_check_pressed(vk_numpad7) {
		ob_control.player_hp=1;
		ob_control.enemy_hp=(ob_control.hp_max*2)-1;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if roadmap_area=roadmap_current_max && area_zone != area_zone_max {
	area_zone++;
	if area_zone>latest_zone { latest_zone=area_zone; }
	roadmap_area=0;
	roadmap_generated=false;
	zone_first_lap=true;
	sc_data_save(false);
	sc_data_save(true);
}
else if roadmap_area=roadmap_current_max && area_zone = area_zone_max
{
	zone_first_lap=false;
	area_zone = 0;
	latest_zone=area_zone_max;
	roadmap_area=2;
	roadmap_generated=false;
	newgameplus = true;
	sc_data_save(false);
	sc_data_save(true);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if !instance_exists(ob_control) and !instance_exists(ob_event) {
	var screen_x=camera_get_view_x(view_camera[0]);
	//
	//
	if !instance_exists(ob_splash) && screen_x != screen_options_x {
		if money_show<money {
			sc_playsound(sn_money,50,false,false);
			//
			var money_speed=ceil((money-money_show)/50);
			money_show+=money_speed;
		}
		else if money_show>money {
			sc_playsound(sn_money,50,false,false);
			//
			var money_speed=ceil((money_show-money)/50);
			money_show-=money_speed;
		}
	}
	if screen_x=screen_main_x and event_transition=-1 and event_transition_standby=-1 and screen_transition=-1 and cursor_hide=false and
	(keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A")) or
	(mouse_x>=screen_main_x+32-2 and mouse_y>=screen_main_y+126-2 and mouse_x<=screen_main_x+32+17 and mouse_y<=screen_main_y+126+17)) {
		menu_options_hover=true;
		mouse_cursor=1;
		if mouse_check_button_pressed(mb_left) or keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A")) {
			sc_playsound(sn_click,50,false,false);
			//
			button_exit_game=instance_create_layer(screen_options_x+cam_w-20,screen_main_y+4,"instances",ob_button_16x16);
			button_exit_game.button_id=100;
			button_reset_config=instance_create_layer(screen_options_x+cam_w-40,screen_main_y+4,"instances",ob_button_16x16);
			button_reset_config.button_id=101;
			button_delete_data=instance_create_layer(screen_options_x+cam_w-60,screen_main_y+4,"instances",ob_button_16x16);
			button_delete_data.button_id=102;
			var button_create;
			button_create=instance_create_layer(screen_options_x+cam_w-80,screen_main_y+4,"instances",ob_button_16x16);
			button_create.button_id=103;
			button_create=instance_create_layer(screen_options_x+cam_w-100,screen_main_y+4,"instances",ob_button_16x16);
			button_create.button_id=104;
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
			if auto_deck_transition=false { sc_playsound(sn_click,50,false,false); }
			//
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
			sc_playsound(sn_click,50,false,false);
			//
			with (ob_button_16x16) { instance_destroy(); }
			with (ob_button_15x16) { instance_destroy(); }
			with (ob_button_31x24) { instance_destroy(); }
			button_exit_game=-1;
			button_reset_config=-1;
			button_delete_data=-1;
			fade_black_exit=0;
			fade_red_delete=0;
			screen_transition=2;
			//
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
			sc_playsound(sn_click,50,false,false);
			//
			with (ob_deckbuild) { instance_destroy(); }
			with (ob_card) { instance_destroy(); }
			with (ob_button_16x16) { instance_destroy(); }
			with (ob_button_15x16) { instance_destroy(); }
			with (ob_button_31x24) { instance_destroy(); }
			screen_transition=2;
			//
			if area_zone<area_zone_max-1 or roadmap_area<=roadmap_current_max-roadmap_league_max { sc_data_save(false); show_debug_message("check2"); }
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
		if file_exists(ob_main.saveconf[ob_main.savestate]) { file_delete(ob_main.saveconf[ob_main.savestate]); }
		sc_config_load();
		sc_config_save();
		//
		audio_sound_gain(ms_main,(option_state[opt_music]/100),0);
		audio_sound_gain(ms_league,(option_state[opt_music]/100),0);
		game_restart();
	}
}
if button_delete_data!=-1 {
	if button_delete_data.button_state>=1 {
		sc_config_save();
		if file_exists(ob_main.savedata[ob_main.savestate]) { file_delete(ob_main.savedata[ob_main.savestate]); }
		game_restart();
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_set_font(fn_matchup);
//

//if mouse_x>=(screen_main_x-86) and mouse_y>= (screen_main_y+25) and mouse_x<=(screen_main_x) and mouse_y<=(screen_main_y+40) {

//	if mouse_check_button_pressed(mb_left){
//		sc_config_save();
//		sc_data_save(false);
//		sc_data_save(true);
//		audio_sound_gain(ms_main,(option_state[opt_music]/100),0);
//		audio_sound_gain(ms_league,(option_state[opt_music]/100),0);
//		game_restart();
//	}
//}	

var i=0;
repeat (options_total) {
	if mouse_x>=option_x[i] and mouse_y>=option_y[i]+2 and mouse_x<=option_x[i]+string_width(option_name[i] + option_state_text[i]) and mouse_y<=option_y[i]+10 and cursor_hide=false {
		mouse_cursor=1;
		option_focus[i]=true;
		//
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
			else if i=opt_coin {
					if mouse_check_button_pressed(mb_left) {
						option_state[i]++;
						if option_state[i]>coin_skin { option_state[i]=0; }
					}
					else if mouse_check_button_pressed(mb_right) {
						option_state[i]--;
						if option_state[i]<0 { option_state[i]=coin_skin; }
					}	
			}
			else if i=opt_autodeck {
				if option_state[i]=false { option_state[i]=true; }
				else { option_state[i]=false; }
			}
			else if i=opt_jumping {
					if mouse_check_button_pressed(mb_left) {
						option_state[i]++;
						if option_state[i]>2 { option_state[i]=0; }
					}
					else if mouse_check_button_pressed(mb_right) {
						option_state[i]--;
						if option_state[i]<0 { option_state[i]=2; }
					}	
			}
			else if i=opt_challenge {
				if area_zone=0 and zone_first_lap=true and roadmap_area=0 {
					if mouse_check_button_pressed(mb_left) {
						option_state[i]++;
						if option_state[i]>10 { option_state[i]=0; }
					}
					else if mouse_check_button_pressed(mb_right) {
						option_state[i]--;
						if option_state[i]<0 { option_state[i]=10; }
					}
					//
					roadmap_generated=false;
				}				
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
			//
			sc_playsound(sn_click,50,false,false);
		}
		else if mouse_check_button(mb_left) or mouse_check_button(mb_right) or mouse_wheel_up() or mouse_wheel_down() {
			if i=opt_music or i=opt_sound or i=opt_edge {
				if (mouse_check_button(mb_left) or mouse_wheel_up()) and option_state[i]<100 {
					option_state[i]++;
				}
				else if (mouse_check_button(mb_right) or mouse_wheel_down()) and option_state[i]>0 {
					option_state[i]--;
				}
				//
				if i=opt_music { //still plays at volume 0 to keep the beat animations
					audio_sound_gain(ms_main,(option_state[i]/100),0);
					audio_sound_gain(ms_league,(option_state[i]/100),0);
				}
				//
				if i=opt_sound or mouse_wheel_up() or mouse_wheel_down() { sc_playsound(sn_click,50,false,false); }
			}
		}
	}
	else { option_focus[i]=false; }
	//
	if i=opt_fullscreen or i=opt_vsync or i=opt_filter {
		if option_state[i]=true { option_state_text[i]="ON"; }
		else { option_state_text[i]="OFF"; }
	}
	else if i=opt_scaling {
		option_state_text[i]="x" + string(option_state[i]);
	}
	else if i=opt_music or i=opt_sound {
		option_state_text[i]=string(option_state[i]) + "%";
	}
	else if i=opt_coin {
		if option_state[i]= coin_normal {option_state_text[i]="NORMAL"; }
		else if option_state[i]= coin_aegislash { option_state_text[i]="POKEBALL"; }
		else if option_state[i]= coin_2 { option_state_text[i]="GREATBALL"; }
		else if option_state[i]= coin_3 { option_state_text[i]="ULTRABALL"; }
		else if option_state[i]= coin_4 { option_state_text[i]="MASTERBALL"; }
		else if option_state[i]= coin_5 { option_state_text[i]="PIKACHU"; }
		else if option_state[i]= coin_6 { option_state_text[i]="METAGROSS"; }
		else if option_state[i]= coin_7 { option_state_text[i]="AEGISLASH"; } 
		else if option_state[i]= coin_8 { option_state_text[i]="ZOROARK"; } 
	}
	else if i=opt_autodeck {
		if option_state[i]=true { option_state_text[i]="GO TO DECK"; }
		else { option_state_text[i]="DO NOTHING"; }
	}
	else if i=opt_jumping{
		if option_state[i]=0 { option_state_text[i]="COMBAT AND DECK"; }
		else if option_state[i]=1 { option_state_text[i]="COMBAT ONLY"; }
		else if option_state[i]=2 { option_state_text[i]="OFF"; }
	}
	else if i=opt_edge {
		option_state_text[i]=string(option_state[i]) + "%";
	}
	else if i=opt_challenge {
		if option_state[i]= ch_swiftness {option_state_text[i]="SWIFTNESS"; }
		else if option_state[i]=ch_resolution { option_state_text[i]="RESOLUTION"; }
		else if option_state[i]=ch_dominance { option_state_text[i]="DOMINANCE"; }
		else if option_state[i]=ch_barrenness { option_state_text[i]="BARRENNESS"; }
		else if option_state[i]=ch_roguelite_easy { option_state_text[i]="ROGUE-LITE EASY"; }
		else if option_state[i]=ch_roguelite_medium { option_state_text[i]="ROGUE-LITE MEDIUM"; }
		else if option_state[i]=ch_roguelite_hard { option_state_text[i]="ROGUE-LITE HARD"; }
		else if option_state[i]=ch_delta { option_state_text[i]="SHINY DELTA"; }
		else if option_state[i]=ch_rainbow { option_state_text[i]="RAINBOW"; }
		else if option_state[i]=ch_unlimited { option_state_text[i]="UNLIMITED"; }
		else if option_state[i]= ch_none {option_state_text[i]="NONE"; }
	}
	else if i=opt_playericon {
		option_state_text[i]="   ";
	}
	else if i=opt_bg_type {
		if option_state[i]=0 { option_state_text[i]="MOVING TILES (HORIZONTAL)"; }
		else if option_state[i]=1 { option_state_text[i]="MOVING TILES (VERTICAL)"; }
		else if option_state[i]=2 { option_state_text[i]="IDLE TILES"; }
		else if option_state[i]=3 { option_state_text[i]="LOCATION"; } //also referenced in draw for alpha of bg preview
	}
	//
	if option_focus[opt_challenge]=true {
		if option_state[opt_challenge]= ch_none {
			tooltip_text="// NO CHALLENGES //\n" +
			"No modifiers and play as long as you like..";
			tooltip_lines=3;
		}
		else if option_state[opt_challenge]=ch_resolution {
			tooltip_text="// RESOLUTION //\n" +
			"All money rewards are multiplied x2 and all routes are extended,\nbut cannot go back to outskirts or fly to any previous locations.";
			tooltip_lines=4;
		}
		else if option_state[opt_challenge]=ch_dominance {
			tooltip_text="// DOMINANCE //\n" +
			"Type-advantage attacks from your opponent always result in OHKOs.";
			tooltip_lines=3;
		}
		else if option_state[opt_challenge]=ch_barrenness {
			tooltip_text="// BARRENNESS //\n" +
			"Can only acquire a total of 30 Berries.";
			tooltip_lines=3;
		}
		else if option_state[opt_challenge]=ch_roguelite_easy {
			tooltip_text="// ROGUE-LITE EASY //\n" +
			"You have 10 lives. Save data will be deleted if you lose 10 times.\nPlay carefully!";
			tooltip_lines=4;
			if area_zone=0 and zone_first_lap=true and roadmap_area=0{ player_lives = 10;}
		}
		else if option_state[opt_challenge]=ch_roguelite_medium {
			tooltip_text="// ROGUE-LITE MEDIUM //\n" +
			"You have 5 lives. Save data will be deleted if you lose 5 times.\nPlay carefully!";
			tooltip_lines=4;
			if area_zone=0 and zone_first_lap=true and roadmap_area=0{ player_lives = 5;}
		}
		else if option_state[opt_challenge]=ch_roguelite_hard {
			tooltip_text="// ROGUE-LITE HARD //\n" +
			"You have 1 life. Save data will be deleted if you lose 1 time.\nPlay carefully!";
			tooltip_lines=4;
			if area_zone=0 and zone_first_lap=true and roadmap_area=0{ player_lives = 1;}
		}
		else if option_state[opt_challenge]=ch_swiftness {
			tooltip_text="// RESOLUTION + ROGUE-LITE //\n" +
			"You have 5 lives. All money rewards are multiplied x2 and all\nroutes are extended, but cannot go back to outskirts or fly\nto any previous locations.";
			tooltip_lines=5;
			if area_zone=0 and zone_first_lap=true and roadmap_area=0{ player_lives = 5;}
		}
		else if option_state[opt_challenge]=ch_delta {
			tooltip_text="// SHINY DELTA //\n" +
			"Enemies are able to use shinies and delta Pokemon, but they have\nthe same rates that you do.";
			tooltip_lines=4;
		}
		else if option_state[opt_challenge]=ch_rainbow {
			tooltip_text="// RAINBOW //\n" +
			"Enemy Pokemon are ALWAYS Delta Pokemon.";
			tooltip_lines=3;
		}
		else if option_state[opt_challenge]=ch_unlimited {
			tooltip_text="// UNLIMITED //\n" +
			"No limits on what cards you put in your deck. There is no cap on\nSecrets.";
			tooltip_lines=4;
		}
		//
		tooltip_text=tooltip_text + "\nChallenges can only be set before picking a Starter Deck.";
		
	}
	//
	i++;
}
//
var i=0;
repeat (colorsetup_total) {
	if mouse_x>=colorsetup_r_x[i] and mouse_y>=colorsetup_y[i]+2 and
	mouse_x<=colorsetup_r_x[i]+string_width("R " + string(colorsetup_r[i])) and mouse_y<=colorsetup_y[i]+10 and cursor_hide=false {
		if mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_right) or mouse_wheel_up() or mouse_wheel_down() { sc_playsound(sn_click,50,false,false); }
		mouse_cursor=1;
		colorsetup_focus_r[i]=true;
		if (mouse_check_button(mb_left) or mouse_wheel_up()) and colorsetup_r[i]<255 { colorsetup_r[i]++; }
		else if (mouse_check_button(mb_right) or mouse_wheel_down()) and colorsetup_r[i]>40 { colorsetup_r[i]--; }
	}
	else { colorsetup_focus_r[i]=false; }
	//
	if mouse_x>=colorsetup_g_x[i] and mouse_y>=colorsetup_y[i]+2 and
	mouse_x<=colorsetup_g_x[i]+string_width("G " + string(colorsetup_g[i])) and mouse_y<=colorsetup_y[i]+10 and cursor_hide=false {
		if mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_right) or mouse_wheel_up() or mouse_wheel_down() { sc_playsound(sn_click,50,false,false); }
		mouse_cursor=1;
		colorsetup_focus_g[i]=true;
		if (mouse_check_button(mb_left) or mouse_wheel_up()) and colorsetup_g[i]<255 { colorsetup_g[i]++; }
		else if (mouse_check_button(mb_right) or mouse_wheel_down()) and colorsetup_g[i]>40 { colorsetup_g[i]--; }
	}
	else { colorsetup_focus_g[i]=false; }
	//
	if mouse_x>=colorsetup_b_x[i] and mouse_y>=colorsetup_y[i]+2 and
	mouse_x<=colorsetup_b_x[i]+string_width("B " + string(colorsetup_b[i])) and mouse_y<=colorsetup_y[i]+10 and cursor_hide=false {
		if mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_right) or mouse_wheel_up() or mouse_wheel_down() { sc_playsound(sn_click,50,false,false); }
		mouse_cursor=1;
		colorsetup_focus_b[i]=true;
		if (mouse_check_button(mb_left) or mouse_wheel_up()) and colorsetup_b[i]<255 { colorsetup_b[i]++; }
		else if (mouse_check_button(mb_right) or mouse_wheel_down()) and colorsetup_b[i]>40 { colorsetup_b[i]--; }
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
var progress_r=colorsetup_r[opt_c_char]*1.2, progress_g=colorsetup_g[opt_c_char]*1.2, progress_b=colorsetup_b[opt_c_char]*1.2;
if progress_r>255 { progress_r=255; }
if progress_g>255 { progress_g=255; }
if progress_b>255 { progress_b=255; }
global.color_character_light=make_colour_rgb(progress_r,progress_g,progress_b);


