//ob_splash
//————————————————————————————————————————————————————————————————————————————————————————————————————



if mouse_x>=(screen_main_x+(cam_w/2)-35) and mouse_y>= (screen_main_y+cam_h-50) and mouse_x<=(screen_main_x+(cam_w/2)+35) and mouse_y<=(screen_main_y+cam_h-25) {
	with (ob_main)
		{
		if mouse_check_button_pressed(mb_left){
			savestate++;
			if savestate>4 { savestate = 0; }
		}
		else if mouse_check_button_pressed(mb_right){
			savestate--;
			if savestate<0 { savestate = 4; }
		}
	}
}	
else if (mouse_check_button_pressed(mb_any) or keyboard_check_pressed(vk_anykey)) and ob_main.fade_black<=0 {
	sc_playsound(sn_click,50,false,false);
	with (ob_main)
	{
		sc_config_load();
		sc_data_load();
		audio_sound_gain(ms_main,(option_state[opt_music]/100),0);
		audio_sound_gain(ms_league,(option_state[opt_music]/100),0);
		event_transition=ref_mainmenu;
	}
	
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