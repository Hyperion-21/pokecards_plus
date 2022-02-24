cam_x=camera_get_view_x(view_camera[0]);
cam_y=camera_get_view_y(view_camera[0]);
//
mouse_cursor=0;
if mouse_check_button(mb_right) {
	cursor_hide=true;
	helpmsg_dismissed=true;
}
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
	i+=1;
}
var i=0;
repeat (card_hand_total+1) {
	var var_card_id=-1;
	if i<card_hand_total { var_card_id=card_hand[i]; } //checks all cards in hand
	else if position_meeting(mouse_x,mouse_y,ob_card) { var_card_id=instance_position(mouse_x,mouse_y,ob_card); } //checks card where mouse is
	if var_card_id!=-1 {
		if mouse_x>=var_card_id.x and mouse_y>=var_card_id.y and mouse_x<var_card_id.x+57 and mouse_y<var_card_id.y+80 and
		var_card_id.card_face=true and (card_focus=-1 or var_card_id.depth<card_focus.depth) and var_card_id.x=var_card_id.potential_x and cursor_hide=false {
			card_focus=var_card_id;
			if i<card_hand_total { card_focus_hand=i; }
		}
	}
	i+=1;
}
var i=0;
repeat (card_hand_total) {
	if card_focus=card_hand[i] {
		card_hand[i].potential_y=208;
	}
	else if card_focus!=card_hand[i] {
		card_hand[i].potential_y=236;
	}
	if card_focus_hand=-1 { card_hand[i].depth=card_hand_total-i; }
	else if card_focus_hand>i { card_hand[i].depth=card_focus_hand-i; }
	else if card_focus_hand=i { card_hand[i].depth=0; }
	else if card_focus_hand<i { card_hand[i].depth=i-card_focus_hand; }
	i+=1;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_focus!=-1 {
	if mouse_check_button(mb_left) and cursor_hide=false and card_focus.card_played=false {
		card_focus.potential_x=mouse_x-28;
		card_focus.potential_y=mouse_y-40;
		card_hold=card_focus;
	}
	else if (mouse_x<card_focus.x or mouse_y<card_focus.y or mouse_x>=card_focus.x+57 or mouse_y>=card_focus.y+80) or cursor_hide=true {
		card_focus=-1;
		card_focus_hand=-1;
	}
	//
	if mouse_check_button_pressed(mb_left) and card_hold=-1 and cursor_hide=false and card_focus.card_played=true {
		with (card_focus) {
			card_hp-=1;
			effect_damaged=1;
			if card_hp<=0 {
				instance_position(x,y,ob_card_space).occupied=false;
				instance_position(x,y,ob_card_space).effect_use=1;
				ob_control.card_space_id[10].effect_use=1;
				ob_control.card_focus=-1;
				card_trash=true;
			}
		}
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_hold!=-1 and (!mouse_check_button(mb_left) or cursor_hide=true) {
	if position_meeting(mouse_x,mouse_y,ob_card_space) {
		var var_cardspace_id=instance_position(mouse_x,mouse_y,ob_card_space), playing_requirements=false;
		//
		if var_cardspace_id=card_space_id[5] or var_cardspace_id=card_space_id[6] or var_cardspace_id=card_space_id[7] or
		var_cardspace_id=card_space_id[8] or var_cardspace_id=card_space_id[9] {
			if card_hold.card_cat=0 and
			var_cardspace_id.berries_total_type[0]>=card_hold.card_cost_total_type[0] and
			var_cardspace_id.berries_total_type[1]>=card_hold.card_cost_total_type[1] and
			var_cardspace_id.berries_total_type[2]>=card_hold.card_cost_total_type[2] and
			var_cardspace_id.berries_total_type[3]>=card_hold.card_cost_total_type[3] {
				playing_requirements=true;
			}
			else if card_hold.card_cat=1 and
			var_cardspace_id.berries_total<8 {
				playing_requirements=true;
			}
		}
		else if var_cardspace_id=card_space_id[10] {
			playing_requirements=true;
		}
		//
		if (var_cardspace_id.occupied=false and playing_requirements=true) or var_cardspace_id=card_space_id[10] {
			if var_cardspace_id=card_space_id[10] {
				card_hold.card_trash=true;
			}
			else if card_hold.card_cat=0 {
				card_hold.potential_x=var_cardspace_id.x;
				card_hold.potential_y=var_cardspace_id.y;
				var_cardspace_id.berries_total_type[0]-=card_hold.card_cost_total_type[0];
				var_cardspace_id.berries_total_type[1]-=card_hold.card_cost_total_type[1];
				var_cardspace_id.berries_total_type[2]-=card_hold.card_cost_total_type[2];
				var_cardspace_id.berries_total_type[3]-=card_hold.card_cost_total_type[3];
				var_cardspace_id.berries_total-=card_hold.card_cost_total;
				card_hold.depth=200;
				var_cardspace_id.occupied=true;
			}
			else if card_hold.card_cat=1 {
				var_cardspace_id.berries_total+=1;
				var_cardspace_id.berries_total_type[card_hold.card_id-3000]+=1;
				card_hold.card_trash=true;
			}
			//
			var_cardspace_id.effect_use=1;
			card_hold.card_played=true;
			//
			var i=0, lower_hand_num=false;
			repeat (card_hand_total) {
				if card_hold=card_hand[i] {
					lower_hand_num=true;
				}
				if lower_hand_num=true {
					if i<card_hand_max-1 { card_hand[i]=card_hand[i+1]; }
					else { card_hand[i]=-1; }
				}
				i+=1;
			}
			card_hand_total-=1;
		}
	}
	//
	card_focus=-1;
	card_hold=-1;
	card_focus_hand=-1;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if button_sorthand=true and card_focus=-1 {
	var i=0, card_hand_pos_replace;
	repeat (card_hand_total) {
		card_hand_pos_replace[i]=-1;
		i+=1;
	}
	//
	var i=1, ii=0;
	do {
		var iii=0;
		repeat (card_hand_total) {
			if card_hand[iii].card_id=i and card_hand_pos_replace[ii]=-1 {
				card_hand_pos_replace[ii]=card_hand[iii];
				ii+=1;
			}
			iii+=1;
		}
		i+=1;
	}
	until (ii=card_hand_total);
	//
	var i=0;
	repeat (card_hand_total) {
		card_hand[i]=card_hand_pos_replace[i];
		i+=1;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if button_nextturn=true {
	if player_turn=true {
		player_turn=false;
		card_draw_points=0;
	}
	else if player_turn=false {
		player_turn=true;
		card_draw_points=4//2;
		helpmsg_dismissed=false;
	}
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
//————————————————————————————————————————————————————————————————————————————————————————————————————
button_sorthand=false;
button_nextturn=false;