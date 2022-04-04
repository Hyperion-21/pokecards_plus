function AI_attack_script() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
var card_space_check_slot=0;
do {
	var card_focus=ob_control.card_space_id[card_space_check_slot].occupy_id;
	if card_focus!=-1 {
		if card_focus.already_attacked=false {
			sc_card_attack(false,card_focus);
			card_space_check_slot=5;
			enemy_turn_timer=8;
		}
		else { card_space_check_slot++; }
	}
	else { card_space_check_slot++; }
} until (card_space_check_slot=5);
//————————————————————————————————————————————————————————————————————————————————————————————————————
}