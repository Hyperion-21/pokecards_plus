function sc_AI_draw(argument0) {
/// @param AI_level
//————————————————————————————————————————————————————————————————————————————————————————————————————
var AI_level=-1;
if argument0<=AI_threshold[0] { AI_level=0; }
else if argument0<=AI_threshold[1] { AI_level=1; }
else if argument0<=AI_threshold[2] { AI_level=2; }
else if argument0<=AI_threshold[3] { AI_level=3; }
else if argument0<=AI_threshold[4] { AI_level=4; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
var enemy_draw_confirm=false, enemy_draw_cat=-1;
//————————————————————————————————————————————————————————————————————————————————————————————————————
// DRAW: RANDOM
if AI_level<=0 {
	do {
		enemy_draw_cat=irandom(1);
		if (enemy_draw_cat=0 and enemycard_draw_points>=card_drawcost_main and enemycard_maindeck[0]!=-1) or
		(enemy_draw_cat=1 and enemycard_draw_points>=card_drawcost_berry and enemycard_berrydeck[0]!=-1) {
			enemy_draw_confirm=true;
		}
	} until (enemy_draw_confirm=true);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// DRAW: AT LEAST 2 POKEMON > BERRIES IF NEEDED
else if AI_level<=4 {
	var i=0, berries_needed, berries_held, poke_held=0;
	berries_needed[0]=0;
	berries_needed[1]=0;
	berries_needed[2]=0;
	berries_needed[3]=0;
	berries_held[0]=0;
	berries_held[1]=0;
	berries_held[2]=0;
	berries_held[3]=0;
	//
	repeat (enemycard_hand_total) {
		if enemycard_hand[i].card_cat=0 {
			berries_needed[0]+=enemycard_hand[i].card_cost_total_type[0]; //oran
			berries_needed[1]+=enemycard_hand[i].card_cost_total_type[1]; //leppa
			berries_needed[2]+=enemycard_hand[i].card_cost_total_type[2]; //lum
			berries_needed[3]+=enemycard_hand[i].card_cost_total_type[3]; //enigma
			poke_held++;
		}
		else if enemycard_hand[i].card_cat=1 {
			berries_held[enemycard_hand[i].card_id-3000]++;
		}
		i++;
	}
	if (enemycard_draw_points>=card_drawcost_main and enemycard_maindeck[0]!=-1 and poke_held<2) {
		enemy_draw_cat=0;
	}
	else if (enemycard_draw_points>=card_drawcost_berry and enemycard_berrydeck[0]!=-1) and
	((berries_needed[0]>berries_held[0]) or
	(berries_needed[1]>berries_held[1]) or
	(berries_needed[2]>berries_held[2])) {
		enemy_draw_cat=1;
	}
	else if (enemycard_draw_points>=card_drawcost_main and enemycard_maindeck[0]!=-1) {
		enemy_draw_cat=0;
	}
	else if (enemycard_draw_points>=card_drawcost_berry and enemycard_berrydeck[0]!=-1) {
		enemy_draw_cat=1;
	}
	//
	sc_AI_report("Draw (AI " + string(AI_level) + ") // berries needed (hand): " +
	string(berries_needed[0]) + "+" + string(berries_needed[1]) + "+" + string(berries_needed[2]) + "+" + string(berries_needed[3]) +
	", berries held (hand): " + string(berries_held[0]) + "+" + string(berries_held[1]) + "+" + string(berries_held[2]) + "+" + string(berries_held[3]));
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if enemy_draw_cat=0 {
	var var_card_selected=enemycard_maindeck[enemycard_maindeck_total-1];
}
else if enemy_draw_cat=1 {
	var var_card_selected=enemycard_berrydeck[enemycard_berrydeck_total-1];
}
//
enemycard_hand_total++;
enemycard_hand[enemycard_hand_total-1]=var_card_selected;
//var_card_selected.card_face=true; //cheat
//
if enemy_draw_cat=0 {
	enemycard_maindeck_total--;
	enemycard_maindeck[enemycard_maindeck_total]=-1;
	enemycard_draw_points-=card_drawcost_main;
}
else if enemy_draw_cat=1 {
	enemycard_berrydeck_total--;
	enemycard_berrydeck[enemycard_berrydeck_total]=-1;
	enemycard_draw_points-=card_drawcost_berry;
}
//
sc_AI_report("Draw (AI " + string(AI_level) + ") > " + string(var_card_selected.card_name));
//————————————————————————————————————————————————————————————————————————————————————————————————————
}