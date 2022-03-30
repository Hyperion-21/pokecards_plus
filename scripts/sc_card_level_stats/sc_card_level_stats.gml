function sc_card_level_stats() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
card_full_hp=1+floor((card_base_hp*card_level)/30); //hp: 1/255 -> 1/9 to 1/86
card_full_atk=ceil((card_base_atk*card_level)/100); //atk: 20/~250 -> 1/2 to 2/25
card_full_def=floor((card_base_def*card_level)/300); //def: 35/460 -> 0/1 to 1/15
//
card_full_hp+=ceil(card_full_hp*((card_souls-1)/5)); //max x2 (5)
card_full_atk+=ceil(card_full_atk*((card_souls-1)/5)); //max x2 (5)
card_full_def+=ceil(card_full_def*((card_souls-1)/5)); //max x2 (5)
//
card_atk=card_full_atk;
card_def=card_full_def;
card_hp=card_full_hp;
//
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
//————————————————————————————————————————————————————————————————————————————————————————————————————
}