function sc_AI_attack(argument0) {
/// @param AI_level
//————————————————————————————————————————————————————————————————————————————————————————————————————
var AI_level=-1;
if argument0<=AI_threshold[0] { AI_level=0; }
else if argument0<=AI_threshold[1] { AI_level=1; }
else if argument0<=AI_threshold[2] { AI_level=2; }
else if argument0<=AI_threshold[3] { AI_level=3; }
else if argument0<=AI_threshold[4] { AI_level=4; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
// ATTACK: ALL
if AI_level<=4 {
	var card_space_slot=enemy_turn_phase-enemy_turn_phase_attack;
	if ob_control.card_space_id[card_space_slot].occupied=true {
		sc_card_attack(false,instance_position(ob_control.card_space_id[card_space_slot].x,ob_control.card_space_id[card_space_slot].y,ob_card));
	}
	else { enemy_turn_timer=0; }
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}