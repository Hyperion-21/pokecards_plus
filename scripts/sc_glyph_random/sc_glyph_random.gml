function sc_glyph_random(argument0) {
/// @param environment
//————————————————————————————————————————————————————————————————————————————————————————————————————
if argument0=false {
	var var_random=irandom(954);
	//
	if var_random<75 { return ref_glyph_lucky; } //75 lucky
	else if var_random<175 { return ref_glyph_harvest; } //100 harvest
	else if var_random<275 { return ref_glyph_debilitate; } //100 debilitate
	else if var_random<375 { return ref_glyph_ruthless; } //100 ruthless
	else if var_random<450 { return ref_glyph_courage; } //75 courage
	else if var_random<500 { return ref_glyph_piercing; } //50 piercing attack
	else if var_random<525 { return ref_glyph_counter; } //25 counterattack
	else if var_random<600 { return ref_glyph_shield; } //75 shield
	else if var_random<625 { return ref_glyph_medic; } //25 medic
	else if var_random<640 { return ref_glyph_tenacity; } //15 tenacity
	else if var_random<665 { return ref_glyph_bulwark; } //25 bulwark
	else if var_random<715 { return ref_glyph_fork; } //50 fork attack
	else if var_random<740 { return ref_glyph_vampire; } //25 vampire
	else if var_random<755 { return ref_glyph_curse; } //15 curse
	else if var_random<830 { return ref_glyph_memento; } //75 memento
	else if var_random<880 { return ref_glyph_berserk; } //50 berserk
	else if var_random<930 { return ref_glyph_adaptability; } //50 adaptability
	else if var_random<955 { return ref_glyph_recovery; } //25 recovery
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else {
	var var_random=irandom(629);
	//
	if var_random<75 { return ref_glyph_lucky; } //75 lucky
	else if var_random<175 { return ref_glyph_debilitate; } //100 debilitate
	else if var_random<275 { return ref_glyph_ruthless; } //100 ruthless
	else if var_random<350 { return ref_glyph_courage; } //75 courage
	else if var_random<375 { return ref_glyph_counter; } //25 counterattack
	else if var_random<450 { return ref_glyph_shield; } //75 shield
	else if var_random<475 { return ref_glyph_medic; } //25 medic
	else if var_random<490 { return ref_glyph_tenacity; } //15 tenacity
	else if var_random<515 { return ref_glyph_bulwark; } //25 bulwark
	else if var_random<530 { return ref_glyph_curse; } //15 curse
	else if var_random<605 { return ref_glyph_memento; } //75 memento
	else if var_random<630 { return ref_glyph_recovery; } //25 recovery
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}