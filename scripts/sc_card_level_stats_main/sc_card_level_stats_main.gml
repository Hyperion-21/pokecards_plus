function sc_card_level_stats_main(argument0) {
/// @param stat //0: hp, 1: atk, 2:def
//————————————————————————————————————————————————————————————————————————————————————————————————————
var return_value=0;
//
if argument0=0 { //HP
	return_value=1+floor((card_base_hp*card_level)/30); //hp: 1/255 -> 1/9 to 1/86
	return_value+=ceil(return_value*((card_innate-1)/(ob_main.innate_max-1))); //max x2
}
else if argument0=1 { //ATK
	return_value=ceil((card_base_atk*card_level)/100); //atk: 20/~250 -> 1/2 to 2/25
	return_value+=ceil(return_value*((card_innate-1)/(ob_main.innate_max-1))); //max x2
}
else if argument0=2 { //DEF
	return_value=floor((card_base_def*card_level)/300); //def: 35/460 -> 0/1 to 1/15
	return_value+=ceil(return_value*((card_innate-1)/(ob_main.innate_max-1))); //max x2
}
//
return return_value;
//————————————————————————————————————————————————————————————————————————————————————————————————————
}