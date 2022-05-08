function sc_card_level_stats_main(argument0,argument1) {
/// @param stat //0: hp, 1: atk, 2:def
/// @param level_multiplier
//————————————————————————————————————————————————————————————————————————————————————————————————————
var return_value=0;
//
if argument0=0 { //HP
	return_value=1+round((card_base_hp*argument1)/59); //hp: 1/69/255 -> 1/2/5 to 1/13/44 (base 30 is min for 2 HP)
	if card_secret=false { return_value+=round(return_value*((card_innate-1)/(innate_max-1))); } //max x2
	else { return_value+=round(return_value*2*((card_innate-1)/(innate_max-1))); } //secret: max x3
}
else if argument0=1 { //ATK
	return_value=round((card_base_atk*argument1)/150); //atk: 20/147/300 -> 1/1/2 to 1/10/20
	if return_value<1 { return_value=1; }
	if card_secret=false { return_value+=round(return_value*((card_innate-1)/(innate_max-1))); } //max x2
	else { return_value+=round(return_value*2*((card_innate-1)/(innate_max-1))); } //secret: max x3
}
else if argument0=2 { //DEF
	return_value=round((card_base_def*argument1)/450); //def: 35/142/460 -> 0/0/1 to 1/3/10
	if card_secret=false { return_value+=round(return_value*((card_innate-1)/(innate_max-1))); } //max x2
	else { return_value+=round(return_value*2*((card_innate-1)/(innate_max-1))); } //secret: max x3
}
//
return return_value;
//————————————————————————————————————————————————————————————————————————————————————————————————————
}