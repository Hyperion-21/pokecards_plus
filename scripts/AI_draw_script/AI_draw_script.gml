function AI_draw_script(argument0) {
/// @param AI_value
//————————————————————————————————————————————————————————————————————————————————————————————————————
// DRAW: RANDOM
//————————————————————————————————————————————————————————————————————————————————————————————————————
if AI_level(argument0)=0 {
	do {
		var enemy_draw_cat=irandom(1);
	} until (AI_draw_available(enemy_draw_cat));
	//
	AI_draw(enemy_draw_cat);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// DRAW: AT LEAST 2 POKEMON > BERRIES IF NEEDED > POKEMON > BERRIES
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if AI_level(argument0)<=4 {
	var berries_needed_fullhand, berries_held;
	for (var i=0; i<=3; i++;) {
		berries_needed_fullhand[i]=0;
		berries_held[i]=0;
	}
	var i=0, poke_held=0;
	repeat (enemycard_hand_total) {
		if enemycard_hand[i].card_cat=0 {
			berries_needed_fullhand[0]+=enemycard_hand[i].card_cost_total_type[0]; //oran
			berries_needed_fullhand[1]+=enemycard_hand[i].card_cost_total_type[1]; //leppa
			berries_needed_fullhand[2]+=enemycard_hand[i].card_cost_total_type[2]; //lum
			berries_needed_fullhand[3]+=enemycard_hand[i].card_cost_total_type[3]; //enigma
			poke_held++;
		}
		else if enemycard_hand[i].card_cat=1 {
			berries_held[enemycard_hand[i].card_id-3000]++;
		}
		i++;
	}
	//
	if poke_held<2 and AI_draw_available(0) {
		AI_draw(0);
	}
	else if ((berries_needed_fullhand[0]>berries_held[0]) or (berries_needed_fullhand[1]>berries_held[1]) or (berries_needed_fullhand[2]>berries_held[2])) and AI_draw_available(1) {
		AI_draw(1);
	}
	else if AI_draw_available(0) {
		AI_draw(0);
	}
	else if AI_draw_available(1) {
		AI_draw(1);
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}