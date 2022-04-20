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
//GYM/LEAGUE DECKS: 33% each level (min-med-max), 20-40% have glyphs (75% 1 glyph, 20% 2 glyphs, 5% 3 glyphs), 10% innate >1
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=101 { //TUTORIAL (PROF. ASPEN)
	enemycard_maindeck_total=5;
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		if i=0 { sc_enemy_deck_addcard(i,016,1,-1,-1,-1,1,0); } //PIDGEY, LV 1
		else if i=1 { sc_enemy_deck_addcard(i,019,1,-1,-1,-1,1,0); } //RATTATA, LV 1
		else if i=2 { sc_enemy_deck_addcard(i,019,1,-1,-1,-1,1,0); } //RATTATA, LV 1
		else if i=3 { sc_enemy_deck_addcard(i,010,1,-1,-1,-1,1,0); } //CATERPIE, LV 1
		else if i=4 { sc_enemy_deck_addcard(i,011,1,ref_glyph_weakness,-1,-1,1,0); } //METAPOD, LV 1
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
		if i=0 { sc_enemy_deck_addcard(i,162,3,ref_glyph_ruthless,-1,-1,1,0); } //FURRET, LV 3 (>MAX)
		else if i=1 { sc_enemy_deck_addcard(i,133,2,-1,-1,-1,2,0); } //EEVEE, LV 2 (IN 2)
		//
		else if i=2 { sc_enemy_deck_addcard(i,020,1,-1,-1,-1,1,0); } //RATICATE, LV 1
		else if i=3 { sc_enemy_deck_addcard(i,190,1,-1,-1,-1,1,0); } //AIPOM, LV 1
		else if i=4 { sc_enemy_deck_addcard(i,052,1,-1,-1,-1,1,0); } //MEOWTH, LV 1
		else if i=5 { sc_enemy_deck_addcard(i,216,1,-1,-1,-1,1,0); } //TEDDIURSA, LV 1
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		else if i=6 { sc_enemy_deck_addcard(i,017,2,ref_glyph_weakness,-1,-1,1,0); } //PIDGEOTTO, LV 2
		//
		else if i=7 { sc_enemy_deck_addcard(i,083,1,-1,-1,-1,1,0); } //FARFETCH'D, LV 1
		else if i=8 { sc_enemy_deck_addcard(i,021,1,-1,-1,-1,1,0); } //SPEAROW, LV 1
		else if i=9 { sc_enemy_deck_addcard(i,163,1,-1,-1,-1,1,0); } //HOOTHOOT, LV 1
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
		if i=0 { sc_enemy_deck_addcard(i,153,4,ref_glyph_lucky,ref_glyph_harvest,-1,1,0); } //BAYLEEF, LV 4 (>MAX)
		else if i=1 { sc_enemy_deck_addcard(i,002,3,ref_glyph_harvest,-1,-1,2,0); } //IVYSAUR, LV 3 (IN 2)
		else if i=2 { sc_enemy_deck_addcard(i,114,3,-1,-1,-1,1,0); } //TANGELA, LV 3
		//
		else if i=3 { sc_enemy_deck_addcard(i,188,2,-1,-1,-1,1,0); } //SKIPLOOM, LV 2
		//
		else if i=4 { sc_enemy_deck_addcard(i,187,1,-1,-1,-1,1,0); } //HOPPIP, LV 1
		else if i=5 { sc_enemy_deck_addcard(i,043,1,-1,-1,-1,1,0); } //ODDISH, LV 1
		else if i=6 { sc_enemy_deck_addcard(i,069,1,-1,-1,-1,1,0); } //BELLSPROUT, LV 1
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		else if i=7 { sc_enemy_deck_addcard(i,028,3,-1,-1,-1,1,0); } //SANDSLASH, LV 3
		//
		else if i=8 { sc_enemy_deck_addcard(i,104,2,-1,-1,-1,1,0); } //CUBONE, LV 2
		else if i=9 { sc_enemy_deck_addcard(i,111,2,-1,-1,-1,1,0); } //RHYHORN, LV 2
		//
		else if i=10 { sc_enemy_deck_addcard(i,231,1,-1,-1,-1,1,0); } //PHANPY, LV 1
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		else if i=11 { sc_enemy_deck_addcard(i,185,3,ref_glyph_bulwark,-1,-1,1,0); } //SUDOWOODO, LV 3
		//
		else if i=12 { sc_enemy_deck_addcard(i,095,2,ref_glyph_shield,-1,-1,1,0); } //ONIX, LV 2
		else if i=13 { sc_enemy_deck_addcard(i,246,2,-1,-1,-1,1,0); } //LARVITAR, LV 2
		//
		else if i=14 { sc_enemy_deck_addcard(i,074,1,-1,-1,-1,1,0); } //GEODUDE, LV 1
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
		if i=0 { sc_enemy_deck_addcard(i,055,5,ref_glyph_adaptability,ref_glyph_harvest,-1,1,0); } //GOLDUCK, LV 5 (>MAX)
		else if i=1 { sc_enemy_deck_addcard(i,087,4,-1,-1,-1,1,0); } //DEWGONG, LV 4
		else if i=2 { sc_enemy_deck_addcard(i,134,4,ref_glyph_lucky,-1,-1,2,0); } //VAPOREON, LV 4 (IN 2)
		else if i=3 { sc_enemy_deck_addcard(i,008,4,-1,-1,-1,1,0); } //WARTORTLE, LV 4
		else if i=4 { sc_enemy_deck_addcard(i,159,4,-1,-1,-1,1,0); } //CROCONAW, LV 4
		//
		else if i=5 { sc_enemy_deck_addcard(i,117,3,-1,-1,-1,1,0); } //SEADRA, LV 3
		else if i=6 { sc_enemy_deck_addcard(i,061,3,-1,-1,-1,1,0); } //POLIWHIRL, LV 3
		else if i=7 { sc_enemy_deck_addcard(i,120,3,ref_glyph_harvest,-1,-1,1,0); } //STARYU, LV 3
		else if i=8 { sc_enemy_deck_addcard(i,072,3,ref_glyph_weakness,-1,-1,1,0); } //TENTACOOL, LV 3
		//
		else if i=9 { sc_enemy_deck_addcard(i,079,2,-1,-1,-1,1,0); } //SLOWPOKE, LV 2
		else if i=10 { sc_enemy_deck_addcard(i,090,2,-1,-1,-1,1,0); } //SHELLDER, LV 2
		else if i=11 { sc_enemy_deck_addcard(i,118,2,-1,-1,-1,1,0); } //GOLDEEN, LV 2
		else if i=12 { sc_enemy_deck_addcard(i,098,2,-1,-1,-1,1,0); } //KRABBY, LV 2
		else if i=13 { sc_enemy_deck_addcard(i,222,2,-1,-1,-1,1,0); } //CORSOLA, LV 2
		else if i=14 { sc_enemy_deck_addcard(i,170,2,-1,-1,-1,1,0); } //CHINCHOU, LV 2
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		else if i=15 { sc_enemy_deck_addcard(i,225,4,-1,-1,-1,2,0); } //DELIBIRD, LV 4 (IN 2)
		else if i=16 { sc_enemy_deck_addcard(i,124,4,-1,-1,-1,1,0); } //JYNX, LV 4
		//
		else if i=17 { sc_enemy_deck_addcard(i,215,3,ref_glyph_counter,-1,-1,1,0); } //SNEASEL, LV 3
		else if i=18 { sc_enemy_deck_addcard(i,220,3,-1,-1,-1,1,0); } //SWINUB, LV 3
		//
		else if i=19 { sc_enemy_deck_addcard(i,238,2,-1,-1,-1,1,0); } //SMOOCHUM, LV 2
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
		if i=0 { sc_enemy_deck_addcard(i,078,6,ref_glyph_courage,-1,-1,1,0); } //RAPIDASH, LV 6 (>MAX)
		else if i=1 { sc_enemy_deck_addcard(i,136,5,ref_glyph_berserk,-1,-1,2,0); } //FLAREON, LV 5 (IN 2)
		else if i=2 { sc_enemy_deck_addcard(i,038,5,-1,-1,-1,1,0); } //NINETALES, LV 5
		else if i=3 { sc_enemy_deck_addcard(i,219,5,-1,-1,-1,1,0); } //MAGCARGO, LV 5
		else if i=4 { sc_enemy_deck_addcard(i,005,5,-1,-1,-1,1,0); } //CHARMELEON, LV 5
		else if i=5 { sc_enemy_deck_addcard(i,156,5,ref_glyph_ruthless,-1,-1,1,0); } //QUILAVA, LV 5
		//
		else if i=6 { sc_enemy_deck_addcard(i,126,4,ref_glyph_harvest,ref_glyph_memento,-1,1,0); } //MAGMAR, LV 4
		else if i=7 { sc_enemy_deck_addcard(i,078,4,ref_glyph_weakness,-1,-1,1,0); } //RAPIDASH, LV 4
		else if i=8 { sc_enemy_deck_addcard(i,077,4,-1,-1,-1,1,0); } //PONYTA, LV 4
		else if i=9 { sc_enemy_deck_addcard(i,058,4,-1,-1,-1,1,0); } //GROWLITHE, LV 4
		else if i=10 { sc_enemy_deck_addcard(i,037,4,-1,-1,-1,2,0); } //VULPIX, LV 4 (IN 2)
		else if i=11 { sc_enemy_deck_addcard(i,228,4,-1,-1,-1,1,0); } //HOUNDOUR, LV 4
		else if i=12 { sc_enemy_deck_addcard(i,218,4,-1,-1,-1,1,0); } //SLUGMA, LV 4
		//
		else if i=13 { sc_enemy_deck_addcard(i,077,3,-1,-1,-1,1,0); } //PONYTA, LV 3
		else if i=14 { sc_enemy_deck_addcard(i,058,3,-1,-1,-1,1,0); } //GROWLITHE, LV 3
		else if i=15 { sc_enemy_deck_addcard(i,037,3,-1,-1,-1,1,0); } //VULPIX, LV 3
		else if i=16 { sc_enemy_deck_addcard(i,228,3,-1,-1,-1,1,0); } //HOUNDOUR, LV 3
		else if i=17 { sc_enemy_deck_addcard(i,218,3,-1,-1,-1,1,0); } //SLUGMA, LV 3
		else if i=18 { sc_enemy_deck_addcard(i,240,3,ref_glyph_lucky,-1,-1,1,0); } //MAGBY, LV 3
		else if i=19 { sc_enemy_deck_addcard(i,240,3,-1,-1,-1,1,0); } //MAGBY, LV 3
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		else if i=20 { sc_enemy_deck_addcard(i,212,5,-1,-1,-1,1,0); } //SCIZOR, LV 5
		else if i=21 { sc_enemy_deck_addcard(i,227,5,-1,-1,-1,1,0); } //SKARMORY, LV 5
		//
		else if i=22 { sc_enemy_deck_addcard(i,227,4,-1,-1,-1,1,0); } //SKARMORY, LV 4
		else if i=23 { sc_enemy_deck_addcard(i,205,4,-1,-1,-1,1,0); } //FORRETRESS, LV 4
		//
		else if i=24 { sc_enemy_deck_addcard(i,081,3,ref_glyph_memento,-1,-1,1,0); } //MAGNEMITE, LV 3
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=204 { //GYM 5: ZOE (ELECTRIC)
	enemycard_maindeck_total=ob_main.maindeck_size_max;
	//
	//enemy_type_chance[04]=100; //electric
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		if i=0 { sc_enemy_deck_addcard(i,181,7,ref_glyph_adaptability,-1,-1,1,0); } //AMPHAROS, LV 7 (>MAX)
		else if i=1 { sc_enemy_deck_addcard(i,025,7,-1,-1,-1,1,0); } //PIKACHU, LV 7 (>MAX)
		else if i=2 { sc_enemy_deck_addcard(i,135,6,ref_glyph_courage,-1,-1,2,0); } //JOLTEON, LV 6 (IN 2)
		else if i=3 { sc_enemy_deck_addcard(i,125,6,ref_glyph_harvest,-1,-1,1,0); } //ELECTABUZZ, LV 6
		else if i=4 { sc_enemy_deck_addcard(i,026,6,-1,-1,-1,1,0); } //RAICHU, LV 6
		else if i=5 { sc_enemy_deck_addcard(i,101,6,-1,-1,-1,1,0); } //ELECTRODE, LV 6
		else if i=6 { sc_enemy_deck_addcard(i,082,6,ref_glyph_weakness,-1,-1,1,0); } //MAGNETON, LV 6
		else if i=7 { sc_enemy_deck_addcard(i,171,6,ref_glyph_memento,-1,-1,1,0); } //LANTURN, LV 6
		else if i=8 { sc_enemy_deck_addcard(i,180,6,-1,-1,-1,1,0); } //FLAAFFY, LV 6
		else if i=9 { sc_enemy_deck_addcard(i,100,6,-1,-1,-1,1,0); } //VOLTORB, LV 6
		//
		else if i=10 { sc_enemy_deck_addcard(i,180,5,ref_glyph_harvest,-1,-1,1,0); } //FLAAFFY, LV 5
		else if i=11 { sc_enemy_deck_addcard(i,100,5,-1,-1,-1,1,0); } //VOLTORB, LV 5
		else if i=12 { sc_enemy_deck_addcard(i,239,5,-1,-1,-1,1,0); } //ELEKID, LV 5
		else if i=13 { sc_enemy_deck_addcard(i,025,5,-1,-1,-1,1,0); } //PIKACHU, LV 5
		else if i=14 { sc_enemy_deck_addcard(i,170,5,-1,-1,-1,1,0); } //CHINCHOU, LV 5
		else if i=15 { sc_enemy_deck_addcard(i,179,5,ref_glyph_lucky,ref_glyph_medic,-1,2,0); } //MAREEP, LV 5 (IN 2)
		else if i=16 { sc_enemy_deck_addcard(i,179,5,-1,-1,-1,1,0); } //MAREEP, LV 5
		else if i=17 { sc_enemy_deck_addcard(i,172,5,-1,-1,-1,1,0); } //PICHU, LV 5
		else if i=18 { sc_enemy_deck_addcard(i,081,5,ref_glyph_counter,-1,-1,1,0); } //MAGNEMITE, LV 5
		else if i=19 { sc_enemy_deck_addcard(i,081,5,-1,-1,-1,2,0); } //MAGNEMITE, LV 5 (IN 2)
		//
		else if i=20 { sc_enemy_deck_addcard(i,100,4,-1,-1,-1,1,0); } //VOLTORB, LV 4
		else if i=21 { sc_enemy_deck_addcard(i,100,4,-1,-1,-1,1,0); } //VOLTORB, LV 4
		else if i=22 { sc_enemy_deck_addcard(i,239,4,-1,-1,-1,1,0); } //ELEKID, LV 4
		else if i=23 { sc_enemy_deck_addcard(i,025,4,-1,-1,-1,1,0); } //PIKACHU, LV 4
		else if i=24 { sc_enemy_deck_addcard(i,170,4,-1,-1,-1,1,0); } //CHINCHOU, LV 4
		else if i=25 { sc_enemy_deck_addcard(i,179,4,-1,-1,-1,1,0); } //MAREEP, LV 4
		else if i=26 { sc_enemy_deck_addcard(i,172,4,-1,-1,-1,1,0); } //PICHU, LV 4
		else if i=27 { sc_enemy_deck_addcard(i,081,4,-1,-1,-1,1,0); } //MAGNEMITE, LV 4
		else if i=28 { sc_enemy_deck_addcard(i,081,4,-1,-1,-1,1,0); } //MAGNEMITE, LV 4
		else if i=29 { sc_enemy_deck_addcard(i,081,4,-1,-1,-1,1,0); } //MAGNEMITE, LV 4
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
		if i=0 { sc_enemy_deck_addcard(i,068,8,ref_glyph_berserk,-1,-1,1,0); } //MACHAMP, LV 8 (>MAX)
		else if i=1 { sc_enemy_deck_addcard(i,068,7,-1,-1,-1,1,0); } //MACHAMP, LV 7
		else if i=2 { sc_enemy_deck_addcard(i,062,7,-1,-1,-1,1,0); } //POLIWRATH, LV 7
		else if i=3 { sc_enemy_deck_addcard(i,107,7,-1,-1,-1,2,0); } //HITMONCHAN, LV 7 (IN 2)
		else if i=4 { sc_enemy_deck_addcard(i,106,7,-1,-1,-1,1,0); } //HITMONLEE, LV 7
		else if i=5 { sc_enemy_deck_addcard(i,214,7,ref_glyph_harvest,ref_glyph_adaptability,-1,1,0); } //HERACROSS, LV 7
		else if i=6 { sc_enemy_deck_addcard(i,237,7,-1,-1,-1,1,0); } //HITMONTOP, LV 7
		else if i=7 { sc_enemy_deck_addcard(i,067,7,-1,-1,-1,1,0); } //MACHOKE, LV 7
		else if i=8 { sc_enemy_deck_addcard(i,057,7,-1,-1,-1,1,0); } //PRIMEAPE, LV 7
		else if i=9 { sc_enemy_deck_addcard(i,066,7,-1,-1,-1,1,0); } //MACHOP, LV 7
		//
		else if i=10 { sc_enemy_deck_addcard(i,107,6,-1,-1,-1,1,0); } //HITMONCHAN, LV 6
		else if i=11 { sc_enemy_deck_addcard(i,106,6,-1,-1,-1,1,0); } //HITMONLEE, LV 6
		else if i=12 { sc_enemy_deck_addcard(i,214,6,-1,-1,-1,1,0); } //HERACROSS, LV 6
		else if i=13 { sc_enemy_deck_addcard(i,237,6,-1,-1,-1,2,0); } //HITMONTOP, LV 6 (IN 2)
		else if i=14 { sc_enemy_deck_addcard(i,067,6,-1,-1,-1,1,0); } //MACHOKE, LV 6
		else if i=15 { sc_enemy_deck_addcard(i,057,6,ref_glyph_courage,-1,-1,1,0); } //PRIMEAPE, LV 6
		else if i=16 { sc_enemy_deck_addcard(i,066,6,-1,-1,-1,1,0); } //MACHOP, LV 6
		else if i=17 { sc_enemy_deck_addcard(i,056,6,-1,-1,-1,1,0); } //MANKEY, LV 6
		else if i=18 { sc_enemy_deck_addcard(i,236,6,-1,-1,-1,1,0); } //TYROGUE, LV 6
		//
		else if i=19 { sc_enemy_deck_addcard(i,107,5,ref_glyph_counter,-1,-1,1,0); } //HITMONCHAN, LV 5
		else if i=20 { sc_enemy_deck_addcard(i,106,5,ref_glyph_counter,-1,-1,1,0); } //HITMONLEE, LV 5
		else if i=21 { sc_enemy_deck_addcard(i,214,5,-1,-1,-1,1,0); } //HERACROSS, LV 5
		else if i=22 { sc_enemy_deck_addcard(i,237,5,-1,-1,-1,1,0); } //HITMONTOP, LV 5
		else if i=23 { sc_enemy_deck_addcard(i,067,5,-1,-1,-1,1,0); } //MACHOKE, LV 5
		else if i=24 { sc_enemy_deck_addcard(i,057,5,-1,-1,-1,1,0); } //PRIMEAPE, LV 5
		else if i=25 { sc_enemy_deck_addcard(i,056,5,ref_glyph_piercing,-1,-1,1,0); } //MANKEY, LV 5
		else if i=26 { sc_enemy_deck_addcard(i,236,5,ref_glyph_courage,-1,-1,1,0); } //TYROGUE, LV 5
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		else if i=27 { sc_enemy_deck_addcard(i,198,8,ref_glyph_memento,-1,-1,1,0); } //MURKROW, LV 8 (>MAX)
		else if i=28 { sc_enemy_deck_addcard(i,197,7,ref_glyph_ruthless,-1,-1,2,0); } //UMBREON, LV 7 (IN 2)
		//
		else if i=29 { sc_enemy_deck_addcard(i,229,6,-1,-1,-1,1,0); } //HOUNDOOM, LV 6
		else if i=30 { sc_enemy_deck_addcard(i,228,6,-1,-1,-1,1,0); } //HOUNDOUR, LV 6
		//
		else if i=31 { sc_enemy_deck_addcard(i,215,5,-1,-1,-1,1,0); } //SNEASEL, LV 5
		else if i=32 { sc_enemy_deck_addcard(i,198,5,ref_glyph_memento,ref_glyph_harvest,-1,1,0); } //MURKROW, LV 5
		else if i=33 { sc_enemy_deck_addcard(i,198,5,-1,-1,-1,1,0); } //MURKROW, LV 5
		else if i=34 { sc_enemy_deck_addcard(i,228,5,-1,-1,-1,1,0); } //HOUNDOUR, LV 5
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
		if i=0 { sc_enemy_deck_addcard(i,065,9,-1,-1,-1,1,0); } //ALAKAZAM, LV 9 (>MAX)
		else if i=1 { sc_enemy_deck_addcard(i,196,8,ref_glyph_adaptability,-1,-1,2,0); } //ESPEON, LV 8 (IN 2)
		else if i=2 { sc_enemy_deck_addcard(i,097,8,-1,-1,-1,1,0); } //HYPNO, LV 8
		else if i=3 { sc_enemy_deck_addcard(i,122,8,-1,-1,-1,1,0); } //MR. MIME, LV 8
		else if i=4 { sc_enemy_deck_addcard(i,178,8,ref_glyph_shield,-1,-1,1,0); } //XATU, LV 8
		else if i=5 { sc_enemy_deck_addcard(i,202,8,ref_glyph_memento,ref_glyph_harvest,-1,1,0); } //WOBBUFFET, LV 8
		else if i=6 { sc_enemy_deck_addcard(i,199,8,-1,-1,-1,1,0); } //SLOWKING, LV 8
		//
		else if i=7 { sc_enemy_deck_addcard(i,124,7,-1,-1,-1,1,0); } //JYNX, LV 7
		else if i=8 { sc_enemy_deck_addcard(i,064,7,ref_glyph_weakness,-1,-1,1,0); } //KADABRA, LV 7
		else if i=9 { sc_enemy_deck_addcard(i,203,7,-1,-1,-1,1,0); } //GIRAFARIG, LV 7
		else if i=10 { sc_enemy_deck_addcard(i,103,7,ref_glyph_bulwark,-1,-1,1,0); } //EXEGGUTOR, LV 7
		else if i=11 { sc_enemy_deck_addcard(i,121,7,ref_glyph_counter,-1,-1,1,0); } //STARMIE, LV 7
		else if i=12 { sc_enemy_deck_addcard(i,096,7,-1,-1,-1,1,0); } //DROWZEE, LV 7
		else if i=13 { sc_enemy_deck_addcard(i,177,7,-1,-1,-1,2,0); } //NATU, LV 7 (IN 2)
		//
		else if i=14 { sc_enemy_deck_addcard(i,080,6,-1,-1,-1,1,0); } //SLOWBRO, LV 6
		else if i=15 { sc_enemy_deck_addcard(i,079,6,-1,-1,-1,1,0); } //SLOWPOKE, LV 6
		else if i=16 { sc_enemy_deck_addcard(i,102,6,-1,-1,-1,1,0); } //EXEGGCUTE, LV 6
		else if i=17 { sc_enemy_deck_addcard(i,063,6,ref_glyph_piercing,-1,-1,1,0); } //ABRA, LV 6
		else if i=18 { sc_enemy_deck_addcard(i,177,6,-1,-1,-1,1,0); } //NATU, LV 6
		else if i=19 { sc_enemy_deck_addcard(i,201,6,ref_glyph_lucky,-1,-1,1,600); } //UNOWN (P), LV 6
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		else if i=20 { sc_enemy_deck_addcard(i,036,8,ref_glyph_berserk,ref_glyph_medic,-1,1,0); } //CLEFABLE, LV 8
		else if i=21 { sc_enemy_deck_addcard(i,176,8,-1,-1,-1,1,0); } //TOGETIC, LV 8
		else if i=22 { sc_enemy_deck_addcard(i,210,8,ref_glyph_ruthless,-1,-1,1,0); } //GRANBULL, LV 8
		else if i=23 { sc_enemy_deck_addcard(i,040,8,-1,-1,-1,1,0); } //WIGGLYTUFF, LV 8
		//
		else if i=24 { sc_enemy_deck_addcard(i,184,7,-1,-1,-1,2,0); } //AZUMARILL, LV 7 (IN 2)
		else if i=25 { sc_enemy_deck_addcard(i,209,7,-1,-1,-1,1,0); } //SNUBBULL, LV 7
		else if i=26 { sc_enemy_deck_addcard(i,035,7,-1,-1,-1,1,0); } //CLEFAIRY, LV 7
		else if i=27 { sc_enemy_deck_addcard(i,039,7,-1,-1,-1,1,0); } //JIGGLYPUFF, LV 7
		//
		else if i=28 { sc_enemy_deck_addcard(i,183,6,-1,-1,-1,1,0); } //MARILL, LV 6
		else if i=29 { sc_enemy_deck_addcard(i,175,6,-1,-1,-1,1,0); } //TOGEPI, LV 6
		else if i=30 { sc_enemy_deck_addcard(i,173,6,-1,-1,-1,1,0); } //CLEFFA, LV 6
		else if i=31 { sc_enemy_deck_addcard(i,174,6,-1,-1,-1,1,0); } //IGGLYBUFF, LV 6
		//————————————————————————————————————————————————————————————————————————————————————————————————————
		else if i=32 { sc_enemy_deck_addcard(i,094,9,ref_glyph_curse,-1,-1,1,0); } //GENGAR, LV 9 (>MAX)
		else if i=33 { sc_enemy_deck_addcard(i,093,8,-1,-1,-1,1,0); } //HAUNTER, LV 8
		//
		else if i=34 { sc_enemy_deck_addcard(i,093,7,-1,-1,-1,1,0); } //HAUNTER, LV 7
		else if i=35 { sc_enemy_deck_addcard(i,200,7,ref_glyph_vampire,-1,-1,2,0); } //MISDREAVUS, LV 7 (IN 2)
		else if i=36 { sc_enemy_deck_addcard(i,092,7,-1,-1,-1,1,0); } //GASTLY, LV 7
		//
		else if i=37 { sc_enemy_deck_addcard(i,200,6,-1,-1,-1,1,0); } //MISDREAVUS, LV 6
		else if i=38 { sc_enemy_deck_addcard(i,092,6,-1,-1,-1,1,0); } //GASTLY, LV 6
		else if i=39 { sc_enemy_deck_addcard(i,092,6,-1,-1,-1,1,0); } //GASTLY, LV 6
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
		if i=0 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=1 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=2 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=3 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=4 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=5 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=6 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=7 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=8 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=9 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=10 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=11 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=12 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=13 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=14 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=15 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=16 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=17 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=18 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=19 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=20 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=21 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=22 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=23 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=24 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=25 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=26 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=27 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=28 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=29 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=30 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=31 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=32 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=33 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=34 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=35 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=36 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=37 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=38 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=39 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=40 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=41 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=42 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=43 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=44 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
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
		if i=0 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=1 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=2 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=3 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=4 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=5 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=6 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=7 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=8 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=9 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=10 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=11 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=12 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=13 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=14 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=15 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=16 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=17 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=18 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=19 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=20 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=21 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=22 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=23 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=24 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=25 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=26 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=27 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=28 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=29 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=30 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=31 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=32 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=33 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=34 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=35 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=36 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=37 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=38 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=39 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=40 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=41 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=42 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=43 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=44 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=45 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=46 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=47 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=48 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=49 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
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
		if i=0 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=1 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=2 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=3 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=4 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=5 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=6 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=7 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=8 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=9 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=10 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=11 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=12 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=13 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=14 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=15 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=16 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=17 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=18 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=19 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=20 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=21 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=22 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=23 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=24 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=25 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=26 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=27 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=28 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=29 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=30 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=31 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=32 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=33 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=34 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=35 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=36 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=37 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=38 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=39 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=40 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=41 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=42 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=43 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=44 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=45 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=46 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=47 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=48 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=49 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
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
		if i=0 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=1 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=2 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=3 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=4 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=5 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=6 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=7 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=8 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=9 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=10 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=11 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=12 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=13 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=14 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=15 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=16 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=17 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=18 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=19 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=20 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=21 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=22 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=23 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=24 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=25 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=26 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=27 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=28 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=29 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=30 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=31 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=32 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=33 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=34 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=35 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=36 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=37 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=38 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=39 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=40 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=41 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=42 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=43 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=44 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=45 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=46 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=47 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=48 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=49 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
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
		if i=0 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=1 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=2 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=3 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=4 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=5 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=6 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=7 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=8 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=9 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=10 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=11 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=12 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=13 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=14 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=15 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=16 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=17 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=18 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=19 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=20 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=21 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=22 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=23 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=24 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=25 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=26 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=27 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=28 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=29 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=30 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=31 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=32 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=33 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=34 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=35 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=36 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=37 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=38 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=39 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=40 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=41 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=42 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=43 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=44 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=45 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=46 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=47 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=48 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=49 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
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
		if i=0 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=1 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=2 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=3 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=4 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=5 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=6 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=7 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=8 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=9 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=10 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=11 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=12 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=13 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=14 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=15 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=16 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=17 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=18 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=19 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=20 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=21 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=22 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=23 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=24 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=25 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=26 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=27 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=28 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=29 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=30 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=31 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=32 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=33 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=34 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=35 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=36 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=37 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=38 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=39 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=40 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=41 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=42 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=43 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=44 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=45 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=46 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=47 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=48 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
		else if i=49 { sc_enemy_deck_addcard(i,000,1,-1,-1,-1,1,0); } //, LV
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}