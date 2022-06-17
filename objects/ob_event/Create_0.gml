depth=-1000;
//————————————————————————————————————————————————————————————————————————————————————————————————————
event_kind=ob_main.event_transition;
tooltip_text="";
tooltip_lines=0;
show_deck=false;
apply_event=false;
event_applied=false;
event_cancelled=false;
//
levelup_new_hp=0;
levelup_new_atk=0;
levelup_new_def=0;
//————————————————————————————————————————————————————————————————————————————————————————————————————
//count berries (same as ob_card)
for (var i=0; i<=3; i++;) {
	deck_berry_total[i]=0;
}
for (var i=0; i<ob_main.berrydeck_total; i++;) {
	deck_berry_total[ob_main.berry_card_id[i]-3000]++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————

if event_kind=ref_event_campfire or event_kind=ref_event_sacrifice or event_kind=ref_event_megaevolve or event_kind=ref_event_changeform {
	show_deck=true;
	//
	deck_x=4;
	deck_y=204;
	hold_deck_bar=false;
	evolution_retry=false;
	evolution_position=0;
	for (var i=0; i<8; i++;) {
		evo_list[i]=-1;
	}
	//
	card_event_total=0;
	var i=0;
	repeat (ob_main.maindeck_total) {
		if ob_main.serial_card_indeck[ob_main.main_card_serial[i]][0]=true {
			card_event_total++;
		}
		i++;
	}
	//
	var i=0, ii=0;
	repeat (ob_main.maindeck_total) {
		if ob_main.serial_card_indeck[ob_main.main_card_serial[i]][0]=true {
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
	if event_kind=ref_event_sacrifice {
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
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if event_kind=ref_event_cardpack or event_kind=ref_event_berry {
	if event_kind=ref_event_cardpack {
		card_prize=5;
		var main_amount=5, berry_amount=1;
		//
		var i=0;
		repeat (card_prize) {
			if main_amount>0 and berry_amount>0 { create_card_cat=choose(0,1); }
			else if main_amount>0 and berry_amount=0 { create_card_cat=0; }
			else if main_amount=0 and berry_amount>0 { create_card_cat=1; }
			if create_card_cat=0 { main_amount--; }
			else { berry_amount--; }
			create_card_id=-1;
			//
			instance_create_layer(screen_main_x+83+(72*i),screen_main_y+104,"instances",ob_card);
			i++;
		}
	}
	else if event_kind=ref_event_berry {
		card_prize=4;
		var min_oran=1, min_leppa=1, min_lum=1;
		//
		var i=0;
		repeat (card_prize) {
			create_card_cat=1;
			if min_oran>0 and min_leppa>0 and min_lum>0 { create_card_id=choose(3000,3001,3002); }
			else if min_oran>0 and min_leppa>0 { create_card_id=choose(3000,3001); }
			else if min_oran>0 and min_lum>0 { create_card_id=choose(3000,3002); }
			else if min_leppa>0 and min_lum>0 { create_card_id=choose(3001,3002); }
			else if min_oran>0 { create_card_id=3000; }
			else if min_leppa>0 { create_card_id=3001; }
			else if min_lum>0 { create_card_id=3002; }
			else { create_card_id=-1; }
			//
			if create_card_id=3000 { min_oran--; }
			else if create_card_id=3001 { min_leppa--; }
			else if create_card_id=3002 { min_lum--; }
			//
			instance_create_layer(screen_main_x+118+(73*i),screen_main_y+104,"instances",ob_card);
			i++;
		}
	}
	
	button_create=instance_create_layer(screen_main_x+cam_w-24,screen_main_y+cam_h-24,"instances",ob_button_16x16);
	button_create.button_id=2;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if event_kind=ref_event_freecard {
	card_prize=1;
	var i=0;
	repeat (5) {
		create_card_cat=0;
		create_card_id=-1;
		//
		instance_create_layer(screen_main_x+83+(72*i),screen_main_y+104,"instances",ob_card);
		i++;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if event_kind=ref_event_grass or event_kind=ref_event_fire or event_kind=ref_event_water {
	//specific pokemon ids are checked manually when creating deck in tutorial
	//exact amount of cards and berries is also checked manually when entering tutorial
	//
	card_prize=14;
	var i=0;
	
	repeat (card_prize) {
		if i<=6 {
			create_card_cat=0;
			if i=0 and event_kind=ref_event_grass { create_card_id=001; } //bulbasaur
			else if i=1 and event_kind=ref_event_grass { create_card_id=152; } //chikorita
			else if i=2 and event_kind=ref_event_grass { create_card_id=252; } //treecko
			else if i=3 and event_kind=ref_event_grass { create_card_id=387; } //turtwig
			else if i=4 and event_kind=ref_event_grass { create_card_id=495; } //snivy
			else if i=5 and event_kind=ref_event_grass { create_card_id=650; } //chespin
			else if i=6 and event_kind=ref_event_grass { create_card_id=722; } //rowlet
			
			
			else if i=0 and event_kind=ref_event_fire { create_card_id=004; } //charmander
			else if i=1 and event_kind=ref_event_fire { create_card_id=155; } //cyndaquil
			else if i=2 and event_kind=ref_event_fire { create_card_id=255; } //torchick
			else if i=3 and event_kind=ref_event_fire { create_card_id=390; } //chimchar
			else if i=4 and event_kind=ref_event_fire { create_card_id=498; } //tepig
			else if i=5 and event_kind=ref_event_fire { create_card_id=653; } //fennekin
			else if i=6 and event_kind=ref_event_fire { create_card_id=725; } //litten
			
			else if i=0 and event_kind=ref_event_water { create_card_id=007; } //squirtle
			else if i=1 and event_kind=ref_event_water { create_card_id=158; } //totodile
			else if i=2 and event_kind=ref_event_water { create_card_id=258; } //mudkip
			else if i=3 and event_kind=ref_event_water { create_card_id=393; } //piplup
			else if i=4 and event_kind=ref_event_water { create_card_id=501; } //oshawott
			else if i=5 and event_kind=ref_event_water { create_card_id=656; } //froakie
			else if i=6 and event_kind=ref_event_water { create_card_id=728; } //popplio
			
			create_card_level=1;
			create_card_glyph_a=-1;
			create_card_glyph_b=-1;
			create_card_glyph_c=-1;
			create_card_innate=1;
			create_card_form_value=0;
		}
		else {
			create_card_cat=1;
			if i<=13 { create_card_id=3000; } //oran
			//else { create_card_id=3001; } //leppa
			//else { create_card_id=3002; } //lum
		}
		
		//
		
		/*
		if i<=4 { var card_x=screen_main_x+83+(72*i), card_y=screen_main_y+104-47; }
		else { var card_x=screen_main_x+83+(72*(i-5)), card_y=screen_main_y+104+47; }
		*/
		if i<=6 { var card_x=screen_main_x+36+(62*i), card_y=screen_main_y+104-47; }
		else { var card_x=screen_main_x+36+(62*(i-7)), card_y=screen_main_y+104+47; }
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
	evolution_retry=false;
	evolution_position=0;
	for (var i=0; i<8; i++;) {
		evo_list[i]=-1;
	}
	//
	card_event_total=0;
	var i=0;
	repeat (ob_main.maindeck_total) {
		if ob_main.serial_card_indeck[ob_main.main_card_serial[i]][0]=true {
			card_event_total++;
		}
		i++;
	}
	//
	var i=0, ii=0;
	repeat (ob_main.maindeck_total) {
		if ob_main.serial_card_indeck[ob_main.main_card_serial[i]][0]=true {
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