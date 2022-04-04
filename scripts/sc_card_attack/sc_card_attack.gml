function sc_card_attack(argument0,argument1) {
/// @param player
/// @param card_id
//————————————————————————————————————————————————————————————————————————————————————————————————————
with (argument1) {
	if already_attacked=false and card_environment=false {
		var card_target=-1, card_space_slot=-1;
		if card_enemy=true { var i=0; } else { var i=5; }
		repeat (5) {
			if ob_control.card_space_id[i].occupy_id=id {
				card_space_slot=i;
			}
			i++;
		}
		//
		if (argument0=true and ob_control.card_space_id[card_space_slot-5].occupy_id!=-1) or (argument0=false and ob_control.card_space_id[card_space_slot+5].occupy_id!=-1) {
			if argument0=true { card_target=ob_control.card_space_id[card_space_slot-5].occupy_id; }
			else { card_target=ob_control.card_space_id[card_space_slot+5].occupy_id; }
			//
			//basic formula (atk-def + type advantage) also used in AI when checking for damage, so tweak AI if changed
			var damage_dealt=card_atk-card_target.card_def, damage_extra_dealt=0;
			if damage_dealt<0 { damage_dealt=0; }
			if sc_type_bonus(card_type_a,card_type_b,card_target.card_type_a,card_target.card_type_b)=true { damage_extra_dealt=1; }
			damage_dealt+=damage_extra_dealt;
			card_target.card_hp-=damage_dealt;
			card_target.effect_damaged=1;
			var damage_num_id=instance_create_layer(card_target.x+28,card_target.y+15,"instances",ob_damage_num);
			damage_num_id.damage_num=damage_dealt-damage_extra_dealt;
			damage_num_id.damage_extra=damage_extra_dealt;
			damage_num_id.text_alpha=damage_num_id.text_alpha_full;
			damage_num_id.text_color=global.color_damage;
			//
			if card_target.card_hp<=0 {
				if sc_glyph_check(card_target,15,true) { //glyph: memento
					if card_target.card_enemy=false {
						ob_control.card_draw_points+=2;
					}
					else { ob_control.enemycard_draw_points+=2; }
				}
				instance_position(card_target.x,card_target.y,ob_card_space).occupy_id=-1;
				instance_position(card_target.x,card_target.y,ob_card_space).effect_use=1;
				ob_control.card_space_id[10].effect_use=1;
				card_target.card_trash=true;
			}
			if card_hp<=0 {
				if sc_glyph_check(id,15,true) { //glyph: memento
					if card_enemy=false {
						ob_control.card_draw_points+=2;
						ob_control.tooltip_timer=ob_control.tooltip_timer_max;
					}
					else { ob_control.enemycard_draw_points+=2; }
				}
				ob_control.card_space_id[card_space_slot].occupy_id=-1;
				ob_control.card_space_id[card_space_slot].effect_use=1;
				ob_control.card_space_id[10].effect_use=1;
				card_trash=true;
				if argument0=true {
					ob_control.card_focus=-1;
				}
			}
		}
		else if (argument0=true and ob_control.card_space_id[card_space_slot-5].occupy_id=-1) or (argument0=false and ob_control.card_space_id[card_space_slot+5].occupy_id=-1) {
			if argument0=true {
				ob_control.enemy_hp-=card_atk;
				ob_control.player_hp+=card_atk;
				ob_control.enemy_effect_damaged=1;
				var damage_num_id=instance_create_layer(x+28,y-57,"instances",ob_damage_num);
				var damage_num_id_b=ob_control.enemy_directdamage_id;
			}
			else {
				ob_control.player_hp-=card_atk;
				ob_control.enemy_hp+=card_atk;
				ob_control.player_effect_damaged=1;
				var damage_num_id=instance_create_layer(x+28,y+123,"instances",ob_damage_num);
				var damage_num_id_b=ob_control.player_directdamage_id;
			}
			//
			if ob_control.player_hp>ob_control.hp_max*2 { ob_control.player_hp=ob_control.hp_max*2; }
			else if ob_control.player_hp<=0 {
				ob_control.player_hp=0;
				ob_control.battler_turn=0;
				ob_main.event_transition=ob_main.ref_event_defeat;
				ob_main.music_player=sc_playsound(ms_defeat,100,false,true);
			}
			if ob_control.enemy_hp>ob_control.hp_max*2 { ob_control.enemy_hp=ob_control.hp_max*2; }
			else if ob_control.enemy_hp<=0 {
				ob_control.enemy_hp=0;
				ob_control.battler_turn=0;
				ob_main.event_transition=ob_main.ref_event_victory;
				ob_main.music_player=sc_playsound(ms_victory,100,false,true);
			}
			//
			damage_num_id.damage_num=card_atk;
			damage_num_id.damage_direct_color=true;
			damage_num_id.text_alpha=damage_num_id.text_alpha_full;
			damage_num_id.text_color=global.color_direct_damage;
			//
			damage_num_id_b.damage_num+=card_atk;
			damage_num_id_b.damage_direct_color=true;
			damage_num_id_b.text_alpha=damage_num_id_b.text_alpha_full;
			damage_num_id_b.y=damage_num_id_b.original_y;
		}
		//
		already_attacked=true;
		if argument0=true { y-=70; }
		else { y+=70; }
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}