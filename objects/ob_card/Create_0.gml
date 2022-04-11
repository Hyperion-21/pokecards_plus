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
for (var i=0; i<=ob_main.deck_setup_max; i++;) {
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
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_cat=0 {
	do {
		card_id=reference_id.create_card_id;
		if card_id=-1 { var random_card=true; } else { var random_card=false; }
		//
		if random_card=true {
			var random_id_chance=irandom(9999), allow_id_enigma=false, allow_id_baby=false, allow_id_stage_2=false, allow_id_stage_3=false;
			//
			if random_id_chance<1 { //0.01% secret card
				card_id=irandom_range(1,ob_main.secret_cards_total)+2000;
			}
			else if random_id_chance<101 { //1% environment card
				card_id=irandom_range(1,ob_main.environment_cards_total)+2500;
			}
			else {
				card_id=irandom_range(1,ob_main.normal_poke_id_max);
				//
				random_id_chance=irandom(99); if random_id_chance<1 { allow_id_enigma=true; } //1% enigma allowed
				random_id_chance=irandom(99); if random_id_chance<25 { allow_id_baby=true; } //25% baby allowed
				random_id_chance=irandom(99); if random_id_chance<10 { allow_id_stage_2=true; } //10% stage 2 allowed
				random_id_chance=irandom(99); if random_id_chance<5 { allow_id_stage_3=true; } //5% stage 3 allowed
			}
			//
			//card_id=irandom_range(95,103); allow_id_enigma=true; allow_id_baby=true; allow_id_stage_2=true; allow_id_stage_3=true; //cheat
			card_level=irandom_range(1,floor((ob_main.area_zone+1)/1.5)+1); //max: 1 2 3 3 4 5 5 6
			card_glyph_a=-1;
			card_glyph_b=-1;
			card_glyph_c=-1;
			card_innate=1;
			card_form_value=irandom(999);
		}
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
		if random_card=true {
			var card_glyph_chance=irandom(999), card_glyph_total=0;
			if card_glyph_chance<1 { card_glyph_total=3; } //0.1%
			else if card_glyph_chance<6 { card_glyph_total=2; } //0.5%
			else if card_glyph_chance<16 { card_glyph_total=1; } //1%
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
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		card_value=sc_card_level_stats_main(0)+sc_card_level_stats_main(1)*2+sc_card_level_stats_main(2)*2;
		var card_rarity=card_value*(1+(1/9)*(card_level-1)); //level rarity: x1 to x2
		//innate value is always 1 on random cards, so it's not considered for rarity
		//
		if random_card=true {
			var card_rarity_chance=irandom(199)+1, card_rarity_check=false;
			if card_rarity_chance>card_rarity or card_rarity_chance=200 {
				card_rarity_check=true;
				//
				if card_enigma=true and allow_id_enigma=false { card_rarity_check=false; }
				else if card_stage=0 and allow_id_baby=false and allow_id_enigma=false { card_rarity_check=false; }
				else if card_stage=2 and allow_id_stage_2=false and allow_id_enigma=false { card_rarity_check=false; }
				else if card_stage=3 and allow_id_stage_3=false and allow_id_enigma=false { card_rarity_check=false; }
				//
				if card_rarity_check=true {
					card_rarity_chance=irandom(9)+1;
					if card_rarity_chance>=card_level { card_rarity_check=true; }
					else { card_rarity_check=false; }
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