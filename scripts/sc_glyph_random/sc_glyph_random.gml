function sc_glyph_random() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
var var_random=irandom(954);
//
if var_random<75 { return 00; } //75 lucky
else if var_random<175 { return 01; } //100 harvest
else if var_random<275 { return 02; } //100 weakness
else if var_random<375 { return 03; } //100 exhaustion
else if var_random<450 { return 04; } //75 courage
else if var_random<490 { return 05; } //40 sneak attack
else if var_random<530 { return 06; } //40 counterattack
else if var_random<605 { return 07; } //75 force field
else if var_random<625 { return 08; } //20 medic
else if var_random<635 { return 09; } //10 tenacity
else if var_random<710 { return 10; } //75 bulwark
else if var_random<750 { return 11; } //40 fork attack
else if var_random<770 { return 12; } //20 toxic
else if var_random<810 { return 13; } //40 guard
else if var_random<820 { return 14; } //10 curse
else if var_random<860 { return 15; } //40 quick defense
else if var_random<880 { return 16; } //20 substitute
else if var_random<955 { return 17; } //75 memento
//————————————————————————————————————————————————————————————————————————————————————————————————————
}