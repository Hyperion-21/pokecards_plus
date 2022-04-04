function AI_draw_script() {//————————————————————————————————————————————————————————————————————————————————————————————————————
var random_value=irandom(99);
//————————————————————————————————————————————————————————————————————————————————————————————————————
var berries_held, berries_needed_fullhand;
var poke_held=0;
//
for (var i=0; i<=3; i++;) {
	berries_held[i]=0;
	berries_needed_fullhand[i]=0;
}
//
for (var i=0; i<enemycard_hand_total; i++;) {
	if enemycard_hand[i].card_cat=1 {
		berries_held[enemycard_hand[i].card_id-3000]++;
	}
	else if enemycard_hand[i].card_cat=0 {
		poke_held++;
		for (var ii=0; ii<=3; ii++;) {
			berries_needed_fullhand[ii]+=enemycard_hand[i].card_cost_total_type[ii];
		}
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// DRAW: RANDOM
//————————————————————————————————————————————————————————————————————————————————————————————————————
if random_value<10 {
	do {
		var enemy_draw_cat=irandom(1);
	} until (AI_draw_available(enemy_draw_cat));
	//
	AI_draw(enemy_draw_cat);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// DRAW: AT LEAST 2 POKEMON > BERRIES IF NEEDED > POKEMON > BERRIES
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if random_value<100 {
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