function AI_play_plan(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,
argument8,argument9,argument10,argument11,argument12,argument13,argument14,argument15) {
/// @param ref_stat_priority //-1: any poke, 0: hp, 1: atk, 2: def, 3: value
/// @param ref_space_type //-1: any space, 0: vs empty space, 1: vs occupied space, 2: next to friendly card
/// @param type_bonus_only
/// @param vs_no_type_bonus_only
/// @param deals_dmg_only
/// @param receives_no_dmg_only
/// @param turn_advantage_only
/// @param 1HKO
/// @param any_card_hurt
/// @param block_vs_win_only
/// @param win_attack_only
/// @param glyph_check
/// @param y/n
/// @param vs_glyph_check
/// @param y/n
/// @param ignore_if_fork/piercing
//————————————————————————————————————————————————————————————————————————————————————————————————————
var stat_min=-1; //used to be an argument, but there's no more space (and it wasn't being used anyway)
//————————————————————————————————————————————————————————————————————————————————————————————————————
var highest_value=0;
//
if argument0!=-1 {
	for (var i=0; i<enemycard_hand_total; i++;) {
		if enemycard_hand[i].card_cat=0 {
			if argument0=0 and enemycard_hand[i].card_hp>highest_value { highest_value=enemycard_hand[i].card_hp; }
			else if argument0=1 and enemycard_hand[i].card_atk>highest_value { highest_value=enemycard_hand[i].card_atk; }
			else if argument0=2 and enemycard_hand[i].card_def>highest_value { highest_value=enemycard_hand[i].card_def; }
			else if argument0=3 and enemycard_hand[i].card_value>highest_value { highest_value=enemycard_hand[i].card_value; }
		}
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
var space_conditions;
//
for (var i=0; i<=4; i++;) {
	space_conditions[i]=false;
	//
	if card_space_id[i].occupy_id=-1 and (argument1=-1 or
	(argument1=0 and card_space_id[i+5].occupy_id=-1) or
	(argument1=1 and card_space_id[i+5].occupy_id!=-1) or
	(argument1=2 and i>0 and card_space_id[i-1].occupy_id!=-1) or
	(argument1=2 and i<4 and card_space_id[i+1].occupy_id!=-1)) {
		space_conditions[i]=true;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
var space_poke_target;
for (var i=0; i<enemycard_hand_total; i++;) {
	for (var ii=0; ii<=4; ii++;) {
		space_poke_target[ii][i]=false;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
var any_playable=false;
//
do {
	for (var i=0; i<enemycard_hand_total; i++;) {
		if enemycard_hand[i].card_cat=0 and ((argument0=-1) or
		(argument0=0 and enemycard_hand[i].card_hp=highest_value and enemycard_hand[i].card_hp>=stat_min) or
		(argument0=1 and enemycard_hand[i].card_atk=highest_value and enemycard_hand[i].card_atk>=stat_min) or
		(argument0=2 and enemycard_hand[i].card_def=highest_value and enemycard_hand[i].card_def>=stat_min) or
		(argument0=3 and enemycard_hand[i].card_value=highest_value and enemycard_hand[i].card_value>=stat_min)) {
			for (var ii=0; ii<=4; ii++;) {
				var opposing_card_id=-1, bonus_dmg=false, vs_bonus_dmg=false, turns_to_defeat=-1, turns_to_faint=-1, any_card_hurt=false;
				//
				if enemycard_hand[i].card_environment=false {
					var own_atk=enemycard_hand[i].card_atk+card_space_id[ii].card_bonus_atk-card_space_id[ii].card_penalty_atk;
					var own_def=enemycard_hand[i].card_def+card_space_id[ii].card_bonus_def-card_space_id[ii].card_penalty_def;
				}
				else {
					var own_atk=enemycard_hand[i].card_atk-card_space_id[ii].card_penalty_atk;
					var own_def=enemycard_hand[i].card_def-card_space_id[ii].card_penalty_def;
				}
				if own_atk<0 { own_atk=0; }
				if own_def<0 { own_def=0; }
				//
				if card_space_id[ii+5].occupy_id!=-1 {
					var opposing_card_id=card_space_id[ii+5].occupy_id;
					//
					if sc_glyph_check(opposing_card_id,ref_glyph_transform,true) and opposing_card_id.card_environment=false { //glyph: transform (Ditto only)
						bonus_dmg=sc_type_bonus(enemycard_hand[i].card_type_a,enemycard_hand[i].card_type_b,enemycard_hand[i].card_type_a,enemycard_hand[i].card_type_b);
						vs_bonus_dmg=sc_type_bonus(enemycard_hand[i].card_type_a,enemycard_hand[i].card_type_b,enemycard_hand[i].card_type_a,enemycard_hand[i].card_type_b);
					}
					else if sc_glyph_check(enemycard_hand[i],ref_glyph_transform,true) and opposing_card_id.card_environment=false { //glyph: transform (Ditto only)
						bonus_dmg=sc_type_bonus(opposing_card_id.card_type_a,opposing_card_id.card_type_b,opposing_card_id.card_type_a,opposing_card_id.card_type_b);
						vs_bonus_dmg=sc_type_bonus(opposing_card_id.card_type_a,opposing_card_id.card_type_b,opposing_card_id.card_type_a,opposing_card_id.card_type_b);
					}
					else if opposing_card_id.card_environment=false {
						bonus_dmg=sc_type_bonus(enemycard_hand[i].card_type_a,enemycard_hand[i].card_type_b,opposing_card_id.card_type_a,opposing_card_id.card_type_b);
						vs_bonus_dmg=sc_type_bonus(opposing_card_id.card_type_a,opposing_card_id.card_type_b,enemycard_hand[i].card_type_a,enemycard_hand[i].card_type_b);
					}
					//
					if sc_glyph_check(enemycard_hand[i],ref_glyph_weakness,true) { var imaginary_penalty_atk=1; } //glyph: weakness
					else { var imaginary_penalty_atk=0; }
					if sc_glyph_check(enemycard_hand[i],ref_glyph_ruthless,true) { var imaginary_penalty_def=2; } //glyph: ruthless
					else { var imaginary_penalty_def=0; }
					//
					var vs_atk=opposing_card_id.card_atk-imaginary_penalty_atk;
					var vs_def=opposing_card_id.card_def-imaginary_penalty_def;
					if vs_atk<0 { vs_atk=0; }
					if vs_def<0 { vs_def=0; }
					//
					var var_imaginary_damage=own_atk-vs_def;
					if var_imaginary_damage<0 { var_imaginary_damage=0; }
					if bonus_dmg=true and sc_glyph_check(enemycard_hand[i],ref_glyph_adaptability,true) { var_imaginary_damage+=2; } //glyph: adaptability
					else if bonus_dmg=true and !sc_glyph_check(enemycard_hand[i],ref_glyph_adaptability,true) { var_imaginary_damage+=1; }
					if var_imaginary_damage>0 { turns_to_defeat=ceil(opposing_card_id.card_hp/var_imaginary_damage); }
					//
					var var_imaginary_damage=vs_atk-own_def;
					if var_imaginary_damage<0 { var_imaginary_damage=0; }
					if vs_bonus_dmg=true and sc_glyph_check(opposing_card_id,ref_glyph_adaptability,true) { var_imaginary_damage+=2; } //glyph: adaptability
					else if vs_bonus_dmg=true and !sc_glyph_check(opposing_card_id,ref_glyph_adaptability,true) { var_imaginary_damage+=1; }
					if var_imaginary_damage>0 { turns_to_faint=ceil(enemycard_hand[i].card_hp/var_imaginary_damage); }
					//
					for (var iii=0; iii<=4; iii++;) {
						if card_space_id[iii].occupy_id!=-1 and card_space_id[iii].occupy_id.card_hp<card_space_id[iii].occupy_id.card_full_hp {
							any_card_hurt=true;
						}
					}
				}
				//
				var all_conditions_met=true;
				if space_poke_possible[ii][i]=false or space_conditions[ii]=false {
					all_conditions_met=false;
				}
				if argument2=true and ((opposing_card_id=-1) or (opposing_card_id!=-1 and bonus_dmg=false)) {
					all_conditions_met=false;
				}
				if argument3=true and opposing_card_id!=-1 and vs_bonus_dmg=true {
					all_conditions_met=false;
				}
				if argument4=true and opposing_card_id!=-1 and own_atk-vs_def<=0 and bonus_dmg=false {
					all_conditions_met=false;
				}
				if argument5=true and opposing_card_id!=-1 and (vs_atk-own_def>0 or vs_bonus_dmg=true) {
					all_conditions_met=false;
				}
				if argument6=true and (opposing_card_id=-1 or turns_to_defeat=-1 or turns_to_faint<turns_to_defeat) {
					all_conditions_met=false;
				}
				if argument7=true and turns_to_defeat>1 {
					all_conditions_met=false;
				}
				if argument8=true and any_card_hurt=false {
					all_conditions_met=false;
				}
				if argument9=true and (opposing_card_id=-1 or (opposing_card_id!=-1 and opposing_card_id.card_atk<enemy_hp)) {
					//checks with card_atk instead of vs_atk because penalty wouldn't be applied if not played
					all_conditions_met=false;
				}
				if argument10=true and (own_atk<player_hp or (opposing_card_id!=-1 and !sc_glyph_check(enemycard_hand[i],ref_glyph_piercing,true))) {
					//glyph: piercing attack (if not)
					all_conditions_met=false;
				}
				if argument11!=-1 {
					if (argument12=true and !sc_glyph_check(enemycard_hand[i],argument11,true)) or
					(argument12=false and sc_glyph_check(enemycard_hand[i],argument11,true)) {
					all_conditions_met=false;
					}
				}
				if argument13!=-1 {
					if (argument14=true and (opposing_card_id=-1 or !sc_glyph_check(opposing_card_id,argument13,true))) or
					(argument14=false and opposing_card_id!=-1 and sc_glyph_check(opposing_card_id,argument13,true)) {
					all_conditions_met=false;
					}
				}
				if argument15=true and //glyph: fork attack / piercing attack
				(sc_glyph_check(enemycard_hand[i],ref_glyph_fork,true) or sc_glyph_check(enemycard_hand[i],ref_glyph_piercing,true)) {
					all_conditions_met=false;
				}
				//
				if all_conditions_met=true {
					space_poke_target[ii][i]=true;
					any_playable=true;
				}
			}
		}
	}
	highest_value--;
} until (any_playable=true or highest_value<0);
//————————————————————————————————————————————————————————————————————————————————————————————————————
if any_playable=true {
	do {
		var enemycard_playplan_slot=irandom(enemycard_hand_total-1);
		enemyspace_playplan_slot=irandom(4);
	} until (space_poke_possible[enemyspace_playplan_slot][enemycard_playplan_slot]=true and space_poke_target[enemyspace_playplan_slot][enemycard_playplan_slot]=true);
	//
	enemycard_playplan_id=enemycard_hand[enemycard_playplan_slot];
	for (var i=0; i<=3; i++;) {
		enemyberry_playplan[i]=enemycard_playplan_id.card_cost_total_type[i]-card_space_id[enemyspace_playplan_slot].berries_total_type[i];
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}
