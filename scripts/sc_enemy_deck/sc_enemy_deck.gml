function sc_enemy_deck(argument0) {
/// @param trainer_kind
//————————————————————————————————————————————————————————————————————————————————————————————————————
enemycard_maindeck_total=ob_main.enemy_maindeck_size;
//
for (var i=0; i<=17; i++;) {
	enemy_type_chance[i]=0; //0%
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if argument0<=100 {
	for (var i=0; i<=17; i++;) {
		enemy_type_chance[i]=1; //1% minimum
	}
	//
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
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		sc_enemy_deck_addcard(i,-1,-1,-2,-2,-2,-1,-1);
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=101 { //TUTORIAL (PROF. ASPEN)
	enemycard_maindeck_total=5;
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		//all use the same berries, to avoid berry deck shuffle issues
		if i<1 { sc_enemy_deck_addcard(i,161,1,-1,-1,-1,1,0); } //SENTRET, LV 1 (IN 1)
		else if i<2 { sc_enemy_deck_addcard(i,016,1,-1,-1,-1,1,0); } //PIDGEY, LV 1 (IN 1)
		else if i<3 { sc_enemy_deck_addcard(i,069,1,-1,-1,-1,1,0); } //BELLSPROUT, LV 1 (IN 1)
		else if i<4 { sc_enemy_deck_addcard(i,172,1,ref_glyph_debilitate,-1,-1,1,0); } //PICHU, LV 1 (IN 1)
		else if i<5 { sc_enemy_deck_addcard(i,019,1,-1,-1,-1,1,0); } //RATTATA, LV 1 (IN 1)
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
//GYM & LEAGUE TYPE CHANCE
//main type: 100% (if very few pokemon, make all others even lower)
//secondary types: 50% (75% if very few pokemon)
//tertiary types: 25% (50% if very few pokemon)
//————————————————————————————————————————————————————————————————————————————————————————————————————
//GYMS AND LEAGUE LEVEL DISTRIBUTION
//high level: 40% (round up, ~1/4 over-level, +1 over-level in league, +2 over-level champion)
//mid level: 40% (round down)
//low level: 20% (rest)
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=200 { //GYM 1: IAN (NORMAL/flying)
	enemy_type_chance[00]=100; //normal
	enemy_type_chance[05]=50; //flying
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		if i<1 { sc_enemy_deck_addcard(i,162,3,ref_glyph_lucky,-2,-2,1,-1); } //FURRET, LV 3 (>MAX) (IN 1)
		else if i<4 { sc_enemy_deck_addcard(i,-1,2,-2,-2,-2,-1,-1); } //(3) LV 2
		else if i<10 { sc_enemy_deck_addcard(i,-1,1,-2,-2,-2,-1,-1); } //(6) LV 1
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=201 { //GYM 2: CAMMIE (GRASS/ground/rock)
	enemy_type_chance[01]=100; //grass
	enemy_type_chance[09]=50; //ground
	enemy_type_chance[10]=50; //rock
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		if i<1 { sc_enemy_deck_addcard(i,192,4,ref_glyph_bulwark,-2,-2,-1,-1); } //SUNFLORA, LV 4 (>MAX)
		else if i<6 { sc_enemy_deck_addcard(i,-1,3,-2,-2,-2,-1,-1); } //(5) LV 3
		else if i<11 { sc_enemy_deck_addcard(i,-1,2,-2,-2,-2,-1,-1); } //(5) LV 2
		else if i<14 { sc_enemy_deck_addcard(i,-1,1,-2,-2,-2,-1,-1); } //(3) LV 1
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=202 { //GYM 3: WALKER (WATER/ice)
	enemy_type_chance[03]=100; //water
	enemy_type_chance[13]=75; //ice
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		if i<1 { sc_enemy_deck_addcard(i,055,5,ref_glyph_shield,-2,-2,-1,-1); } //GOLDUCK, LV 5 (>MAX)
		else if i<2 { sc_enemy_deck_addcard(i,-1,5,-2,-2,-2,-1,-1); } //(1) LV 5 (>MAX)
		else if i<8 { sc_enemy_deck_addcard(i,-1,4,-2,-2,-2,-1,-1); } //(6) LV 4
		else if i<15 { sc_enemy_deck_addcard(i,-1,3,-2,-2,-2,-1,-1); } //(7) LV 3
		else if i<18 { sc_enemy_deck_addcard(i,-1,2,-2,-2,-2,-1,-1); } //(3) LV 2
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=203 { //GYM 4: MADISON (FIRE/steel)
	enemy_type_chance[02]=100; //fire
	enemy_type_chance[15]=75; //steel
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		if i<1 { sc_enemy_deck_addcard(i,038,6,ref_glyph_courage,-2,-2,-1,-1); } //NINETALES, LV 6 (>MAX)
		else if i<2 { sc_enemy_deck_addcard(i,-1,6,-2,-2,-2,-1,-1); } //(1) LV 6 (>MAX)
		else if i<9 { sc_enemy_deck_addcard(i,-1,5,-2,-2,-2,-1,-1); } //(7) LV 5
		else if i<17 { sc_enemy_deck_addcard(i,-1,4,-2,-2,-2,-1,-1); } //(8) LV 4
		else if i<22 { sc_enemy_deck_addcard(i,-1,3,-2,-2,-2,-1,-1); } //(5) LV 3
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=204 { //GYM 5: ZOE (ELECTRIC)
	enemy_type_chance[04]=100; //electric
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		if i<1 { sc_enemy_deck_addcard(i,135,7,ref_glyph_ruthless,-2,-2,-1,-1); } //JOLTEON, LV 7 (>MAX)
		else if i<3 { sc_enemy_deck_addcard(i,-1,7,-2,-2,-2,-1,-1); } //(2) LV 7 (>MAX)
		else if i<11 { sc_enemy_deck_addcard(i,-1,6,-2,-2,-2,-1,-1); } //(8) LV 6
		else if i<21 { sc_enemy_deck_addcard(i,-1,5,-2,-2,-2,-1,-1); } //(10) LV 5
		else if i<26 { sc_enemy_deck_addcard(i,-1,4,-2,-2,-2,-1,-1); } //(5) LV 4
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=205 { //GYM 6: VINCENT (FIGHTING/dark)
	enemy_type_chance[06]=100; //fighting
	enemy_type_chance[17]=75; //dark
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		if i<1 { sc_enemy_deck_addcard(i,107,8,ref_glyph_counter,-2,-2,-1,-1); } //HITMONCHAN, LV 8 (>MAX)
		else if i<3 { sc_enemy_deck_addcard(i,-1,8,-2,-2,-2,-1,-1); } //(2) LV 8 (>MAX)
		else if i<12 { sc_enemy_deck_addcard(i,-1,7,-2,-2,-2,-1,-1); } //(9) LV 7
		else if i<24 { sc_enemy_deck_addcard(i,-1,6,-2,-2,-2,-1,-1); } //(12) LV 6
		else if i<30 { sc_enemy_deck_addcard(i,-1,5,-2,-2,-2,-1,-1); } //(6) LV 5
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=206 { //GYM 7: PENNY (PSYCHIC/fairy/ghost)
	enemy_type_chance[07]=100; //psychic
	enemy_type_chance[08]=50; //fairy
	enemy_type_chance[16]=75; //ghost
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		if i<1 { sc_enemy_deck_addcard(i,196,9,ref_glyph_curse,-2,-2,-1,-1); } //ESPEON, LV 9 (>MAX)
		else if i<4 { sc_enemy_deck_addcard(i,-1,9,-2,-2,-2,-1,-1); } //(3) LV 9 (>MAX)
		else if i<14 { sc_enemy_deck_addcard(i,-1,8,-2,-2,-2,-1,-1); } //(10) LV 8
		else if i<27 { sc_enemy_deck_addcard(i,-1,7,-2,-2,-2,-1,-1); } //(13) LV 7
		else if i<34 { sc_enemy_deck_addcard(i,-1,6,-2,-2,-2,-1,-1); } //(7) LV 6
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=207 { //GYM 8: LAKE (GRASS/FIRE/WATER)
	enemy_type_chance[01]=100; //grass
	enemy_type_chance[02]=100; //fire
	enemy_type_chance[03]=100; //water
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		if i<1 { sc_enemy_deck_addcard(i,071,10,ref_glyph_adaptability,-2,-2,-1,-1); } //VICTREEBEL, LV 10 (>MAX)
		else if i<2 { sc_enemy_deck_addcard(i,126,10,ref_glyph_adaptability,-2,-2,-1,-1); } //MAGMAR, LV 10 (>MAX)
		else if i<3 { sc_enemy_deck_addcard(i,099,10,ref_glyph_adaptability,-2,-2,-1,-1); } //KINGLER, LV 10 (>MAX)
		else if i<4 { sc_enemy_deck_addcard(i,-1,10,-2,-2,-2,-1,-1); } //(1) LV 10 (>MAX)
		else if i<16 { sc_enemy_deck_addcard(i,-1,9,-2,-2,-2,-1,-1); } //(12) LV 9
		else if i<31 { sc_enemy_deck_addcard(i,-1,8,-2,-2,-2,-1,-1); } //(15) LV 8
		else if i<38 { sc_enemy_deck_addcard(i,-1,7,-2,-2,-2,-1,-1); } //(7) LV 7
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=208 { //ELITE 1: EMILY (FIRE/dark, psychic/ghost)
	enemy_type_chance[02]=100; //fire
	enemy_type_chance[07]=25; //psychic
	enemy_type_chance[16]=50; //ghost
	enemy_type_chance[17]=75; //dark
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		if i<1 { sc_enemy_deck_addcard(i,006,10,ref_glyph_vampire,-2,-2,innate_max,-1); } //CHARIZARD, LV 10 (IN MAX)
		else if i<5 { sc_enemy_deck_addcard(i,-1,10,-2,-2,-2,innate_max,-1); } //(4) LV 10 (IN MAX)
		else if i<16 { sc_enemy_deck_addcard(i,-1,10,-2,-2,-2,-1,-1); } //(11) LV 10
		else if i<32 { sc_enemy_deck_addcard(i,-1,9,-2,-2,-2,-1,-1); } //(16) LV 9
		else if i<40 { sc_enemy_deck_addcard(i,-1,8,-2,-2,-2,-1,-1); } //(8) LV 8
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=209 { //ELITE 2: FINN (POISON/bug, ground/rock)
	enemy_type_chance[09]=25; //ground
	enemy_type_chance[10]=25; //rock
	enemy_type_chance[11]=50; //bug
	enemy_type_chance[12]=100; //poison
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		if i<1 { sc_enemy_deck_addcard(i,024,10,ref_glyph_debilitate,-2,-2,innate_max,-1); } //ARBOK, LV 10 (IN MAX)
		else if i<5 { sc_enemy_deck_addcard(i,-1,10,-2,-2,-2,innate_max,-1); } //(4) LV 10 (IN MAX)
		else if i<16 { sc_enemy_deck_addcard(i,-1,10,-2,-2,-2,-1,-1); } //(11) LV 10
		else if i<32 { sc_enemy_deck_addcard(i,-1,9,-2,-2,-2,-1,-1); } //(16) LV 9
		else if i<40 { sc_enemy_deck_addcard(i,-1,8,-2,-2,-2,-1,-1); } //(8) LV 8
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=210 { //ELITE 3: DION (FLYING/fighting, grass)
	enemy_type_chance[01]=25; //grass
	enemy_type_chance[05]=100; //flying
	enemy_type_chance[06]=50; //fighting
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		if i<1 { sc_enemy_deck_addcard(i,227,10,ref_glyph_piercing,-2,-2,innate_max,-1); } //SKARMORY, LV 10 (IN MAX)
		else if i<5 { sc_enemy_deck_addcard(i,-1,10,-2,-2,-2,innate_max,-1); } //(4) LV 10 (IN MAX)
		else if i<16 { sc_enemy_deck_addcard(i,-1,10,-2,-2,-2,-1,-1); } //(11) LV 10
		else if i<32 { sc_enemy_deck_addcard(i,-1,9,-2,-2,-2,-1,-1); } //(16) LV 9
		else if i<40 { sc_enemy_deck_addcard(i,-1,8,-2,-2,-2,-1,-1); } //(8) LV 8
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=211 { //ELITE 4: APRIL (DRAGON/ice, steel, water)
	enemy_type_chance[03]=5; //water
	enemy_type_chance[13]=50; //ice
	enemy_type_chance[14]=100; //dragon
	enemy_type_chance[15]=25; //steel
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		if i<1 { sc_enemy_deck_addcard(i,149,10,ref_glyph_berserk,-2,-2,innate_max,-1); } //DRAGONITE, LV 10 (IN MAX)
		else if i<5 { sc_enemy_deck_addcard(i,-1,10,-2,-2,-2,innate_max,-1); } //(4) LV 10 (IN MAX)
		else if i<16 { sc_enemy_deck_addcard(i,-1,10,-2,-2,-2,-1,-1); } //(11) LV 10
		else if i<32 { sc_enemy_deck_addcard(i,-1,9,-2,-2,-2,-1,-1); } //(16) LV 9
		else if i<40 { sc_enemy_deck_addcard(i,-1,8,-2,-2,-2,-1,-1); } //(8) LV 8
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if argument0=212 { //CHAMPION: DUNCAN (ALL)
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
	//
	for (var i=0; i<enemycard_maindeck_total; i++;) {
		if i<1 { sc_enemy_deck_addcard(i,248,10,ref_glyph_tenacity,-2,-2,innate_max,-1); } //TYRANITAR, LV 10 (IN MAX)
		else if i<2 { sc_enemy_deck_addcard(i,150,10,ref_glyph_counter,ref_glyph_curse,ref_glyph_medic,innate_max,-1); } //MEWTWO, LV 10 (IN MAX)
		else if i<6 { sc_enemy_deck_addcard(i,-1,10,-2,-2,-2,innate_max,-1); } //(4) LV 10 (IN MAX)
		else if i<16 { sc_enemy_deck_addcard(i,-1,10,-2,-2,-2,-1,-1); } //(10) LV 10
		else if i<32 { sc_enemy_deck_addcard(i,-1,9,-2,-2,-2,-1,-1); } //(16) LV 9
		else if i<40 { sc_enemy_deck_addcard(i,-1,8,-2,-2,-2,-1,-1); } //(8) LV 8
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}