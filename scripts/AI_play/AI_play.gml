function AI_play(argument0,argument1,argument2,argument3,argument4,argument5) {
/// @param card_id
/// @param oran_berries
/// @param leppa_berries
/// @param lum_berries
/// @param enigma_berries
/// @param discard_id
//————————————————————————————————————————————————————————————————————————————————————————————————————
var playcard_id=-1;
//
if argument5!=-1 {
	playcard_id=argument5;
	playcard_id.card_trash=true;
	playcard_id.card_played=true;
	card_space_id[10].effect_use=1;
	//
	enemycard_discardplan_id=-1;
}
else if argument1>0 or argument2>0 or argument3>0 or argument4>0 {
	var i=0;
	do {
		for (var ii=3; ii>=0; ii--;) {
			if enemyberry_playplan[ii]>0 and enemycard_hand[i].card_id=3000+ii {
				playcard_id=enemycard_hand[i];
			}
		}
		i++;
	} until (playcard_id!=-1);
	//
	card_space_id[enemyspace_playplan_slot].berries_total++;
	card_space_id[enemyspace_playplan_slot].berries_total_type[playcard_id.card_id-3000]++;
	enemyberry_playplan[playcard_id.card_id-3000]--;
	playcard_id.card_trash=true;
	playcard_id.card_played=true;
	card_space_id[enemyspace_playplan_slot].effect_use=1;
	//
	if argument0=-1 { enemyspace_playplan_slot=-1; } //when just playing a berry
}
else if argument0!=-1 {
	playcard_id=argument0;
	//
	if sc_glyph_check(playcard_id,00) { //glyph: lucky
		enemycard_draw_points+=2;
	}
	playcard_id.potential_x=card_space_id[enemyspace_playplan_slot].x;
	playcard_id.potential_y=card_space_id[enemyspace_playplan_slot].y;
	card_space_id[enemyspace_playplan_slot].berries_total_type[0]-=playcard_id.card_cost_total_type[0];
	card_space_id[enemyspace_playplan_slot].berries_total_type[1]-=playcard_id.card_cost_total_type[1];
	card_space_id[enemyspace_playplan_slot].berries_total_type[2]-=playcard_id.card_cost_total_type[2];
	card_space_id[enemyspace_playplan_slot].berries_total_type[3]-=playcard_id.card_cost_total_type[3];
	card_space_id[enemyspace_playplan_slot].berries_total-=playcard_id.card_cost_total;
	playcard_id.card_face=true;
	playcard_id.card_played=true;
	card_space_id[enemyspace_playplan_slot].occupied=true;
	card_space_id[enemyspace_playplan_slot].effect_use=1;
	//
	enemycard_playplan_id=-1;
	enemyspace_playplan_slot=-1;
}
//
var i=0, lower_hand_num=false;
repeat (enemycard_hand_total) {
	if playcard_id=enemycard_hand[i] {
		lower_hand_num=true;
	}
	if lower_hand_num=true {
		enemycard_hand[i]=enemycard_hand[i+1];
	}
	i++;
}
enemycard_hand_total--;
//
enemy_turn_timer=irandom_range(15,30);
//————————————————————————————————————————————————————————————————————————————————————————————————————
}