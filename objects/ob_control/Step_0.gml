cam_x=camera_get_view_x(view_camera[0]);
cam_y=camera_get_view_y(view_camera[0]);
if keyboard_check_pressed(vk_f5) { game_restart(); } //< delete later, testing
//————————————————————————————————————————————————————————————————————————————————————————————————————
if cam_x!=(floor(x/256)*256) or cam_y!=(floor(y/192)*192) { //camera moving
	if screen_transition=false { screen_transition=true; }
	instance_activate_region(x-128,y-96,256,192,true);
}
else { //camera still
	if screen_transition=true {
		reset_objects=true;
		screen_transition=false;
		quick_transition=false;
	}
	else if screen_transition=false and reset_objects=true {
		reset_objects=false;
		instance_deactivate_object(ob_event);
		instance_deactivate_object(ob_tallgrass);
		instance_activate_region(x-128,y-96,256,192,true);
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
text_next=false;
//
if text_show!=text_string {
	if text_timer=text_timermax {
		//sc_playsound(sn_text,50,false,false,false);
		text_show=text_show+string_char_at(text_string,text_charnum);
		text_charnum+=1;
		text_timer=0;
	}
	else { text_timer+=1; }
	//
	if sc_input("01",0) {
		//sc_playsound(sn_text,50,false,false,false);
		text_show=text_string;
	}
}
else if text_string!="" {
	if sc_input("01",0) {
		text_string="";
		text_show="";
		text_charnum=1;
		text_timer=0;
		text_next=true;
	}
}