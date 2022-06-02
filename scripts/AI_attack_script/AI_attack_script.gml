function AI_attack_script() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
var card_space_checked;
for (var i=0; i<=4; i++;) {
	card_space_checked[i]=false;
}
//
do {
	var card_space_check_slot=irandom(4);
	var card_focus=ob_control.card_space_id[card_space_check_slot].occupy_id;
	if card_focus!=-1 {
		if card_focus.already_attacked=false and card_focus.card_environment=false {
			sc_card_attack(false,card_focus);
			for (var i=0; i<=4; i++;) {
				card_space_checked[i]=true;
			}
			enemy_turn_timer=8; //same as auto-attack
		}
	}
	//
	card_space_checked[card_space_check_slot]=true;
	//
	var card_space_checked_all=true;
	for (var i=0; i<=4; i++;) {
		if card_space_checked[i]=false { card_space_checked_all=false; }
	}
} until (card_space_checked_all=true);
//————————————————————————————————————————————————————————————————————————————————————————————————————
}