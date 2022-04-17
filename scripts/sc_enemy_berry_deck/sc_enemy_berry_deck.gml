function sc_enemy_berry_deck() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
enemycard_berrydeck_total=enemy_deck_fullcost[0]*2+enemy_deck_fullcost[1]*2+enemy_deck_fullcost[2]*2+enemy_deck_fullcost[3]*2; //none over berrydeck_total_max
//
var i=0;
repeat (enemycard_berrydeck_total) {
	if i<enemy_deck_fullcost[0]*2 { enemy_berry_id[i]=3000; } //oran
	else if i<enemy_deck_fullcost[0]*2+enemy_deck_fullcost[1]*2 { enemy_berry_id[i]=3001; } //leppa
	else if i<enemy_deck_fullcost[0]*2+enemy_deck_fullcost[1]*2+enemy_deck_fullcost[2]*2 { enemy_berry_id[i]=3002; } //lum
	else { enemy_berry_id[i]=3003; } //enigma
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}