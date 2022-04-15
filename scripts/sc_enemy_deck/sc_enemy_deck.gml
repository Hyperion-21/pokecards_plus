function sc_enemy_deck(argument0) {
/// @param trainer_kind
//————————————————————————————————————————————————————————————————————————————————————————————————————
if argument0<=20 {
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	enemycard_maindeck_total=(ob_main.area_zone+1)*10; //9-11, 18-22, 27-33, 36-44, 45-50, 50
	enemycard_maindeck_total=irandom_range(enemycard_maindeck_total*0.9,enemycard_maindeck_total*1.1);
	if enemycard_maindeck_total>maindeck_used_max { enemycard_maindeck_total=maindeck_used_max; }
	//
	var i=0;
	repeat (enemycard_maindeck_total) {
		enemy_card_id[i]=-1;
		enemy_card_level[i]=-1;
		enemy_card_glyph_a[i]=-1;
		enemy_card_glyph_b[i]=-1;
		enemy_card_glyph_c[i]=-1;
		enemy_card_innate[i]=-1;
		enemy_card_form_value[i]=-1;
		i++;
	}
	//
	enemycard_berrydeck_total=berrydeck_total_max*3;
	//
	var i=0;
	repeat (enemycard_berrydeck_total) {
		enemy_berry_id[i]=irandom_range(3000,3002);
		//if i<berrydeck_total_max { enemy_berry_id[i]=3000; }
		//else if i<berrydeck_total_max*2 { enemy_berry_id[i]=3001; }
		//else if i<berrydeck_total_max*3 { enemy_berry_id[i]=3002; }
		i++;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}