cam_x=camera_get_view_x(view_camera[0]);
cam_y=camera_get_view_y(view_camera[0]);
//————————————————————————————————————————————————————————————————————————————————————————————————————
mouse_cursor=0;
if mouse_check_button(mb_right) {
	cursor_hide=true;
	helpmsg_dismissed=true;
}
else { cursor_hide=false; }
//
if keyboard_check_pressed(vk_f1) {
	if AI_report_toggle=false { AI_report_toggle=true; }
	else { AI_report_toggle=false; }
}
if keyboard_check_pressed(vk_f5) { game_restart(); } //< delete later, testing
//————————————————————————————————————————————————————————————————————————————————————————————————————
var i=0;
repeat (card_hand_total) { //sets x coordinate in hand
	var ii=0;
	do {
		ii+=1;
		var card_distance=25-ii;
	}
	until (((card_hand_total-1)*card_distance*2)+57<=350);
	card_hand[i].potential_x=round(cam_w/2)-28-(card_distance*(card_hand_total-1))+(card_distance*i*2);
	i+=1;
}
//
var i=0;
repeat (enemycard_hand_total) { //sets x and y coordinates in hand for enemy
	var ii=0;
	do {
		ii+=1;
		var card_distance=25-ii;
	}
	until (((enemycard_hand_total-1)*card_distance*2)+57<=350);
	enemycard_hand[i].potential_x=round(cam_w/2)-28-(card_distance*(enemycard_hand_total-1))+(card_distance*i*2);
	enemycard_hand[i].potential_y=-58;
	i+=1;
}
//
var i=0;
repeat (card_hand_total+1) { //sets card focus
	var var_card_id=-1;
	if i<card_hand_total { //checks all cards in hand
		var_card_id=card_hand[i];
	}
	else if position_meeting(mouse_x,mouse_y,ob_card) and instance_position(mouse_x,mouse_y,ob_card).card_face=true { //checks card where mouse is
		var_card_id=instance_position(mouse_x,mouse_y,ob_card);
	}
	if var_card_id!=-1 {
		if mouse_x>=var_card_id.x and mouse_y>=var_card_id.y and mouse_x<var_card_id.x+57 and mouse_y<var_card_id.y+80 and
		var_card_id.card_face=true and (card_focus=-1 or var_card_id.depth<card_focus.depth) and var_card_id.x=var_card_id.potential_x and cursor_hide=false {
			card_focus=var_card_id;
			if i<card_hand_total { card_focus_hand=i; }
		}
	}
	i+=1;
}
//
var i=0;
repeat (card_hand_total) { //sets y coordinate and depth of cards in hand
	if card_focus=card_hand[i] {
		card_hand[i].potential_y=208;
	}
	else if card_focus!=card_hand[i] {
		card_hand[i].potential_y=236;
	}
	//
	if card_focus_hand=-1 { card_hand[i].depth=card_hand_total-i; }
	else if card_focus_hand>i { card_hand[i].depth=card_focus_hand-i; }
	else if card_focus_hand=i { card_hand[i].depth=0; }
	else if card_focus_hand<i { card_hand[i].depth=i-card_focus_hand; }
	i+=1;
}
//
var i=0;
repeat (enemycard_hand_total) { //sets depth of cards in enemy's hand
	enemycard_hand[i].depth=enemycard_hand_total-i;
	i+=1;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_focus!=-1 {
	if mouse_check_button(mb_left) and cursor_hide=false and player_turn=true and card_focus.card_played=false { //hold focused card
		card_focus.potential_x=mouse_x-28;
		card_focus.potential_y=mouse_y-40;
		card_hold=card_focus;
	}
	else if (mouse_x<card_focus.x or mouse_y<card_focus.y or mouse_x>=card_focus.x+57 or mouse_y>=card_focus.y+80) or cursor_hide=true {
		card_focus=-1;
		card_focus_hand=-1;
	}
	//
	if mouse_check_button_pressed(mb_left) and card_hold=-1 and cursor_hide=false and card_focus.card_played=true and card_focus.card_enemy=false { //click played card
		with (card_focus) {
			//card_hp-=1;
			//effect_damaged=1;
			y-=70;
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
if card_hold!=-1 and (!mouse_check_button(mb_left) or cursor_hide=true) { //play held card
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
			else if card_hold.card_cat=1 and var_cardspace_id.berries_total<8 {
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
// ENEMY TURN
//————————————————————————————————————————————————————————————————————————————————————————————————————
if player_turn=false {
	if enemy_turn_timer>0 { enemy_turn_timer-=1; }
	//
	if enemy_turn_timer=0 {
		if enemy_turn_phase<0 { enemy_turn_timer=irandom_range(30,45); }
		else { enemy_turn_timer=irandom_range(15,15); }
		enemy_turn_phase+=1;
		enemycard_playplan_id=-1;
		enemyspace_playplan=-1;
	}
	//
	if enemy_turn_phase=1 {
		if enemycard_draw_points>0 and enemycard_hand_total<card_hand_max and (enemycard_maindeck[0]!=-1 or enemycard_berrydeck[0]!=-1) {
			sc_AI_draw(irandom(99)+1);
		}
	}
	//
	else if enemy_turn_phase=2 {
		sc_AI_play(irandom(99)+1);
	}
	//
	else if enemy_turn_phase=3 {
		sc_AI_attack(irandom(99)+1);
	}
	//
	else if enemy_turn_phase=4 {
		button_nextturn=true;
		button_nextturn_id.button_state=1;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// BUTTONS
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
		enemycard_draw_points=2;
		helpmsg_dismissed=false;
		enemy_turn_timer=0;
		enemy_turn_phase=-1;
		sc_AI_report("- NEW TURN -");
	}
	else if player_turn=false {
		player_turn=true;
		card_draw_points=2;
		enemycard_draw_points=0;
		helpmsg_dismissed=false;
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
//————————————————————————————————————————————————————————————————————————————————————————————————————
button_sorthand=false;
button_nextturn=false;