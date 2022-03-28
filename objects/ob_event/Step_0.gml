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
	apply_event=false;
	ob_main.event_transition=event_kind;
}