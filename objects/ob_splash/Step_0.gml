//ob_splash
//————————————————————————————————————————————————————————————————————————————————————————————————————
if mouse_check_button_pressed(mb_any) or keyboard_check_pressed(vk_anykey) and ob_main.fade_black<=0 {
	ob_main.event_transition=ob_main.ref_mainmenu;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if beat_margin>0 { beat_margin--; }
var music_pos=audio_sound_get_track_position(ob_main.music_player), music_length=audio_sound_length(ob_main.music_player);
if beat_margin=0 and
((music_pos<=music_length*0.01) or (music_pos>=music_length*0.24 and music_pos<=music_length*0.26) or
(music_pos>=music_length*0.49 and music_pos<=music_length*0.51) or (music_pos>=music_length*0.74 and music_pos<=music_length*0.76)) {
	text_potential_y=-70;
	text_color=make_colour_rgb(irandom_range(170,255),irandom_range(170,255),irandom_range(170,255));
	beat_margin=15;
}
else {
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