function sc_AI_play(argument0) {
/// @param AI_level
//————————————————————————————————————————————————————————————————————————————————————————————————————
var AI_level=-1;
if argument0<=AI_threshold[0] { AI_level=0; }
else if argument0<=AI_threshold[1] { AI_level=1; }
else if argument0<=AI_threshold[2] { AI_level=2; }
else if argument0<=AI_threshold[3] { AI_level=3; }
else if argument0<=AI_threshold[4] { AI_level=4; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
var berries_held, enemycard_berry_play=-1;
berries_held[0]=0;
berries_held[1]=0;
berries_held[2]=0;
berries_held[3]=0;
//
var i=0, space_confirm;
repeat (enemycard_hand_total) {
	space_confirm[0][i]=false;
	space_confirm[1][i]=false;
	space_confirm[2][i]=false;
	space_confirm[3][i]=false;
	space_confirm[4][i]=false;
	i++;
}
//
var i=0;
repeat (enemycard_hand_total) {
	if enemycard_hand[i].card_cat=1 {
		berries_held[enemycard_hand[i].card_id-3000]++;
	}
	i++;
}
//
var i=0, enemycard_atk, enemycard_def, enemycard_hp;
repeat (enemycard_hand_total) {
	enemycard_atk[i]=-1;
	enemycard_def[i]=-1;
	enemycard_hp[i]=-1;
	if enemycard_hand[i].card_cat=0 {
		enemycard_atk[i]=enemycard_hand[i].card_atk;
		enemycard_def[i]=enemycard_hand[i].card_def;
		enemycard_hp[i]=enemycard_hand[i].card_hp;
		//
		var ii=0;
		repeat (5) {
			var space_missing_berries;
			space_missing_berries[0]=enemycard_hand[i].card_cost_total_type[0]-card_space_id[ii].berries_total_type[0];
			space_missing_berries[1]=enemycard_hand[i].card_cost_total_type[1]-card_space_id[ii].berries_total_type[1];
			space_missing_berries[2]=enemycard_hand[i].card_cost_total_type[2]-card_space_id[ii].berries_total_type[2];
			space_missing_berries[3]=enemycard_hand[i].card_cost_total_type[3]-card_space_id[ii].berries_total_type[3];
			if space_missing_berries[0]<0 { space_missing_berries[0]=0; }
			if space_missing_berries[1]<0 { space_missing_berries[1]=0; }
			if space_missing_berries[2]<0 { space_missing_berries[2]=0; }
			if space_missing_berries[3]<0 { space_missing_berries[3]=0; }
			//
			if card_space_id[ii].occupied=false and
			enemycard_hand[i].card_cost_total_type[0]<=card_space_id[ii].berries_total_type[0]+berries_held[0] and
			enemycard_hand[i].card_cost_total_type[1]<=card_space_id[ii].berries_total_type[1]+berries_held[1] and
			enemycard_hand[i].card_cost_total_type[2]<=card_space_id[ii].berries_total_type[2]+berries_held[2] and
			enemycard_hand[i].card_cost_total_type[3]<=card_space_id[ii].berries_total_type[3]+berries_held[3] and
			(card_space_id[ii].berries_total+space_missing_berries[0]+space_missing_berries[1]+space_missing_berries[2]+space_missing_berries[3]<=8) {
				space_confirm[ii][i]=true;
			}
			ii++;
		}
	}
	i++;
}
//
var i=0, enemycard_poke_playable=false;
repeat (enemycard_hand_total) {
	var ii=0;
	repeat (5) {
		if space_confirm[ii][i]=true { enemycard_poke_playable=true; }
		ii++;
	}
	i++;
}
//
var i=0, enemycard_justberry_playable=false;
repeat (5) {
	if card_space_id[i].berries_total<8 and card_space_id[i].occupied=false and
	enemycard_draw_points>0 and enemycard_hand_total=card_hand_max and (enemycard_maindeck[0]!=-1 or enemycard_berrydeck[0]!=-1) and
	(berries_held[0]>0 or berries_held[1]>0 or berries_held[2]>0) { enemycard_justberry_playable=true; }
	i++;
}
//
var discard_check=false, discard_skip=false, enemycard_discard_id=-1;
if enemycard_draw_points>0 and enemycard_hand_total=card_hand_max and (enemycard_maindeck[0]!=-1 or enemycard_berrydeck[0]!=-1) and
enemycard_poke_playable=false and enemycard_justberry_playable=false { discard_check=true; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
// PLAY: RANDOM POKE
if AI_level<=4 and enemycard_poke_playable=true and enemycard_playplan_id=-1 {
	do {
		var enemycard_playplan_slot=irandom(enemycard_hand_total-1);
		enemyspace_playplan=irandom(4);
	} until (space_confirm[enemyspace_playplan][enemycard_playplan_slot]=true);
	//
	sc_AI_report("Play (AI " + string(AI_level) + ") // want to play " + string(enemycard_hand[enemycard_playplan_slot].card_name) + " in slot " + string(enemyspace_playplan));
	sc_AI_report("Play (AI " + string(AI_level) + ") // berries needed (card): " +
	string(enemycard_hand[enemycard_playplan_slot].card_cost_total_type[0]) + "+" + string(enemycard_hand[enemycard_playplan_slot].card_cost_total_type[1]) +
	"+" + string(enemycard_hand[enemycard_playplan_slot].card_cost_total_type[2]) + "+" + string(enemycard_hand[enemycard_playplan_slot].card_cost_total_type[3]) +
	", berries held (hand): " + string(berries_held[0]) + "+" + string(berries_held[1]) + "+" + string(berries_held[2]) + "+" + string(berries_held[3]));
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if AI_level<=4 and enemycard_poke_playable=true and enemycard_playplan_id=-1 {
	var i=0, enemycard_playplan_slot=-1;
	repeat (pokecard_hand_total) {
		if enemycard_playplan_slot=-1 or (enemycard_atk[i]>enemycard_atk[enemycard_playplan_slot]) {
			enemycard_playplan_slot=i;
		}
		i++;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// PLAY (FULL HAND): RANDOM BERRY
else if AI_level<=4 and enemycard_poke_playable=false and enemycard_justberry_playable=true {
	do {
		enemycard_berry_play=irandom(2); //no enigma
		enemyspace_playplan=irandom(4);
	} until (berries_held[enemycard_berry_play]>0 and card_space_id[enemyspace_playplan].berries_total<8 and card_space_id[enemyspace_playplan].occupied=false);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// PLAY (DISCARD): RANDOM BERRY > RANDOM POKEMON
else if AI_level<=4 and discard_check=true {
	if berries_held[0]+berries_held[1]+berries_held[2]>0 { //no enigma
		do {
			enemycard_discard_id=enemycard_hand[irandom(enemycard_hand_total-1)];
		} until (enemycard_discard_id.card_id=3000 or enemycard_discard_id.card_id=3001 or enemycard_discard_id.card_id=3002); //no enigma
	}
	else {
		var i=0, discardable_poke=false;
		repeat (enemycard_hand_total) {
			if enemycard_hp[i]>0 { discardable_poke=true; }
			i++;
		}
		//
		if discardable_poke=true {
			do {
				var enemycard_discard_slot=irandom(enemycard_hand_total-1);
			} until (enemycard_hp[enemycard_discard_slot]>0);
			enemycard_discard_id=enemycard_hand[enemycard_discard_slot];
		}
		else { discard_skip=true; }
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if enemycard_poke_playable=false and enemycard_justberry_playable=false and enemy_turn_timer=1 {
	sc_AI_report("Play (AI " + string(AI_level) + ") // no more cards can be played");
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if enemycard_poke_playable=true or enemycard_justberry_playable=true or enemycard_discard_id!=-1 {
	var enemycard_playnow_id=-1;
	//
	if enemycard_playplan_id=-1 and enemycard_poke_playable=true {
		enemycard_playplan_id=enemycard_hand[enemycard_playplan_slot];
	}
	if enemycard_poke_playable=true {
		if card_space_id[enemyspace_playplan].berries_total_type[0]<enemycard_playplan_id.card_cost_total_type[0] { enemycard_berry_play=0; }
		if card_space_id[enemyspace_playplan].berries_total_type[1]<enemycard_playplan_id.card_cost_total_type[1] { enemycard_berry_play=1; }
		if card_space_id[enemyspace_playplan].berries_total_type[2]<enemycard_playplan_id.card_cost_total_type[2] { enemycard_berry_play=2; }
		if card_space_id[enemyspace_playplan].berries_total_type[3]<enemycard_playplan_id.card_cost_total_type[3] { enemycard_berry_play=3; }
	}
	if enemycard_berry_play!=-1 {
		var i=0;
		do {
			if enemycard_hand[i].card_id=3000+enemycard_berry_play {
				enemycard_playnow_id=enemycard_hand[i];
			}
			i++;
		} until (enemycard_playnow_id!=-1);
		//
		card_space_id[enemyspace_playplan].berries_total++;
		card_space_id[enemyspace_playplan].berries_total_type[enemycard_berry_play]++;
		enemycard_playnow_id.card_trash=true;
		enemycard_playnow_id.card_played=true;
		card_space_id[enemyspace_playplan].effect_use=1;
		//
		if enemycard_playplan_id=-1 { enemyspace_playplan=-1; } //only if it's playing a random berry
	}
	else if enemycard_playplan_id!=-1 {
		enemycard_playnow_id=enemycard_playplan_id;
		//
		enemycard_playnow_id.potential_x=card_space_id[enemyspace_playplan].x;
		enemycard_playnow_id.potential_y=card_space_id[enemyspace_playplan].y;
		card_space_id[enemyspace_playplan].berries_total_type[0]-=enemycard_playnow_id.card_cost_total_type[0];
		card_space_id[enemyspace_playplan].berries_total_type[1]-=enemycard_playnow_id.card_cost_total_type[1];
		card_space_id[enemyspace_playplan].berries_total_type[2]-=enemycard_playnow_id.card_cost_total_type[2];
		card_space_id[enemyspace_playplan].berries_total_type[3]-=enemycard_playnow_id.card_cost_total_type[3];
		card_space_id[enemyspace_playplan].berries_total-=enemycard_playnow_id.card_cost_total;
		enemycard_playnow_id.card_face=true;
		enemycard_playnow_id.card_played=true;
		card_space_id[enemyspace_playplan].occupied=true;
		card_space_id[enemyspace_playplan].effect_use=1;
		//
		enemycard_playplan_id=-1;
		enemyspace_playplan=-1;
	}
	else if enemycard_discard_id!=-1 {
		enemycard_playnow_id=enemycard_discard_id;
		enemycard_playnow_id.card_trash=true;
		enemycard_playnow_id.card_played=true;
		card_space_id[10].effect_use=1;
	}
	//
	var i=0, lower_hand_num=false;
	repeat (enemycard_hand_total) {
		if enemycard_playnow_id=enemycard_hand[i] {
			lower_hand_num=true;
		}
		if lower_hand_num=true {
			enemycard_hand[i]=enemycard_hand[i+1];
		}
		i++;
	}
	enemycard_hand_total--;
	//
	enemy_play_delay=15;
	enemy_turn_timer+=15;
	//
	if enemycard_discard_id!=-1 { sc_AI_report("Discard (AI " + string(AI_level) + ") > " + string(enemycard_playnow_id.card_name)); }
	else { sc_AI_report("Play (AI " + string(AI_level) + ") > " + string(enemycard_playnow_id.card_name)); }
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if enemycard_draw_points>0 and enemy_turn_timer>1 and discard_skip=false {
	enemy_turn_phase=enemy_turn_phase_draw; //no enemy_turn_timer=0
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}