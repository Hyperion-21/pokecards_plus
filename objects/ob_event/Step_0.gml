if show_deck=true {
	var i=0;
	repeat (card_event_total) {
		if card_event[i].card_played=false {
			card_event[i].potential_x=screen_main_x+deck_x+(60*i);
			card_event[i].potential_y=screen_main_y+deck_y;
		}
		i++;
	}
	i=0;
	repeat (card_event_inventory_total) {
		if card_inventory[i].card_played=false {
			card_inventory[i].potential_x=screen_main_x+inventory_x+(60*i);
			card_inventory[i].potential_y=screen_main_y+inventory_y;
		}
		i++;
	}
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	// SCROLL BAR (ob_event & ob_deckbuild)
	if mouse_y>=screen_main_y+inventory_y and mouse_y<screen_main_y+inventory_y+80+8 and ob_main.cursor_hide=false {
		if mouse_wheel_up() {
			inventory_x+=32;
			if inventory_x>4 { inventory_x=4; }
		}
		else if mouse_wheel_down() and cam_w<(card_event_inventory_total*60) {
			inventory_x-=32;
			if inventory_x<cam_w-(card_event_inventory_total*60)-1 { inventory_x=cam_w-(card_event_inventory_total*60)-1; }
		}
	}
	else if mouse_y>=screen_main_y+deck_y-8 and mouse_y<screen_main_y+deck_y+80 and ob_main.cursor_hide=false {
		if mouse_wheel_up() {
			deck_x+=32;
			if deck_x>4 { deck_x=4; }
		}
		else if mouse_wheel_down() and cam_w<(card_event_total*60) {
			deck_x-=32;
			if deck_x<cam_w-(card_event_total*60)-1 { deck_x=cam_w-(card_event_total*60)-1; }
		}
	}
	//
	
	if mouse_check_button(mb_left) and ob_main.cursor_hide=false and cam_w<(card_event_inventory_total*60) and
	((mouse_y>=screen_main_y+inventory_y+80 and mouse_y<screen_main_y+inventory_y+88) or hold_inventory_bar=true) {
		//screen_main_y+deck_y-8
		var mouse_pos=mouse_x-screen_main_x-8-4; 
		var mouse_pos_max=cam_w-16-10,
		var inventory_pos_max=cam_w-(card_event_inventory_total*60)-5;
		
		var inventory_x_percent=mouse_pos*100/mouse_pos_max;
		inventory_x=round(inventory_x_percent*inventory_pos_max/100)+4;
		if inventory_x>4 { inventory_x=4; }
		else if inventory_x<cam_w-(card_event_inventory_total*60)-1 { inventory_x=cam_w-(card_event_inventory_total*60)-1; }
		hold_inventory_bar=true;
	}	
	else if mouse_check_button(mb_left) and ob_main.cursor_hide=false and cam_w<(card_event_total*60) and
	((mouse_y>=screen_main_y+deck_y-10 and mouse_y<screen_main_y+deck_y-2) or hold_deck_bar=true) {
		
		var mouse_pos=mouse_x-screen_main_x-8-4;
		var mouse_pos_max=cam_w-16-10; 
		var deck_pos_max=cam_w-(card_event_total*60)-5;
		
		var deck_x_percent=mouse_pos*100/mouse_pos_max;
		deck_x=round(deck_x_percent*deck_pos_max/100)+4;
		if deck_x>4 { deck_x=4; }
		else if deck_x<cam_w-(card_event_total*60)-1 { deck_x=cam_w-(card_event_total*60)-1; }
		hold_deck_bar=true;
	}
	else if !mouse_check_button(mb_left) or ob_main.cursor_hide=true {
		hold_inventory_bar=false;
		hold_deck_bar=false;
	}
	//
	if cam_w<(card_event_total*60) { //when moving last cards in list
		if deck_x<cam_w-(card_event_total*60)-1 { deck_x=cam_w-(card_event_total*60)-1; }
	}
	else { deck_x=4; }
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else {
	if card_prize=0 {
		ob_main.event_transition=event_kind;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if apply_event=true {
	var i=0, card_id_in_space;
		repeat (event_space_total) {
			card_id_in_space[i]=-1;
			if event_space_id[i].occupy_id!=-1 {
				var ii=0;
				
				if(event_space_id_deck[i])
				{
					repeat (card_event_total) {
						if card_event[ii]=event_space_id[i].occupy_id {
							card_id_in_space[i]=event_space_id[i].occupy_id;
						}
						ii++;
					}
				} else {
					repeat (card_event_inventory_total) {
						if card_inventory[ii]=event_space_id[i].occupy_id {
							card_id_in_space[i]=event_space_id[i].occupy_id;
						}
						ii++;
					}
				}
			}
			i++;
		}
	//
	if event_kind=ref_event_levelup and card_id_in_space[0]!=-1 {
		//conditions also used for showing cost/stats in ob_card_space
		if card_id_in_space[0].card_level<ob_main.card_level_player_limit and card_id_in_space[0].card_innate>0 and
		ob_main.money-ob_main.event_cost_standby>=ob_main.event_cost_standby_levelup {
			card_id_in_space[0].card_level++;
			sc_card_effect(event_space_id[0].x,event_space_id[0].y,0,false,true);
			with (card_id_in_space[0]) {
				sc_card_level_stats_all(true,true);
			}
			//
			event_applied=true;
			ob_main.event_cost_standby+=ob_main.event_cost_standby_levelup;
			sc_playsound(sn_upgrade,50,false,false);
			ob_main.main_card_level[card_id_in_space[0].num_in_all]=card_id_in_space[0].card_level;
		}
	}
	else if event_kind=ref_event_evolution and card_id_in_space[0]!=-1 {
		if evo_list[0]!=-1 and evo_list[0]<=normal_poke_id_max and card_id_in_space[0].card_innate>0 {
			do {
				card_id_in_space[0].card_id=evo_list[evolution_position];
				//
				evolution_position++;
				if evolution_position>7 { evolution_position=0; }
			} until (card_id_in_space[0].card_id!=-1 and card_id_in_space[0].card_id<=normal_poke_id_max);
			sc_card_effect(event_space_id[0].x,event_space_id[0].y,0,false,true);
			with (card_id_in_space[0]) {
				sc_pokelist();
				sc_card_level_stats_all(true,true);
			}
			//
			event_applied=true;
			evolution_retry=true;
			sc_playsound(sn_upgrade,50,false,false);
			ob_main.main_card_id[card_id_in_space[0].num_in_all]=card_id_in_space[0].card_id;
		}
	}
	else if event_kind=ref_event_megaevolve and card_id_in_space[0]!=-1 {
		if card_id_in_space[0].card_can_mega {
			do {
				//card_id_in_space[0].card_form_value=irandom(999);
				if card_id_in_space[0].card_form_value<999 {
				card_id_in_space[0].card_form_value=1000+irandom(1);}//multi mega
				else {
				card_id_in_space[0].card_form_value=irandom(999);
				}
			} until (card_id_in_space[0].card_id!=-1 and card_id_in_space[0].card_id<=normal_poke_id_max);
			sc_card_effect(event_space_id[0].x,event_space_id[0].y,0,false,true);
			with (card_id_in_space[0]) {
				sc_pokelist();
				sc_card_level_stats_all(true,true);
			}
			//
			event_applied=true;//free for testing
			evolution_retry=true;
			sc_playsound(sn_upgrade,50,false,false);
			ob_main.main_card_form_value[card_id_in_space[0].num_in_all]=card_id_in_space[0].card_form_value;
		}
	}
	else if event_kind=ref_event_changeform and card_id_in_space[0]!=-1 {
		if card_id_in_space[0].card_has_forms and card_id_in_space[0].card_form_change=true {
			if card_id_in_space[0].card_id=493 or card_id_in_space[0].card_id=773 {
				do { //
					if card_id_in_space[0].card_form_value<935 {
					card_id_in_space[0].card_form_value+=55;}
					else {
					card_id_in_space[0].card_form_value=irandom(55);}
				} until (card_id_in_space[0].card_id!=-1 and card_id_in_space[0].card_id<=normal_poke_id_max);
			}
			else if card_id_in_space[0].card_can_mega and card_id_in_space[0].card_form_value>999 {//already checks for has_forms
				do {
					if card_id_in_space[0].card_form_value=1000 {
					card_id_in_space[0].card_form_value=1001;}
					else {
					card_id_in_space[0].card_form_value=1000}
				} until (card_id_in_space[0].card_id!=-1 and card_id_in_space[0].card_id<=normal_poke_id_max);
			}
			else{
				do { //2 forms is clean, multiform is messy.
					//card_id_in_space[0].card_form_value=irandom(999);
					if card_id_in_space[0].card_form_value<500 {
					card_id_in_space[0].card_form_value=irandom(499)+500;}
					else {
					card_id_in_space[0].card_form_value=irandom(499);}
				} until (card_id_in_space[0].card_id!=-1 and card_id_in_space[0].card_id<=normal_poke_id_max);
			}
			sc_card_effect(event_space_id[0].x,event_space_id[0].y,0,false,true);
			with (card_id_in_space[0]) {
				sc_pokelist();
				sc_card_level_stats_all(true,true);
			}
			//
			event_applied=true;//free for testing
			evolution_retry=true;
			sc_playsound(sn_upgrade,50,false,false);
			ob_main.main_card_form_value[card_id_in_space[0].num_in_all]=card_id_in_space[0].card_form_value;
		}
	}
	else if event_kind=ref_event_glyph and card_id_in_space[0]!=-1 {
		if card_id_in_space[0].card_glyph_c=-1 and card_id_in_space[0].card_innate>0 and
		card_id_in_space[0].card_glyph_a!=glyph_add_id and card_id_in_space[0].card_glyph_b!=glyph_add_id and card_id_in_space[0].card_glyph_c!=glyph_add_id {
			sc_insert_into_free_glyph_slot(0,glyph_add_id);
			sc_card_effect(event_space_id[0].x,event_space_id[0].y,0,false,true);
			with (card_id_in_space[0]) {
				sc_card_level_stats_all(true,true);
			}
			//
			event_applied=true;
			sc_playsound(sn_upgrade,50,false,false);
			ob_main.main_card_glyph_a[card_id_in_space[0].num_in_all]=card_id_in_space[0].card_glyph_a;
			ob_main.main_card_glyph_b[card_id_in_space[0].num_in_all]=card_id_in_space[0].card_glyph_b;
			ob_main.main_card_glyph_c[card_id_in_space[0].num_in_all]=card_id_in_space[0].card_glyph_c;
		}
	}
	else if event_kind=ref_event_tribute and card_id_in_space[0]!=-1 and card_id_in_space[1]!=-1 {
		if card_id_in_space[0].card_innate>0 and card_id_in_space[1].card_innate<innate_max and
		card_id_in_space[0].card_environment=false and card_id_in_space[1].card_environment=false {
			card_id_in_space[0].card_innate--;
			card_id_in_space[0].effect_damaged=1;
			//
			card_id_in_space[1].card_innate++;
			sc_card_effect(event_space_id[1].x,event_space_id[1].y,0,false,true);
			sc_playsound(sn_upgrade,50,false,false);
			//
			with (card_id_in_space[0]) {
				sc_card_level_stats_all(true,true);
			}
			with (card_id_in_space[1]) {
				sc_card_level_stats_all(true,true);
			}
			//
			event_applied=true;
			ob_main.main_card_innate[card_id_in_space[0].num_in_all]=card_id_in_space[0].card_innate;
			ob_main.main_card_innate[card_id_in_space[1].num_in_all]=card_id_in_space[1].card_innate;
		}
	}
	else if event_kind=ref_event_sacrifice and card_id_in_space[0]!=-1 and card_id_in_space[1]!=-1 and card_id_in_space[1].card_environment=false {
		if (card_id_in_space[0].card_glyph_a != -1 or card_id_in_space[0].card_glyph_b != -1 or card_id_in_space[0].card_glyph_c != -1) and card_id_in_space[0].card_innate > 0{
			
			var devour = false;
			// WE SHALL SACRIFICE THIS CARD TO THE LORD OF THE DEAD!
			if(card_id_in_space[0].card_innate = 0){
				if card_id_in_space[0].card_glyph_c != -1 and !sc_glyph_bound(card_id_in_space[0].card_glyph_c) {
					sc_insert_into_free_glyph_slot(1,card_id_in_space[0].card_glyph_c);
					card_id_in_space[0].card_glyph_c= -1;
				}
				
				if card_id_in_space[0].card_glyph_b != -1 and !sc_glyph_bound(card_id_in_space[0].card_glyph_b) {
					sc_insert_into_free_glyph_slot(1,card_id_in_space[0].card_glyph_b);
					card_id_in_space[0].card_glyph_b= -1;
				}
				
				if card_id_in_space[0].card_glyph_a != -1 and !sc_glyph_bound(card_id_in_space[0].card_glyph_a) {
					sc_insert_into_free_glyph_slot(1,card_id_in_space[0].card_glyph_a);
					card_id_in_space[0].card_glyph_a= -1;
				}				
				devour = true;
			} else { // OUR LORD IS MERCIFUL, PROVIDE HIS HERALD WITH YOUR ESSENCE AND YOU SHALL REMAIN
				if card_id_in_space[0].card_glyph_c != -1 and !sc_glyph_bound(card_id_in_space[0].card_glyph_c) {
					sc_insert_into_free_glyph_slot(1,card_id_in_space[0].card_glyph_c);
					card_id_in_space[0].card_glyph_c= -1;
				}
				else if card_id_in_space[0].card_glyph_b != -1 and !sc_glyph_bound(card_id_in_space[0].card_glyph_b) {
					sc_insert_into_free_glyph_slot(1,card_id_in_space[0].card_glyph_b);
					card_id_in_space[0].card_glyph_b = -1;
				}
				else if card_id_in_space[0].card_glyph_a != -1 and !sc_glyph_bound(card_id_in_space[0].card_glyph_a) {
					sc_insert_into_free_glyph_slot(1,card_id_in_space[0].card_glyph_a);
					card_id_in_space[0].card_glyph_a = -1;
				}
				else {
					return; // BEGONE EMPTY HUSK, YOU BRING NOTHING TO THE LORD
				}
			}
			card_id_in_space[0].card_innate--;
			card_id_in_space[0].effect_damaged=1;			
			sc_card_effect(event_space_id[0].x,event_space_id[0].y,0,false,true);
			sc_playsound(sn_hurt,50,false,false);
			
			//
			card_id_in_space[1].card_innate++;
			sc_card_effect(event_space_id[1].x,event_space_id[1].y,0,false,true);
			sc_playsound(sn_upgrade,50,false,false);
			//
			with (card_id_in_space[0]) {
				if(devour)
				{
					event_space_id[0].occupy_id = -1;
					sc_playsound(sn_faint,50,false,false);
					//
					ob_deckbuild.reorder_swap_standby=ob_deckbuild.reorder_selected;
					ob_deckbuild.reorder_type=5;
					instance_destroy();
				} else {
					sc_card_level_stats_all(true,true);
				}
				
			}
			with (card_id_in_space[1]) {
				sc_card_level_stats_all(true,true);
			}
			//
			event_applied=true;
			if(!devour)
			{
				ob_main.main_card_innate[card_id_in_space[0].num_in_all]=card_id_in_space[0].card_innate;
			}
			ob_main.main_card_innate[card_id_in_space[1].num_in_all]=card_id_in_space[1].card_innate;
		}
	}
	else if event_kind=ref_event_deglyph and card_id_in_space[0]!=-1 {
		if card_id_in_space[0].card_glyph_a>0 or card_id_in_space[0].card_glyph_b or card_id_in_space[0].card_glyph_c
		{
			if card_id_in_space[0].card_glyph_c != -1 and !sc_glyph_bound(card_id_in_space[0].card_glyph_c) {
				card_id_in_space[0].card_glyph_c= -1;
			}
			else if card_id_in_space[0].card_glyph_b != -1 and !sc_glyph_bound(card_id_in_space[0].card_glyph_b) {
				card_id_in_space[0].card_glyph_b = -1;
			}
			else if card_id_in_space[0].card_glyph_a != -1 and !sc_glyph_bound(card_id_in_space[0].card_glyph_a) {
				card_id_in_space[0].card_glyph_a = -1;
			}
			else {
				return;
			}
			
			card_id_in_space[0].effect_damaged=1;
			//
			sc_card_effect(event_space_id[0].x,event_space_id[0].y,0,false,true);
			sc_playsound(sn_hurt,50,false,false);
			//
			with (card_id_in_space[0]) {
				sc_card_level_stats_all(true,true);
			}
			//
			event_applied=true;
			ob_main.main_card_innate[card_id_in_space[0].num_in_all]=card_id_in_space[0].card_innate;
			ob_main.main_card_innate[card_id_in_space[1].num_in_all]=card_id_in_space[1].card_innate;
		}
	}
	else if event_kind=ref_event_campfire and card_id_in_space[0]!=-1 {
		if card_id_in_space[0].card_innate<innate_max and card_id_in_space[0].card_environment=false {
			card_id_in_space[0].card_innate++;
			sc_card_effect(event_space_id[0].x,event_space_id[0].y,0,false,true);
			sc_playsound(sn_upgrade,50,false,false);
			//
			with (card_id_in_space[0]) {
				sc_card_level_stats_all(true,true);
			}
			//
			event_applied=true;
			ob_main.main_card_innate[card_id_in_space[0].num_in_all]=card_id_in_space[0].card_innate;
		}
	}
	//
	apply_event=false;
}