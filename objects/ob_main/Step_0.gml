if mouse_check_button(mb_right) { cursor_hide=true; }
else { cursor_hide=false; }
//
if keyboard_check_pressed(vk_f5) { game_restart(); } //< delete later, testing
//————————————————————————————————————————————————————————————————————————————————————————————————————
if roadmap_create=true {
	var i=0;
	repeat (3) {
		var ii=0;
		repeat (10) {
			if i<2 { event[i][ii]=irandom_range(0,1); }
			else { event[i][ii]=irandom_range(-1,1); }
			//
			if event[i][ii]=0 { event_name[i][ii]="Battle"; }
			else if event[i][ii]=1 { event_name[i][ii]="Card Pack"; }
			//
			do {
				area[ii]=irandom(21);
			} until (area[ii]!=11 and area[ii]!=13 and area[ii]!=15); //rocket HQs & city
			ii++;
		}
		i++;
	}
	roadmap_create=false;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if event_transition>-1 and fade_black<1 {
	if event_transition=0 { fade_black+=0.02; }
	else if event_transition=1 or event_transition=2 { fade_black+=0.005; }
}
else if event_transition=-1 and fade_black>0 {
	fade_black-=0.02;
}
else if event_transition>-1 and fade_black>=1 {
	if event_transition=0 {
		instance_create_layer(x,y,"instances",ob_control);
	}
	else if event_transition=1 or event_transition=2 {
		//destroy everything except ob_main
		with (ob_control) { instance_destroy(); }
		with (ob_card) { instance_destroy(); }
		with (ob_card_space) { instance_destroy(); }
		with (ob_button_16x16) { instance_destroy(); }
		with (ob_button_31x24) { instance_destroy(); }
		with (ob_background) { instance_destroy(); }
		with (ob_background_tile) { instance_destroy(); }
		with (ob_damage_num) { instance_destroy(); }
	}
	event_transition=-1;
}
else if event_transition=-1 and fade_black<=0 {
	if keyboard_check_pressed(vk_enter) and !instance_exists(ob_control) {
		event_transition=0;
	}
}