depth=-1000;
//————————————————————————————————————————————————————————————————————————————————————————————————————
stored_x=4;
stored_y=4;
hold_stored_bar=false;
//
used_x=4;
used_y=204;
hold_used_bar=false;
//————————————————————————————————————————————————————————————————————————————————————————————————————
var i=0, button_create;
repeat (5) {
	button_create=instance_create_layer(ob_main.screen_deck_x+97,ob_main.screen_main_y+104+(i*16),"instances",ob_button_15x16);
	button_create.button_id=i;
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
deck_build_all_total=ob_main.maindeck_total;
var i=0;
repeat (deck_build_all_total) {
	create_card_cat=0;
	create_card_id=ob_main.main_card_id[i];
	create_card_level=ob_main.main_card_level[i];
	create_card_glyph_a=ob_main.main_card_glyph_a[i];
	create_card_glyph_b=ob_main.main_card_glyph_b[i];
	create_card_glyph_c=ob_main.main_card_glyph_c[i];
	create_card_innate=ob_main.main_card_innate[i];
	create_card_indeck=ob_main.main_card_indeck[i];
	//
	deck_card_all[i]=instance_create_layer(x,y,"instances",ob_card);
	i++;
}
//
card_berrydeck_total=ob_main.berrydeck_total;
var i=0;
repeat (4) {
	deck_berry_total[i]=0;
	deck_berry_used[i]=ob_main.berry_num_used[i];
	i++;
}
var i=0;
repeat (card_berrydeck_total) {
	if deck_berry_total[ob_main.berry_card_id[i]-3000]=0 {
		create_card_cat=1;
		create_card_id=ob_main.berry_card_id[i];
		deck_card_berry[ob_main.berry_card_id[i]-3000]=instance_create_layer(x,y,"instances",ob_card);
	}
	deck_berry_total[ob_main.berry_card_id[i]-3000]++;
	i++;
}
//
deck_build_stored_total=0;
deck_build_used_total=0;
deck_build_used_max=50;
deck_build_used_min=5;
//————————————————————————————————————————————————————————————————————————————————————————————————————
tooltip_text="";
tooltip_lines=0;
reorder_type=0; //0 pokemon id, 1 level, 2 attack, 3 defense, 4 hp, 5 delete card
reorder_selected=0;