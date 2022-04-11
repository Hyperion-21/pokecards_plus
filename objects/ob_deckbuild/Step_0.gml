if reorder_type>-1 {
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	//ORDER BY SERIAL
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	var i=0, card_pos_replace;
	repeat (deck_build_all_total) {
		card_pos_replace[i]=-1;
		i++;
	}
	//
	var i=0, serial_check=0;
	do {
		var ii=0;
		repeat (deck_build_all_total) {
			if instance_exists(deck_card_all[ii]) {
				if (reorder_type=0 or reorder_type=5) and deck_card_all[ii].card_serial=serial_check and card_pos_replace[i]=-1 {
					card_pos_replace[i]=deck_card_all[ii];
					i++;
				}
				else if (reorder_type>=1 and reorder_type<=4) and deck_card_all[ii].card_serial=serial_check and card_pos_replace[deck_build_all_total-i-1]=-1 {
					card_pos_replace[deck_build_all_total-i-1]=deck_card_all[ii];
					i++;
				}
			}
			ii++;
		}
		serial_check++;
	} until (i=deck_build_all_total or (reorder_type=5 and i=deck_build_all_total-1));
	//
	var i=0;
	repeat (deck_build_all_total) {
		deck_card_all[i]=card_pos_replace[i];
		i++;
	}
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	if reorder_type=5 {
		deck_build_all_total--;
	}
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	//ORDER BY STATS
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	var i=0, card_pos_replace;
	repeat (deck_build_all_total) {
		card_pos_replace[i]=-1;
		i++;
	}
	//
	var i=0, order_check=0;
	do {
		var ii=0;
		repeat (deck_build_all_total) {
			if instance_exists(deck_card_all[ii]) {
				if (reorder_type=0 or reorder_type=5) and deck_card_all[ii].card_id=order_check and card_pos_replace[i]=-1 { //pokemon id
					card_pos_replace[i]=deck_card_all[ii];
					i++;
				}
				else if reorder_type=1 and deck_card_all[ii].card_level=order_check and card_pos_replace[deck_build_all_total-i-1]=-1 { //level
					card_pos_replace[deck_build_all_total-i-1]=deck_card_all[ii];
					i++;
				}
				else if reorder_type=2 and deck_card_all[ii].card_full_atk=order_check and card_pos_replace[deck_build_all_total-i-1]=-1 { //attack
					card_pos_replace[deck_build_all_total-i-1]=deck_card_all[ii];
					i++;
				}
				else if reorder_type=3 and deck_card_all[ii].card_full_def=order_check and card_pos_replace[deck_build_all_total-i-1]=-1 { //defense
					card_pos_replace[deck_build_all_total-i-1]=deck_card_all[ii];
					i++;
				}
				else if reorder_type=4 and deck_card_all[ii].card_full_hp=order_check and card_pos_replace[deck_build_all_total-i-1]=-1 { //hp
					card_pos_replace[deck_build_all_total-i-1]=deck_card_all[ii];
					i++;
				}
			}
			ii++;
		}
		order_check++;
	} until (i=deck_build_all_total);
	//
	var i=0;
	repeat (deck_build_all_total) {
		deck_card_all[i]=card_pos_replace[i];
		i++;
	}
	//
	if reorder_type=5 {
		var i=0;
		repeat (deck_build_all_total) {
			for (var ii=1; ii<=ob_main.deck_setup_max; ii++;) { //re-save decks
				ob_main.main_card_indeck[i][ii]=deck_card_all[i].card_indeck[ii];
			}
			i++;
		}
		//
		for (var i=1; i<=ob_main.deck_setup_max; i++;) { //unnecessary, but just in case
			ob_main.main_card_indeck[deck_build_all_total][i]=false;
		}
	}
	//
	reorder_type=-1;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
//LOAD DECKS
if deck_setup_load>-1 {
	var i=0;
	repeat (deck_build_all_total) {
		deck_card_all[i].card_indeck[0]=ob_main.main_card_indeck[i][deck_setup_load];
		i++;
	}
	//
	var i=0;
	repeat (4) {
		deck_berry_used[i]=ob_main.berry_num_used[i][deck_setup_load];
		i++;
	}
	//
	deck_setup_load=-1;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
deck_build_stored_total=0;
deck_build_used_total=0;
//
var i=0, ii=0, iii=0;
repeat (deck_build_all_total) {
	if deck_card_all[i].card_indeck[0]=false {
		deck_card_stored[ii]=deck_card_all[i];
		deck_build_stored_total++;
		ii++;
	}
	else {
		deck_card_used[iii]=deck_card_all[i];
		deck_build_used_total++;
		iii++;
	}
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
//SAVE DECKS
ob_main.maindeck_total=deck_build_all_total;
var i=0;
repeat (deck_build_all_total) {
	ob_main.main_card_id[i]=deck_card_all[i].card_id;
	ob_main.main_card_level[i]=deck_card_all[i].card_level;
	ob_main.main_card_glyph_a[i]=deck_card_all[i].card_glyph_a;
	ob_main.main_card_glyph_b[i]=deck_card_all[i].card_glyph_b;
	ob_main.main_card_glyph_c[i]=deck_card_all[i].card_glyph_c;
	ob_main.main_card_innate[i]=deck_card_all[i].card_innate;
	ob_main.main_card_form_value[i]=deck_card_all[i].card_form_value;
	ob_main.main_card_serial[i]=deck_card_all[i].card_serial;
	//
	ob_main.main_card_indeck[i][0]=deck_card_all[i].card_indeck[0];
	if deck_setup_save>-1 {
		deck_card_all[i].card_indeck[deck_setup_save]=deck_card_all[i].card_indeck[0];
		ob_main.main_card_indeck[i][deck_setup_save]=deck_card_all[i].card_indeck[deck_setup_save];
	}
	//
	i++;
}
//
ob_main.berrydeck_total=card_berrydeck_total;
var i=0;
repeat (4) {
	ob_main.berry_num_used[i][0]=deck_berry_used[i];
	if deck_setup_save>-1 {
		ob_main.berry_num_used[i][deck_setup_save]=deck_berry_used[i];
	}
	//
	i++;
}
//
deck_setup_save=-1;
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
//
var i=0;
repeat (4) {
	if deck_berry_total[i]>0 {
		deck_card_berry[i].potential_x=ob_main.screen_deck_x+(69*i)+124;
		deck_card_berry[i].potential_y=ob_main.screen_main_y+104;
	}
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// SCROLL BARS (ob_event & ob_deckbuild)
if mouse_y>=ob_main.screen_main_y+stored_y and mouse_y<ob_main.screen_main_y+stored_y+80+8 and ob_main.cursor_hide=false {
	if mouse_wheel_up() {
		stored_x+=32;
		if stored_x>4 { stored_x=4; }
	}
	else if mouse_wheel_down() and ob_main.cam_w<(deck_build_stored_total*60) {
		stored_x-=32;
		if stored_x<ob_main.cam_w-(deck_build_stored_total*60)-1 { stored_x=ob_main.cam_w-(deck_build_stored_total*60)-1; }
	}
}
else if mouse_y>=ob_main.screen_main_y+used_y-8 and mouse_y<ob_main.screen_main_y+used_y+80 and ob_main.cursor_hide=false {
	if mouse_wheel_up() {
		used_x+=32;
		if used_x>4 { used_x=4; }
	}
	else if mouse_wheel_down() and ob_main.cam_w<(deck_build_used_total*60) {
		used_x-=32;
		if used_x<ob_main.cam_w-(deck_build_used_total*60)-1 { used_x=ob_main.cam_w-(deck_build_used_total*60)-1; }
	}
}
//
if mouse_check_button(mb_left) and ob_main.cursor_hide=false and ob_main.cam_w<(deck_build_stored_total*60) and hold_used_bar=false and
((mouse_y>=ob_main.screen_main_y+stored_y+82 and mouse_y<ob_main.screen_main_y+stored_y+86) or hold_stored_bar=true) {
	var mouse_pos=mouse_x-ob_main.screen_deck_x-8-4, mouse_pos_max=ob_main.cam_w-16-10, stored_pos_max=ob_main.cam_w-(deck_build_stored_total*60)-5;
	var stored_x_percent=mouse_pos*100/mouse_pos_max;
	stored_x=round(stored_x_percent*stored_pos_max/100)+4;
	if stored_x>4 { stored_x=4; }
	else if stored_x<ob_main.cam_w-(deck_build_stored_total*60)-1 { stored_x=ob_main.cam_w-(deck_build_stored_total*60)-1; }
	hold_stored_bar=true;
}
else if mouse_check_button(mb_left) and ob_main.cursor_hide=false and ob_main.cam_w<(deck_build_used_total*60) and hold_stored_bar=false and
((mouse_y>=ob_main.screen_main_y+used_y-8 and mouse_y<ob_main.screen_main_y+used_y-4) or hold_used_bar=true) {
	var mouse_pos=mouse_x-ob_main.screen_deck_x-8-4, mouse_pos_max=ob_main.cam_w-16-10, used_pos_max=ob_main.cam_w-(deck_build_used_total*60)-5;
	var used_x_percent=mouse_pos*100/mouse_pos_max;
	used_x=round(used_x_percent*used_pos_max/100)+4;
	if used_x>4 { used_x=4; }
	else if used_x<ob_main.cam_w-(deck_build_used_total*60)-1 { used_x=ob_main.cam_w-(deck_build_used_total*60)-1; }
	hold_used_bar=true;
}
else if !mouse_check_button(mb_left) or ob_main.cursor_hide=true {
	hold_stored_bar=false;
	hold_used_bar=false;
}
//
if ob_main.cam_w<(deck_build_stored_total*60) { //when moving last cards in list
	if stored_x<ob_main.cam_w-(deck_build_stored_total*60)-1 { stored_x=ob_main.cam_w-(deck_build_stored_total*60)-1; }
}
else { stored_x=4; }
if ob_main.cam_w<(deck_build_used_total*60) { //when moving last cards in list
	if used_x<ob_main.cam_w-(deck_build_used_total*60)-1 { used_x=ob_main.cam_w-(deck_build_used_total*60)-1; }
}
else { used_x=4; }