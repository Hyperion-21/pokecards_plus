depth=-1000;
//————————————————————————————————————————————————————————————————————————————————————————————————————
stored_x=4;
stored_y=4;
hold_stored_bar=false;
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
	deck_card_main[i]=instance_create_layer(x,y,"instances",ob_card);
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
//	i++;
//}
//
deck_build_used_max=50;
var i=0;
repeat (deck_build_used_max+1) { //+1 to replace value when using last card when hand is full
	deck_card_used[i]=-1;
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
tooltip_text="";
card_focus=-1; //id