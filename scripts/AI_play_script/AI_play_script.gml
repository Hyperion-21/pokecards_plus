function AI_play_script() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
var random_value=irandom(99);
//————————————————————————————————————————————————————————————————————————————————————————————————————
var fullhand_draw=false;
if enemycard_draw_points>0 and enemycard_hand_total=card_hand_max and (enemycard_maindeck[0]!=-1 or enemycard_berrydeck[0]!=-1) {
	fullhand_draw=true;
}
//
var i=0, no_more_main=true;
repeat (enemycard_hand_total) {
	if enemycard_hand[i].card_cat=0 { no_more_main=false; }
}
if enemycard_maindeck[0]!=-1 { no_more_main=false; }
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
	if card_space_id[i].berries_total<8 and card_space_id[i].occupy_id=-1 and (berries_held[0]>0 or berries_held[1]>0 or berries_held[2]>0) {
		commonberry_playable=true;
	}
	if card_space_id[i].berries_total<8 and card_space_id[i].occupy_id=-1 and (berries_held[3]>0) {
		enigmaberry_playable=true;
	}
	if card_space_id[i].occupy_id=-1 {
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
				//space_missing_berries is only used to avoid max number of berries in space slot,
				//so it doesn't consider enigma berries as wildcards when counting (because it's a mess and may cause issues)
				space_missing_berries[iii]=enemycard_hand[i].card_cost_total_type[iii]-card_space_id[ii].berries_total_type[iii];
				if space_missing_berries[iii]<0 { space_missing_berries[iii]=0; }
			}
			//
			if card_space_id[ii].occupy_id=-1 and
			sc_card_cost_check(card_space_id[ii].berries_total_type[0]+berries_held[0],card_space_id[ii].berries_total_type[1]+berries_held[1],
			card_space_id[ii].berries_total_type[2]+berries_held[2],card_space_id[ii].berries_total_type[3]+berries_held[3],
			enemycard_hand[i].card_cost_total_type[0],enemycard_hand[i].card_cost_total_type[1],
			enemycard_hand[i].card_cost_total_type[2],enemycard_hand[i].card_cost_total_type[3],-1) and
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
if anypoke_playable=true and ob_main.playing_tutorial=false {
	var var_courage=ref_glyph_courage;
	var var_piercing=ref_glyph_piercing;
	var var_shield=ref_glyph_shield;
	var var_medic=ref_glyph_medic;
	var var_fork=ref_glyph_fork;
	//
	if enemycard_playplan_id=-1 { AI_play_plan(-1,-1,0,0,0,0,0,0,0,0,1,-1,0,-1,0,0); } //ANY CARD > ANY > WIN
	//
	if turn_num<=2 {
		if enemycard_playplan_id=-1 { AI_play_plan(3,-1,0,0,0,1,0,0,0,0,0,-1,0,-1,0,0); } //HIGHEST VALUE > ANY > RECEIVE NO DAMAGE
		if enemycard_playplan_id=-1 { AI_play_plan(2,1,0,0,1,0,1,0,0,0,0,-1,0,-1,0,1); } //HIGHEST DEF > VS > TURN ADVANTAGE
	}
	else if random_value<40 { //AGGRESIVE: DIRECT
		if enemycard_playplan_id=-1 { AI_play_plan(3,1,0,0,0,1,0,0,0,1,0,-1,0,-1,0,0); } //HIGHEST VALUE > VS > BLOCK WIN AND RECEIVE NO DAMAGE
		if enemycard_playplan_id=-1 { AI_play_plan(1,1,0,0,0,0,1,0,0,1,0,-1,0,-1,0,0); } //*HIGHEST ATK > VS > BLOCK WIN AND TURN ADVANTAGE
		if enemycard_playplan_id=-1 { AI_play_plan(1,1,0,0,0,0,0,0,0,1,0,-1,0,-1,0,0); } //*HIGHEST ATK > VS > BLOCK WIN
		if enemycard_playplan_id=-1 { AI_play_plan(1,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,1); } //HIGHEST ATK > EMPTY
		if enemycard_playplan_id=-1 { AI_play_plan(1,1,0,0,1,0,0,1,0,0,0,-1,0,-1,0,1); } //*HIGHEST ATK > VS > 1HKO
		if enemycard_playplan_id=-1 { AI_play_plan(3,1,0,0,1,0,0,0,0,0,0,-1,0,var_fork,1,1); } //HIGHEST VALUE > VS > FORK ATTACK
		if enemycard_playplan_id=-1 { AI_play_plan(1,-1,0,0,0,1,0,0,1,0,0,var_medic,1,-1,0,0); } //MEDIC, HIGHEST ATK, IF ANY HURT > ANY > RECEIVE NO DAMAGE
		if enemycard_playplan_id=-1 { AI_play_plan(2,-1,0,0,0,0,0,0,1,0,0,var_medic,1,-1,0,0); } //MEDIC, HIGHEST DEF, IF ANY HURT > ANY > RANDOM SPACE
		if enemycard_playplan_id=-1 { AI_play_plan(3,2,0,0,0,0,0,0,0,0,0,var_courage,1,-1,0,0); } //COURAGE, HIGHEST VALUE > NEXT TO FRIENDLY
		if enemycard_playplan_id=-1 { AI_play_plan(3,2,0,0,0,0,0,0,0,0,0,var_shield,1,-1,0,0); } //SHIELD, HIGHEST VALUE > NEXT TO FRIENDLY
		if enemycard_playplan_id=-1 { AI_play_plan(1,1,1,1,1,0,1,0,0,0,0,-1,0,-1,0,1); } //HIGHEST ATK > VS > DEAL BONUS, RECEIVE NO BONUS AND TURN ADVANTAGE
		if enemycard_playplan_id=-1 { AI_play_plan(1,1,1,0,1,0,1,0,0,0,0,-1,0,-1,0,1); } //HIGHEST ATK > VS > DEAL BONUS AND TURN ADVANTAGE
		if enemycard_playplan_id=-1 { AI_play_plan(1,1,0,0,1,0,1,0,0,0,0,-1,0,-1,0,1); } //*HIGHEST ATK > VS > TURN ADVANTAGE
		if enemycard_playplan_id=-1 { AI_play_plan(1,1,1,1,1,0,0,0,0,0,0,-1,0,-1,0,1); } //HIGHEST ATK > VS > DEAL BONUS AND RECEIVE NO BONUS
		if enemycard_playplan_id=-1 { AI_play_plan(1,1,1,0,1,0,0,0,0,0,0,-1,0,-1,0,1); } //HIGHEST ATK > VS > DEAL BONUS
		if enemycard_playplan_id=-1 { AI_play_plan(1,-1,0,0,0,1,0,0,0,0,0,var_fork,1,-1,0,0); } //FORK ATTACK, HIGHEST ATK > ANY > RECEIVE NO DAMAGE
		if enemycard_playplan_id=-1 { AI_play_plan(1,-1,0,0,0,1,0,0,0,0,0,var_piercing,1,-1,0,0); } //PIERCING ATTACK, HIGHEST ATK > ANY > RECEIVE NO DAMAGE
		if enemycard_playplan_id=-1 { AI_play_plan(2,1,0,0,0,1,0,0,0,0,0,-1,0,-1,0,0); } //HIGHEST DEF > VS > RECEIVE NO DAMAGE
		if enemycard_playplan_id=-1 { AI_play_plan(2,1,0,1,0,0,0,0,0,0,0,-1,0,-1,0,1); } //HIGHEST DEF > VS > RECEIVE NO BONUS
		if enemycard_playplan_id=-1 { AI_play_plan(3,-1,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0); } //HIGHEST VALUE > ANY > RANDOM SPACE
	}
	else if random_value<80 { //AGGRESIVE: VS POKEMON
		if enemycard_playplan_id=-1 { AI_play_plan(3,1,0,0,0,1,0,0,0,1,0,-1,0,-1,0,0); } //HIGHEST VALUE > VS > BLOCK WIN AND RECEIVE NO DAMAGE
		if enemycard_playplan_id=-1 { AI_play_plan(3,1,0,0,0,0,1,0,0,1,0,-1,0,-1,0,0); } //*HIGHEST VALUE > VS > BLOCK WIN AND TURN ADVANTAGE
		if enemycard_playplan_id=-1 { AI_play_plan(3,1,0,0,0,0,0,0,0,1,0,-1,0,-1,0,0); } //*HIGHEST VALUE > VS > BLOCK WIN
		if enemycard_playplan_id=-1 { AI_play_plan(3,1,0,0,1,0,0,1,0,0,0,-1,0,-1,0,1); } //*HIGHEST VALUE > VS > 1HKO
		if enemycard_playplan_id=-1 { AI_play_plan(3,1,0,0,1,0,0,0,0,0,0,-1,0,var_fork,1,1); } //HIGHEST VALUE > VS > FORK ATTACK
		if enemycard_playplan_id=-1 { AI_play_plan(1,-1,0,0,0,1,0,0,1,0,0,var_medic,1,-1,0,0); } //MEDIC, HIGHEST ATK, IF ANY HURT > ANY > RECEIVE NO DAMAGE
		if enemycard_playplan_id=-1 { AI_play_plan(2,-1,0,0,0,0,0,0,1,0,0,var_medic,1,-1,0,0); } //MEDIC, HIGHEST DEF, IF ANY HURT > ANY > RANDOM SPACE
		if enemycard_playplan_id=-1 { AI_play_plan(3,2,0,0,0,0,0,0,0,0,0,var_courage,1,-1,0,0); } //COURAGE, HIGHEST VALUE > NEXT TO FRIENDLY
		if enemycard_playplan_id=-1 { AI_play_plan(3,2,0,0,0,0,0,0,0,0,0,var_shield,1,-1,0,0); } //SHIELD, HIGHEST VALUE > NEXT TO FRIENDLY
		if enemycard_playplan_id=-1 { AI_play_plan(1,1,1,1,1,0,1,0,0,0,0,-1,0,-1,0,1); } //HIGHEST ATK > VS > DEAL BONUS, RECEIVE NO BONUS AND TURN ADVANTAGE
		if enemycard_playplan_id=-1 { AI_play_plan(1,1,1,0,1,0,1,0,0,0,0,-1,0,-1,0,1); } //HIGHEST ATK > VS > DEAL BONUS AND TURN ADVANTAGE
		if enemycard_playplan_id=-1 { AI_play_plan(1,1,0,0,1,0,1,0,0,0,0,-1,0,-1,0,1); } //*HIGHEST ATK > VS > TURN ADVANTAGE
		if enemycard_playplan_id=-1 { AI_play_plan(1,1,1,1,1,0,0,0,0,0,0,-1,0,-1,0,1); } //HIGHEST ATK > VS > DEAL BONUS AND RECEIVE NO BONUS
		if enemycard_playplan_id=-1 { AI_play_plan(1,1,1,0,1,0,0,0,0,0,0,-1,0,-1,0,1); } //HIGHEST ATK > VS > DEAL BONUS
		if enemycard_playplan_id=-1 { AI_play_plan(1,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,1); } //HIGHEST ATK > EMPTY
		if enemycard_playplan_id=-1 { AI_play_plan(1,-1,0,0,0,1,0,0,0,0,0,var_fork,1,-1,0,0); } //FORK ATTACK, HIGHEST ATK > ANY > RECEIVE NO DAMAGE
		if enemycard_playplan_id=-1 { AI_play_plan(1,-1,0,0,0,1,0,0,0,0,0,var_piercing,1,-1,0,0); } //PIERCING ATTACK, HIGHEST ATK > ANY > RECEIVE NO DAMAGE
		if enemycard_playplan_id=-1 { AI_play_plan(2,1,0,0,0,1,0,0,0,0,0,-1,0,-1,0,0); } //HIGHEST DEF > VS > RECEIVE NO DAMAGE
		if enemycard_playplan_id=-1 { AI_play_plan(2,1,0,1,0,0,0,0,0,0,0,-1,0,-1,0,1); } //HIGHEST DEF > VS > RECEIVE NO BONUS
		if enemycard_playplan_id=-1 { AI_play_plan(3,-1,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0); } //HIGHEST VALUE > ANY > RANDOM SPACE
	}
	else if random_value<100 { //DEFENSIVE
		if enemycard_playplan_id=-1 { AI_play_plan(3,1,0,0,0,1,0,0,0,1,0,-1,0,-1,0,0); } //HIGHEST VALUE > VS > BLOCK WIN AND RECEIVE NO DAMAGE
		if enemycard_playplan_id=-1 { AI_play_plan(2,1,0,0,0,0,1,0,0,1,0,-1,0,-1,0,0); } //*HIGHEST DEF > VS > BLOCK WIN AND TURN ADVANTAGE
		if enemycard_playplan_id=-1 { AI_play_plan(2,1,0,0,0,0,0,0,0,1,0,-1,0,-1,0,0); } //*HIGHEST DEF > VS > BLOCK WIN
		if enemycard_playplan_id=-1 { AI_play_plan(2,1,0,0,1,0,0,1,0,0,0,-1,0,-1,0,1); } //*HIGHEST DEF > VS > 1HKO
		if enemycard_playplan_id=-1 { AI_play_plan(1,-1,0,0,0,1,0,0,1,0,0,var_medic,1,-1,0,0); } //MEDIC, HIGHEST ATK, IF ANY HURT > ANY > RECEIVE NO DAMAGE
		if enemycard_playplan_id=-1 { AI_play_plan(2,-1,0,0,0,0,0,0,1,0,0,var_medic,1,-1,0,0); } //MEDIC, HIGHEST DEF, IF ANY HURT > ANY > RANDOM SPACE
		if enemycard_playplan_id=-1 { AI_play_plan(3,2,0,0,0,0,0,0,0,0,0,var_shield,1,-1,0,0); } //SHIELD, HIGHEST VALUE > NEXT TO FRIENDLY
		if enemycard_playplan_id=-1 { AI_play_plan(2,1,0,0,0,1,0,0,0,0,0,-1,0,-1,0,0); } //HIGHEST DEF > VS > RECEIVE NO DAMAGE
		if enemycard_playplan_id=-1 { AI_play_plan(2,1,0,1,0,0,0,0,0,0,0,-1,0,-1,0,1); } //HIGHEST DEF > VS > RECEIVE NO BONUS
		if enemycard_playplan_id=-1 { AI_play_plan(3,1,0,0,1,0,0,0,0,0,0,-1,0,var_fork,1,1); } //HIGHEST VALUE > VS > FORK ATTACK
		if enemycard_playplan_id=-1 { AI_play_plan(3,2,0,0,0,0,0,0,0,0,0,var_courage,1,-1,0,0); } //COURAGE, HIGHEST VALUE > NEXT TO FRIENDLY
		if enemycard_playplan_id=-1 { AI_play_plan(1,1,1,1,1,0,1,0,0,0,0,-1,0,-1,0,1); } //HIGHEST ATK > VS > DEAL BONUS, RECEIVE NO BONUS AND TURN ADVANTAGE
		if enemycard_playplan_id=-1 { AI_play_plan(1,1,1,0,1,0,1,0,0,0,0,-1,0,-1,0,1); } //HIGHEST ATK > VS > DEAL BONUS AND TURN ADVANTAGE
		if enemycard_playplan_id=-1 { AI_play_plan(2,1,0,0,1,0,1,0,0,0,0,-1,0,-1,0,1); } //*HIGHEST DEF > VS > TURN ADVANTAGE
		if enemycard_playplan_id=-1 { AI_play_plan(1,1,1,1,1,0,0,0,0,0,0,-1,0,-1,0,1); } //HIGHEST ATK > VS > DEAL BONUS AND RECEIVE NO BONUS
		if enemycard_playplan_id=-1 { AI_play_plan(1,1,1,0,1,0,0,0,0,0,0,-1,0,-1,0,1); } //HIGHEST ATK > VS > DEAL BONUS
		if enemycard_playplan_id=-1 { AI_play_plan(1,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,1); } //HIGHEST ATK > EMPTY
		if enemycard_playplan_id=-1 { AI_play_plan(1,-1,0,0,0,1,0,0,0,0,0,var_fork,1,-1,0,0); } //FORK ATTACK, HIGHEST ATK > ANY > RECEIVE NO DAMAGE
		if enemycard_playplan_id=-1 { AI_play_plan(1,-1,0,0,0,1,0,0,0,0,0,var_piercing,1,-1,0,0); } //PIERCING ATTACK, HIGHEST ATK > ANY > RECEIVE NO DAMAGE
		if enemycard_playplan_id=-1 { AI_play_plan(3,-1,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0); } //HIGHEST VALUE > ANY > RANDOM SPACE
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// PLAY: TUTORIAL
//————————————————————————————————————————————————————————————————————————————————————————————————————
if anypoke_playable=true and ob_main.playing_tutorial=true {
	if turn_num=2 and enemycard_playplan_id=-1 { AI_play_plan(-1,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0); } //ANY CARD > EMPTY SPACE
	else if turn_num=4 and enemycard_playplan_id=-1 { AI_play_plan(-1,1,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0); } //ANY CARD > VS
	else if turn_num=6 and enemycard_playplan_id=-1 { AI_play_plan(-1,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0); } //ANY CARD > EMPTY SPACE
	else if turn_num=10 and enemycard_playplan_id=-1 { AI_play_plan(-1,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0); } //ANY CARD > EMPTY SPACE
	else if turn_num=12 and enemycard_playplan_id=-1 { AI_play_plan(-1,-1,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0); } //ANY CARD > ANY > RANDOM SPACE
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// PLAY (FULL HAND)
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if anypoke_playable=false and commonberry_playable=true and fullhand_draw=true and no_more_main=false {
	//RANDOM BERRY (NOT ENIGMA) IN RANDOM SPACE
	do {
		var berry_kind=irandom(2);
		enemyspace_playplan_slot=irandom(4);
	} until (berries_held[berry_kind]>0 and card_space_id[enemyspace_playplan_slot].berries_total<8 and card_space_id[enemyspace_playplan_slot].occupy_id=-1);
	//
	enemyberry_playplan[berry_kind]=1;
}
else if anypoke_playable=false and commonberry_playable=false and enigmaberry_playable=true and fullhand_draw=true and no_more_main=false {
	//ENIGMA BERRY IN RANDOM SPACE
	do {
		var berry_kind=3;
		enemyspace_playplan_slot=irandom(4);
	} until (card_space_id[enemyspace_playplan_slot].berries_total<8 and card_space_id[enemyspace_playplan_slot].occupy_id=-1);
	//
	enemyberry_playplan[berry_kind]=1;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// PLAY (DISCARD)
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if anypoke_playable=false and commonberry_playable=false and enigmaberry_playable=false and fullhand_draw=true and no_more_main=false {
	//RANDOM UNNEEDED BERRY (NOT ENIGMA) IF BERRIES NEEDED > (IF EMPTY SPACES) > WEAKEST POKEMON (WEAK) > ENIGMA BERRY > WEAKEST POKEMON (ANY)
	if (berries_held[0]>berries_needed_fullhand[0] or berries_held[1]>berries_needed_fullhand[1] or berries_held[2]>berries_needed_fullhand[2]) and
	(berries_needed_fullhand[0]>berries_held[0] or berries_needed_fullhand[1]>berries_held[1] or berries_needed_fullhand[2]>berries_held[2]) {
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
			if enemycard_hand[i].card_cat=0 and enemycard_hand[i].card_value<=lowest_value and enemycard_hand[i].card_value<=4 {
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