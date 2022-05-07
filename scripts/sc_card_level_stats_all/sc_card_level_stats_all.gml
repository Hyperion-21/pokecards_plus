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
//
var var_card_innate=card_innate;
card_innate=1;
var card_max_common_value=sc_card_level_stats_main(0,10)+sc_card_level_stats_main(1,10)*2+sc_card_level_stats_main(2,10)*2; //checks with max card_level and base card_innate
card_innate=var_card_innate;
//————————————————————————————————————————————————————————————————————————————————————————————————————
if argument1=true {
	if card_full_hp<=1 and card_full_atk<=1 and card_full_def<=0 { card_cost_total=0; }
	else if card_evo[0]=-1 and card_max_common_value>=30 { card_cost_total=2; } //not shuckle, smeargle, etc.
	else { card_cost_total=1; }
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