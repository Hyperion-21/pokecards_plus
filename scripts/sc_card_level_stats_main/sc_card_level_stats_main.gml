function sc_card_level_stats_main(argument0,argument1) {
/// @param stat //0: hp, 1: atk, 2:def
/// @param level_multiplier
//————————————————————————————————————————————————————————————————————————————————————————————————————
var return_value=0;
//
if argument0=0 { //HP
	var min_value=1;
	if card_base_hp<=20 and argument1=1 { return_value=1; } //base 20 and lower: 1 HP at level 1
	else { return_value=((sqrt(card_base_hp-1)*argument1)/6)+1; } //hp: 1/69/255 -> 1/2/4 to 1/15/28
}
else if argument0=1 { //ATK
	if card_base_atk>0 { var min_value=1; } else { var min_value=0; }
	return_value=((sqrt(card_base_atk)*argument1)/12); //atk: 20/147/300 -> 1/1/1 to 4/10/14
}
else if argument0=2 { //DEF
	var min_value=0;
	return_value=((sqrt(card_base_def)*argument1)/28); //def: 35/142/460 -> 0/0/1 to 2/4/8
}
//
if card_secret=false { return_value+=(return_value*((card_innate-1)/(innate_max-1))*0.42); } //max x1.42
else { return_value+=(return_value*((card_innate-1)/(innate_max-1))*1.5); } //secret: max x2.5
//
return_value=round(return_value);
if return_value<min_value { return_value=min_value; }
//
return return_value;
//————————————————————————————————————————————————————————————————————————————————————————————————————
}