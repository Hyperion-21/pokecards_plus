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
if card_cat=1 or reference_id=ob_control or reference_id=ob_event { card_indeck=false; }
else { card_indeck=reference_id.create_card_indeck; }
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
		//
		if card_id=-1 {
			card_id=irandom_range(1,ob_main.normal_poke_id_max+ob_main.secret_cards_total+ob_main.environment_cards_total); //from 1 to max normal + secret + environment cards
			if card_id>ob_main.normal_poke_id_max+ob_main.secret_cards_total { card_id+=2500-ob_main.normal_poke_id_max-ob_main.secret_cards_total; } //environment cards
			else if card_id>ob_main.normal_poke_id_max { card_id+=2000-ob_main.normal_poke_id_max; } //secret cards
			//
			card_level=10//irandom_range(1,floor((ob_main.area_zone+1)/2)+1); //max: 1 2 2 3 3 4 4 5
			card_glyph_a=01//-1;
			card_glyph_b=-1;
			card_glyph_c=-1;
			card_innate=1;
		}
		else {
			card_level=reference_id.create_card_level;
			card_glyph_a=reference_id.create_card_glyph_a;
			card_glyph_b=reference_id.create_card_glyph_b;
			card_glyph_c=reference_id.create_card_glyph_c;
			card_innate=reference_id.create_card_innate;
		}
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		sc_pokelist();
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		if card_id=-1 {
			var card_glyph_chance=irandom(999)+1, card_glyph_total=0;
			if card_glyph_chance<=1 { card_glyph_total=3; } //0.1%
			else if card_glyph_chance<=11 { card_glyph_total=2; } //1%
			else if card_glyph_chance<=31 { card_glyph_total=1; } //2%
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
		var card_rarity_chance=irandom(199)+1, card_rarity_check=false;
		if card_rarity_chance=200 or card_rarity_chance>card_rarity {
			card_rarity_check=true;
			//
			if card_secret=true { //1% stays
				card_rarity_chance=irandom(99)+1;
				if card_rarity_chance>=100 { card_rarity_check=true; }
				else { card_rarity_check=false; }
			}
			if card_enigma=true and card_rarity_check=true { //2% stays
				card_rarity_chance=irandom(99)+1;
				if card_rarity_chance>=99 { card_rarity_check=true; }
				else { card_rarity_check=false; }
			}
			if card_environment=true and card_rarity_check=true { //25% stays
				card_rarity_chance=irandom(99)+1;
				if card_rarity_chance>=76 { card_rarity_check=true; }
				else { card_rarity_check=false; }
			}
			//
			if card_stage=0 and card_rarity_check=true { //25% stays
				card_rarity_chance=irandom(99)+1;
				if card_rarity_chance>=76 { card_rarity_check=true; }
				else { card_rarity_check=false; }
			}
			else if card_stage=2 and card_rarity_check=true { //20% stays
				card_rarity_chance=irandom(99)+1;
				if card_rarity_chance>=81 { card_rarity_check=true; }
				else { card_rarity_check=false; }
			}
			else if card_stage=3 and card_rarity_check=true { //10% stays
				card_rarity_chance=irandom(99)+1;
				if card_rarity_chance>=91 { card_rarity_check=true; }
				else { card_rarity_check=false; }
			}
			//
			if card_rarity_check=true {
				card_rarity_chance=irandom(9)+1;
				if card_rarity_chance>=card_level { card_rarity_check=true; }
				else { card_rarity_check=false; }
			}
		}
	} until (card_rarity_check=true and card_name!="");
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	sc_card_level_stats_all(true,true);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if card_cat=1 {
	card_id=reference_id.create_card_id;
	//
	if card_id=-1 {
		var card_berry_chance=irandom(999)+1;
		if card_berry_chance<=990 { card_id=choose(3000,3001,3002); }
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