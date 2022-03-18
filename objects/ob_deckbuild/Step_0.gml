var i=0;
repeat (deck_build_total) {
	deck_card_main[i].potential_x=ob_main.screen_deck_x+stored_x+(60*i);
	deck_card_main[i].potential_y=ob_main.screen_main_y+stored_y;
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if mouse_x<=ob_main.screen_deck_x+32 and mouse_y>=ob_main.screen_main_y+stored_y and mouse_y<ob_main.screen_main_y+stored_y+80 and ob_main.cursor_hide=false {
	stored_x+=16;
	if stored_x>4 { stored_x=4; }
}
else if mouse_x>=ob_main.screen_deck_x+ob_main.cam_w-32 and mouse_y>=ob_main.screen_main_y+stored_y and mouse_y<ob_main.screen_main_y+stored_y+80 and ob_main.cursor_hide=false {
	if ob_main.cam_w<(deck_build_total*60) {
		stored_x-=16;
		if stored_x<ob_main.cam_w-(deck_build_total*60)-1 { stored_x=ob_main.cam_w-(deck_build_total*60)-1; }
	}
}
//
if mouse_check_button(mb_left) and ob_main.cursor_hide=false and ob_main.cam_w<(deck_build_total*60) and
((mouse_y>=ob_main.screen_main_y+86 and mouse_y<ob_main.screen_main_y+90) or hold_stored_bar=true) {
	stored_x=round((mouse_x-ob_main.screen_deck_x-14)*(ob_main.cam_w-(deck_build_total*60)-5)/(ob_main.cam_w-26));
	if stored_x>4 { stored_x=4; }
	else if stored_x<ob_main.cam_w-(deck_build_total*60)-1 { stored_x=ob_main.cam_w-(deck_build_total*60)-1; }
	hold_stored_bar=true;
}
else if !mouse_check_button(mb_left) or ob_main.cursor_hide=true {
	hold_stored_bar=false;
}