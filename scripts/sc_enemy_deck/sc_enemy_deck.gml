function sc_enemy_deck(argument0) {
/// @param trainer_kind
//————————————————————————————————————————————————————————————————————————————————————————————————————
for (var i=0; i<=17; i++;) {
	enemy_type_chance[i]=1; //1% minimum
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if argument0<=100 {
	if argument0=-1 { //-
		enemy_type_chance[00]=00; //normal
		enemy_type_chance[01]=00; //grass
		enemy_type_chance[02]=00; //fire
		enemy_type_chance[03]=00; //water
		enemy_type_chance[04]=00; //electric
		enemy_type_chance[05]=00; //flying
		enemy_type_chance[06]=00; //fighting
		enemy_type_chance[07]=00; //psychic
		enemy_type_chance[08]=00; //fairy
		enemy_type_chance[09]=00; //ground
		enemy_type_chance[10]=00; //rock
		enemy_type_chance[11]=00; //bug
		enemy_type_chance[12]=00; //poison
		enemy_type_chance[13]=00; //ice
		enemy_type_chance[14]=00; //dragon
		enemy_type_chance[15]=00; //steel
		enemy_type_chance[16]=00; //ghost
		enemy_type_chance[17]=00; //dark
	}
	else if argument0=00 { //CAMPER/PICNICKER
		enemy_type_chance[00]=100; //normal
		enemy_type_chance[01]=100; //grass
		enemy_type_chance[03]=75; //water
		enemy_type_chance[05]=100; //flying
		enemy_type_chance[09]=100; //ground
		enemy_type_chance[10]=75; //rock
		enemy_type_chance[11]=25; //bug
		enemy_type_chance[12]=25; //poison
		enemy_type_chance[17]=10; //dark
	}
	else if argument0=01 or argument0=04 { //FISHER & SWIMMER
		enemy_type_chance[03]=100; //water
	}
	else if argument0=02 { //HIKER
		enemy_type_chance[01]=10; //grass
		enemy_type_chance[06]=25; //fighting
		enemy_type_chance[09]=100; //ground
		enemy_type_chance[10]=100; //rock
		enemy_type_chance[11]=10; //bug
	}
	else if argument0=03 { //BUG CATCHER
		enemy_type_chance[01]=10; //grass
		enemy_type_chance[09]=10; //ground
		enemy_type_chance[11]=100; //bug
		enemy_type_chance[12]=100; //poison
	}
	else if argument0=05 { //BIRD KEEPER
		enemy_type_chance[05]=100; //flying
	}
	else if argument0=06 { //SKIER
		enemy_type_chance[03]=50; //water
		enemy_type_chance[05]=25; //flying
		enemy_type_chance[10]=25; //rock
		enemy_type_chance[13]=100; //ice
	}
	else if argument0=07 { //SUPER NERD
		enemy_type_chance[02]=75; //fire
		enemy_type_chance[04]=100; //electric
		enemy_type_chance[12]=100; //poison
	}
	else if argument0=08 { //YOUNGSTER
		enemy_type_chance[00]=100; //normal
		enemy_type_chance[01]=25; //grass
		enemy_type_chance[02]=25; //fire
		enemy_type_chance[03]=25; //water
		enemy_type_chance[04]=25; //electric
		enemy_type_chance[05]=25; //flying
		enemy_type_chance[06]=10; //fighting
		enemy_type_chance[09]=25; //ground
		enemy_type_chance[10]=25; //rock
		enemy_type_chance[11]=100; //bug
		enemy_type_chance[12]=25; //poison
		enemy_type_chance[15]=10; //steel
		enemy_type_chance[17]=10; //dark
	}
	else if argument0=09 { //LAD/LASS
		enemy_type_chance[00]=50; //normal
		enemy_type_chance[01]=100; //grass
		enemy_type_chance[02]=25; //fire
		enemy_type_chance[03]=25; //water
		enemy_type_chance[04]=25; //electric
		enemy_type_chance[05]=25; //flying
		enemy_type_chance[08]=100; //fairy
		enemy_type_chance[12]=10; //poison
	}
	else if argument0=10 { //BIKER
		enemy_type_chance[00]=25; //normal
		enemy_type_chance[02]=100; //fire
		enemy_type_chance[04]=25; //electric
		enemy_type_chance[07]=25; //psychic
		enemy_type_chance[08]=10; //fairy
		enemy_type_chance[12]=100; //poison
		enemy_type_chance[16]=50; //ghost
		enemy_type_chance[17]=50; //dark
	}
	else if argument0=11 { //ROUGHNECK
		enemy_type_chance[06]=100; //fighting
		enemy_type_chance[12]=50; //poison
		enemy_type_chance[16]=25; //ghost
		enemy_type_chance[17]=100; //dark
	}
	else if argument0=12 { //PUNK GUY/PUNK GIRL
		enemy_type_chance[00]=10; //normal
		enemy_type_chance[06]=25; //fighting
		enemy_type_chance[12]=100; //poison
		enemy_type_chance[16]=50; //ghost
		enemy_type_chance[17]=100; //dark
	}
	else if argument0=13 { //GUITARIST
		enemy_type_chance[04]=100; //electric
		enemy_type_chance[12]=10; //poison
		enemy_type_chance[17]=25; //dark
	}
	else if argument0=14 { //PSYCHIC
		enemy_type_chance[07]=100; //psychic
		enemy_type_chance[16]=50; //ghost
	}
	else if argument0=15 { //BLACK BELT
		enemy_type_chance[02]=10; //fire
		enemy_type_chance[06]=100; //fighting
		enemy_type_chance[10]=50; //rock
		enemy_type_chance[15]=25; //steel
	}
	else if argument0=16 { //SCIENTIST
		enemy_type_chance[00]=25; //normal
		enemy_type_chance[02]=10; //fire
		enemy_type_chance[04]=100; //electric
		enemy_type_chance[07]=100; //psychic
		enemy_type_chance[12]=75; //poison
	}
	else if argument0=17 { //RUIN MANIAC
		enemy_type_chance[09]=100; //ground
		enemy_type_chance[10]=100; //rock
		enemy_type_chance[15]=75; //steel
	}
	else if argument0=18 { //BURGLAR
		enemy_type_chance[02]=100; //fire
		enemy_type_chance[12]=25; //poison
		enemy_type_chance[17]=10; //dark
	}
	else if argument0=19 { //ENGINEER
		enemy_type_chance[04]=100; //electric
	}
	else if argument0=20 { //CHANNELER
		enemy_type_chance[16]=100; //ghost
		enemy_type_chance[17]=10; //dark
	}
	else if argument0=21 { //DRAGON TAMER
		enemy_type_chance[14]=100; //dragon
	}
	else if argument0=22 { //SPRITE BOY/FAIRY GIRL
		enemy_type_chance[00]=25; //normal
		enemy_type_chance[07]=50; //psychic
		enemy_type_chance[08]=100; //fairy
	}
	else if argument0=23 { //KINDLER
		enemy_type_chance[02]=100; //fire
		enemy_type_chance[03]=10; //water
	}
	else if argument0=24 { //AROMA MAN/AROMA LADY
		enemy_type_chance[01]=100; //grass
		enemy_type_chance[08]=10; //fairy
	}
	else if argument0=25 { //RANGER
		enemy_type_chance[00]=50; //normal
		enemy_type_chance[01]=100; //grass
		enemy_type_chance[02]=10; //fire
		enemy_type_chance[03]=25; //water
		enemy_type_chance[04]=10; //electric
		enemy_type_chance[05]=25; //flying
		enemy_type_chance[09]=25; //ground
		enemy_type_chance[10]=10; //rock
		enemy_type_chance[11]=25; //bug
		enemy_type_chance[12]=25; //poison
	}
	else if argument0=100 { //ACE TRAINER
		enemy_type_chance[00]=100; //normal
		enemy_type_chance[01]=100; //grass
		enemy_type_chance[02]=100; //fire
		enemy_type_chance[03]=100; //water
		enemy_type_chance[04]=100; //electric
		enemy_type_chance[05]=100; //flying
		enemy_type_chance[06]=100; //fighting
		enemy_type_chance[07]=100; //psychic
		enemy_type_chance[08]=100; //fairy
		enemy_type_chance[09]=100; //ground
		enemy_type_chance[10]=100; //rock
		enemy_type_chance[11]=100; //bug
		enemy_type_chance[12]=100; //poison
		enemy_type_chance[13]=100; //ice
		enemy_type_chance[14]=100; //dragon
		enemy_type_chance[15]=100; //steel
		enemy_type_chance[16]=100; //ghost
		enemy_type_chance[17]=100; //dark
	}
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
		if i<berrydeck_total_max { enemy_berry_id[i]=3000; }
		else if i<berrydeck_total_max*2 { enemy_berry_id[i]=3001; }
		else if i<berrydeck_total_max*3 { enemy_berry_id[i]=3002; }
		i++;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=101 { //tutorial
	enemycard_maindeck_total=5;
	//
	var i=0;
	repeat (enemycard_maindeck_total) {
		enemy_card_id[i]=choose(010,011,013,014,016,019); //caterpie, metapod, weedle, kakuna, pidgey, rattata
		enemy_card_level[i]=1;
		enemy_card_glyph_a[i]=-1;
		enemy_card_glyph_b[i]=-1;
		enemy_card_glyph_c[i]=-1;
		enemy_card_innate[i]=1;
		enemy_card_form_value[i]=0;
		i++;
	}
	//
	enemycard_berrydeck_total=10;
	//
	var i=0;
	repeat (enemycard_berrydeck_total) {
		if i<=4 { enemy_berry_id[i]=3000; }
		else { enemy_berry_id[i]=3001; }
		i++;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}