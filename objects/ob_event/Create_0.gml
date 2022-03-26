depth=-1000;
//————————————————————————————————————————————————————————————————————————————————————————————————————
count_berries=true;
tooltip_text="";
show_deck=false;
//————————————————————————————————————————————————————————————————————————————————————————————————————
if ob_main.event_transition=ob_main.ref_event_cardpack {
	card_prize=5;
	var i=0, main_amount=3, berry_amount=2;
	repeat (card_prize) {
		if main_amount>0 and berry_amount>0 { create_card_cat=choose(0,1); }
		else if main_amount>0 and berry_amount=0 { create_card_cat=0; }
		else if main_amount=0 and berry_amount>0 { create_card_cat=1; }
		if create_card_cat=0 { main_amount--; }
		else { berry_amount--; }
		create_card_id=-1;
		//
		instance_create_layer(ob_main.screen_main_x+83+(72*i),ob_main.screen_main_y+104,"instances",ob_card);
		i++;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if ob_main.event_transition=ob_main.ref_event_freecard {
	card_prize=1;
	var i=0;
	repeat (3) {
		create_card_cat=0;
		create_card_id=-1;
		//
		instance_create_layer(ob_main.screen_main_x+155+(72*i),ob_main.screen_main_y+104,"instances",ob_card);
		i++;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if ob_main.event_transition=ob_main.ref_event_grass or ob_main.event_transition=ob_main.ref_event_fire or ob_main.event_transition=ob_main.ref_event_water {
	card_prize=10;
	var i=0;
	repeat (card_prize) {
		if i<=4 {
			create_card_cat=0;
			if i=0 and ob_main.event_transition=ob_main.ref_event_grass { create_card_id=choose(001,152); } //grass starter
			else if i=0 and ob_main.event_transition=ob_main.ref_event_fire { create_card_id=choose(004,155); } //fire starter
			else if i=0 and ob_main.event_transition=ob_main.ref_event_water { create_card_id=choose(007,158); } //water starter
			else if i=1 { create_card_id=016; } //pidgey
			else if i=2 { create_card_id=019; } //rattata
			else if i=3 { create_card_id=010; } //caterpie
			else if i=4 { create_card_id=013; } //weedle
			create_card_level=1;
			create_card_glyph_a=-1;
			create_card_glyph_b=-1;
			create_card_glyph_c=-1;
		}
		else {
			create_card_cat=1;
			if i<=6 { create_card_id=3000; } //oran
			else if i<=8 { create_card_id=3001; } //leppa
			else { create_card_id=3002; } //lum
		}
		//
		if i<=4 { var card_x=ob_main.screen_main_x+83+(72*i), card_y=ob_main.screen_main_y+104-47; }
		else { var card_x=ob_main.screen_main_x+83+(72*(i-5)), card_y=ob_main.screen_main_y+104+47; }
		instance_create_layer(card_x,card_y,"instances",ob_card);
		i++;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if ob_main.event_transition=ob_main.ref_event_levelup or ob_main.event_transition=ob_main.ref_event_evolution or
ob_main.event_transition=ob_main.ref_event_glyph or ob_main.event_transition=ob_main.ref_event_sacrifice {
	show_deck=true;
	//
	deck_x=4;
	deck_y=4;
	hold_deck_bar=false;
	//
	card_event_total=0;
	var i=0;
	repeat (ob_main.maindeck_total) {
		if ob_main.main_card_indeck[i]=true {
			card_event_total++;
		}
		i++;
	}
	//
	var i=0, ii=0;
	repeat (ob_main.maindeck_total) {
		if ob_main.main_card_indeck[i]=true {
			create_card_cat=0;
			create_card_id=ob_main.main_card_id[i];
			create_card_level=ob_main.main_card_level[i];
			create_card_glyph_a=ob_main.main_card_glyph_a[i];
			create_card_glyph_b=ob_main.main_card_glyph_b[i];
			create_card_glyph_c=ob_main.main_card_glyph_c[i];
			//
			card_event[ii]=instance_create_layer(cam_x+cam_w-67,cam_y+181,"instances",ob_card);
			//
			ii++;
		}
		i++;
	}
}