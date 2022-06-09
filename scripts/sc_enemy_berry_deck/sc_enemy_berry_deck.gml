function sc_enemy_berry_deck() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
enemycard_berrydeck_total=enemy_deck_fullcost[0]*2+enemy_deck_fullcost[1]*2+enemy_deck_fullcost[2]*2+enemy_deck_fullcost[3]*2; //none over berrydeck_total_max
if enemycard_berrydeck_total=0 { enemycard_berrydeck_total=1; }
//
if ob_main.playing_gym=true { enemycard_berrydeck_total=round(enemycard_berrydeck_total*1.2); } //+20%
else if ob_main.playing_elite=true { enemycard_berrydeck_total=round(enemycard_berrydeck_total*1.3); } //+30%
else if ob_main.playing_champion=true { enemycard_berrydeck_total=round(enemycard_berrydeck_total*1.4); } //+40%
else if ob_main.playing_tutorial=false { enemycard_berrydeck_total=round(enemycard_berrydeck_total*1.1); } //+10% (keep in mind enigma berry spawn chance in ob_card)
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