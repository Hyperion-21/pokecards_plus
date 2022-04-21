function sc_tutorial_conditions(argument0,argument1) {
/// @param condition_check //0: next turn, 1: draw main, 2: draw berry, 3: play main, 4: play berry, 5: attack
/// @param play_slot
//————————————————————————————————————————————————————————————————————————————————————————————————————
if argument0=0 { //next turn
	var card_id_played;
	for (var i=0; i<=4; i++;) {
		if ob_control.card_space_id[i+5].occupy_id!=-1 {
			card_id_played[i]=ob_control.card_space_id[i+5].occupy_id.card_id;
		}
		else { card_id_played[i]=-1; }
	}
	//
	var all_cards_attacked=true;
	for (var i=0; i<=4; i++;) {
		if ob_control.card_space_id[i+5].occupy_id!=-1 {
			if ob_control.card_space_id[i+5].occupy_id.already_attacked=false { all_cards_attacked=false; }
		}
	}
	//
	if ob_control.turn_num=1 and
	(card_id_played[0]=019 or card_id_played[1]=019 or card_id_played[2]=019 or card_id_played[3]=019 or card_id_played[4]=019) { return true; } //rattata
	else if ob_control.turn_num=3 and all_cards_attacked=true and
	(card_id_played[0]=016 or card_id_played[1]=016 or card_id_played[2]=016 or card_id_played[3]=016 or card_id_played[4]=016) { return true; } //pidgey
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=1 { //draw main
	if ob_control.turn_num=1 and ob_control.card_maindeck_total>3 { return true; }
	else if ob_control.turn_num=3 {} //can't draw main
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=2 { //draw berry
	if ob_control.turn_num=1 and ob_control.card_berrydeck_total>4 { return true; }
	else if ob_control.turn_num=3 { return true; }
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=3 { //play main
	if ob_control.turn_num=1 and ob_control.card_hold.card_id=019 { return true; } //rattata
	else if ob_control.turn_num=3 and ob_control.card_hold.card_id=016 { return true; } //pidgey
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=4 { //play berry
	var berries_held=0;
	for (var i=0; i<ob_control.card_hand_total; i++;) {
		if ob_control.card_hand[i].card_cat=1 { berries_held++; }
	}
	//
	var space_slot=-1;
	for (var i=5; i<=9; i++;) {
		if ob_control.card_space_id[i]=argument1 { space_slot=i; }
	}
	//
	if ob_control.turn_num=1 { return true; }
	else if ob_control.turn_num=3 and ob_control.card_space_id[space_slot-5].occupy_id!=-1 and ob_control.card_space_id[space_slot-5].occupy_id.card_id=019 { return true; } //vs rattata
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=5 { //attack
	var empty_spaces=0;
	for (var i=5; i<=9; i++;) {
		if ob_control.card_space_id[i].occupy_id=-1 { empty_spaces++; }
	}
	//
	if ob_control.turn_num=1 {} //can't attack (first turn)
	else if ob_control.turn_num=3 and empty_spaces=3 { return true; }
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}