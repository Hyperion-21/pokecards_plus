function sc_card_level_stats_main(argument0,argument1) {
/// @param stat //0: hp, 1: atk, 2:def
/// @param level_multiplier
//————————————————————————————————————————————————————————————————————————————————————————————————————
var return_value=0;
//
if argument0=0 { //HP
	var min_value=1;
	//return_value=1+round((card_base_hp*argument1)/49); //hp: 1/69/255 -> 1/2/6 to 1/15/53 (base 25 is min for 2 HP)
	if card_base_hp<=20 and argument1=1 { return_value=1; } //base 20 and lower: 1 HP at level 1
	else { return_value=1+round((sqrt(card_base_hp-1)*argument1)/7); } //hp: 1/69/255 -> 1/2/3 to 1/13/24
}
else if argument0=1 { //ATK
	var min_value=1;
	//return_value=round((card_base_atk*argument1)/130); //atk: 20/147/300 -> 1/1/2 to 2/11/23
	return_value=round((sqrt(card_base_atk)*argument1)/12); //atk: 20/147/300 -> 1/1/1 to 4/10/14
	if return_value<min_value { return_value=min_value; }
}
else if argument0=2 { //DEF
	var min_value=0;
	//return_value=round((card_base_def*argument1)/450); //def: 35/142/460 -> 0/0/1 to 1/3/10
	return_value=round((sqrt(card_base_def)*argument1)/28); //def: 35/142/460 -> 0/0/1 to 2/4/8
}
//
if card_secret=false { return_value+=round(return_value*((card_innate-1)/(innate_max-1))/2); } //max x1.5
else { return_value+=round(return_value*((card_innate-1)/(innate_max-1))); } //secret: max x2
if return_value<min_value { return_value=min_value; }
//
return return_value;
//————————————————————————————————————————————————————————————————————————————————————————————————————
}