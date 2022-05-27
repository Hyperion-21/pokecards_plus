function sc_card_attack(argument0,argument1) {
/// @param player
/// @param card_id
//————————————————————————————————————————————————————————————————————————————————————————————————————
with (argument1) {
	if already_attacked=false and card_environment=false {
		sc_playsound(sn_hurt,50,false,false);
		//
		var card_target=-1, card_target_fork_a=-1, card_target_fork_b=-1; //target -1: empty space (direct/piercing attack), -2: unassigned (skip)
		var card_space_slot=-1, attack_cycle=1;
		if card_enemy=true { var i=0; } else { var i=5; }
		repeat (5) {
			if ob_control.card_space_id[i].occupy_id=id {
				card_space_slot=i;
			}
			i++;
		}
		//
		if sc_glyph_check(id,ref_glyph_fork,true) { //glyph: fork attack
			attack_cycle=2;
			if !sc_glyph_check(id,ref_glyph_piercing,true) { //glyph: piercing attack (if not)
				if (argument0=true and card_space_slot>5 and ob_control.card_space_id[card_space_slot-6].occupy_id!=-1) or
				(argument0=false and card_space_slot>0 and ob_control.card_space_id[card_space_slot+4].occupy_id!=-1) {
					if argument0=true { card_target_fork_a=ob_control.card_space_id[card_space_slot-6].occupy_id; }
					else { card_target_fork_a=ob_control.card_space_id[card_space_slot+4].occupy_id; }
				}
				if (argument0=true and card_space_slot<9 and ob_control.card_space_id[card_space_slot-4].occupy_id!=-1) or
				(argument0=false and card_space_slot<4 and ob_control.card_space_id[card_space_slot+6].occupy_id!=-1) {
					if argument0=true { card_target_fork_b=ob_control.card_space_id[card_space_slot-4].occupy_id; }
					else { card_target_fork_b=ob_control.card_space_id[card_space_slot+6].occupy_id; }
				}
			}
			if argument0=true and card_space_slot=5 { card_target_fork_a=-2; }
			else if argument0=false and card_space_slot=0 { card_target_fork_a=-2; }
			if argument0=true and card_space_slot=9 { card_target_fork_b=-2; }
			else if argument0=false and card_space_slot=4 { card_target_fork_b=-2; }
		}
		else {
			if !sc_glyph_check(id,ref_glyph_piercing,true) { //glyph: piercing attack (if not)
				if (argument0=true and ob_control.card_space_id[card_space_slot-5].occupy_id!=-1) or
				(argument0=false and ob_control.card_space_id[card_space_slot+5].occupy_id!=-1) {
					if argument0=true { card_target=ob_control.card_space_id[card_space_slot-5].occupy_id; }
					else { card_target=ob_control.card_space_id[card_space_slot+5].occupy_id; }
				}
			}
		}
		//
		do {
			if sc_glyph_check(id,ref_glyph_fork,true) { //glyph: fork attack
				if attack_cycle=2 { card_target=card_target_fork_a; }
				else if attack_cycle=1 { card_target=card_target_fork_b; }
			}
			//
			if card_target>-1 {
				//basic formula (atk-def + type advantage) also used in AI when checking for damage, so tweak AI if changed
				var damage_dealt=card_atk-card_target.card_def, damage_extra_dealt=0;
				if damage_dealt<0 { damage_dealt=0; }
				if sc_type_bonus(card_type_a,card_type_b,card_target.card_type_a,card_target.card_type_b)=true {
					damage_extra_dealt=ceil(card_level/advantage_level_interval);
					if sc_glyph_check(id,ref_glyph_adaptability,true) { damage_extra_dealt+=2; } //glyph: adaptability
				}
				damage_dealt+=damage_extra_dealt;
				card_target.card_hp-=damage_dealt;
				card_target.effect_damaged=1;
				var damage_num_id=instance_create_layer(card_target.x+29,card_target.y+18,"instances",ob_damage_num);
				damage_num_id.damage_num=damage_dealt-damage_extra_dealt;
				damage_num_id.damage_extra=damage_extra_dealt;
				damage_num_id.text_alpha=damage_num_id.text_alpha_full;
				damage_num_id.text_color=global.color_damage;
				//
				if sc_glyph_check(card_target,ref_glyph_counter,true) { //glyph: counterattack
					var damage_num_id=instance_create_layer(x+29,y+18,"instances",ob_damage_num);
					if card_hp-(damage_dealt-damage_extra_dealt)>0 { //bonus damage not included
						damage_num_id.damage_num=damage_dealt-damage_extra_dealt;
						card_hp-=damage_dealt-damage_extra_dealt;
					}
					else {
						damage_num_id.damage_num=card_hp-1;
						card_hp=1;
					}
					damage_num_id.text_alpha=damage_num_id.text_alpha_full;
					damage_num_id.text_color=global.color_damage;
					effect_damaged=1;
				}
				//
				if sc_glyph_check(id,ref_glyph_vampire,true) { //glyph: vampire
					card_hp+=floor(damage_dealt/2);
					if card_hp>card_full_hp { card_hp=card_full_hp; }
					var damage_num_id=instance_create_layer(x+29,y+18+15,"instances",ob_damage_num);
					damage_num_id.damage_num=floor(damage_dealt/2);
					damage_num_id.text_alpha=damage_num_id.text_alpha_full;
					damage_num_id.text_color=global.color_fullhp;
				}
				//
				if card_target.card_hp<=0 {
					sc_playsound(sn_faint,50,false,false);
					//
					if sc_glyph_check(card_target,ref_glyph_harvest,true) { //glyph: harvest
						if card_target.card_enemy=false {
							for (var i=0; i<=3; i++;) {
								ob_control.berry_spawn[i]+=card_target.consumed_berry[i];
							}
						}
						else {
							for (var i=0; i<=3; i++;) {
								ob_control.enemyberry_spawn[i]+=card_target.consumed_berry[i];
							}
						}
					}
					//
					if sc_glyph_check(card_target,ref_glyph_curse,true) { //glyph: curse
						var damage_num_id=instance_create_layer(x+29,y+18,"instances",ob_damage_num);
						damage_num_id.damage_num=card_hp-1;
						damage_num_id.text_alpha=damage_num_id.text_alpha_full;
						damage_num_id.text_color=global.color_damage;
						card_hp=1;
						effect_damaged=1;
					}
					//
					if sc_glyph_check(card_target,ref_glyph_memento,true) { //glyph: memento
						if card_target.card_enemy=false {
							ob_control.card_draw_points+=2;
						}
						else { ob_control.enemycard_draw_points+=2; }
					}
					//
					var chance_tenacity=choose(true,false);
					if sc_glyph_check(card_target,ref_glyph_tenacity,true) and chance_tenacity=true and
					((card_target.card_enemy=false and ob_control.card_hand_total<ob_control.card_hand_max) or
					(card_target.card_enemy=true and ob_control.enemycard_hand_total<ob_control.card_hand_max)) { //glyph: tenacity
						if card_target.card_enemy=false {
							ob_control.card_hand_total++;
							ob_control.card_hand[ob_control.card_hand_total-1]=card_target;
						}
						else {
							ob_control.enemycard_hand_total++;
							ob_control.enemycard_hand[ob_control.enemycard_hand_total-1]=card_target;
							card_target.card_face=false;
						}
						card_target.card_hp=card_target.card_full_hp;
						card_target.card_played=false;
					}
					else {
						sc_card_effect(ob_control.card_space_id[10].x,ob_control.card_space_id[10].y,1,false,false);
						card_target.card_trash=true;
					}
					//
					instance_position(card_target.x,card_target.y,ob_card_space).occupy_id=-1;
					sc_card_effect(card_target.x,card_target.y,0,false,false);
				}
			}
			else if card_target=-1 {
				if argument0=true {
					ob_control.enemy_hp-=card_atk;
					ob_control.player_hp+=card_atk;
					ob_control.enemy_effect_damaged=1;
				}
				else {
					ob_control.player_hp-=card_atk;
					ob_control.enemy_hp+=card_atk;
					ob_control.player_effect_damaged=1;
				}
				//
				var damage_num_id_a=-1, damage_num_id_b=-1;
				//
				if sc_glyph_check(id,ref_glyph_fork,true) { //glyph: fork attack
					if attack_cycle=2 and argument0=true {
						damage_num_id_a=instance_create_layer(x+29-64,y-57,"instances",ob_damage_num);
						damage_num_id_b=ob_control.enemy_directdamage_id;
					}
					else if attack_cycle=2 and argument0=false {
						damage_num_id_a=instance_create_layer(x+29-64,y+123,"instances",ob_damage_num);
						damage_num_id_b=ob_control.player_directdamage_id;
					}
					else if attack_cycle=1 and argument0=true {
						damage_num_id_a=instance_create_layer(x+29+64,y-57,"instances",ob_damage_num);
						damage_num_id_b=ob_control.enemy_directdamage_id;
					}
					else if attack_cycle=1 and argument0=false {
						damage_num_id_a=instance_create_layer(x+29+64,y+123,"instances",ob_damage_num);
						damage_num_id_b=ob_control.player_directdamage_id;
					}
				}
				else {
					if argument0=true {
						damage_num_id_a=instance_create_layer(x+29,y-57,"instances",ob_damage_num);
						damage_num_id_b=ob_control.enemy_directdamage_id;
					}
					else {
						damage_num_id_a=instance_create_layer(x+29,y+123,"instances",ob_damage_num);
						damage_num_id_b=ob_control.player_directdamage_id;
					}
				}
				//
				if ob_control.player_hp>ob_control.hp_max*2 { ob_control.player_hp=ob_control.hp_max*2; }
				else if ob_control.player_hp<=0 {
					ob_control.player_hp=0;
					ob_control.battler_turn=0;
					ob_main.event_transition=ref_event_defeat;
					sc_playsound(sn_faint,50,false,false);
					ob_main.music_player=sc_playsound(ms_defeat,100,false,true);
				}
				if ob_control.enemy_hp>ob_control.hp_max*2 { ob_control.enemy_hp=ob_control.hp_max*2; }
				else if ob_control.enemy_hp<=0 {
					ob_control.enemy_hp=0;
					ob_control.battler_turn=0;
					ob_main.event_transition=ref_event_victory;
					if ob_main.playing_champion=false {
						sc_playsound(sn_faint,50,false,false);
						ob_main.music_player=sc_playsound(ms_victory,100,false,true);
					}
					else { ob_main.music_player=sc_playsound(sn_faint,100,false,true); } //play as music to stop music
				}
				//
				damage_num_id_a.big_font=true;
				damage_num_id_a.damage_num=card_atk;
				damage_num_id_a.damage_direct_color=true;
				damage_num_id_a.text_alpha=damage_num_id_a.text_alpha_full;
				damage_num_id_a.text_color=global.color_direct_damage;
				//
				if damage_num_id_b.ref_turn_num!=ob_control.turn_num {
					damage_num_id_b.ref_turn_num=ob_control.turn_num;
					damage_num_id_b.damage_num=0;
				}
				damage_num_id_b.damage_num+=card_atk;
				damage_num_id_b.damage_direct_color=true;
				damage_num_id_b.text_alpha=damage_num_id_b.text_alpha_full;
				damage_num_id_b.y=damage_num_id_b.original_y;
			}
			//
			attack_cycle--;
		} until (attack_cycle=0);
		//
		already_attacked=true;
		if argument0=true { y-=70; }
		else { y+=70; }
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}