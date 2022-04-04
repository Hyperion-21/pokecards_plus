function AI_attack_script() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
var card_space_check_slot=0;
do {
	//checks with position_meeting instead of occupied=true, because if the timer is too quick, using occupied=true with instance_position afterwards can result in the game
	//being unable to find a card. checking with position_meeting makes sure it checks for a card first, but any card in the position would trigger it (including a held card by the
	//player in that specific position). this should be no issue though, as long as the player is unable to hold cards when it's not their turn.
	//
	if position_meeting(ob_control.card_space_id[card_space_check_slot].x,ob_control.card_space_id[card_space_check_slot].y,ob_card) {
		var card_focus=instance_position(ob_control.card_space_id[card_space_check_slot].x,ob_control.card_space_id[card_space_check_slot].y,ob_card);
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