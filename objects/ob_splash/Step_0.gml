//ob_splash
//————————————————————————————————————————————————————————————————————————————————————————————————————
if (mouse_check_button_pressed(mb_any) or keyboard_check_pressed(vk_anykey)) and ob_main.fade_black<=0 {
	sc_playsound(sn_click,50,false,false);
	ob_main.event_transition=ref_mainmenu;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if sc_music_sync()=true {
	text_potential_y=-70;
	text_color=make_colour_rgb(irandom_range(170,255),irandom_range(170,255),irandom_range(170,255));
	with (ob_card_splash) {
		if beat_direction=0 {
			potential_y-=70;
			beat_direction=1;
		}
		else {
			potential_y+=70;
			beat_direction=0;
		}
	}
}
else {
	text_potential_y=0;
	with (ob_card_splash) {
		potential_y=initial_y;
	}
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