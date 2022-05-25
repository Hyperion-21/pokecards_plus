function sc_card_level_stats_all(argument0,argument1) {
/// @param update_hp
/// @param update_costs
//————————————————————————————————————————————————————————————————————————————————————————————————————
if argument0=true { card_full_hp=sc_card_level_stats_main(0,card_level); }
card_full_atk=sc_card_level_stats_main(1,card_level);
card_full_def=sc_card_level_stats_main(2,card_level);
//
if argument0=true { card_hp=card_full_hp; }
card_atk=card_full_atk;
card_def=card_full_def;
//————————————————————————————————————————————————————————————————————————————————————————————————————
card_value=card_full_hp+card_full_atk*2+card_full_def*2;
//————————————————————————————————————————————————————————————————————————————————————————————————————
if argument1=true {
	if card_value<=3 { card_cost_total=0; } //and also used in tutorial for card with glyph
	else { card_cost_total=1; }
	//
	if (card_glyph_a>=0 and card_glyph_a<glyph_common_amount) or (card_glyph_b>=0 and card_glyph_b<glyph_common_amount) or (card_glyph_c>=0 and card_glyph_c<glyph_common_amount) {
		card_cost_total++; } //similar conditions in ob_card_space for showing new cost when adding a glyph to an empty card
	//
	if card_environment=true { card_cost_total=0; }
	//
	for (var i=0; i<=2; i++;) {
		card_cost[i]=sc_card_cost_map(card_cost_total,card_enigma,card_type_a,card_type_b,i);
	}
	//
	card_cost_total_type[0]=0; //oran
	card_cost_total_type[1]=0; //leppa
	card_cost_total_type[2]=0; //lum
	card_cost_total_type[3]=0; //enigma
	//
	var i=0;
	repeat (3) { //cost types are also considered for tutorial enemy deck, and shown in ob_card_space when adding a glyph to an empty card
		//normal, grass, fire, water, electric, flying
		if card_cost[i]=00 or card_cost[i]=01 or card_cost[i]=02 or card_cost[i]=03 or card_cost[i]=04 or card_cost[i]=05 {
			card_cost[i]=0; //oran
			card_cost_total_type[0]++;
			if enemy_costcount=true { ob_control.enemy_deck_fullcost[0]++; }
		}
		//psychic, fairy, bug, poison, ghost, dark
		else if card_cost[i]=07 or card_cost[i]=08 or card_cost[i]=11 or card_cost[i]=12 or card_cost[i]=16 or card_cost[i]=17 {
			card_cost[i]=1; //leppa
			card_cost_total_type[1]++;
			if enemy_costcount=true { ob_control.enemy_deck_fullcost[1]++; }
		}
		//fighting, ground, rock, ice, dragon, steel
		else if card_cost[i]=06 or card_cost[i]=09 or card_cost[i]=10 or card_cost[i]=13 or card_cost[i]=14 or card_cost[i]=15 {
			card_cost[i]=2; //lum
			card_cost_total_type[2]++;
			if enemy_costcount=true { ob_control.enemy_deck_fullcost[2]++; }
		}
		//enigma
		else if card_cost[i]=20 {
			card_cost[i]=3; //enigma
			card_cost_total_type[3]++;
			if enemy_costcount=true { ob_control.enemy_deck_fullcost[3]++; }
		}
		i++;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}