depth=200;
//
if instance_exists(ob_control) { var reference_id=ob_control; }
else if instance_exists(ob_deckbuild) { var reference_id=ob_deckbuild; }
else if instance_exists(ob_event) { var reference_id=ob_event; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
if reference_id=ob_deckbuild or (reference_id=ob_event and ob_event.show_deck=true) { card_face=true; }
else { card_face=false; }
card_played=false;
card_trash=false;
card_enemy=false;
//
card_cat=reference_id.create_card_cat;
for (var i=0; i<=deck_setup_max; i++;) {
	if card_cat=0 and reference_id=ob_deckbuild { card_indeck[i]=reference_id.create_card_indeck[i]; }
	else { card_indeck[i]=false; }
}
if card_cat=0 and reference_id=ob_deckbuild { card_serial=reference_id.create_card_serial; }
else { card_serial=-1; }
//
num_in_maindeck=-1;
num_in_berrydeck=-1;
num_in_all=-1;
//
potential_x=x;
potential_y=y;
//
already_attacked=false;
effect_damaged=0;
//
card_delete_timer=0;
card_delete_timer_max=150;
//
auto_turn_add=false;
if card_cat=0 and reference_id=ob_control { enemy_randomizer=reference_id.create_enemy_randomizer; }
else { enemy_randomizer=false; }
if card_cat=0 and reference_id=ob_control { enemy_costcount=reference_id.create_enemy_costcount; }
else { enemy_costcount=false; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_cat=0 {
	var random_group_chance=irandom(9999);
	//
	do {
		card_id=reference_id.create_card_id;
		if card_id=-1 { var random_card=true; } else { var random_card=false; }
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		if random_card=true and enemy_randomizer=false {
			var allow_id_enigma=false, allow_id_pseudo=false, allow_id_fossil=false, allow_id_starter=false, allow_id_baby=false, allow_id_stage_2=false, allow_id_stage_3=false;
			//
			if random_group_chance<1 { //0.01% secret card
				card_id=irandom_range(1,secret_cards_total)+2000;
				card_innate=1;
			}
			else if random_group_chance<101 { //1% environment card
				card_id=irandom_range(1,environment_cards_total)+2500;
				card_innate=1;
			}
			else {
				card_id=irandom_range(1,normal_poke_id_max);
				card_innate=1;
				//
				var random_id_chance=irandom(99); if random_id_chance<5 { allow_id_enigma=true; } //5% enigma allowed
				var random_id_chance=irandom(99); if random_id_chance<50 { allow_id_pseudo=true; } //50% pseudo allowed
				var random_id_chance=irandom(99); if random_id_chance<50 { allow_id_fossil=true; } //50% fossil allowed
				var random_id_chance=irandom(99); if random_id_chance<25 { allow_id_starter=true; } //25% starter allowed
				var random_id_chance=irandom(99); if random_id_chance<25 { allow_id_baby=true; } //25% baby allowed
				var random_id_chance=irandom(99); if random_id_chance<10 { allow_id_stage_2=true; } //10% stage 2 allowed
				var random_id_chance=irandom(99); if random_id_chance<5 { allow_id_stage_3=true; } //5% stage 3 allowed
			}
			//
			//card_id=irandom_range(000,000); //cheat
			//allow_id_enigma=true; allow_id_pseudo=true; allow_id_fossil=true; allow_id_starter=true; allow_id_baby=true; allow_id_stage_2=true; allow_id_stage_3=true; //cheat
			card_level=irandom_range(1,ob_main.card_level_spawn_limit);
			card_glyph_a=-1;
			card_glyph_b=-1;
			card_glyph_c=-1;
			card_form_value=irandom(999);
		}
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		else if random_card=true and enemy_randomizer=true {
			var allow_id_enigma=false, allow_id_pseudo=false, allow_id_fossil=false, allow_id_starter=false, allow_id_baby=false, allow_id_stage_2=false, allow_id_stage_3=false;
			//
			if random_group_chance<500 { //5% environment card
				card_id=irandom_range(1,environment_cards_total)+2500;
				card_innate=1;
			}
			else {
				card_id=irandom_range(1,normal_poke_id_max);
				//
				if reference_id.create_card_innate=-1 {
					var card_enemy_innate_value=irandom(999);
					if card_enemy_innate_value<1 { card_innate=innate_max; } //0.1%
					else if card_enemy_innate_value<3 { card_innate=5; } //0.2%
					else if card_enemy_innate_value<8 { card_innate=4; } //0.5%
					else if card_enemy_innate_value<18 { card_innate=3; } //1%
					else if card_enemy_innate_value<38 { card_innate=2; } //2%
					else if card_enemy_innate_value<1000 { card_innate=1; } //96.2%
				}
				else { card_innate=reference_id.create_card_innate; }
				//
				//var random_id_chance=irandom(99); if random_id_chance<0 { allow_id_enigma=true; } //0% enigma allowed
				var random_id_chance=irandom(99); if random_id_chance<90 { allow_id_pseudo=true; } //90% pseudo allowed
				var random_id_chance=irandom(99); if random_id_chance<75 { allow_id_fossil=true; } //75% fossil allowed
				var random_id_chance=irandom(99); if random_id_chance<75 { allow_id_starter=true; } //75% starter allowed
				var random_id_chance=irandom(99); if random_id_chance<50 { allow_id_baby=true; } //50% baby allowed
				var random_id_chance=irandom(99); if random_id_chance<90 { allow_id_stage_2=true; } //90% stage 2 allowed
				var random_id_chance=irandom(99); if random_id_chance<80 { allow_id_stage_3=true; } //80% stage 3 allowed
			}
			//
			if reference_id.create_card_level=-1 { card_level=irandom_range(ob_main.card_level_enemy_min,ob_main.card_level_enemy_limit); }
			else { card_level=reference_id.create_card_level; }
			card_glyph_a=reference_id.create_card_glyph_a;
			card_glyph_b=reference_id.create_card_glyph_b;
			card_glyph_c=reference_id.create_card_glyph_c;
			if reference_id.create_card_form_value=-1 { card_form_value=irandom(999); }
			else { card_form_value=reference_id.create_card_form_value; }
		}
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		else {
			card_level=reference_id.create_card_level;
			card_glyph_a=reference_id.create_card_glyph_a;
			card_glyph_b=reference_id.create_card_glyph_b;
			card_glyph_c=reference_id.create_card_glyph_c;
			card_innate=reference_id.create_card_innate;
			card_form_value=reference_id.create_card_form_value;
		}
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		sc_pokelist();
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		if random_card=true or card_glyph_a=-2 or card_glyph_b=-2 or card_glyph_c=-2 {
			if card_glyph_a=-2 { card_glyph_a=-1; } //in case they were -2, which is used for semi-random enemy cards
			if card_glyph_b=-2 { card_glyph_b=-1; }
			if card_glyph_c=-2 { card_glyph_c=-1; }
			//
			if card_id=109 or card_id=110 { card_glyph_a=choose(-1,-1,ref_glyph_mist); } //koffing, weezing
			else if card_id=132 { card_glyph_a=ref_glyph_transform; } //ditto
			//
			if enemy_randomizer=false {
				var card_glyph_chance=irandom(999), card_glyph_total=0;
				if card_glyph_chance<5 { card_glyph_total=2; } //0.5%
				else if card_glyph_chance<25 { card_glyph_total=1; } //2%
				//
				if card_glyph_total>=1 and card_glyph_a=-1 {
					card_glyph_a=sc_glyph_random();
				}
				if card_glyph_total>=2 and card_glyph_b=-1 {
					do {
						card_glyph_b=sc_glyph_random();
					} until (card_glyph_b!=card_glyph_a);
				}
			}
			else {
				var card_glyph_chance=irandom(9999), card_glyph_total=0;
				if card_glyph_chance<280*(ob_main.area_zone+1) { //2.8%, 5.6%, 8.4%, 11.2%, 14%, 16.8%, 19.6%, 22.4%, (25.2%)
					card_glyph_chance=irandom(99);
					if card_glyph_chance<5 { card_glyph_total=3; } //5%
					else if card_glyph_chance<30 { card_glyph_total=2; } //25%
					else if card_glyph_chance<100 { card_glyph_total=1; } //70%
					//
					if card_glyph_total>=1 and card_glyph_a=-1 {
						card_glyph_a=sc_glyph_random();
					}
					if card_glyph_total>=2 and card_glyph_b=-1 {
						do {
							card_glyph_b=sc_glyph_random();
						} until (card_glyph_b!=card_glyph_a);
					}
					if card_glyph_total=3 and card_glyph_c=-1 {
						do {
							card_glyph_c=sc_glyph_random();
						} until (card_glyph_c!=card_glyph_a and card_glyph_c!=card_glyph_b);
					}
				}
			}
		}
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		card_value=sc_card_level_stats_main(0,card_level)+sc_card_level_stats_main(1,card_level)*2+sc_card_level_stats_main(2,card_level)*2;
		var card_rarity=sc_card_level_stats_main(0,10)+sc_card_level_stats_main(1,10)*2+sc_card_level_stats_main(2,10)*2; //checks with max card_level
		//innate value is always 1 on random cards, so it's not considered for rarity
		//
		if random_card=true {
			var card_rarity_chance=0;
			//
			if enemy_randomizer=false {
				card_rarity_chance=irandom(74)+1; //75
			}
			else {
				if card_environment=true or ob_main.playing_gym=true or ob_main.playing_elite=true {
					card_rarity_chance=irandom(74)+1; //75
				}
				else {
					var enemy_rarity_max=34+ob_main.area_zone*15;
					if enemy_rarity_max>74 { enemy_rarity_max=74; }
					card_rarity_chance=irandom(enemy_rarity_max)+1; //35 (above lowest normal-type and dragon-type), 50, 65, 75
				}
			}
			//
			var card_rarity_check=false;
			if card_rarity_chance>card_rarity or card_rarity_chance=75 {
				card_rarity_check=true;
				//
				if card_enigma=true and allow_id_enigma=false { card_rarity_check=false; }
				else if card_pseudo=true and allow_id_pseudo=false { card_rarity_check=false; }
				else if card_fossil=true and allow_id_fossil=false { card_rarity_check=false; }
				else if card_starter=true and allow_id_starter=false { card_rarity_check=false; }
				else if card_stage=0 and allow_id_baby=false { card_rarity_check=false; }
				else if card_stage=2 and allow_id_stage_2=false { card_rarity_check=false; }
				else if card_stage=3 and allow_id_stage_3=false { card_rarity_check=false; }
				//
				if card_rarity_check=true {
					card_rarity_chance=irandom(9)+1;
					if card_rarity_chance>=card_level { card_rarity_check=true; }
					else { card_rarity_check=false; }
				}
				//
				if card_rarity_check=true and enemy_randomizer=true and card_environment=false {
					card_rarity_check=false;
					//
					for (var i=0; i<=17; i++;) {
						var type_condition_chance=irandom(99);
						if type_condition_chance<ob_control.enemy_type_chance[i] and (card_type_a=i or card_type_b=i) {
							card_rarity_check=true;
						}
					}
				}
			}
		}
	} until (random_card=false or (card_rarity_check=true and card_name!=""));
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	sc_card_level_stats_all(true,true);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if card_cat=1 {
	card_id=reference_id.create_card_id;
	if card_id=-1 { var random_card=true; } else { var random_card=false; }
	//
	if random_card=true {
		var card_berry_chance=irandom(99);
		if card_berry_chance<99 { card_id=choose(3000,3001,3002); }
		else { card_id=3003; }
	}
	//
	switch (card_id) {
		case 3000:
			card_name="Oran Berry"; break;
		case 3001:
			card_name="Leppa Berry"; break;
		case 3002:
			card_name="Lum Berry"; break;
		case 3003:
			card_name="Enigma Berry"; break;
	}
}