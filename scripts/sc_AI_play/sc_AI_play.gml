function sc_AI_play(argument0) {
/// @param AI_level
//————————————————————————————————————————————————————————————————————————————————————————————————————
var berries_held;
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
	i+=1;
}
//
var i=0, ii=0, pokecard_hand_total=0, enemycard_atk, enemycard_def, enemycard_hp;
repeat (enemycard_hand_total) {
	if enemycard_hand[i].card_cat=0 {
		enemycard_atk[ii]=enemycard_hand[i].card_atk;
		enemycard_def[ii]=enemycard_hand[i].card_def;
		enemycard_hp[ii]=enemycard_hand[i].card_hp;
		pokecard_hand_total+=1;
		//
		var iii=0;
		repeat (5) {
			if card_space_id[iii].occupied=false //and
			//enemycard_hand[i].card_cost_total_type[0]<=card_space_id[iii].berries_total_type[0]+berries_held[0] and
			//enemycard_hand[i].card_cost_total_type[1]<=card_space_id[iii].berries_total_type[1]+berries_held[1] and
			//enemycard_hand[i].card_cost_total_type[2]<=card_space_id[iii].berries_total_type[2]+berries_held[2] and
			//enemycard_hand[i].card_cost_total_type[3]<=card_space_id[iii].berries_total_type[3]+berries_held[3] {
			{
				space_confirm[iii][i]=true;
			}
			iii+=1;
		}
	}
	else if enemycard_hand[i].card_cat=1 {
		berries_held[enemycard_hand[i].card_id-3000]+=1;
		enemycard_atk[ii]=-1;
		enemycard_def[ii]=-1;
		enemycard_hp[ii]=-1;
	}
	//
	i+=1;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// RANDOM
if argument0=0 {
	if pokecard_hand_total>0 {
		do {
			var enemycard_play=irandom(enemycard_hand_total-1), space_choice=irandom(4);
		} until (space_confirm[space_choice][enemycard_play]=true);
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=1 {
	if pokecard_hand_total>0 {
		var i=0, enemycard_play=-1;
		repeat (pokecard_hand_total) {
			if enemycard_play=-1 or (enemycard_atk[i]>enemycard_atk[enemycard_play]) {
				enemycard_play=i;
			}
			i+=1;
		}
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if pokecard_hand_total>0 {
	enemycard_hand[enemycard_play].potential_x=card_space_id[space_choice].x;
	enemycard_hand[enemycard_play].potential_y=card_space_id[space_choice].y;
	enemycard_hand[enemycard_play].depth=200;
	enemycard_hand[enemycard_play].card_face=true;
	card_space_id[space_choice].occupied=true;
	//
	card_space_id[space_choice].effect_use=1;
	enemycard_hand[enemycard_play].card_played=true;
	//
	sc_AI_report("PHASE: Play (AI level " + string(argument0) + ")");
	sc_AI_report("Play > " + string(enemycard_hand[enemycard_play].card_name));
	//
	var i=0, lower_hand_num=false;
	repeat (enemycard_hand_total) {
		if enemycard_hand[enemycard_play]=enemycard_hand[i] {
			lower_hand_num=true;
		}
		if lower_hand_num=true {
			if i<card_hand_max-1 { enemycard_hand[i]=enemycard_hand[i+1]; }
			else { enemycard_hand[i]=-1; }
		}
		i+=1;
	}
	enemycard_hand_total-=1;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}