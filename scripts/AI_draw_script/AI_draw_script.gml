function AI_draw_script() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
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
// DRAW: RANDOM (5%)
//————————————————————————————————————————————————————————————————————————————————————————————————————
if random_value<5 and ob_main.playing_tutorial=false {
	do {
		var enemy_draw_cat=irandom(1);
	} until (AI_draw_available(enemy_draw_cat));
	//
	AI_draw(enemy_draw_cat);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
// DRAW: AT LEAST 1 POKEMON > POKEMON IF 0-2 POKEMON AND 3+ BERRIES > POKEMON IF 0-3 POKEMON AND 6+ BERRIES > BERRIES IF NEEDED (NOT ENIGMA) > POKEMON > BERRIES
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if random_value<100 and ob_main.playing_tutorial=false {
	if poke_held<1 and AI_draw_available(0) {
		AI_draw(0);
	}
	else if poke_held<=2 and (berries_held[0]+berries_held[1]+berries_held[2]+berries_held[3])>=3 and AI_draw_available(0) {
		AI_draw(0);
	}
	else if poke_held<=3 and (berries_held[0]+berries_held[1]+berries_held[2]+berries_held[3])>=6 and AI_draw_available(0) {
		AI_draw(0);
	}
	else if (berries_needed_fullhand[0]>berries_held[0] or berries_needed_fullhand[1]>berries_held[1] or berries_needed_fullhand[2]>berries_held[2]) and AI_draw_available(1) {
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
// DRAW: TUTORIAL
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if ob_main.playing_tutorial=true {
	if turn_num=2 {
		if poke_held=0 { AI_draw(0); }
		else { AI_draw(1); }
	}
	if turn_num=4 { AI_draw(0); }
	if turn_num=6 { AI_draw(0); }
	if turn_num=8 { AI_draw(0); }
	if turn_num=10 { AI_draw(1); }
	if turn_num=12 { AI_draw(0); }
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}