if show_deck=true {
	var i=0;
	repeat (card_event_total) {
		if card_event[i].card_played=false {
			card_event[i].potential_x=ob_main.screen_main_x+deck_x+(60*i);
			card_event[i].potential_y=ob_main.screen_main_y+deck_y;
		}
		i++;
	}
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	// SCROLL BAR (ob_event & ob_deckbuild)
	if mouse_y>=ob_main.screen_main_y+deck_y-8 and mouse_y<ob_main.screen_main_y+deck_y+80 and ob_main.cursor_hide=false {
		if mouse_wheel_up() {
			deck_x+=32;
			if deck_x>4 { deck_x=4; }
		}
		else if mouse_wheel_down() and ob_main.cam_w<(card_event_total*60) {
			deck_x-=32;
			if deck_x<ob_main.cam_w-(card_event_total*60)-1 { deck_x=ob_main.cam_w-(card_event_total*60)-1; }
		}
	}
	//
	if mouse_check_button(mb_left) and ob_main.cursor_hide=false and ob_main.cam_w<(card_event_total*60) and
	((mouse_y>=ob_main.screen_main_y+deck_y-8 and mouse_y<ob_main.screen_main_y+deck_y-4) or hold_deck_bar=true) {
		var mouse_pos=mouse_x-ob_main.screen_main_x-8-4, mouse_pos_max=ob_main.cam_w-16-10, deck_pos_max=ob_main.cam_w-(card_event_total*60)-5;
		var deck_x_percent=mouse_pos*100/mouse_pos_max;
		deck_x=round(deck_x_percent*deck_pos_max/100)+4;
		if deck_x>4 { deck_x=4; }
		else if deck_x<ob_main.cam_w-(card_event_total*60)-1 { deck_x=ob_main.cam_w-(card_event_total*60)-1; }
		hold_deck_bar=true;
	}
	else if !mouse_check_button(mb_left) or ob_main.cursor_hide=true {
		hold_deck_bar=false;
	}
	//
	if ob_main.cam_w<(card_event_total*60) { //when moving last cards in list
		if deck_x<ob_main.cam_w-(card_event_total*60)-1 { deck_x=ob_main.cam_w-(card_event_total*60)-1; }
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
if count_berries=true {
	var i=0;
	repeat (4) {
		deck_berry_total[i]=0;
		i++;
	}
	var i=0;
	repeat (ob_main.berrydeck_total) {
		deck_berry_total[ob_main.berry_card_id[i]-3000]++;
		i++;
	}
	count_berries=false;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if apply_event=true {
	var i=0, card_id_space;
	repeat (event_space_total) {
		card_id_space[i]=-1;
		if position_meeting(event_space_id[i].x,event_space_id[i].y,ob_card) {
			var ii=0;
			repeat (card_event_total) {
				if card_event[ii]=instance_position(event_space_id[i].x,event_space_id[i].y,ob_card) {
					card_id_space[i]=instance_position(event_space_id[i].x,event_space_id[i].y,ob_card);
				}
				ii++;
			}
		}
		i++;
	}
	//
	if event_kind=ob_main.ref_event_levelup and card_id_space[0]!=-1 {
		if card_id_space[0].card_level<10 {
			card_id_space[0].card_level++;
			card_id_space[0].effect_damaged=1;
			with (card_id_space[0]) {
				sc_card_level_stats();
			}
			//
			event_applied=true;
			ob_main.main_card_level[card_id_space[0].num_in_all]=card_id_space[0].card_level;
			ob_main.event_transition=event_kind;
		}
	}
	else if event_kind=ob_main.ref_event_evolution and card_id_space[0]!=-1 {
		if card_id_space[0].card_evo[0]!=-1 and card_id_space[0].card_evo[0]<=ob_main.normal_poke_id_max {
			do {
				card_id_space[0].card_id=card_id_space[0].card_evo[irandom(7)];
			} until (card_id_space[0].card_id!=-1 and card_id_space[0].card_id<=ob_main.normal_poke_id_max);
			card_id_space[0].effect_damaged=1;
			with (card_id_space[0]) {
				sc_pokelist();
				sc_card_level_stats();
			}
			//
			event_applied=true;
			ob_main.main_card_id[card_id_space[0].num_in_all]=card_id_space[0].card_id;
			ob_main.event_transition=event_kind;
		}
	}
	else if event_kind=ob_main.ref_event_glyph and card_id_space[0]!=-1 {
		if card_id_space[0].card_glyph_c=-1 { //only checks third glyph slot
			if card_id_space[0].card_glyph_a=-1 {
				card_id_space[0].card_glyph_a=glyph_add_id;
			}
			else if card_id_space[0].card_glyph_b=-1 {
				card_id_space[0].card_glyph_b=glyph_add_id;
			}
			else if card_id_space[0].card_glyph_c=-1 {
				card_id_space[0].card_glyph_c=glyph_add_id;
			}
			card_id_space[0].effect_damaged=1;
			//
			event_applied=true;
			ob_main.main_card_glyph_a[card_id_space[0].num_in_all]=card_id_space[0].card_glyph_a;
			ob_main.main_card_glyph_b[card_id_space[0].num_in_all]=card_id_space[0].card_glyph_b;
			ob_main.main_card_glyph_c[card_id_space[0].num_in_all]=card_id_space[0].card_glyph_c;
			ob_main.event_transition=event_kind;
		}
	}
	else if event_kind=ob_main.ref_event_sacrifice and card_id_space[0]!=-1 and card_id_space[1]!=-1 {
		if card_id_space[0].card_souls>0 and card_id_space[1].card_souls<5 {
			card_id_space[0].card_souls--;
			card_id_space[1].card_souls++;
			card_id_space[0].effect_damaged=1;
			card_id_space[1].effect_damaged=1;
			with (card_id_space[0]) {
				sc_card_level_stats();
			}
			with (card_id_space[1]) {
				sc_card_level_stats();
			}
			//
			event_applied=true;
			ob_main.main_card_souls[card_id_space[0].num_in_all]=card_id_space[0].card_souls;
			ob_main.main_card_souls[card_id_space[1].num_in_all]=card_id_space[1].card_souls;
			ob_main.event_transition=event_kind;
		}
	}
	//
	apply_event=false;
}