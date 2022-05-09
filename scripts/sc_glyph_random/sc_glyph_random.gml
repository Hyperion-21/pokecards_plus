function sc_glyph_random() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
var var_random=irandom(859);
//
if var_random<75 { return ref_glyph_lucky; } //75 lucky
else if var_random<175 { return ref_glyph_harvest; } //100 harvest
else if var_random<275 { return ref_glyph_debilitate; } //100 debilitate
else if var_random<375 { return ref_glyph_ruthless; } //100 ruthless
else if var_random<450 { return ref_glyph_courage; } //75 courage
else if var_random<490 { return ref_glyph_piercing; } //40 piercing attack
else if var_random<510 { return ref_glyph_counter; } //20 counterattack
else if var_random<585 { return ref_glyph_shield; } //75 shield
else if var_random<605 { return ref_glyph_medic; } //20 medic
else if var_random<615 { return ref_glyph_tenacity; } //10 tenacity
else if var_random<635 { return ref_glyph_bulwark; } //20 bulwark
else if var_random<675 { return ref_glyph_fork; } //40 fork attack
else if var_random<695 { return ref_glyph_vampire; } //20 vampire
else if var_random<705 { return ref_glyph_curse; } //10 curse
else if var_random<780 { return ref_glyph_memento; } //75 memento
else if var_random<820 { return ref_glyph_berserk; } //40 berserk
else if var_random<860 { return ref_glyph_adaptability; } //40 adaptability
//————————————————————————————————————————————————————————————————————————————————————————————————————
}