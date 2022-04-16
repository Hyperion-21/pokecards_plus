if button_id!=2 or !instance_exists(ob_control) {
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
				else if button_id=3 {
					ob_control.type_chart=true;
				}
			}
			else if instance_exists(ob_event) {
				if button_id=0 and ob_event.event_applied=false {
					ob_event.apply_event=true;
				}
				else if button_id=1 {
					ob_main.event_transition=ob_event.event_kind;
					ob_event.event_cancelled=true;
				}
				else if button_id=2 {
					with (ob_card) {
						auto_turn_add=true;
					}
				}
			}
			else if instance_exists(ob_deckbuild) {
				if button_id<=4 {
					ob_deckbuild.reorder_selected=button_id;
					ob_deckbuild.reorder_type=ob_deckbuild.reorder_selected;
				}
				else if button_id<=9 {
					ob_deckbuild.deck_setup_load=button_id-4;
					ob_deckbuild.reorder_selected=0; //pokemon id
					ob_deckbuild.reorder_type=ob_deckbuild.reorder_selected;
				}
				else if button_id<=14 {
					ob_deckbuild.deck_setup_save=button_id-9;
					ob_deckbuild.reorder_selected=0; //pokemon id
					ob_deckbuild.reorder_type=ob_deckbuild.reorder_selected;
				}
			}
			button_state=1;
		}
		else { button_state-=0.1; }
	}
	else { button_state-=0.1; }
	//
	if button_state<0 { button_state=0; }
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else {
	if mouse_x>=x and mouse_y>=y+2 and mouse_x<x+sprite_width and mouse_y<y+sprite_height-2 and ob_main.mouse_cursor=0 and ob_control.battler_turn!=0 {
		ob_main.mouse_cursor=1;
		if mouse_check_button(mb_left) and ob_main.cursor_hide=false {
			button_state+=0.005;
			if button_state=1 {
				ob_control.battler_turn=0;
				ob_main.event_transition=ref_event_exitbattle;
				ob_main.fade_black=1;
			}
		}
		else { button_state-=0.05; }
	}
	else { button_state-=0.05; }
	//
	if button_state<0 { button_state=0; }
	ob_main.fade_black_exit_battle=button_state;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if instance_exists(ob_deckbuild) and ob_main.cursor_hide=false {
	if mouse_x>=x and mouse_y>=y+2 and mouse_x<x+sprite_width and mouse_y<y+sprite_height-2 {
		switch (button_id) {
			case 00: ob_deckbuild.tooltip_text="Sort cards by number."; break;
			case 01: ob_deckbuild.tooltip_text="Sort cards by level."; break;
			case 02: ob_deckbuild.tooltip_text="Sort cards by attack points."; break;
			case 03: ob_deckbuild.tooltip_text="Sort cards by defense points."; break;
			case 04: ob_deckbuild.tooltip_text="Sort cards by hit points."; break;
			case 05: ob_deckbuild.tooltip_text="Load deck setup 1."; break;
			case 06: ob_deckbuild.tooltip_text="Load deck setup 2."; break;
			case 07: ob_deckbuild.tooltip_text="Load deck setup 3."; break;
			case 08: ob_deckbuild.tooltip_text="Load deck setup 4."; break;
			case 09: ob_deckbuild.tooltip_text="Load deck setup 5."; break;
			case 10: ob_deckbuild.tooltip_text="Save deck setup 1."; break;
			case 11: ob_deckbuild.tooltip_text="Save deck setup 2."; break;
			case 12: ob_deckbuild.tooltip_text="Save deck setup 3."; break;
			case 13: ob_deckbuild.tooltip_text="Save deck setup 4."; break;
			case 14: ob_deckbuild.tooltip_text="Save deck setup 5."; break;
		}
		ob_deckbuild.tooltip_lines=1;
	}
}
