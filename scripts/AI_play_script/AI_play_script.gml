function AI_play_script() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
var random_value=irandom(99);
//————————————————————————————————————————————————————————————————————————————————————————————————————
var fullhand_draw=false;
if enemycard_draw_points>0 and enemycard_hand_total=card_hand_max and (enemycard_maindeck[0]!=-1 or enemycard_berrydeck[0]!=-1) {
	fullhand_draw=true;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
var berries_held, berries_needed_fullhand;
var anypoke_playable=false, commonberry_playable=false, enigmaberry_playable=false, all_spaces_occupied=true;
//
for (var i=0; i<=3; i++;) {
	berries_held[i]=0;
	berries_needed_fullhand[i]=0;
}
//
for (var i=0; i<enemycard_hand_total; i++;) {
	for (var ii=0; ii<=4; ii++;) {
		space_poke_possible[ii][i]=false;
	}
	if enemycard_hand[i].card_cat=1 {
		berries_held[enemycard_hand[i].card_id-3000]++;
	}
	else if enemycard_hand[i].card_cat=0 {
		for (var ii=0; ii<=3; ii++;) {
			berries_needed_fullhand[ii]+=enemycard_hand[i].card_cost_total_type[ii];
		}
	}
}
//
for (var i=0; i<=4; i++;) {
	if card_space_id[i].berries_total<8 and card_space_id[i].occupied=false and (berries_held[0]>0 or berries_held[1]>0 or berries_held[2]>0) {
		commonberry_playable=true;
	}
	if card_space_id[i].berries_total<8 and card_space_id[i].occupied=false and (berries_held[3]>0) {
		enigmaberry_playable=true;
	}
	if card_space_id[i].occupied=false {
		all_spaces_occupied=false;
	}
}
//
var i=0;
repeat (enemycard_hand_total) {
	if enemycard_hand[i].card_cat=0 {
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
				space_poke_possible[ii][i]=true;
				anypoke_playable=true;
			}
			ii++;
		}
	}
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// PLAY
//————————————————————————————————————————————————————————————————————————————————————————————————————
if anypoke_playable=true {
	if random_value<40 { //AGGRESIVE: DIRECT
		if enemycard_playplan_id=-1 { AI_play_plan(1,-1,0,false,false,false,false); } //HIGHEST ATK VS EMPTY SPACE
		if enemycard_playplan_id=-1 { AI_play_plan(1,-1,1,true,true,true,false); } //HIGHEST ATK VS DEALING TYPE ADVANTAGE BONUS AND RECEIVING NO TYPE ADVANTAGE BONUS DAMAGE FROM POKEMON
		if enemycard_playplan_id=-1 { AI_play_plan(1,-1,1,true,false,true,false); } //HIGHEST ATK VS DEALING TYPE ADVANTAGE BONUS
		if enemycard_playplan_id=-1 { AI_play_plan(2,-1,1,false,false,false,true); } //HIGHEST DEF VS RECEIVING NO DAMAGE FROM POKEMON
		if enemycard_playplan_id=-1 { AI_play_plan(2,-1,1,false,true,false,false); } //HIGHEST DEF VS RECEIVING NO TYPE ADVANTAGE BONUS DAMAGE FROM POKEMON
	}
	else if random_value<80 { //AGGRESIVE: VS POKEMON
		if enemycard_playplan_id=-1 { AI_play_plan(1,-1,1,true,true,true,false); } //HIGHEST ATK VS DEALING TYPE ADVANTAGE BONUS AND RECEIVING NO TYPE ADVANTAGE BONUS DAMAGE FROM POKEMON
		if enemycard_playplan_id=-1 { AI_play_plan(1,-1,1,true,false,true,false); } //HIGHEST ATK VS DEALING TYPE ADVANTAGE BONUS
		if enemycard_playplan_id=-1 { AI_play_plan(1,-1,0,false,false,false,false); } //HIGHEST ATK VS EMPTY SPACE
		if enemycard_playplan_id=-1 { AI_play_plan(2,-1,1,false,false,false,true); } //HIGHEST DEF VS RECEIVING NO DAMAGE FROM POKEMON
		if enemycard_playplan_id=-1 { AI_play_plan(2,-1,1,false,true,false,false); } //HIGHEST DEF VS RECEIVING NO TYPE ADVANTAGE BONUS DAMAGE FROM POKEMON
	}
	else if random_value<100 { //DEFENSIVE
		if enemycard_playplan_id=-1 { AI_play_plan(2,-1,1,false,false,false,true); } //HIGHEST DEF VS RECEIVING NO DAMAGE FROM POKEMON
		if enemycard_playplan_id=-1 { AI_play_plan(2,-1,1,false,true,false,false); } //HIGHEST DEF VS RECEIVING NO TYPE ADVANTAGE BONUS DAMAGE FROM POKEMON
		if enemycard_playplan_id=-1 { AI_play_plan(1,-1,1,true,true,true,false); } //HIGHEST ATK VS DEALING TYPE ADVANTAGE BONUS AND RECEIVING NO TYPE ADVANTAGE BONUS DAMAGE FROM POKEMON
		if enemycard_playplan_id=-1 { AI_play_plan(1,-1,1,true,false,true,false); } //HIGHEST ATK VS DEALING TYPE ADVANTAGE BONUS
		if enemycard_playplan_id=-1 { AI_play_plan(1,-1,0,false,false,false,false); } //HIGHEST ATK VS EMPTY SPACE
	}
	if enemycard_playplan_id=-1 { AI_play_plan(3,-1,-1,false,false,false,false); } //HIGHEST VALUE IN RANDOM SPACE
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// PLAY (FULL HAND)
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if anypoke_playable=false and commonberry_playable=true and fullhand_draw=true {
	//RANDOM BERRY (NOT ENIGMA) IN RANDOM SPACE
	do {
		var berry_kind=irandom(2);
		enemyspace_playplan_slot=irandom(4);
	} until (berries_held[berry_kind]>0 and card_space_id[enemyspace_playplan_slot].berries_total<8 and card_space_id[enemyspace_playplan_slot].occupied=false);
	//
	enemyberry_playplan[berry_kind]=1;
}
else if anypoke_playable=false and commonberry_playable=false and enigmaberry_playable=true and fullhand_draw=true {
	//ENIGMA BERRY IN RANDOM SPACE
	do {
		var berry_kind=3;
		enemyspace_playplan_slot=irandom(4);
	} until (card_space_id[enemyspace_playplan_slot].berries_total<8 and card_space_id[enemyspace_playplan_slot].occupied=false);
	//
	enemyberry_playplan[berry_kind]=1;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// PLAY (DISCARD)
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if anypoke_playable=false and commonberry_playable=false and enigmaberry_playable=false and fullhand_draw=true {
	//RANDOM UNNEEDED BERRY (NOT ENIGMA) > (IF EMPTY SPACES) > WEAKEST POKEMON (WEAK) > ENIGMA BERRY > WEAKEST POKEMON (ANY)
	if berries_held[0]>berries_needed_fullhand[0] or berries_held[1]>berries_needed_fullhand[1] or berries_held[2]>berries_needed_fullhand[2] {
		do {
			enemycard_discardplan_id=enemycard_hand[irandom(enemycard_hand_total-1)];
		} until ((berries_held[0]>berries_needed_fullhand[0] and enemycard_discardplan_id.card_id=3000) or
		(berries_held[1]>berries_needed_fullhand[1] and enemycard_discardplan_id.card_id=3001) or
		(berries_held[2]>berries_needed_fullhand[2] and enemycard_discardplan_id.card_id=3002));
	}
	//
	else if all_spaces_occupied=false {
		var i=0, any_discardable=false, lowest_value=999;
		repeat (enemycard_hand_total) {
			if enemycard_hand[i].card_cat=0 and enemycard_hand[i].card_value<=lowest_value and enemycard_hand[i].card_value<10 {
				lowest_value=enemycard_hand[i].card_value;
				any_discardable=true;
			}
			i++;
		}
		if any_discardable=true {
			do {
				var enemycard_discardplan_slot=irandom(enemycard_hand_total-1);
			} until (enemycard_hand[enemycard_discardplan_slot].card_value=lowest_value);
			enemycard_discardplan_id=enemycard_hand[enemycard_discardplan_slot];
		}
		//
		else if berries_held[3]>0 {
			do {
				enemycard_discardplan_id=enemycard_hand[irandom(enemycard_hand_total-1)];
			} until (enemycard_discardplan_id.card_id=3003);
		}
		//
		else {
			var i=0, any_discardable=false, lowest_value=999;
			repeat (enemycard_hand_total) {
				if enemycard_hand[i].card_cat=0 and enemycard_hand[i].card_value<=lowest_value {
					lowest_value=enemycard_hand[i].card_value;
					any_discardable=true;
				}
				i++;
			}
			if any_discardable=true {
				do {
					var enemycard_discardplan_slot=irandom(enemycard_hand_total-1);
				} until (enemycard_hand[enemycard_discardplan_slot].card_value=lowest_value);
				enemycard_discardplan_id=enemycard_hand[enemycard_discardplan_slot];
			}
		}
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if enemycard_playplan_id!=-1 or enemycard_discardplan_id!=-1 or enemyberry_playplan[0]>0 or enemyberry_playplan[1]>0 or enemyberry_playplan[2]>0 or enemyberry_playplan[3]>0 {
	enemy_turn_timer=1; //to avoid ending turn
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}