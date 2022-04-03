function AI_play_script(argument0) {
/// @param AI_value
//————————————————————————————————————————————————————————————————————————————————————————————————————
var fullhand_draw=false;
if enemycard_draw_points>0 and enemycard_hand_total=card_hand_max and (enemycard_maindeck[0]!=-1 or enemycard_berrydeck[0]!=-1) {
	fullhand_draw=true;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
var berries_held, enemycard_atk, enemycard_def, enemycard_hp, poke_playable_in_space;
var anypoke_playable=false, anyberry_playable=false;
//
for (var i=0; i<=3; i++;) {
	berries_held[i]=0;
}
//
for (var i=0; i<enemycard_hand_total; i++;) {
	for (var ii=0; ii<=4; ii++;) {
		poke_playable_in_space[ii][i]=false;
	}
	if enemycard_hand[i].card_cat=1 {
		berries_held[enemycard_hand[i].card_id-3000]++;
	}
}
//
for (var i=0; i<=4; i++;) {
	if card_space_id[i].berries_total<8 and card_space_id[i].occupied=false and (berries_held[0]>0 or berries_held[1]>0 or berries_held[2]>0) {
		anyberry_playable=true; //no enigma
	}
}
//
var i=0;
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
			for (var iii=0; iii<=3; iii++;) {
				space_missing_berries[iii]=enemycard_hand[i].card_cost_total_type[iii]-card_space_id[ii].berries_total_type[iii];
				if space_missing_berries[iii]<0 { space_missing_berries[iii]=0; }
			}
			//
			if card_space_id[ii].occupied=false and
			enemycard_hand[i].card_cost_total_type[0]<=card_space_id[ii].berries_total_type[0]+berries_held[0] and
			enemycard_hand[i].card_cost_total_type[1]<=card_space_id[ii].berries_total_type[1]+berries_held[1] and
			enemycard_hand[i].card_cost_total_type[2]<=card_space_id[ii].berries_total_type[2]+berries_held[2] and
			enemycard_hand[i].card_cost_total_type[3]<=card_space_id[ii].berries_total_type[3]+berries_held[3] and
			(card_space_id[ii].berries_total+space_missing_berries[0]+space_missing_berries[1]+space_missing_berries[2]+space_missing_berries[3]<=8) {
				poke_playable_in_space[ii][i]=true;
				anypoke_playable=true;
			}
			ii++;
		}
	}
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// PLAY: RANDOM POKEMON IN RANDOM SPACE
//————————————————————————————————————————————————————————————————————————————————————————————————————
if AI_level(argument0)<=4 and anypoke_playable=true {
	do {
		var enemycard_playplan_slot=irandom(enemycard_hand_total-1);
		enemyspace_playplan_slot=irandom(4);
	} until (poke_playable_in_space[enemyspace_playplan_slot][enemycard_playplan_slot]=true);
	//
	enemycard_playplan_id=enemycard_hand[enemycard_playplan_slot];
	for (var i=0; i<=3; i++;) {
		enemyberry_playplan[i]=enemycard_playplan_id.card_cost_total_type[i]-card_space_id[enemyspace_playplan_slot].berries_total_type[i];
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
/*else if AI_level(argument0)<=4 and anypoke_playable=true {
	var i=0, enemycard_playplan_slot=-1;
	repeat (pokecard_hand_total) {
		if enemycard_playplan_slot=-1 or (enemycard_atk[i]>enemycard_atk[enemycard_playplan_slot]) {
			enemycard_playplan_slot=i;
		}
		i++;
	}
}*/
//————————————————————————————————————————————————————————————————————————————————————————————————————
// PLAY (FULL HAND): RANDOM BERRY IN RANDOM SPACE
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if AI_level(argument0)<=4 and anypoke_playable=false and anyberry_playable=true and fullhand_draw=true {
	do {
		var berry_kind=irandom(2);  //no enigma
		enemyspace_playplan_slot=irandom(4);
	} until (berries_held[berry_kind]>0 and card_space_id[enemyspace_playplan_slot].berries_total<8 and card_space_id[enemyspace_playplan_slot].occupied=false);
	//
	enemyberry_playplan[berry_kind]=1;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// PLAY (DISCARD): RANDOM BERRY > RANDOM POKEMON
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if AI_level(argument0)<=4 and anypoke_playable=false and anyberry_playable=false and fullhand_draw=true {
	if berries_held[0]+berries_held[1]+berries_held[2]>0 { //no enigma
		do {
			enemycard_discardplan_id=enemycard_hand[irandom(enemycard_hand_total-1)];
		} until (enemycard_discardplan_id.card_id=3000 or enemycard_discardplan_id.card_id=3001 or enemycard_discardplan_id.card_id=3002); //no enigma
	}
	else {
		var i=0, any_discardable=false, card_discardable;
		repeat (enemycard_hand_total) {
			if enemycard_hp[i]>0 { //any pokemon (checks against all berries)
				card_discardable[i]=true;
				any_discardable=true;
			}
			else { card_discardable[i]=false; }
			i++;
		}
		//
		if any_discardable=true {
			do {
				var enemycard_discardplan_slot=irandom(enemycard_hand_total-1);
			} until (card_discardable[enemycard_discardplan_slot]=true);
			enemycard_discardplan_id=enemycard_hand[enemycard_discardplan_slot];
		}
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}