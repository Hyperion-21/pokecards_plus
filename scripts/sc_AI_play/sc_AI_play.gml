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
			var space_missing_berries;
			space_missing_berries[0]=enemycard_hand[i].card_cost_total_type[0]-card_space_id[iii].berries_total_type[0];
			if space_missing_berries[0]<0 { space_missing_berries[0]=0; }
			space_missing_berries[1]=enemycard_hand[i].card_cost_total_type[1]-card_space_id[iii].berries_total_type[1];
			if space_missing_berries[1]<0 { space_missing_berries[1]=0; }
			space_missing_berries[2]=enemycard_hand[i].card_cost_total_type[2]-card_space_id[iii].berries_total_type[2];
			if space_missing_berries[2]<0 { space_missing_berries[2]=0; }
			space_missing_berries[3]=enemycard_hand[i].card_cost_total_type[3]-card_space_id[iii].berries_total_type[3];
			if space_missing_berries[3]<0 { space_missing_berries[3]=0; }
			//
			if card_space_id[iii].occupied=false and
			enemycard_hand[i].card_cost_total_type[0]<=card_space_id[iii].berries_total_type[0]+berries_held[0] and
			enemycard_hand[i].card_cost_total_type[1]<=card_space_id[iii].berries_total_type[1]+berries_held[1] and
			enemycard_hand[i].card_cost_total_type[2]<=card_space_id[iii].berries_total_type[2]+berries_held[2] and
			enemycard_hand[i].card_cost_total_type[3]<=card_space_id[iii].berries_total_type[3]+berries_held[3] and
			(card_space_id[iii].berries_total+space_missing_berries[0]+space_missing_berries[1]+space_missing_berries[2]+space_missing_berries[3]<=8) {
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
//
var i=0, can_play_something=false;
repeat (enemycard_hand_total) {
	var ii=0;
	repeat (5) {
		if space_confirm[ii][i]=true { can_play_something=true; }
		ii+=1;
	}
	i+=1;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// RANDOM
if argument0=0 and can_play_something=true and enemycard_play_id=-1 {
	if pokecard_hand_total>0 {
		do {
			var enemycard_play=irandom(enemycard_hand_total-1);
			enemyspace_play=irandom(4);
		} until (space_confirm[enemyspace_play][enemycard_play]=true);
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=1 and can_play_something=true and enemycard_play_id=-1 {
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
if pokecard_hand_total>0 and can_play_something=true {
	if enemycard_play_id=-1 {
		enemycard_play_id=enemycard_hand[enemycard_play];
		sc_AI_report("(want to play " + string(enemycard_play_id.card_name) + " in slot " + string(enemyspace_play) + ")");
	}
	//
	if card_space_id[enemyspace_play].berries_total_type[0]<enemycard_play_id.card_cost_total_type[0] {
		card_space_id[enemyspace_play].berries_total+=1;
		card_space_id[enemyspace_play].berries_total_type[0]+=1;
		enemycard_play_id.card_trash=true;
		sc_AI_report("Play (AI level " + string(argument0) + ") > Oran Berry");
	}
	else if card_space_id[enemyspace_play].berries_total_type[1]<enemycard_play_id.card_cost_total_type[1] {
		card_space_id[enemyspace_play].berries_total+=1;
		card_space_id[enemyspace_play].berries_total_type[1]+=1;
		enemycard_play_id.card_trash=true;
		sc_AI_report("Play (AI level " + string(argument0) + ") > Leppa Berry");
	}
	else if card_space_id[enemyspace_play].berries_total_type[2]<enemycard_play_id.card_cost_total_type[2] {
		card_space_id[enemyspace_play].berries_total+=1;
		card_space_id[enemyspace_play].berries_total_type[2]+=1;
		enemycard_play_id.card_trash=true;
		sc_AI_report("Play (AI level " + string(argument0) + ") > Lum Berry");
	}
	else if card_space_id[enemyspace_play].berries_total_type[3]<enemycard_play_id.card_cost_total_type[3] {
		card_space_id[enemyspace_play].berries_total+=1;
		card_space_id[enemyspace_play].berries_total_type[3]+=1;
		enemycard_play_id.card_trash=true;
		sc_AI_report("Play (AI level " + string(argument0) + ") > Enigma Berry");
	}
	else {
		enemycard_play_id.potential_x=card_space_id[enemyspace_play].x;
		enemycard_play_id.potential_y=card_space_id[enemyspace_play].y;
		card_space_id[enemyspace_play].berries_total_type[0]-=enemycard_play_id.card_cost_total_type[0];
		card_space_id[enemyspace_play].berries_total_type[1]-=enemycard_play_id.card_cost_total_type[1];
		card_space_id[enemyspace_play].berries_total_type[2]-=enemycard_play_id.card_cost_total_type[2];
		card_space_id[enemyspace_play].berries_total_type[3]-=enemycard_play_id.card_cost_total_type[3];
		card_space_id[enemyspace_play].berries_total-=enemycard_play_id.card_cost_total;
		enemycard_play_id.depth=200;
		enemycard_play_id.card_face=true;
		card_space_id[enemyspace_play].occupied=true;
		sc_AI_report("Play (AI level " + string(argument0) + ") > " + string(enemycard_play_id.card_name));
	}
	//
	if enemycard_play_id!=-1 {
		card_space_id[enemyspace_play].effect_use=1;
		enemycard_play_id.card_played=true;
		//
		var i=0, lower_hand_num=false;
		repeat (enemycard_hand_total) {
			if enemycard_play_id=enemycard_hand[i] {
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
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}