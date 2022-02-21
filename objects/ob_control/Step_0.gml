cam_x=camera_get_view_x(view_camera[0]);
cam_y=camera_get_view_y(view_camera[0]);
//
mouse_cursor=0;
if mouse_check_button(mb_right) { cursor_hide=true; }
else { cursor_hide=false; }
//
if keyboard_check_pressed(vk_f5) { game_restart(); } //< delete later, testing
//————————————————————————————————————————————————————————————————————————————————————————————————————
var i=0;
repeat (card_hand_total) {
	var ii=0;
	do {
		ii+=1;
		var card_distance=25-ii;
	}
	until (((card_hand_total-1)*card_distance*2)+57<=350);
	card_hand[i].potential_x=round(cam_w/2)-28-(card_distance*(card_hand_total-1))+(card_distance*i*2);
	//
	if mouse_x>=card_hand[i].x and mouse_y>=card_hand[i].y and mouse_x<=card_hand[i].x+57 and mouse_y<=card_hand[i].y+80 and
		card_hand[i].card_face=true and (card_focus=-1 or card_hand[i].depth<card_focus.depth) and card_hand[i].x=card_hand[i].potential_x and cursor_hide=false {
		card_focus=card_hand[i];
		card_focus_hand=i;
	}
	i+=1;
}
var i=0;
repeat (card_hand_total) {
	if card_focus=card_hand[i] {
		card_hand[i].potential_y=208;
	}
	else if card_focus!=card_hand[i] {
		card_hand[i].potential_y=238;
	}
	if card_focus_hand=-1 { card_hand[i].depth=card_hand_total-i; }
	else if card_focus_hand>i { card_hand[i].depth=card_focus_hand-i; }
	else if card_focus_hand=i { card_hand[i].depth=0; }
	else if card_focus_hand<i { card_hand[i].depth=i-card_focus_hand; }
	i+=1;
}
if card_focus!=-1 {
	if mouse_check_button(mb_left) {
		card_focus.potential_x=mouse_x-28;
		card_focus.potential_y=mouse_y-40;
		card_hold=card_focus;
	}
	else if cursor_hide=true or (mouse_x<card_focus.x or mouse_y<card_focus.y or mouse_x>card_focus.x+57 or mouse_y>card_focus.y+80) {
		card_focus=-1;
		card_focus_hand=-1;
	}
}
if card_hold!=-1 and !mouse_check_button(mb_left) {
	card_focus=-1;
	card_hold=-1;
	card_focus_hand=-1;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
//if cam_x!=(floor(x/256)*256) or cam_y!=(floor(y/192)*192) { //camera moving
//	if screen_transition=false { screen_transition=true; }
//	instance_activate_region(x-128,y-96,256,192,true);
//}
//else { //camera still
//	if screen_transition=true {
//		reset_objects=true;
//		screen_transition=false;
//		quick_transition=false;
//	}
//	else if screen_transition=false and reset_objects=true {
//		reset_objects=false;
//		instance_deactivate_object(ob_event);
//		instance_deactivate_object(ob_tallgrass);
//		instance_activate_region(x-128,y-96,256,192,true);
//	}
//}
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