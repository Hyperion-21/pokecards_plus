function sc_enemy_deck(argument0) {
/// @param trainer_kind
//————————————————————————————————————————————————————————————————————————————————————————————————————
for (var i=0; i<=17; i++;) {
	enemy_type_chance[i]=1; //1% minimum
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if argument0<=100 {
	if argument0=-1 { //(TEMPLATE)
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
	enemycard_maindeck_total=ob_main.enemy_maindeck_size;
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		sc_enemy_deck_addcard(i,-1,-1,-1,-1,-1,-1,-1);
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=101 { //TUTORIAL (PROF. ASPEN)
	enemycard_maindeck_total=5;
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		if i=0 { sc_enemy_deck_addcard(i,016,1,-1,-1,-1,1,0); } //PIDGEY, LV 1, IN 1
		else if i=1 { sc_enemy_deck_addcard(i,019,1,-1,-1,-1,1,0); } //RATTATA, LV 1, IN 1
		else if i=2 { sc_enemy_deck_addcard(i,019,1,-1,-1,-1,1,0); } //RATTATA, LV 1, IN 1
		else if i=3 { sc_enemy_deck_addcard(i,010,1,-1,-1,-1,1,0); } //CATERPIE, LV 1, IN 1
		else if i=4 { sc_enemy_deck_addcard(i,011,1,ref_glyph_weakness,-1,-1,1,0); } //METAPOD, LV 1, IN 1, WEAKNESS
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=200 { //GYM 1: IAN (NORMAL/flying)
	enemycard_maindeck_total=ob_main.maindeck_size_max;
	//
	//enemy_type_chance[00]=100; //normal
	//enemy_type_chance[05]=75; //flying
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		if i=0 { sc_enemy_deck_addcard(i,162,3,ref_glyph_ruthless,-1,-1,1,0); } //FURRET, LV 3 (max+1), IN 1, RUTHLESS
		else if i=1 { sc_enemy_deck_addcard(i,017,2,ref_glyph_weakness,-1,-1,1,0); } //PIDGEOTTO, LV 2, IN 1, WEAKNESS
		else if i=2 { sc_enemy_deck_addcard(i,133,2,-1,-1,-1,2,0); } //EEVEE, LV 2, IN 2
		else if i=3 { sc_enemy_deck_addcard(i,020,1,-1,-1,-1,1,0); } //RATICATE, LV 1, IN 1
		else if i=4 { sc_enemy_deck_addcard(i,083,1,-1,-1,-1,1,0); } //FARFETCH'D, LV 1, IN 1
		else if i=5 { sc_enemy_deck_addcard(i,190,1,-1,-1,-1,1,0); } //AIPOM, LV 1, IN 1
		else if i=6 { sc_enemy_deck_addcard(i,052,1,-1,-1,-1,1,0); } //MEOWTH, LV 1, IN 1
		else if i=7 { sc_enemy_deck_addcard(i,021,1,-1,-1,-1,1,0); } //SPEAROW, LV 1, IN 1
		else if i=8 { sc_enemy_deck_addcard(i,163,1,-1,-1,-1,1,0); } //HOOTHOOT, LV 1, IN 1
		else if i=9 { sc_enemy_deck_addcard(i,216,1,-1,-1,-1,1,0); } //TEDDIURSA, LV 1, IN 1
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=201 { //GYM 2: CAMMIE (GRASS/ground/rock)
	enemycard_maindeck_total=ob_main.maindeck_size_max;
	//
	//enemy_type_chance[01]=100; //grass
	//enemy_type_chance[09]=75; //ground
	//enemy_type_chance[10]=75; //rock
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=202 { //GYM 3: BENNY (WATER/ice)
	enemycard_maindeck_total=ob_main.maindeck_size_max;
	//
	//enemy_type_chance[03]=100; //water
	//enemy_type_chance[13]=75; //ice
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=203 { //GYM 4: MADISON (FIRE/steel)
	enemycard_maindeck_total=ob_main.maindeck_size_max;
	//
	//enemy_type_chance[02]=100; //fire
	//enemy_type_chance[15]=75; //steel
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=204 { //GYM 5: ZOE (ELECTRIC)
	enemycard_maindeck_total=ob_main.maindeck_size_max;
	//
	//enemy_type_chance[04]=100; //electric
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=205 { //GYM 6: VINCENT (FIGHTING/dark)
	enemycard_maindeck_total=ob_main.maindeck_size_max;
	//
	//enemy_type_chance[06]=100; //fighting
	//enemy_type_chance[17]=75; //dark
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=206 { //GYM 7: PENNY (PSYCHIC/fairy/ghost)
	enemycard_maindeck_total=ob_main.maindeck_size_max;
	//
	//enemy_type_chance[07]=100; //psychic
	//enemy_type_chance[08]=75; //fairy
	//enemy_type_chance[16]=75; //ghost
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=207 { //GYM 8: LAKE (GRASS/FIRE/WATER)
	enemycard_maindeck_total=ob_main.maindeck_size_max;
	//
	//enemy_type_chance[01]=100; //grass
	//enemy_type_chance[02]=100; //fire
	//enemy_type_chance[03]=100; //water
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=208 { //ELITE 1: EMILY (FIRE/dark, psychic/ghost)
	enemycard_maindeck_total=ob_main.maindeck_size_max;
	//
	//enemy_type_chance[02]=100; //fire
	//enemy_type_chance[07]=50; //psychic
	//enemy_type_chance[16]=50; //ghost
	//enemy_type_chance[17]=75; //dark
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=209 { //ELITE 2: FINN (POISON/bug, ground/rock)
	enemycard_maindeck_total=ob_main.maindeck_size_max;
	//
	//enemy_type_chance[09]=50; //ground
	//enemy_type_chance[10]=50; //rock
	//enemy_type_chance[11]=75; //bug
	//enemy_type_chance[12]=100; //poison
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=210 { //ELITE 3: DION (FLYING/fighting, grass)
	enemycard_maindeck_total=ob_main.maindeck_size_max;
	//
	//enemy_type_chance[01]=50; //grass
	//enemy_type_chance[05]=100; //flying
	//enemy_type_chance[06]=75; //fighting
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=211 { //ELITE 4: APRIL (DRAGON/ice, steel, water)
	enemycard_maindeck_total=ob_main.maindeck_size_max;
	//
	//enemy_type_chance[03]=10; //water
	//enemy_type_chance[13]=75; //ice
	//enemy_type_chance[14]=100; //dragon
	//enemy_type_chance[15]=50; //steel
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=212 { //CHAMPION: DUNCAN (ALL)
	enemycard_maindeck_total=ob_main.maindeck_size_max;
	//
	//enemy_type_chance[00]=100; //normal
	//enemy_type_chance[01]=100; //grass
	//enemy_type_chance[02]=100; //fire
	//enemy_type_chance[03]=100; //water
	//enemy_type_chance[04]=100; //electric
	//enemy_type_chance[05]=100; //flying
	//enemy_type_chance[06]=100; //fighting
	//enemy_type_chance[07]=100; //psychic
	//enemy_type_chance[08]=100; //fairy
	//enemy_type_chance[09]=100; //ground
	//enemy_type_chance[10]=100; //rock
	//enemy_type_chance[11]=100; //bug
	//enemy_type_chance[12]=100; //poison
	//enemy_type_chance[13]=100; //ice
	//enemy_type_chance[14]=100; //dragon
	//enemy_type_chance[15]=100; //steel
	//enemy_type_chance[16]=100; //ghost
	//enemy_type_chance[17]=100; //dark
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}