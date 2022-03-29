if mouse_x>=x and mouse_y>=y+2 and mouse_x<x+sprite_width and mouse_y<y+sprite_height-2 and ob_main.mouse_cursor=0 {
	ob_main.mouse_cursor=1;
	if mouse_check_button_pressed(mb_left) and button_state=0 and ob_main.cursor_hide=false {
		if instance_exists(ob_control) {
			if button_id=0 and ob_control.battler_turn=1 {
				ob_control.button_nextturn=true;
			}
			else if button_id=1 {
				ob_control.button_sorthand=true;
			}
		}
		else if instance_exists(ob_event) {
			if button_id=0 and ob_event.event_applied=false {
				ob_event.apply_event=true;
			}
			else if button_id=1 {
				ob_main.event_transition=ob_event.event_kind;
			}
		}
		else if instance_exists(ob_deckbuild) {
			ob_deckbuild.reorder_selected=button_id;
			ob_deckbuild.reorder_type=ob_deckbuild.reorder_selected;
		}
		button_state=1;
	}
	else {
		button_state-=0.1;
	}
}
else {
	button_state-=0.1;
}
if button_state<0 { button_state=0; }