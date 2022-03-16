depth=-2100;
//————————————————————————————————————————————————————————————————————————————————————————————————————
deck_build_total=ob_main.maindeck_total;
deck_build_used=0;
deck_build_stored=deck_build_total-deck_build_used;
var i=0;
repeat (deck_build_total) {
	create_card_cat=0;
	create_card_id=ob_main.main_card_id[i];
	create_card_level=ob_main.main_card_level[i];
	create_card_glyph_a=ob_main.main_card_glyph_a[i];
	create_card_glyph_b=ob_main.main_card_glyph_b[i];
	create_card_glyph_c=ob_main.main_card_glyph_c[i];
	//
	card_maindeck[i]=instance_create_layer(ob_main.screen_deck_x+(12*i),ob_main.screen_main_y+4,"instances",ob_card);
	card_maindeck[i].num_in_maindeck=i;
	i++;
}
//
//card_berrydeck_total=ob_main.berrydeck_total;
//var i=0;
//repeat (card_berrydeck_total) {
//	create_card_cat=1;
//	create_card_id=ob_main.berry_card_id[i];
	//
//	card_berrydeck[i]=instance_create_layer(cam_x+10,cam_y+181,"instances",ob_card);
//	card_berrydeck[i].num_in_berrydeck=i;
//	i++;
//}
//
//card_hand_total=0;
//card_hand_max=12;
//var i=0;
//repeat (card_hand_max+1) { //+1 to replace value when using last card when hand is full
//	card_hand[i]=-1;
//	i++;
//}
//————————————————————————————————————————————————————————————————————————————————————————————————————
tooltip_text="";
card_focus=-1; //id