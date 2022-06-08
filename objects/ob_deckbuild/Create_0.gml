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
	button_create=instance_create_layer(screen_deck_x+97,screen_main_y+104+(i*16),"instances",ob_button_15x16);
	button_create.button_id=i;
	i++;
}
repeat (5) {
	button_create=instance_create_layer(screen_deck_x+400,screen_main_y+104+((i-5)*16),"instances",ob_button_16x16);
	button_create.button_id=i;
	i++;
}
repeat (5) {
	button_create=instance_create_layer(screen_deck_x+416,screen_main_y+104+((i-10)*16),"instances",ob_button_16x16);
	button_create.button_id=i;
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
for (var i=0; i<=3; i++;) {
	berries_needed_deck[i]=0;
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
	create_card_form_value=ob_main.main_card_form_value[i];
	create_card_serial=ob_main.main_card_serial[i];
	//
	for (var ii=0; ii<=deck_setup_max; ii++;) {
		create_card_indeck[ii]=ob_main.serial_card_indeck[ob_main.main_card_serial[i]][ii];
	}
	//
	deck_card_all[i]=instance_create_layer(x,y,"instances",ob_card);
	i++;
}
//
card_berrydeck_total=ob_main.berrydeck_total;
var i=0;
repeat (4) {
	deck_berry_total[i]=0;
	deck_berry_used[i]=ob_main.berry_num_used[i][0];
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
//
deck_setup_load=-1; //value 0 not used, because current setup is always saved
deck_setup_save=-1; //value 0 not used, because current setup is always saved
//————————————————————————————————————————————————————————————————————————————————————————————————————
tooltip_text="";
tooltip_lines=0;
reorder_type=0; //0 pokemon id, 1 level, 2 attack, 3 defense, 4 hp, 5 delete card
reorder_selected=0;
reorder_swap_standby=0;
