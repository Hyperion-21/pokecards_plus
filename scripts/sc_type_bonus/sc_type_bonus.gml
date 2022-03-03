function sc_type_bonus(argument0,argument1,argument2,argument3) {
/// @param attack1
/// @param attack2
/// @param defense1
/// @param defense2
//————————————————————————————————————————————————————————————————————————————————————————————————————
//00 normal, 01 grass, 02 fire, 03 water, 04 electric, 05 flying, 06 fighting, 07 psychic, 08 fairy
//09 ground, 10 rock, 11 bug, 12 poison, 13 ice, 14 dragon, 15 steel, 16 ghost, 17 dark
//————————————————————————————————————————————————————————————————————————————————————————————————————
if (argument0=01 or argument1=01) and (argument2=03 or argument3=03) { return true; } //grass > water
else if (argument0=01 or argument1=01) and (argument2=09 or argument3=09) { return true; } //grass > ground
else if (argument0=01 or argument1=01) and (argument2=10 or argument3=10) { return true; } //grass > rock
//
else if (argument0=02 or argument1=02) and (argument2=01 or argument3=01) { return true; } //fire > grass
else if (argument0=02 or argument1=02) and (argument2=13 or argument3=13) { return true; } //fire > ice
else if (argument0=02 or argument1=02) and (argument2=11 or argument3=11) { return true; } //fire > bug
else if (argument0=02 or argument1=02) and (argument2=15 or argument3=15) { return true; } //fire > steel
//
else if (argument0=03 or argument1=03) and (argument2=02 or argument3=02) { return true; } //water > fire
else if (argument0=03 or argument1=03) and (argument2=09 or argument3=09) { return true; } //water > ground
else if (argument0=03 or argument1=03) and (argument2=10 or argument3=10) { return true; } //water > rock
//
else if (argument0=04 or argument1=04) and (argument2=03 or argument3=03) { return true; } //electric > water
else if (argument0=04 or argument1=04) and (argument2=05 or argument3=05) { return true; } //electric > flying
//
else if (argument0=05 or argument1=05) and (argument2=01 or argument3=01) { return true; } //flying > grass
else if (argument0=05 or argument1=05) and (argument2=06 or argument3=06) { return true; } //flying > fighting
else if (argument0=05 or argument1=05) and (argument2=11 or argument3=11) { return true; } //flying > bug
//
else if (argument0=06 or argument1=06) and (argument2=00 or argument3=00) { return true; } //fighting > normal
else if (argument0=06 or argument1=06) and (argument2=13 or argument3=13) { return true; } //fighting > ice
else if (argument0=06 or argument1=06) and (argument2=10 or argument3=10) { return true; } //fighting > rock
else if (argument0=06 or argument1=06) and (argument2=17 or argument3=17) { return true; } //fighting > dark
else if (argument0=06 or argument1=06) and (argument2=15 or argument3=15) { return true; } //fighting > steel
//
else if (argument0=07 or argument1=07) and (argument2=06 or argument3=06) { return true; } //psychic > fighting
else if (argument0=07 or argument1=07) and (argument2=12 or argument3=12) { return true; } //psychic > poison
//
else if (argument0=08 or argument1=08) and (argument2=06 or argument3=06) { return true; } //fairy > fighting
else if (argument0=08 or argument1=08) and (argument2=14 or argument3=14) { return true; } //fairy > dragon
else if (argument0=08 or argument1=08) and (argument2=17 or argument3=17) { return true; } //fairy > dark
//
else if (argument0=09 or argument1=09) and (argument2=02 or argument3=02) { return true; } //ground > fire
else if (argument0=09 or argument1=09) and (argument2=04 or argument3=04) { return true; } //ground > electric
else if (argument0=09 or argument1=09) and (argument2=12 or argument3=12) { return true; } //ground > poison
else if (argument0=09 or argument1=09) and (argument2=10 or argument3=10) { return true; } //ground > rock
else if (argument0=09 or argument1=09) and (argument2=15 or argument3=15) { return true; } //ground > steel
//
else if (argument0=10 or argument1=10) and (argument2=02 or argument3=02) { return true; } //rock > fire
else if (argument0=10 or argument1=10) and (argument2=13 or argument3=13) { return true; } //rock > ice
else if (argument0=10 or argument1=10) and (argument2=05 or argument3=05) { return true; } //rock > flying
else if (argument0=10 or argument1=10) and (argument2=11 or argument3=11) { return true; } //rock > bug
//
else if (argument0=11 or argument1=11) and (argument2=01 or argument3=01) { return true; } //bug > grass
else if (argument0=11 or argument1=11) and (argument2=07 or argument3=07) { return true; } //bug > psychic
else if (argument0=11 or argument1=11) and (argument2=17 or argument3=17) { return true; } //bug > dark
//
else if (argument0=12 or argument1=12) and (argument2=01 or argument3=01) { return true; } //poison > grass
else if (argument0=12 or argument1=12) and (argument2=08 or argument3=08) { return true; } //poison > fairy
//
else if (argument0=13 or argument1=13) and (argument2=01 or argument3=01) { return true; } //ice > grass
else if (argument0=13 or argument1=13) and (argument2=09 or argument3=09) { return true; } //ice > ground
else if (argument0=13 or argument1=13) and (argument2=05 or argument3=05) { return true; } //ice > flying
else if (argument0=13 or argument1=13) and (argument2=14 or argument3=14) { return true; } //ice > dragon
//
else if (argument0=14 or argument1=14) and (argument2=14 or argument3=14) { return true; } //dragon > dragon
//
else if (argument0=15 or argument1=15) and (argument2=13 or argument3=13) { return true; } //steel > ice
else if (argument0=15 or argument1=15) and (argument2=10 or argument3=10) { return true; } //steel > rock
else if (argument0=15 or argument1=15) and (argument2=08 or argument3=08) { return true; } //steel > fairy
//
else if (argument0=16 or argument1=16) and (argument2=07 or argument3=07) { return true; } //ghost > psychic
else if (argument0=16 or argument1=16) and (argument2=16 or argument3=16) { return true; } //ghost > ghost
//
else if (argument0=17 or argument1=17) and (argument2=07 or argument3=07) { return true; } //dark > psychic
else if (argument0=17 or argument1=17) and (argument2=16 or argument3=16) { return true; } //dark > ghost
//
else { return false; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
}