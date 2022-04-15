depth=-1000;
//————————————————————————————————————————————————————————————————————————————————————————————————————
event_kind=ob_main.event_transition;
count_berries=true;
tooltip_text="";
tooltip_lines=0;
show_deck=false;
apply_event=false;
event_applied=false;
event_cancelled=false;
//————————————————————————————————————————————————————————————————————————————————————————————————————
if event_kind=ref_event_cardpack or event_kind=ref_event_berry {
	if event_kind=ref_event_cardpack {
		card_prize=4;
		var main_amount=3, berry_amount=1;
	}
	else if event_kind=ref_event_berry {
		card_prize=4;
		var main_amount=0, berry_amount=4;
	}
	var i=0;
	repeat (card_prize) {
		if main_amount>0 and berry_amount>0 { create_card_cat=choose(0,1); }
		else if main_amount>0 and berry_amount=0 { create_card_cat=0; }
		else if main_amount=0 and berry_amount>0 { create_card_cat=1; }
		if create_card_cat=0 { main_amount--; }
		else { berry_amount--; }
		create_card_id=-1;
		//
		instance_create_layer(screen_main_x+118+(73*i),screen_main_y+104,"instances",ob_card);
		i++;
	}
	//
	button_create=instance_create_layer(screen_main_x+cam_w-24,screen_main_y+cam_h-24,"instances",ob_button_16x16);
	button_create.button_id=2;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if event_kind=ref_event_freecard {
	card_prize=1;
	var i=0;
	repeat (3) {
		create_card_cat=0;
		create_card_id=-1;
		//
		instance_create_layer(screen_main_x+155+(72*i),screen_main_y+104,"instances",ob_card);
		i++;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if event_kind=ref_event_grass or event_kind=ref_event_fire or event_kind=ref_event_water {
	card_prize=15;
	var i=0;
	repeat (card_prize) {
		if i<=6 {
			create_card_cat=0;
			if i=0 and event_kind=ref_event_grass { create_card_id=001; } //bulbasaur
			else if i=1 and event_kind=ref_event_grass { create_card_id=152; } //chikorita
			else if i=0 and event_kind=ref_event_fire { create_card_id=004; } //charmander
			else if i=1 and event_kind=ref_event_fire { create_card_id=155; } //cyndaquil
			else if i=0 and event_kind=ref_event_water { create_card_id=007; } //squirtle
			else if i=1 and event_kind=ref_event_water { create_card_id=158; } //totodile
			else if i=2 { create_card_id=016; } //pidgey
			else if i=3 { create_card_id=021; } //spearow
			else if i=4 { create_card_id=019; } //rattata
			else if i=5 { create_card_id=010; } //caterpie
			else if i=6 { create_card_id=013; } //weedle
			create_card_level=1;
			create_card_glyph_a=-1;
			create_card_glyph_b=-1;
			create_card_glyph_c=-1;
			create_card_innate=1;
			create_card_form_value=0;
		}
		else {
			create_card_cat=1;
			if i<=11 { create_card_id=3000; } //oran
			else if i<=13 { create_card_id=3001; } //leppa
			else { create_card_id=3002; } //lum
		}
		//
		if i<=6 { var card_x=screen_main_x+47+(60*i), card_y=screen_main_y+104-47; }
		else { var card_x=screen_main_x+17+(60*(i-7)), card_y=screen_main_y+104+47; }
		instance_create_layer(card_x,card_y,"instances",ob_card);
		i++;
	}
	//
	button_create=instance_create_layer(screen_main_x+cam_w-24,screen_main_y+cam_h-24,"instances",ob_button_16x16);
	button_create.button_id=2;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if event_kind=ref_event_levelup or event_kind=ref_event_evolution or
event_kind=ref_event_glyph or event_kind=ref_event_tribute {
	show_deck=true;
	//
	deck_x=4;
	deck_y=204;
	hold_deck_bar=false;
	//
	if event_kind=ref_event_glyph {
		glyph_add_id=ob_main.current_glyph_add;
	}
	//
	card_event_total=0;
	var i=0;
	repeat (ob_main.maindeck_total) {
		if ob_main.main_card_indeck[i][0]=true {
			card_event_total++;
		}
		i++;
	}
	//
	var i=0, ii=0;
	repeat (ob_main.maindeck_total) {
		if ob_main.main_card_indeck[i][0]=true {
			create_card_cat=0;
			create_card_id=ob_main.main_card_id[i];
			create_card_level=ob_main.main_card_level[i];
			create_card_glyph_a=ob_main.main_card_glyph_a[i];
			create_card_glyph_b=ob_main.main_card_glyph_b[i];
			create_card_glyph_c=ob_main.main_card_glyph_c[i];
			create_card_innate=ob_main.main_card_innate[i];
			create_card_form_value=ob_main.main_card_form_value[i];
			//
			card_event[ii]=instance_create_layer(x,y,"instances",ob_card);
			card_event[ii].num_in_all=i;
			//
			ii++;
		}
		i++;
	}
	//
	if event_kind=ref_event_tribute {
		event_space_total=2;
		for (var i=0; i<event_space_total; i++;) {
			event_space_id[i]=instance_create_layer(screen_main_x+227-35+71*i,screen_main_y+59,"instances",ob_card_space);
		}
	}
	else {
		event_space_total=1;
		for (var i=0; i<event_space_total; i++;) {
			event_space_id[i]=instance_create_layer(screen_main_x+227,screen_main_y+59,"instances",ob_card_space);
		}
	}
	//
	var i=0, button_create;
	repeat (2) {
		button_create=instance_create_layer(screen_main_x+219+42*i,screen_main_y+155,"instances",ob_button_31x24);
		button_create.button_id=i;
		i++;
	}
}