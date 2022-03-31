//ob_splash
//————————————————————————————————————————————————————————————————————————————————————————————————————
if mouse_check_button_pressed(mb_any) or keyboard_check_pressed(vk_anykey) and ob_main.fade_black<=0 {
	ob_main.event_transition=ob_main.ref_mainmenu;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
text_timer--;
if text_timer=0 {
	text_potential_y=-70;
	text_color=make_colour_rgb(irandom_range(170,255),irandom_range(170,255),irandom_range(170,255));
}
else if text_timer<0 {
	text_timer=text_timer_max;
	text_potential_y=0;
}
//
if text_potential_y!=text_rel_y {
	if text_potential_y>text_rel_y {
		var step_y=ceil((text_potential_y-text_rel_y)/5);
		text_rel_y+=step_y;
	}
	else if text_potential_y<text_rel_y {
		var step_y=ceil((text_rel_y-text_potential_y)/5);
		text_rel_y-=step_y;
	}
}