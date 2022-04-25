function AI_draw(argument0) {
/// @param cat
//————————————————————————————————————————————————————————————————————————————————————————————————————
sc_playsound(sn_card,50,false,false);
//
if argument0=0 {
	var var_card_selected=enemycard_maindeck[enemycard_maindeck_total-1];
}
else if argument0=1 {
	var var_card_selected=enemycard_berrydeck[enemycard_berrydeck_total-1];
}
//
enemycard_hand_total++;
enemycard_hand[enemycard_hand_total-1]=var_card_selected;
//var_card_selected.card_face=true; //cheat
//
if argument0=0 {
	enemycard_maindeck_total--;
	enemycard_maindeck[enemycard_maindeck_total]=-1;
	enemycard_draw_points-=card_drawcost_main;
}
else if argument0=1 {
	enemycard_berrydeck_total--;
	enemycard_berrydeck[enemycard_berrydeck_total]=-1;
	enemycard_draw_points-=card_drawcost_berry;
}
//
enemy_turn_timer=irandom_range(15,30);
//————————————————————————————————————————————————————————————————————————————————————————————————————
}