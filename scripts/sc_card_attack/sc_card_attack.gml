function sc_card_attack(argument0,argument1) {
/// @param player
/// @param card_id
//————————————————————————————————————————————————————————————————————————————————————————————————————
with (argument1) {
	if already_attacked=false {
		var card_target=-1;
		if (argument0=true and position_meeting(x+28,y-20,ob_card)) or (argument0=false and position_meeting(x+28,y+100,ob_card)) {
			if argument0=true { card_target=instance_position(x+28,y-20,ob_card); }
			else { card_target=instance_position(x+28,y+100,ob_card); }
			//
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
				instance_position(card_target.x,card_target.y,ob_card_space).occupied=false;
				instance_position(card_target.x,card_target.y,ob_card_space).effect_use=1;
				ob_control.card_space_id[10].effect_use=1;
				card_target.card_trash=true;
			}
			if card_hp<=0 {
				instance_position(x,y,ob_card_space).occupied=false;
				instance_position(x,y,ob_card_space).effect_use=1;
				ob_control.card_space_id[10].effect_use=1;
				card_trash=true;
				if argument0=true {
					ob_control.card_focus=-1;
				}
				else {
					enemy_turn_timer=0;
					ob_control.enemy_turn_phase=ob_control.enemy_turn_phase_play-1; //to replace defeated card if possible
				}
			}
		}
		else if (argument0=true and !position_meeting(x+28,y-20,ob_card)) or (argument0=false and !position_meeting(x+28,y+100,ob_card)) {
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
				ob_main.event_transition=2;
			}
			if ob_control.enemy_hp>ob_control.hp_max*2 { ob_control.enemy_hp=ob_control.hp_max*2; }
			else if ob_control.enemy_hp<0 {
				ob_control.enemy_hp=0;
				ob_control.battler_turn=0;
				ob_main.event_transition=1;
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