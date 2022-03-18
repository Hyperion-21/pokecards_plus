var i=0, ii=0, iii=0;
repeat (deck_build_all_total) {
	if deck_card_all[i].used_in_deck=false {
		deck_card_stored[ii]=deck_card_all[i];
		ii++;
	}
	else {
		deck_card_used[iii]=deck_card_all[i];
		iii++;
	}
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if reorder_type>-1 {
	if reorder_type=0 {
		deck_build_stored_total--;
		deck_build_used_total++;
	}
	else {
		deck_build_stored_total++;
		deck_build_used_total--;
	}
	//
	/*var i=0, card_stored_pos_replace;
	repeat (deck_build_stored_total) {
		card_stored_pos_replace[i]=-1;
		i++;
	}
	//
	var i=1, ii=0;
	do {
		var iii=0;
		repeat (deck_build_stored_total) {
			if deck_card_stored[iii].card_id=i and card_stored_pos_replace[ii]=-1 {
				card_stored_pos_replace[ii]=deck_card_stored[iii];
				ii++;
			}
			iii++;
		}
		i++;
	}
	until (ii=deck_build_stored_total);
	//
	var i=0;
	repeat (deck_build_stored_total) {
		deck_card_stored[i]=card_stored_pos_replace[i];
		i++;
	}*/
	//
	reorder_type=-1;
	reorder_card_id=-1;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
var i=0;
repeat (deck_build_stored_total) {
	deck_card_stored[i].potential_x=ob_main.screen_deck_x+stored_x+(60*i);
	deck_card_stored[i].potential_y=ob_main.screen_main_y+stored_y;
	i++;
}
//
var i=0;
repeat (deck_build_used_total) {
	deck_card_used[i].potential_x=ob_main.screen_deck_x+used_x+(60*i);
	deck_card_used[i].potential_y=ob_main.screen_main_y+used_y;
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if mouse_wheel_up() and ob_main.cursor_hide=false and mouse_y>=ob_main.screen_main_y+stored_y and mouse_y<ob_main.screen_main_y+stored_y+80 {
	stored_x+=32;
	if stored_x>4 { stored_x=4; }
}
else if mouse_wheel_down() and ob_main.cursor_hide=false and mouse_y>=ob_main.screen_main_y+stored_y and mouse_y<ob_main.screen_main_y+stored_y+80 {
	if ob_main.cam_w<(deck_build_stored_total*60) {
		stored_x-=32;
		if stored_x<ob_main.cam_w-(deck_build_stored_total*60)-1 { stored_x=ob_main.cam_w-(deck_build_stored_total*60)-1; }
	}
}
//
if mouse_check_button(mb_left) and ob_main.cursor_hide=false and ob_main.cam_w<(deck_build_stored_total*60) and
((mouse_y>=ob_main.screen_main_y+86 and mouse_y<ob_main.screen_main_y+90) or hold_stored_bar=true) {
	stored_x=round((mouse_x-ob_main.screen_deck_x-14)*(ob_main.cam_w-(deck_build_stored_total*60)-5)/(ob_main.cam_w-26));
	if stored_x>4 { stored_x=4; }
	else if stored_x<ob_main.cam_w-(deck_build_stored_total*60)-1 { stored_x=ob_main.cam_w-(deck_build_stored_total*60)-1; }
	hold_stored_bar=true;
}
else if !mouse_check_button(mb_left) or ob_main.cursor_hide=true {
	hold_stored_bar=false;
}
//
if stored_x<ob_main.cam_w-(deck_build_stored_total*60)-1 { stored_x=ob_main.cam_w-(deck_build_stored_total*60)-1; } //when moving last cards in list