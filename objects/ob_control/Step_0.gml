if ob_main.cursor_hide=true {
	tooltip_timer=0;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if player_effect_damaged>0 { player_effect_damaged-=0.08; }
if enemy_effect_damaged>0 { enemy_effect_damaged-=0.08; }
//
if turn_splash_timer>0 { turn_splash_timer--; }
if tooltip_timer>0 { tooltip_timer--; }
else if tooltip_timer=0 {
	first_turn_attack_warning=false;
	hand_full_draw_warning=false;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
do { //glyph: harvest
	for (var i=0; i<=3; i++;) {
		if card_hand_total<card_hand_max and berry_spawn[i]>0 {
			create_card_cat=1;
			create_card_id=3000+i;
			var berry_spawn_id=instance_create_layer(card_space_id[10].x,card_space_id[10].y,"instances",ob_card);
			berry_spawn_id.card_face=true;
			//
			berry_spawn[i]--;
			card_hand_total++;
			card_hand[card_hand_total-1]=berry_spawn_id;
		}
	}
} until ((berry_spawn[0]=0 and berry_spawn[1]=0 and berry_spawn[2]=0 and berry_spawn[3]=0) or card_hand_total=card_hand_max);
//
do {
	for (var i=0; i<=3; i++;) {
		if enemycard_hand_total<card_hand_max and enemyberry_spawn[i]>0 {
			create_card_cat=1;
			create_card_id=3000+i;
			var berry_spawn_id=instance_create_layer(card_space_id[10].x,card_space_id[10].y,"instances",ob_card);
			berry_spawn_id.card_enemy=true;
			//berry_spawn_id.card_face=true; //cheat
			//
			enemyberry_spawn[i]--;
			enemycard_hand_total++;
			enemycard_hand[enemycard_hand_total-1]=berry_spawn_id;
		}
	}
} until ((enemyberry_spawn[0]=0 and enemyberry_spawn[1]=0 and enemyberry_spawn[2]=0 and enemyberry_spawn[3]=0) or enemycard_hand_total=card_hand_max);
//
for (var i=0; i<=3; i++;) {
	berry_spawn[i]=0;
	enemyberry_spawn[i]=0;
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
		if mouse_check_button_pressed(mb_left) { sc_playsound(sn_card,50,false,false); }
		//
		card_focus.potential_x=mouse_x-28;
		card_focus.potential_y=mouse_y-40;
		card_hold=card_focus;
	}
	else if (mouse_x<card_focus.x or mouse_y<card_focus.y or mouse_x>=card_focus.x+57 or mouse_y>=card_focus.y+80) or ob_main.cursor_hide=true {
		card_focus=-1;
		card_focus_hand=-1;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_focus!=-1 { //click played card
	if mouse_check_button_pressed(mb_left) and battler_turn=1 and card_hold=-1 and ob_main.cursor_hide=false and
	card_focus.card_played=true and card_focus.card_enemy=false {
		if mouse_check_button_pressed(mb_left) { sc_playsound(sn_click,50,false,false); }
		//
		if ob_main.playing_tutorial=false or (ob_main.playing_tutorial=true and sc_tutorial_conditions(5,-1)) {
			if turn_num>2 { sc_card_attack(true,card_focus); }
			else if (card_focus.card_glyph_a = ref_glyph_rush or card_focus.card_glyph_b = ref_glyph_rush or card_focus.card_glyph_c = ref_glyph_rush)
			{ sc_card_attack(true,card_focus); }
			else if (card_focus.card_glyph_a != ref_glyph_rush and card_focus.card_glyph_b != ref_glyph_rush and card_focus.card_glyph_c != ref_glyph_rush){
				first_turn_attack_warning=true;
				tooltip_timer=tooltip_timer_max;
			}
		}
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_hold!=-1 and (!mouse_check_button(mb_left) or ob_main.cursor_hide=true) { //play held card
	if position_meeting(mouse_x,mouse_y,ob_card_space) {
		var var_cardspace_id=instance_position(mouse_x,mouse_y,ob_card_space), playing_requirements=false, var_consumed_berry;
		//
		for (var i=0; i<=3; i++;) {
			var_consumed_berry[i]=0;
		}
		//
		if var_cardspace_id=card_space_id[5] or var_cardspace_id=card_space_id[6] or var_cardspace_id=card_space_id[7] or
		var_cardspace_id=card_space_id[8] or var_cardspace_id=card_space_id[9] {
			if card_hold.card_cat=0 and sc_card_cost_check(var_cardspace_id.berries_total_type[0],var_cardspace_id.berries_total_type[1],
			var_cardspace_id.berries_total_type[2],var_cardspace_id.berries_total_type[3],
			card_hold.card_cost_total_type[0],card_hold.card_cost_total_type[1],card_hold.card_cost_total_type[2],card_hold.card_cost_total_type[3],-1){
				playing_requirements=true;
				//
				for (var i=0; i<=3; i++;) {
					var_consumed_berry[i]=sc_card_cost_check(var_cardspace_id.berries_total_type[0],var_cardspace_id.berries_total_type[1],
					var_cardspace_id.berries_total_type[2],var_cardspace_id.berries_total_type[3],
					card_hold.card_cost_total_type[0],card_hold.card_cost_total_type[1],card_hold.card_cost_total_type[2],card_hold.card_cost_total_type[3],i);
				}
			}
			else if card_hold.card_cat=1 and var_cardspace_id.berries_total<8 {
				playing_requirements=true;
			}
		}
		else if var_cardspace_id=card_space_id[10] {
			playing_requirements=true;
		}
		//
		if ob_main.playing_tutorial=true and (var_cardspace_id=card_space_id[10] or
		(card_hold.card_cat=0 and !sc_tutorial_conditions(3,var_cardspace_id)) or (card_hold.card_cat=1 and !sc_tutorial_conditions(4,var_cardspace_id))) {
			playing_requirements=false;
		}
		//
		if playing_requirements=true and (var_cardspace_id.occupy_id=-1 or var_cardspace_id=card_space_id[10]) {
			sc_playsound(sn_card,50,false,false);
			//
			if var_cardspace_id=card_space_id[10] {
				card_hold.card_trash=true;
			}
			else if card_hold.card_cat=0 {
				if sc_glyph_check(card_hold,ref_glyph_lucky,true) { //glyph: lucky
					card_draw_points+=2;
					tooltip_timer=tooltip_timer_max;
				}
				//
				if sc_glyph_check(card_hold,ref_glyph_medic,true) { //glyph: medic
					for (var i=5; i<=9; i++;) {
						if card_space_id[i].occupy_id!=-1 {
							var card_to_heal=card_space_id[i].occupy_id;
							card_to_heal.card_hp=card_to_heal.card_full_hp;
							var heal_num_id=instance_create_layer(card_to_heal.x+29,card_to_heal.y+18+15,"instances",ob_damage_num);
							heal_num_id.damage_num=card_to_heal.card_full_hp;
							heal_num_id.text_alpha=heal_num_id.text_alpha_full;
							heal_num_id.text_color=global.color_fullhp;
						}
					}
				}
				//
				if sc_glyph_check(card_hold,ref_glyph_bulwark,true) { //glyph: bulwark
					var i=0;
					repeat (2) {
						var rock_cardspace_id=-1;
						if var_cardspace_id=card_space_id[5] and card_space_id[6].occupy_id=-1 and i=1 { rock_cardspace_id=card_space_id[6]; }
						else if var_cardspace_id=card_space_id[6] and card_space_id[5].occupy_id=-1 and i=0 { rock_cardspace_id=card_space_id[5]; }
						else if var_cardspace_id=card_space_id[6] and card_space_id[7].occupy_id=-1 and i=1 { rock_cardspace_id=card_space_id[7]; }
						else if var_cardspace_id=card_space_id[7] and card_space_id[6].occupy_id=-1 and i=0 { rock_cardspace_id=card_space_id[6]; }
						else if var_cardspace_id=card_space_id[7] and card_space_id[8].occupy_id=-1 and i=1 { rock_cardspace_id=card_space_id[8]; }
						else if var_cardspace_id=card_space_id[8] and card_space_id[7].occupy_id=-1 and i=0 { rock_cardspace_id=card_space_id[7]; }
						else if var_cardspace_id=card_space_id[8] and card_space_id[9].occupy_id=-1 and i=1 { rock_cardspace_id=card_space_id[9]; }
						else if var_cardspace_id=card_space_id[9] and card_space_id[8].occupy_id=-1 and i=0 { rock_cardspace_id=card_space_id[8]; }
						//
						if rock_cardspace_id!=-1 {
							create_card_cat=0;
							create_card_id=2503; //rock
							create_card_level=card_hold.card_level;
							create_card_glyph_a=-1;
							create_card_glyph_b=-1;
							create_card_glyph_c=-1;
							create_card_innate=1;
							create_card_shiny=-1;
							create_card_holo=-0;
							create_card_delta=-1;
							create_card_delta_type=-1;
							create_card_type_a=-1;
							create_card_type_b=-1;
							create_card_form_value=0;
							create_enemy_randomizer=false;
							create_enemy_costcount=false;
							//
							var rock_spawn_id=instance_create_layer(var_cardspace_id.x,var_cardspace_id.y,"instances",ob_card);
							rock_spawn_id.potential_x=rock_cardspace_id.x;
							rock_spawn_id.potential_y=rock_cardspace_id.y;
							rock_spawn_id.card_face=true;
							rock_spawn_id.card_played=true;
							rock_cardspace_id.occupy_id=rock_spawn_id;
							sc_card_effect(rock_cardspace_id.x,rock_cardspace_id.y,0,true,false);
						}
						//
						i++;
					}
				}
				//
				card_hold.potential_x=var_cardspace_id.x;
				card_hold.potential_y=var_cardspace_id.y;
				for (var i=0; i<=3; i++;) {
					var_cardspace_id.berries_total_type[i]-=var_consumed_berry[i];
					card_hold.consumed_berry[i]=var_consumed_berry[i];
				}
				var_cardspace_id.berries_total-=var_consumed_berry[0]+var_consumed_berry[1]+var_consumed_berry[2]+var_consumed_berry[3];
				var_cardspace_id.occupy_id=card_hold;
			}
			else if card_hold.card_cat=1 {
				var_cardspace_id.berries_total++;
				var_cardspace_id.berries_total_type[card_hold.card_id-3000]++;
				card_hold.card_trash=true;
			}
			//
			if var_cardspace_id=card_space_id[10] { sc_card_effect(var_cardspace_id.x,var_cardspace_id.y,1,false,false); }
			else { sc_card_effect(var_cardspace_id.x,var_cardspace_id.y,0,true,false); }
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
	if enemy_turn_timer=0 and enemycard_hand_total<card_hand_max and
	((enemycard_draw_points>=card_drawcost_main and enemycard_maindeck[0]!=-1) or (enemycard_draw_points>=card_drawcost_berry and enemycard_berrydeck[0]!=-1)) {
		AI_draw_script();
	}
	//
	if enemy_turn_timer=0 {
		if enemycard_playplan_id=-1 and enemycard_discardplan_id=-1 and
		enemyberry_playplan[0]<=0 and enemyberry_playplan[1]<=0 and enemyberry_playplan[2]<=0 and enemyberry_playplan[3]<=0 {
			AI_play_script();
		}
		else {
			AI_play(enemycard_playplan_id,enemyberry_playplan[0],enemyberry_playplan[1],enemyberry_playplan[2],enemyberry_playplan[3],enemycard_discardplan_id);
		}
	}
	//
	if enemy_turn_timer=0 and turn_num>2 {
		AI_attack_script();
	}
	//
	if enemy_turn_timer=0 { //still 0 = took no action
		button_nextturn=true;
		button_nextturn_id.button_state=1;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// BUTTONS
//————————————————————————————————————————————————————————————————————————————————————————————————————
if keyboard_check_pressed(vk_tab) and !mouse_check_button(mb_left) and card_hold=-1 and ob_main.cursor_hide=false {
	sc_playsound(sn_click,50,false,false);
	//
	button_sorthand=true;
	button_sorthand_id.button_state=1;
}
if button_sorthand=true and card_hold=-1 {
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
if (((keyboard_check(vk_up) or keyboard_check(ord("W"))) and !mouse_check_button(mb_left)) or (button_autoattack_id.button_state=1)) and
battler_turn=1 and card_hold=-1 and ob_main.cursor_hide=false {
	if keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")) { sc_playsound(sn_click,50,false,false); }
	//
	if auto_attack_timer>0 { auto_attack_timer--; }
	//
	if auto_attack_timer=0 and (ob_main.playing_tutorial=false or (ob_main.playing_tutorial=true and sc_tutorial_conditions(5,-1))) {
		if turn_num>2 {
			if card_space_id[auto_attack_slot+5].occupy_id!=-1 and
			card_space_id[auto_attack_slot+5].occupy_id.already_attacked=false and card_space_id[auto_attack_slot+5].occupy_id.card_environment=false {
				sc_card_attack(true,card_space_id[auto_attack_slot+5].occupy_id);
				auto_attack_timer=8; //same as enemy
			}
			if auto_attack_slot<=3 { auto_attack_slot++; }		
		}
		else {
			if card_space_id[auto_attack_slot+5].occupy_id!=-1 and (card_space_id[auto_attack_slot+5].occupy_id.card_glyph_a == ref_glyph_rush or card_space_id[auto_attack_slot+5].occupy_id.card_glyph_b == ref_glyph_rush or card_space_id[auto_attack_slot+5].occupy_id.card_glyph_c == ref_glyph_rush) and
			card_space_id[auto_attack_slot+5].occupy_id.already_attacked=false and card_space_id[auto_attack_slot+5].occupy_id.card_environment=false { // Rush Glyph
				sc_card_attack(true,card_space_id[auto_attack_slot+5].occupy_id);
				auto_attack_timer=8; //same as enemy
			}
			if auto_attack_slot<=3 { auto_attack_slot++; }		
			if card_space_id[auto_attack_slot+5].occupy_id != -1
			{
				if (card_space_id[auto_attack_slot+5].occupy_id.card_glyph_a != ref_glyph_rush and card_space_id[auto_attack_slot+5].occupy_id.card_glyph_b != ref_glyph_rush and card_space_id[auto_attack_slot+5].occupy_id.card_glyph_c != ref_glyph_rush){
					first_turn_attack_warning=true;
					tooltip_timer=tooltip_timer_max;
				}
			}
		}
	}
}
else {
	auto_attack_slot=0;
	auto_attack_timer=0;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if keyboard_check_pressed(vk_space) and !mouse_check_button(mb_left) and battler_turn=1 and card_hold=-1 and ob_main.cursor_hide=false {
	sc_playsound(sn_click,50,false,false);
	//
	button_nextturn=true;
	button_nextturn_id.button_state=1;
}
//
if ob_main.playing_tutorial=false or (ob_main.playing_tutorial=true and (sc_tutorial_conditions(0,-1) or battler_turn!=1)) {
	if button_nextturn=true {
		if battler_turn=1 {
			battler_turn=2;
			if turn_num>1 { enemycard_draw_points+=2; }
			else { enemycard_draw_points+=5; }
			//card_draw_points=0;
			enemy_turn_timer=irandom_range(30,60);
			//
			for (var i=0; i<=4; i++;) {
				if card_space_id[i].occupy_id!=-1 {
					if sc_glyph_check(card_space_id[i].occupy_id,ref_glyph_recovery,true) { //glyph: recovery
						card_space_id[i].occupy_id.card_hp++;
						if card_space_id[i].occupy_id.card_hp>card_space_id[i].occupy_id.card_full_hp {
							card_space_id[i].occupy_id.card_hp=card_space_id[i].occupy_id.card_full_hp; }
						var heal_num_id=instance_create_layer(card_space_id[i].occupy_id.x+29,card_space_id[i].occupy_id.y+18+15,"instances",ob_damage_num);
						heal_num_id.damage_num=1;
						heal_num_id.text_alpha=heal_num_id.text_alpha_full;
						heal_num_id.text_color=global.color_fullhp;
					}
				}
			}
		}
		else if battler_turn=2 {
			battler_turn=1;
			if turn_num>1 { card_draw_points+=2; }
			else { card_draw_points+=5; }
			enemycard_draw_points=0;
			//
			for (var i=5; i<=9; i++;) {
				if card_space_id[i].occupy_id!=-1 {
					if sc_glyph_check(card_space_id[i].occupy_id,ref_glyph_recovery,true) { //glyph: recovery
						card_space_id[i].occupy_id.card_hp++;
						if card_space_id[i].occupy_id.card_hp>card_space_id[i].occupy_id.card_full_hp {
							card_space_id[i].occupy_id.card_hp=card_space_id[i].occupy_id.card_full_hp; }
						var heal_num_id=instance_create_layer(card_space_id[i].occupy_id.x+29,card_space_id[i].occupy_id.y+18+15,"instances",ob_damage_num);
						heal_num_id.damage_num=1;
						heal_num_id.text_alpha=heal_num_id.text_alpha_full;
						heal_num_id.text_color=global.color_fullhp;
					}
				}
			}
		}
		//
		turn_num++;
		tooltip_timer=tooltip_timer_max;
		turn_splash_timer=turn_splash_timer_max;
		first_turn_attack_warning=false;
		hand_full_draw_warning=false;
		//
		tutorial_textbox_line_newturn_seen=false;
		tutorial_textbox_line_drawn_seen=false;
		tutorial_textbox_line_attacked_seen=false;
		//
		with (ob_card) {
			already_attacked=false;
		}
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
button_sorthand=false;
button_nextturn=false;
//————————————————————————————————————————————————————————————————————————————————————————————————————
if ob_main.playing_tutorial=true {
	//
	var any_card_played=false, all_cards_attacked=true;
	for (var i=0; i<=4; i++;) {
		if card_space_id[i+5].occupy_id!=-1 {
			any_card_played=true;
			if card_space_id[i+5].occupy_id.already_attacked=false { all_cards_attacked=false; }
		}
	}
	//
	if battler_turn=1 and tutorial_textbox_line_current<=tutorial_textbox_line_max and (tutorial_textbox_line_newturn_seen=false or
	(card_draw_points=0 and tutorial_textbox_line_drawn_seen=false) or (any_card_played=true and all_cards_attacked=true and tutorial_textbox_line_attacked_seen=false)) {
		sc_textbox(tutorial_textbox_line_current);
		tutorial_textbox_line_current++;
		//
		if tutorial_textbox_line_newturn_seen=false { tutorial_textbox_line_newturn_seen=true; }
		else if tutorial_textbox_line_drawn_seen=false { tutorial_textbox_line_drawn_seen=true; }
		else if tutorial_textbox_line_attacked_seen=false { tutorial_textbox_line_attacked_seen=true; }
	}
}
