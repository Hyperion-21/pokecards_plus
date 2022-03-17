depth=200;
//
if instance_exists(ob_control) { var reference_id=ob_control; }
else { var reference_id=ob_deckbuild; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
if instance_exists(ob_control) { card_face=false; }
else { card_face=true; }
card_played=false;
card_trash=false;
card_enemy=false;
//
card_cat=reference_id.create_card_cat;
card_id=reference_id.create_card_id;
//
num_in_maindeck=-1;
num_in_berrydeck=-1;
//
potential_x=x;
potential_y=y;
//
already_attacked=false;
effect_damaged=0;
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_cat=0 {
	do {
		card_level=reference_id.create_card_level;
		card_glyph_a=reference_id.create_card_glyph_a;
		card_glyph_b=reference_id.create_card_glyph_b;
		card_glyph_c=reference_id.create_card_glyph_c;
		//
		if card_id<=386 { card_sheet=sp_poke_a; }
		else if card_id<=2000 { card_sheet=sp_poke_b; }
		else { card_sheet=sp_poke_c; }
		var i=0;
		repeat (8) {
			card_evo[i]=-1;
			i++;
		}
		card_enigma=false;
		card_secret=false;
		card_environment=false;
		//
		sc_pokelist();
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		//var card_glyph_chance=irandom(999)+1, card_glyph_total=0;
		//if card_glyph_chance<=1 { card_glyph_total=3; } //0.1%
		//else if card_glyph_chance<=11 { card_glyph_total=2; } //1%
		//else if card_glyph_chance<=31 { card_glyph_total=1; } //2%
		//if card_glyph_total>=1 and card_glyph_a=-1 {
		//	card_glyph_a=irandom_range(0,17);
		//}
		//if card_glyph_total>=2 and card_glyph_b=-1 {
		//	do {
		//		card_glyph_b=irandom_range(0,17);
		//	} until (card_glyph_b!=card_glyph_a);
		//}
		//if card_glyph_total=3 and card_glyph_c=-1 {
		//	do {
		//		card_glyph_c=irandom_range(0,17);
		//	} until (card_glyph_c!=card_glyph_a and card_glyph_c!=card_glyph_b);
		//}
		//
		card_full_hp=1+floor((card_base_hp*card_level)/30); //hp: 1/255 -> 1/9 to 1/86
		card_full_atk=ceil((card_base_atk*card_level)/100); //atk: 20/~250 -> 1/2 to 2/25
		card_full_def=floor((card_base_def*card_level)/300); //def: 35/460 -> 0/1 to 1/15
		//
		card_atk=card_full_atk;
		card_def=card_full_def;
		card_hp=card_full_hp;
		//
		card_rarity=1+floor((card_base_hp*10)/30)+ceil((card_base_atk*10)/100)*2+floor((card_base_def*10)/300)*2;
		card_rarity=card_rarity*(1+(1/9)*(card_level-1));
		//
		var card_rarity_chance=irandom(249)+1, card_rarity_check=false;
		if card_rarity_chance>card_rarity {
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
	if card_full_hp+card_full_atk*2+card_full_def*2>=50 { card_cost_total=2; }
	else if card_full_hp+card_full_atk*2+card_full_def*2>=10 { card_cost_total=1; }
	else { card_cost_total=0; }
	if card_enigma=true { card_cost_total++; }
	if card_environment=true { card_cost_total=0; }
	//
	var i=0;
	repeat (3) {
		card_cost[i]=-1;
		i++;
	}
	if card_cost_total=1 and card_enigma=false { card_cost[0]=card_type_a; }
	else if card_cost_total=1 and card_enigma=true { card_cost[0]=20; }
	else if card_cost_total=2 and card_type_b=-1 and card_enigma=false { card_cost[0]=card_type_a; card_cost[1]=card_type_a; }
	else if card_cost_total=2 and card_type_b>=0 and card_enigma=false { card_cost[0]=card_type_a; card_cost[1]=card_type_b; }
	else if card_cost_total=2 and card_enigma=true { card_cost[0]=card_type_a; card_cost[1]=20; }
	else if card_cost_total=3 and card_type_b=-1 and card_enigma=true { card_cost[0]=card_type_a; card_cost[1]=card_type_a; card_cost[2]=20; }
	else if card_cost_total=3 and card_type_b>=0 and card_enigma=true { card_cost[0]=card_type_a; card_cost[1]=card_type_b; card_cost[2]=20; }
	//
	card_cost_total_type[0]=0; //oran
	card_cost_total_type[1]=0; //leppa
	card_cost_total_type[2]=0; //lum
	card_cost_total_type[3]=0; //enigma
	//
	var i=0;
	repeat (3) {
		//normal, grass, fire, water, electric, flying
		if card_cost[i]=00 or card_cost[i]=01 or card_cost[i]=02 or card_cost[i]=03 or card_cost[i]=04 or card_cost[i]=05 {
			card_cost[i]=0; //oran
			card_cost_total_type[0]++;
		}
		//psychic, fairy, bug, poison, ghost, dark
		else if card_cost[i]=07 or card_cost[i]=08 or card_cost[i]=11 or card_cost[i]=12 or card_cost[i]=16 or card_cost[i]=17 {
			card_cost[i]=1; //leppa
			card_cost_total_type[1]++;
		}
		//fighting, ground, rock, ice, dragon, steel
		else if card_cost[i]=06 or card_cost[i]=09 or card_cost[i]=10 or card_cost[i]=13 or card_cost[i]=14 or card_cost[i]=15 {
			card_cost[i]=2; //lum
			card_cost_total_type[2]++;
		}
		//enigma
		else if card_cost[i]=20 {
			card_cost[i]=3; //enigma
			card_cost_total_type[3]++;
		}
		i++;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if card_cat=1 {
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