function sc_card_level_stats_main(argument0) {
/// @param stat //0: hp, 1: atk, 2:def
//————————————————————————————————————————————————————————————————————————————————————————————————————
var return_value=0;
//
if argument0=0 { //HP
	return_value=1+round((card_base_hp*card_level)/50); //hp: 1/69/255 -> 1/2/6 to 1/15/52
	return_value+=round(return_value*((card_innate-1)/(ob_main.innate_max-1))); //max x2
}
else if argument0=1 { //ATK
	return_value=round((card_base_atk*card_level)/125); //atk: 20/147/300 -> 1/1/2 to 2/12/24
	if return_value<1 { return_value=1; }
	return_value+=round(return_value*((card_innate-1)/(ob_main.innate_max-1))); //max x2
}
else if argument0=2 { //DEF
	return_value=round((card_base_def*card_level)/300); //def: 35/142/460 -> 0/0/2 to 1/5/15
	return_value+=round(return_value*((card_innate-1)/(ob_main.innate_max-1))); //max x2
}
//
return return_value;
//————————————————————————————————————————————————————————————————————————————————————————————————————
}