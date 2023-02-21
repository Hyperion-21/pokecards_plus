var i=0;
repeat (deck_build_all_total) {
	ob_main.main_card_id[i]=deck_card_all[i].card_id;
	ob_main.main_card_level[i]=deck_card_all[i].card_level;
	ob_main.main_card_glyph_a[i]=deck_card_all[i].card_glyph_a;
	ob_main.main_card_glyph_b[i]=deck_card_all[i].card_glyph_b;
	ob_main.main_card_glyph_c[i]=deck_card_all[i].card_glyph_c;
	ob_main.main_card_innate[i]=deck_card_all[i].card_innate;
	ob_main.main_card_shiny[i]=deck_card_all[i].card_shiny;
	ob_main.main_card_holo[i]=deck_card_all[i].card_holo;
	ob_main.main_card_delta[i]=deck_card_all[i].card_delta;
	ob_main.main_card_delta_type[i]=deck_card_all[i].card_delta_type;
	ob_main.main_card_type_a[i]=deck_card_all[i].card_type_a;
	ob_main.main_card_type_b[i]=deck_card_all[i].card_type_b;
	ob_main.main_card_form_value[i]=deck_card_all[i].card_form_value;
	ob_main.main_card_serial[i]=deck_card_all[i].card_serial;
	//
	ob_main.serial_card_indeck[ob_main.main_card_serial[i]][0]=deck_card_all[i].card_indeck[0];
	if deck_setup_save>-1 {
		deck_card_all[i].card_indeck[deck_setup_save]=deck_card_all[i].card_indeck[0];
		ob_main.serial_card_indeck[ob_main.main_card_serial[i]][deck_setup_save]=deck_card_all[i].card_indeck[deck_setup_save];
	}
	//
	i++;
}