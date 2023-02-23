if instance_exists(ob_control) { var reference_id=ob_control; var massdel = false;}
else if instance_exists(ob_deckbuild) { var reference_id=ob_deckbuild; var massdel = ob_deckbuild.massdel}
else if instance_exists(ob_event) { var reference_id=ob_event; var massdel = false; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
if potential_x!=x {
	if potential_x>x {
		var step_x=ceil((potential_x-x)/5);
		x+=step_x;
	}
	else if potential_x<x {
		var step_x=ceil((x-potential_x)/5);
		x-=step_x;
	}
}
if potential_y!=y {
	if potential_y>y {
		var step_y=ceil((potential_y-y)/5);
		y+=step_y;
	}
	else if potential_y<y {
		var step_y=ceil((y-potential_y)/5);
		y-=step_y;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if effect_damaged>0 { effect_damaged-=0.1; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
if reference_id=ob_control {
	if card_played=true and card_trash=false and y!=potential_y { //attacking
		depth=-100;
	}
	else if card_played=true and card_trash=false and y=potential_y {
		depth=200;
	}
}
//
if reference_id=ob_event and (y>screen_main_y+cam_h or y<screen_main_y) { //getting card
	instance_destroy();
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_trash=true {
	card_face=false;
	x=ob_control.card_space_id[10].x;
	y=ob_control.card_space_id[10].y;
	potential_x=x;
	potential_y=y;
	depth=300;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if reference_id=ob_control and card_cat=0 {
	var vs_card=-1;
	//
	if card_played=true {
		if card_enemy=true { var i=0; } else { var i=5; }
		repeat (5) {
			if ob_control.card_space_id[i].occupy_id=id {
				if (card_enemy=false and ob_control.card_space_id[i-5].occupy_id!=-1) {
					vs_card=ob_control.card_space_id[i-5].occupy_id;
				}
				if (card_enemy=true and ob_control.card_space_id[i+5].occupy_id!=-1) {
					vs_card=ob_control.card_space_id[i+5].occupy_id;
				}
			}
			i++;
		}
	}
	if sc_glyph_check(id,ref_glyph_transform,false) and card_played=true { //glyph: transform (Ditto only)
		if sc_glyph_check(id,ref_glyph_transform,true) and vs_card!=-1 and vs_card.card_environment=false {
			//transforms only if there's no mist

			if card_id!=vs_card.card_id {
				card_id=vs_card.card_id;
				card_form_value=vs_card.card_form_value;
				sc_pokelist();
				sc_card_level_stats_all(false,false);
				if old_id = 132
				{
					card_name="Ditto";
				}
				else
				{
					card_name="Animon";
				}
				effect_damaged=1;
			}
		}
		else if card_id!=old_id {
			//transforms back even if there's mist
			card_id=old_id;
			sc_pokelist();
			sc_card_level_stats_all(false,false);
			effect_damaged=1;
		}
	}
	else if sc_glyph_check(id,ref_glyph_transform,false) and card_played=false {
		if card_id!=old_id {
			card_id=old_id;
			sc_pokelist();
			sc_card_level_stats_all(false,false);
		}
	}
	//
	if sc_glyph_check(id,ref_glyph_sketch,false) and card_played=true { //glyph: sketch (Smeargle only)
		if sc_glyph_check(id,ref_glyph_sketch,true) and vs_card!=-1 and vs_card.card_environment=false {
			//copies types only if there's no mist
			if card_type_a!=vs_card.card_type_a or card_type_b!=vs_card.card_type_b {
				card_type_a=vs_card.card_type_a;
				card_type_b=vs_card.card_type_b;
				effect_damaged=1;
			}
		}
		else if card_type_a!=00 or card_type_b!=-1 {
			//restores types even if there's mist
			card_type_a=00;
			card_type_b=-1;
			effect_damaged=1;
		}
	}
	else if sc_glyph_check(id,ref_glyph_sketch,false) and card_played=false {
		if card_type_a!=00 or card_type_b!=-1 {
			card_type_a=00;
			card_type_b=-1;
		}
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
card_bonus_atk = 0;
var base_atk_multiplier=1;
var base_atk_divisor=1;
if reference_id=ob_control and card_cat=0 {

	if instance_exists(ob_control)
	{
		if sc_glyph_check(id,ref_glyph_berserk,true) and (card_hp<=(card_full_hp/3) or (card_hp=1 and card_hp!=card_full_hp)) { var base_atk_multiplier=2; } //glyph: berserk
		else { var base_atk_multiplier=1; }
	}
	else
	{
		if sc_glyph_check(id,ref_glyph_berserk,true) and (card_hp<=(card_full_hp/3) or (card_hp=1 and card_hp!=card_full_hp)) { var base_atk_multiplier=2; } //glyph: berserk
		else { var base_atk_multiplier=1; }
	}

		
	//
	if sc_glyph_check(id,ref_glyph_fork,true) { var base_atk_divisor=1.5; } //glyph: fork attack
	else { var base_atk_divisor=1; }
	//
	if card_played=false and card_trash=false {
		card_atk=ceil(card_full_atk*base_atk_multiplier/base_atk_divisor);
	}
	else if card_played=true and card_trash=false { //handles buffs in match
		if card_enemy=true { var i=0; } else { var i=5; }
		repeat (5) {
			if ob_control.card_space_id[i].occupy_id=id {
				if card_environment=false {
					card_bonus_atk += ob_control.card_space_id[i].card_bonus_atk-ob_control.card_space_id[i].card_penalty_atk;
					card_def=card_full_def+ob_control.card_space_id[i].card_bonus_def-ob_control.card_space_id[i].card_penalty_def;
				}
				else {
					card_def=card_full_def-ob_control.card_space_id[i].card_penalty_def;
				}
				if card_atk<0 { card_atk=0; }
				if card_def<0 { card_def=0; }
			}
			i++;
		}
	}
}
	if !reference_id=ob_control{
		if (card_glyph_a = ref_glyph_fork or card_glyph_b = ref_glyph_fork or card_glyph_c = ref_glyph_fork) { var base_atk_divisor=1.5; } //glyph: fork attack
		else { var base_atk_divisor=1; }
		if (card_glyph_a = ref_glyph_berserk or card_glyph_b = ref_glyph_berserk or card_glyph_c = ref_glyph_berserk) and (card_hp<=(card_full_hp/3) or (card_hp=1 and card_hp!=card_full_hp)) { var base_atk_multiplier=2; } //glyph: berserk
		else { var base_atk_multiplier=1; }
	}
	if instance_exists(ob_control){
			if (card_glyph_a = ref_glyph_rush or card_glyph_b = ref_glyph_rush or card_glyph_c = ref_glyph_rush) && ob_control.turn_num <= 2 && !instance_exists(ob_deckbuild)
			{
				card_bonus_atk += ceil((card_full_atk*1.5)-card_full_atk);
			}
	}
		if card_glyph_a = ref_glyph_bless or card_glyph_b = ref_glyph_bless or card_glyph_c = ref_glyph_bless
		{
			card_bonus_atk += 1;
		}
		if (card_glyph_a = ref_glyph_adversity or card_glyph_b = ref_glyph_adversity or card_glyph_c = ref_glyph_adversity) && card_innate = -1
		{
			card_bonus_atk += 3;
		}			
		card_penalty_atk = 0;		

card_atk=ceil(card_full_atk*base_atk_multiplier/base_atk_divisor)+(card_bonus_atk);

//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_trash=false and card_enemy=false and reference_id=ob_control {
	if ((mouse_x>=x and mouse_y>=y and mouse_x<x+sprite_width and mouse_y<y+sprite_height) or
	((keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))) and num_in_berrydeck>=0) or
	((keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))) and num_in_maindeck>=0)) {
		if (mouse_x>=x and mouse_y>=y and mouse_x<x+sprite_width and mouse_y<y+sprite_height) {
			if ob_control.card_hold=-1 { ob_main.mouse_cursor=1; }
			else { ob_main.mouse_cursor=2; }
		}
		//
		if (mouse_check_button_pressed(mb_left) or
		((keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))) and num_in_berrydeck>=0) or
		((keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))) and num_in_maindeck>=0)) and
		ob_control.card_draw_click=false and ob_main.cursor_hide=false and card_face=false and ob_control.battler_turn=1 and ob_control.card_hold=-1 and
		((num_in_maindeck>=0 and num_in_maindeck=ob_control.card_maindeck_total-1 and ob_control.card_draw_points>=ob_control.card_drawcost_main) or
		(num_in_berrydeck>=0 and num_in_berrydeck=ob_control.card_berrydeck_total-1 and ob_control.card_draw_points>=ob_control.card_drawcost_berry)) {
			sc_playsound(sn_card,50,false,false);
			ob_control.card_draw_click=true;
			//
			if ob_control.card_hand_total<ob_control.card_hand_max {
				if ob_main.playing_tutorial=false or (ob_main.playing_tutorial=true and
				((num_in_maindeck>=0 and sc_tutorial_conditions(1,-1)) or (num_in_berrydeck>=0 and sc_tutorial_conditions(2,-1)))) {
					ob_control.card_hand_total++;
					ob_control.card_hand[ob_control.card_hand_total-1]=id;
					card_face=true;
					//
					if num_in_maindeck>=0 and num_in_maindeck=ob_control.card_maindeck_total-1 {
						ob_control.card_maindeck_total--;
						ob_control.card_maindeck[num_in_maindeck]=-1;
						num_in_maindeck=-1;
						ob_control.card_draw_points-=ob_control.card_drawcost_main;
					}
					else if num_in_berrydeck>=0 and num_in_berrydeck=ob_control.card_berrydeck_total-1 {
						ob_control.card_berrydeck_total--;
						ob_control.card_berrydeck[num_in_berrydeck]=-1;
						num_in_berrydeck=-1;
						ob_control.card_draw_points-=ob_control.card_drawcost_berry;
					}
				}
			}
			else {
				ob_control.hand_full_draw_warning=true;
				ob_control.tooltip_timer=ob_control.tooltip_timer_max;
			}
		}
	}
	//
	if !mouse_check_button_pressed(mb_left) and
	!(keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))) and
	!(keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))) {
		ob_control.card_draw_click=false;
	}
}
//
else if ((mouse_x>=x and mouse_y>=y and mouse_x<x+sprite_width and mouse_y<y+sprite_height) or auto_turn_add=true) and reference_id=ob_event {
	ob_main.mouse_cursor=1;
	//
	if ((mouse_check_button_pressed(mb_left) and ob_main.cursor_hide=false) or auto_turn_add=true) and y=potential_y and x=potential_x {
		sc_playsound(sn_card,50,false,false);
		//
		if ob_event.show_deck=false {
			if card_face=false {
				if (card_cat=1 and card_id=3003) or
				(card_cat=0 and (card_stage>1 or card_pseudo = true or (card_glyph_a!=-1 and card_glyph_a<glyph_common_amount) or
				(card_glyph_b!=-1 and card_glyph_b<glyph_common_amount) or (card_glyph_c!=-1 and card_glyph_c<glyph_common_amount))) {
					if card_shiny = true{
					sc_playsound(sn_shiny,50,false,false);
					}else{
					sc_playsound(sn_rare,50,false,false);
					}
					sc_card_effect(x,y,0,false,true);
				}
				else if card_cat=0 and (card_enigma=true or card_secret=true or card_shiny = true or card_delta = true) {
					if card_shiny = true{
					sc_playsound(sn_shiny,50,false,false);
					}else{
					sc_playsound(sn_rare_2,50,false,false);
					}
					sc_card_effect(x,y,0,false,true);
				}
				else {
					sc_card_effect(x,y,0,false,false);
				}
				//
				card_face=true;
			}
			else {
				//ADD CARD
				if card_cat=0 and ob_main.maindeck_total<maindeck_total_max and ob_event.card_prize>0 {
					ob_main.main_card_id[ob_main.maindeck_total]=card_id;
					ob_main.main_card_level[ob_main.maindeck_total]=card_level;
					ob_main.main_card_glyph_a[ob_main.maindeck_total]=card_glyph_a;
					ob_main.main_card_glyph_b[ob_main.maindeck_total]=card_glyph_b;
					ob_main.main_card_glyph_c[ob_main.maindeck_total]=card_glyph_c;
					ob_main.main_card_innate[ob_main.maindeck_total]=card_innate;
					ob_main.main_card_shiny[ob_main.maindeck_total]=card_shiny;
					ob_main.main_card_holo[ob_main.maindeck_total]=card_holo;
					ob_main.main_card_delta[ob_main.maindeck_total]=card_delta;
					ob_main.main_card_delta_type[ob_main.maindeck_total]=card_delta_type;
					ob_main.main_card_type_a[ob_main.maindeck_total]=card_type_a;
					ob_main.main_card_type_b[ob_main.maindeck_total]=card_type_b;
					ob_main.main_card_form_value[ob_main.maindeck_total]=card_form_value;
					for (var i=0; i<=deck_setup_max; i++;) {
						ob_main.serial_card_indeck[ob_main.serial_count][i]=false;
					}
					//
					ob_main.main_card_serial[ob_main.maindeck_total]=ob_main.serial_count;
					ob_main.serial_count++;
					//
					ob_main.maindeck_total++;
					potential_y=screen_main_y+cam_h+2;
				}
				else if card_cat=1 and ob_event.deck_berry_total[card_id-3000]<berrydeck_total_max and ob_event.card_prize>0 and
				(ob_main.option_state[opt_challenge]!=ch_barrenness or ob_main.berrydeck_total<30) {
					ob_main.berry_card_id[ob_main.berrydeck_total]=card_id;
					ob_main.berrydeck_total++;
					potential_y=screen_main_y+cam_h+2;
					//
					//count berries (same as ob_event)
					for (var i=0; i<=3; i++;) {
						ob_event.deck_berry_total[i]=0;
					}
					for (var i=0; i<ob_main.berrydeck_total; i++;) {
						ob_event.deck_berry_total[ob_main.berry_card_id[i]-3000]++;
					}
				}
				else {
					potential_y=screen_main_y-82;
				}
				//
				ob_event.card_prize--;
			}
		}
		else {
			if card_played=false {
				var i=0;
				do {
					if ob_event.event_space_id[i].occupy_id=-1 {
						if card_shiny = true
						{
							sc_playsound(sn_shiny,50,false,false);
						}
						card_played=true;
						potential_x=ob_event.event_space_id[i].x;
						potential_y=ob_event.event_space_id[i].y;
						ob_event.event_space_id[i].occupy_id=id;
						ob_event.event_space_id_deck[i] = false;
						if(mouse_y > 144) {
							ob_event.event_space_id_deck[i] = true;
						}
							
						sc_card_effect(ob_event.event_space_id[i].x,ob_event.event_space_id[i].y,0,true,false);
						//
						if ob_event.event_kind=ref_event_evolution {
							for (var ii=0; ii<8; ii++;) {
								ob_event.evo_list[ii]=card_evo[ii];
							}
							ob_event.evolution_position=0;
							ob_event.count=0;
						}
						//
						i=ob_event.event_space_total;
					}
					else if ob_event.event_space_id[i].occupy_id != -1 && reference_id = ob_event && ob_event.event_kind != ref_event_tribute && ob_event.event_kind != ref_event_sacrifice
					{
						ob_event.event_space_id[i].occupy_id.card_played = false;
						instance_position(ob_event.event_space_id[i].occupy_id.x,ob_event.event_space_id[i].occupy_id.y,ob_card_space).occupy_id=-1;
						ob_event.evolution_retry=false;
						ob_event.used = true;
						card_played=true;
						potential_x=ob_event.event_space_id[i].x;
						potential_y=ob_event.event_space_id[i].y;
						ob_event.event_space_id[i].occupy_id=id;
						ob_event.event_space_id_deck[i] = false;
						if(mouse_y > 144) {
							ob_event.event_space_id_deck[i] = true;
						}
						sc_card_effect(ob_event.event_space_id[i].x,ob_event.event_space_id[i].y,0,true,false);
						i=ob_event.event_space_total;						
					} else { i++; }
				} until (i=ob_event.event_space_total);
			}
			else {
				card_played=false;
				instance_position(x,y,ob_card_space).occupy_id=-1;
				ob_event.evolution_retry=false;
				if ob_event.event_applied = true
				{
					ob_event.used = true;
				}
			}
		}
	}
	//
	auto_turn_add=false;
}
//
else if (mouse_x>=x and mouse_y>=y and mouse_x<x+sprite_width and mouse_y<y+sprite_height and reference_id=ob_deckbuild) or massdel = true {
	ob_main.mouse_cursor=1;
	//
	if card_cat=0 {
		if mouse_check_button_pressed(mb_left) and ob_main.cursor_hide=false && massdel = false {
		
		if ob_main.option_state[opt_challenge] != ch_unlimited
		{
			var dupemax = 100;
			var i = 0;
			for (var i=0; i<ob_deckbuild.deck_build_used_total; i++;) {   ///DUPLICATE CHECK
				if ob_deckbuild.deck_card_used[i].card_secret = card_secret && card_secret = true // Secret Pokemon
						{
							var dupemax = 1; // sets duplicates max
							dupe += 1; 
						}	
						else if ob_deckbuild.deck_card_used[i].card_id = card_id ///Duplicates
						{
							var dupemax = 2; // sets duplicates max
							if ob_deckbuild.deck_card_used[i].card_id = card_id
							{
								dupe += 1;
							}
						}
						//if ob_deckbuild.deck_card_used[i].card_enigma =  card_enigma
						//{
							//legodupe += 1; // I'm disabling this because I can't figure out how to stop them from evolving. I really wanted to put limits on it, but I seem incapable of figuring out this
							/// variable system the main developer has created.
						//}	
					}
			}

			if card_indeck[0]=false and ob_deckbuild.deck_build_used_total<ob_main.maindeck_size_max && dupe < dupemax {
				sc_playsound(sn_click,50,false,false);
				card_indeck[0]=true;
				ob_deckbuild.reorder_swap_standby=ob_deckbuild.reorder_selected;
				ob_deckbuild.reorder_selected=0; //pokemon id
				ob_deckbuild.reorder_type=ob_deckbuild.reorder_selected;
			}
			else if card_indeck[0]=true {
				sc_playsound(sn_click,50,false,false);
				card_indeck[0]=false;
				ob_deckbuild.reorder_swap_standby=ob_deckbuild.reorder_selected;
				ob_deckbuild.reorder_selected=0; //pokemon id
				ob_deckbuild.reorder_type=ob_deckbuild.reorder_selected;
			}
				else 
				{
					sc_playsound(sn_hurt,50,false,false);
				}
			card_delete_timer=0;
		}
		else if ((mouse_check_button(mb_right) and ob_main.cursor_hide=false) or massdel = true) and (card_indeck[0]=false and ob_deckbuild.deck_build_all_total>ob_main.maindeck_size_min_full) {
			if mouse_check_button_pressed(mb_right) { sc_playsound(sn_card,50,false,false); }
			//
						
						if card_shiny = false && card_holo = false && card_delta = false && ((card_glyph_a = -1 or sc_glyph_bound(ref_glyph_taunt) or sc_glyph_bound(ref_glyph_rush) or
						sc_glyph_bound(ref_glyph_transform) or sc_glyph_bound(ref_glyph_sketch) or sc_glyph_bound(ref_glyph_mist)) && card_glyph_b = -1) && card_enigma = false && 
						card_starter = false && card_can_mega = false && card_secret = false && card_environment = false && massdel = true
						{

								if ob_deckbuild.berry[0] = true && (card_cost[0] = 0 or card_cost[1] = 0 or card_cost[2] = 0)
								{
									card_delete_timer++;
								}
								else if ob_deckbuild.berry[1] = true && (card_cost[0] = 1 or card_cost[1] = 1 or card_cost[2] = 1)
								{
									card_delete_timer++;
								}
								else if ob_deckbuild.berry[2] = true && (card_cost[0] = 2 or card_cost[1] = 2 or card_cost[2] = 2)
								{
									card_delete_timer++;
								}

						}	
						else if massdel = false
						{
							card_delete_timer++;
						}


			if card_delete_timer=card_delete_timer_max {
				sc_playsound(sn_faint,50,false,false);
				if card_holo = true && card_shiny = true && card_secret = true
				{
					var 	bonus = 6
				}
				else if card_holo = true && card_shiny = true
				{
					var 	bonus = 4
				}
				else if card_holo = true
				{
					var bonus = 2;
				}

				else if card_shiny = true
				{
					var 	bonus = 2
				}
				else if card_secret = true
				{
					var 	bonus = 2
				}
				else
				{
					var bonus = 1;
				}
				
				if(card_innate = -1){
					ob_main.money += 1;
				} else {
					ob_main.money+=round(card_value*sell_value_multiplier* bonus);
				}
				marked = true;


			}
		}
		else {
			card_delete_timer=0;
		}
	}
	else if card_cat=1 && massdel = false {
		var berry_common_used=ob_deckbuild.deck_berry_used[0]+ob_deckbuild.deck_berry_used[1]+ob_deckbuild.deck_berry_used[2];
		var berry_enigma_used=ob_deckbuild.deck_berry_used[3];
		//
		if mouse_check_button_pressed(mb_left) and ob_main.cursor_hide=false {
			sc_playsound(sn_click,50,false,false);
			if ((card_id!=3003) or (card_id=3003 and ob_deckbuild.deck_berry_total[3]<=berry_common_used)) {
				ob_deckbuild.deck_berry_used[card_id-3000]=ob_deckbuild.deck_berry_total[card_id-3000];
			}
			else if card_id=3003 and ob_deckbuild.deck_berry_total[3]>berry_common_used {
				ob_deckbuild.deck_berry_used[card_id-3000]=berry_common_used;
			}
		}
		else if mouse_check_button_pressed(mb_right) and ob_main.cursor_hide=false {
			sc_playsound(sn_click,50,false,false);
			ob_deckbuild.deck_berry_used[card_id-3000]=0;
			//
			berry_common_used=ob_deckbuild.deck_berry_used[0]+ob_deckbuild.deck_berry_used[1]+ob_deckbuild.deck_berry_used[2];
			berry_enigma_used=ob_deckbuild.deck_berry_used[3];
			if berry_enigma_used>berry_common_used { ob_deckbuild.deck_berry_used[3]=berry_common_used; }
		}
		else if (mouse_wheel_up() or keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))) and ob_main.cursor_hide=false {
			if ob_deckbuild.deck_berry_used[card_id-3000]<ob_deckbuild.deck_berry_total[card_id-3000] and
			((card_id!=3003) or (card_id=3003 and berry_enigma_used+1<=berry_common_used)) {
				sc_playsound(sn_click,50,false,false);
				ob_deckbuild.deck_berry_used[card_id-3000]++;
			}
		}
		else if (mouse_wheel_down() or keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"))) and ob_main.cursor_hide=false {
			if ob_deckbuild.deck_berry_used[card_id-3000]>0 {
				sc_playsound(sn_click,50,false,false);
				ob_deckbuild.deck_berry_used[card_id-3000]--;
				//
				berry_common_used=ob_deckbuild.deck_berry_used[0]+ob_deckbuild.deck_berry_used[1]+ob_deckbuild.deck_berry_used[2];
				berry_enigma_used=ob_deckbuild.deck_berry_used[3];
				if berry_enigma_used>berry_common_used { ob_deckbuild.deck_berry_used[3]=berry_common_used; }
			}
		}
	}
}
else {
	dupe = 0;
	card_delete_timer=0;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if ((reference_id=ob_control and ob_control.card_focus=id) or reference_id=ob_event or reference_id=ob_deckbuild) and card_face=true and card_cat=0 and ob_main.cursor_hide=false { 
		
	var heartwidth = ((card_innate-1)*2);
	
	if (mouse_x>=x+2 and mouse_y>=y+2 and mouse_x<=x+13 and mouse_y<=y+12) or
	(card_type_b>=0 and mouse_x>=x+2 and mouse_y>=y+12 and mouse_x<=x+13 and mouse_y<=y+22) {
		if card_type_b>=0 and mouse_x>=x+2 and mouse_y>=y+12 and mouse_x<=x+13 and mouse_y<=y+22 { var switch_var=card_type_b; }
		else if mouse_x>=x+2 and mouse_y>=y+2 and mouse_x<=x+13 and mouse_y<=y+12 { var switch_var=card_type_a; }
		switch (switch_var) {
			case 00: reference_id.tooltip_text="Normal - Oran Berry"; break;
			case 01: reference_id.tooltip_text="Grass - Lum Berry"; break;
			case 02: reference_id.tooltip_text="Fire - Leppa Berry"; break;
			case 03: reference_id.tooltip_text="Water - Oran Berry"; break;
			case 04: reference_id.tooltip_text="Electric - Lum Berry"; break;
			case 05: reference_id.tooltip_text="Flying - Lum Berry"; break;
			case 06: reference_id.tooltip_text="Fighting - Leppa Berry"; break;
			case 07: reference_id.tooltip_text="Psychic - Leppa Berry"; break;
			case 08: reference_id.tooltip_text="Fairy - Leppa Berry"; break;
			case 09: reference_id.tooltip_text="Ground - Leppa Berry"; break;
			case 10: reference_id.tooltip_text="Rock - Lum Berry"; break;
			case 11: reference_id.tooltip_text="Bug - Lum Berry"; break;
			case 12: reference_id.tooltip_text="Poison - Lum Berry"; break;
			case 13: reference_id.tooltip_text="Ice - Oran Berry"; break;
			case 14: reference_id.tooltip_text="Dragon - Oran Berry"; break;
			case 15: reference_id.tooltip_text="Steel - Oran Berry"; break;
			case 16: reference_id.tooltip_text="Ghost - Oran Berry"; break;
			case 17: reference_id.tooltip_text="Dark - Leppa Berry"; break;
			case 18: reference_id.tooltip_text="Trainer"; break;
			case 19: reference_id.tooltip_text="Shadow - Enigma Berry"; break;
			case 20: reference_id.tooltip_text="Crystal - Enigma Berry"; break;
			case 21: reference_id.tooltip_text="Bird - Enigma Berry"; break;
			case 22: reference_id.tooltip_text="??? - Enigma Berry"; break;
		}
		reference_id.tooltip_lines=1;
	}
	else if (card_glyph_a>=0 and mouse_x>=x+43 and mouse_y>=y+2 and mouse_x<=x+54 and mouse_y<=y+12) or
	(card_glyph_b>=0 and mouse_x>=x+43 and mouse_y>=y+12 and mouse_x<=x+54 and mouse_y<=y+22) or
	(card_glyph_c>=0 and mouse_x>=x+43 and mouse_y>=y+22 and mouse_x<=x+54 and mouse_y<=y+32) {
		if card_glyph_c>=0 and mouse_x>=x+43 and mouse_y>=y+22 and mouse_x<=x+54 and mouse_y<=y+32 { var switch_var=card_glyph_c; }
		else if card_glyph_b>=0 and mouse_x>=x+43 and mouse_y>=y+12 and mouse_x<=x+54 and mouse_y<=y+22 { var switch_var=card_glyph_b; }
		else if card_glyph_a>=0 and mouse_x>=x+43 and mouse_y>=y+2 and mouse_x<=x+54 and mouse_y<=y+12 { var switch_var=card_glyph_a; }
		reference_id.tooltip_text=sc_glyph_text(switch_var,false);
		reference_id.tooltip_lines=sc_glyph_text(switch_var,true);
	}
	else if card_cost_total>0 and mouse_x>=x+3 and mouse_y>=y+35 and mouse_x<=x+2+(4*card_cost_total) and mouse_y<=y+38 {
		reference_id.tooltip_text="Cost: ";
		if card_cost_total_type[0]>=1 {
			reference_id.tooltip_text=reference_id.tooltip_text + string(card_cost_total_type[0]) + "x Oran";
		}
		if card_cost_total_type[1]>=1 {
			if card_cost_total_type[0]>=1 { reference_id.tooltip_text=reference_id.tooltip_text + ", "; }
			reference_id.tooltip_text=reference_id.tooltip_text + string(card_cost_total_type[1]) + "x Leppa";
		}
		if card_cost_total_type[2]>=1 {
			if card_cost_total_type[0]>=1 or card_cost_total_type[1]>=1 { reference_id.tooltip_text=reference_id.tooltip_text + ", "; }
			reference_id.tooltip_text=reference_id.tooltip_text + string(card_cost_total_type[2]) + "x Lum";
		}
		if card_cost_total_type[3]>=1 {
			if card_cost_total_type[0]>=1 or card_cost_total_type[1]>=1 or card_cost_total_type[2]>=1 { reference_id.tooltip_text=reference_id.tooltip_text + ", "; }
			reference_id.tooltip_text=reference_id.tooltip_text + string(card_cost_total_type[3]) + "x Enigma";
		}
		reference_id.tooltip_text=reference_id.tooltip_text + ".";
		reference_id.tooltip_lines=1;
	}
	else if mouse_x>=((x+29)-heartwidth) and mouse_y>=y and mouse_x<=((x+27)+heartwidth) and mouse_y<=y+5 && card_innate > 0{
		reference_id.tooltip_text="Hearts: " + string(card_innate-1);
		reference_id.tooltip_lines=1;
	}
	else if mouse_x>=((x+29)+heartwidth) and mouse_y>=y and mouse_x<=((x+27)-heartwidth) and mouse_y<=y+5 && card_innate = 0{
		reference_id.tooltip_text="Weakened";
		reference_id.tooltip_lines=1;
	}
	else if mouse_x>=((x+27)+heartwidth) and mouse_y>=y and mouse_x<=((x+29)-heartwidth) and mouse_y<=y+5 && card_innate = -1{
		reference_id.tooltip_text="Exhausted";
		reference_id.tooltip_lines=1;
	}
	else if mouse_x>=x+25 and mouse_y>=y+33 and mouse_x<=x+32 and mouse_y<=y+37 and card_shiny = true {
		reference_id.tooltip_text="Shiny!";
		reference_id.tooltip_lines=1;
	}
	else if mouse_x>=x+5 and mouse_y>=y+5 and mouse_x<=x+51 and mouse_y<=y+36 and card_holo = true {
		reference_id.tooltip_text="Holofoil!";
		reference_id.tooltip_lines=1;
	}
	else if mouse_x>=x+25 and mouse_y>=y+72 and mouse_x<=x+32 and mouse_y<=y+76 and card_delta = true {
		reference_id.tooltip_text="Delta Species!";
		reference_id.tooltip_lines=1;
	}
	else if mouse_x>=x and mouse_y>=y and mouse_x<=x+60 and mouse_y<=y+79 and card_secret = true && dupe > 0{
		reference_id.tooltip_text="Only 1 Secret per deck.";
		reference_id.tooltip_lines=1;
	}
	else if mouse_x>=x and mouse_y>=y and mouse_x<=x+60 and mouse_y<=y+79 and dupe > 2{
		reference_id.tooltip_text="Only 2 species duplicates per deck.";
		reference_id.tooltip_lines=1;
	}
	else if mouse_x>=x+5 and mouse_y>=y+69 and mouse_x<=x+13 and mouse_y<=y+76 && card_atk > card_full_atk{
		reference_id.tooltip_text="ATK: " + string(card_full_atk) + " + " + string(card_atk-card_full_atk);
		reference_id.tooltip_lines=1;
	}
	else if mouse_x>=x+5 and mouse_y>=y+69 and mouse_x<=x+13 and mouse_y<=y+76 && card_atk < card_full_atk{
	reference_id.tooltip_text="ATK: " + string(card_full_atk) + " - " + string(card_full_atk-card_atk);
	reference_id.tooltip_lines=1;
	}
	else if mouse_x>=x+44 and mouse_y>=y+69 and mouse_x<=x+60 and mouse_y<=y+76 && card_def > card_full_def{ // 
		reference_id.tooltip_text="DEF: " + string(card_full_def) + " + " + string(card_def-card_full_def);
		reference_id.tooltip_lines=1;
	}
	else if mouse_x>=x+44 and mouse_y>=y+69 and mouse_x<=x+60 and mouse_y<=y+76 && card_def < card_full_def{
	reference_id.tooltip_text="DEF: " + string(card_full_def) + " - " + string(card_full_def-card_def);
	reference_id.tooltip_lines=1;
	}
	else if mouse_x>=x+25 and mouse_y>=y+63 and mouse_x<=x+30 and mouse_y<=y+71 && instance_exists(ob_control){
	reference_id.tooltip_text="HP: " + string(card_hp) + "/" + string(card_full_hp); 
	reference_id.tooltip_lines=1;
	}
}
else if reference_id=ob_deckbuild and card_cat=1 and ob_main.cursor_hide=false {
	if mouse_x>=x and mouse_y>=y and mouse_x<x+sprite_width and mouse_y<y+sprite_height {
		if card_id=3003 { //enigma berries
			reference_id.tooltip_text="Can be used as any Berry.\nTotal amount cannot exceed half of Berry Deck.";
			reference_id.tooltip_lines=2;
		}

	}

}

if (reference_id == ob_control || reference_id == ob_event || reference_id == ob_deckbuild) && card_face && card_cat == 0 {
	
    if ob_main.option_state[opt_jumping] < 2 && !card_environment && card_innate > -1 && !card_can_fly {
        if ob_main.option_state[opt_jumping] < 1 || !instance_exists(ob_deckbuild) {
            if jumping == 3 {
                if jumpy <= jumpmax {
                    jumping = 2;
                } else {
                    jumpy -= 1;
                }
            } else if jumping == 2 {
                if jumpy >= 0 {
                    var i = irandom_range(0, 10000);
                    if i < 2000 {
                        jumping = 3;
                    } else {
                        jumptimer = irandom_range(50, 1000);
                        jumping = 1;
                    }
                } else {
                    jumpy += 1;
                }
            } else if jumping == 1 {
                jumpy = 0;
                if jumpcount >= jumptimer {
                    jumpcount = 0;
                    jumping = 3;
                } else {
                    jumpcount += 1;
                }
            }
        }
    } else if card_can_fly == true && (ob_main.option_state[opt_jumping] < 1 || !instance_exists(ob_deckbuild))
	{
			var flyspeed = choose(0.05,0.08,0.1);
            if jumping == 2 {
                if jumpy <= jumpmax {
                    jumping = 1;
					jumpfloor = irandom_range(0.5,2);
                } else {
                    jumpy -= flyspeed;
                }
            } else if jumping == 1 {
                if jumpy >= jumpfloor {
                    jumping = 2;
					jumpmax = irandom_range(-0.5,-2);
                    }
                else {
                    jumpy += flyspeed;
                }	
			}
	}
}


		