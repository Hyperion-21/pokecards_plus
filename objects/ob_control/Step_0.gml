if ob_main.cursor_hide=true {
	tooltip_timer=0;
}
window_set_caption(string(enemycard_draw_points))
//
if keyboard_check_pressed(vk_f1) {
	if AI_report_toggle=false { AI_report_toggle=true; }
	else { AI_report_toggle=false; }
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if player_effect_damaged>0 { player_effect_damaged-=0.08; }
if enemy_effect_damaged>0 { enemy_effect_damaged-=0.08; }
//
if tooltip_timer>0 { tooltip_timer--; }
else if tooltip_timer=0 {
	first_turn_attack_warning=false;
	hand_full_draw_warning=false;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
var i=0;
repeat (card_hand_total) { //sets x coordinate in hand
	var ii=0;
	do {
		ii++;
		var card_distance=25-ii;
	}
	until (((card_hand_total-1)*card_distance*2)+57<=350);
	card_hand[i].potential_x=cam_x+round(cam_w/2)-28-(card_distance*(card_hand_total-1))+(card_distance*i*2);
	i++;
}
//
var i=0;
repeat (enemycard_hand_total) { //sets x and y coordinates in hand for enemy
	var ii=0;
	do {
		ii++;
		var card_distance=25-ii;
	}
	until (((enemycard_hand_total-1)*card_distance*2)+57<=350);
	enemycard_hand[i].potential_x=cam_x+round(cam_w/2)-28-(card_distance*(enemycard_hand_total-1))+(card_distance*i*2);
	enemycard_hand[i].potential_y=cam_y-58;
	i++;
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
		var_card_id.card_face=true and (card_focus=-1 or var_card_id.depth<card_focus.depth) and var_card_id.x=var_card_id.potential_x and ob_main.cursor_hide=false {
			card_focus=var_card_id;
			if i<card_hand_total { card_focus_hand=i; }
		}
	}
	i++;
}
//
var i=0;
repeat (card_hand_total) { //sets y coordinate and depth of cards in hand
	if card_focus=card_hand[i] {
		card_hand[i].potential_y=cam_y+208;
	}
	else if card_focus!=card_hand[i] {
		card_hand[i].potential_y=cam_y+236;
	}
	//
	if card_focus_hand=-1 { card_hand[i].depth=card_hand_total-i; }
	else if card_focus_hand>i { card_hand[i].depth=card_focus_hand-i; }
	else if card_focus_hand=i { card_hand[i].depth=0; }
	else if card_focus_hand<i { card_hand[i].depth=i-card_focus_hand; }
	i++;
}
//
var i=0;
repeat (enemycard_hand_total) { //sets depth of cards in enemy's hand
	enemycard_hand[i].depth=enemycard_hand_total-i;
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_focus!=-1 {
	if mouse_check_button(mb_left) and ob_main.cursor_hide=false and battler_turn=1 and card_focus.card_played=false { //hold focused card
		card_focus.potential_x=mouse_x-28;
		card_focus.potential_y=mouse_y-40;
		card_hold=card_focus;
	}
	else if (mouse_x<card_focus.x or mouse_y<card_focus.y or mouse_x>=card_focus.x+57 or mouse_y>=card_focus.y+80) or ob_main.cursor_hide=true {
		card_focus=-1;
		card_focus_hand=-1;
	}
	//
	if mouse_check_button_pressed(mb_left) and battler_turn=1 and card_hold=-1 and ob_main.cursor_hide=false and
	card_focus.card_played=true and card_focus.card_enemy=false { //click played card
		if turn_num>2 { sc_card_attack(true,card_focus); }
		else {
			first_turn_attack_warning=true;
			tooltip_timer=tooltip_timer_max;
		}
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_hold!=-1 and (!mouse_check_button(mb_left) or ob_main.cursor_hide=true) { //play held card
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
				if card_hold.card_glyph_a=00 or card_hold.card_glyph_b=00 or card_hold.card_glyph_c=00 { //glyph: lucky
					card_draw_points+=2;
					tooltip_timer=tooltip_timer_max;
				}
				card_hold.potential_x=var_cardspace_id.x;
				card_hold.potential_y=var_cardspace_id.y;
				var_cardspace_id.berries_total_type[0]-=card_hold.card_cost_total_type[0];
				var_cardspace_id.berries_total_type[1]-=card_hold.card_cost_total_type[1];
				var_cardspace_id.berries_total_type[2]-=card_hold.card_cost_total_type[2];
				var_cardspace_id.berries_total_type[3]-=card_hold.card_cost_total_type[3];
				var_cardspace_id.berries_total-=card_hold.card_cost_total;
				var_cardspace_id.occupied=true;
			}
			else if card_hold.card_cat=1 {
				var_cardspace_id.berries_total++;
				var_cardspace_id.berries_total_type[card_hold.card_id-3000]++;
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
					card_hand[i]=card_hand[i+1];
				}
				i++;
			}
			card_hand_total--;
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
if battler_turn=2 {
	if enemy_turn_timer>0 { enemy_turn_timer--; }
	//
	if enemy_turn_timer=0 {
		enemy_turn_phase++;
		if enemy_turn_phase=0 { enemy_turn_timer=irandom_range(30,60); }
		else if enemy_turn_phase=enemy_turn_phase_draw { enemy_turn_timer=irandom_range(45,90); }
		else if enemy_turn_phase=enemy_turn_phase_play { enemy_turn_timer=irandom_range(15,30); }
		else { enemy_turn_timer=4; }
	}
	//
	if enemy_turn_phase=enemy_turn_phase_draw {
		if enemycard_draw_points>0 and enemycard_hand_total<card_hand_max and (enemycard_maindeck[0]!=-1 or enemycard_berrydeck[0]!=-1) {
			sc_AI_draw(irandom(99)+1);
		}
	}
	//
	else if enemy_turn_phase=enemy_turn_phase_play {
		if enemy_play_delay=0 {
			sc_AI_play(irandom(99)+1);
		}
		else { enemy_play_delay--; }
	}
	//
	else if enemy_turn_phase>=enemy_turn_phase_attack and enemy_turn_phase<=enemy_turn_phase_attack+4 {
		if turn_num>2 {
			sc_AI_attack(irandom(99)+1);
		}
		else { enemy_turn_timer=0; }
	}
	//
	else if enemy_turn_phase=enemy_turn_phase_attack+5 {
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
		i++;
	}
	//
	var i=0, id_check=1;
	do {
		var ii=0;
		repeat (card_hand_total) {
			if card_hand[ii].card_id=id_check and card_hand_pos_replace[i]=-1 {
				card_hand_pos_replace[i]=card_hand[ii];
				i++;
			}
			ii++;
		}
		id_check++;
	}
	until (i=card_hand_total);
	//
	var i=0;
	repeat (card_hand_total) {
		card_hand[i]=card_hand_pos_replace[i];
		i++;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if keyboard_check_pressed(vk_space) and !mouse_check_button(mb_left) and battler_turn=1 and card_hold=-1 {
	button_nextturn=true;
	button_nextturn_id.button_state=1;
}
//
if button_nextturn=true {
	if battler_turn=1 {
		battler_turn=2;
		if turn_num>1 { enemycard_draw_points=2; }
		else { enemycard_draw_points=3; }
		card_draw_points=0;
		enemy_turn_timer=0;
		enemy_turn_phase=-1;
		sc_AI_report("- NEW TURN -");
	}
	else if battler_turn=2 {
		battler_turn=1;
		if turn_num>1 { card_draw_points=2; }
		else { card_draw_points=3; }
		enemycard_draw_points=0;
	}
	//
	turn_num++;
	tooltip_timer=tooltip_timer_max;
	first_turn_attack_warning=false;
	hand_full_draw_warning=false;
	//
	with (ob_card) {
		already_attacked=false;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
text_next=false;
//
if text_show!=text_string {
	if text_timer=text_timermax {
		//sc_playsound(sn_text,50,false,false,false);
		text_show=text_show+string_char_at(text_string,text_charnum);
		text_charnum++;
		text_timer=0;
	}
	else { text_timer++; }
	//
	if keyboard_check_pressed(vk_space) {
		//sc_playsound(sn_text,50,false,false,false);
		text_show=text_string;
	}
}
else if text_string!="" {
	if keyboard_check_pressed(vk_space) {
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