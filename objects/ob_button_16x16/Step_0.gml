if mouse_x>=x and mouse_y>=y+2 and mouse_x<x+sprite_width and mouse_y<y+sprite_height-2 and ob_control.mouse_cursor=0 {
	ob_control.mouse_cursor=1;
	if mouse_check_button_pressed(mb_left) and button_state=0 and ob_control.cursor_hide=false {
		if button_id=0 {
			ob_control.button_nextturn=true;
		}
		else if button_id=1 {
			ob_control.button_sorthand=true;
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