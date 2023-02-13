function sc_glyph_random(argument0) {
/// @param environment
//————————————————————————————————————————————————————————————————————————————————————————————————————
if argument0=false {
	var var_random=irandom(954);
	//
	if var_random<75 { return ref_glyph_lucky; } //75 lucky
	else if var_random<160 { return ref_glyph_harvest; } //85 harvest
	else if var_random<245 { return ref_glyph_debilitate; } //85 debilitate
	else if var_random<330 { return ref_glyph_ruthless; } //85 ruthless
	else if var_random<405 { return ref_glyph_courage; } //75 courage
	else if var_random<455 { return ref_glyph_piercing; } //50 piercing attack
	else if var_random<480 { return ref_glyph_counter; } //25 counterattack
	else if var_random<555 { return ref_glyph_shield; } //75 shield
	else if var_random<580 { return ref_glyph_medic; } //25 medic
	else if var_random<595 { return ref_glyph_tenacity; } //15 tenacity
	else if var_random<620 { return ref_glyph_bulwark; } //25 bulwark
	else if var_random<670 { return ref_glyph_fork; } //50 fork attack
	else if var_random<695 { return ref_glyph_vampire; } //25 vampire
	else if var_random<710 { return ref_glyph_curse; } //15 curse
	else if var_random<785 { return ref_glyph_memento; } //75 memento
	else if var_random<835 { return ref_glyph_berserk; } //50 berserk
	else if var_random<885 { return ref_glyph_adaptability; } //50 adaptability
	else if var_random<910 { return ref_glyph_recovery; } //25 recovery
	else if var_random<955 { return ref_glyph_recovery; } //25 recovery
	//else if var_random<955 { return ref_glyph_bless; } //20 recovery
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else {
	var var_random=irandom(629);
	//
	if var_random<75 { return ref_glyph_lucky; } //75 lucky
	else if var_random<160 { return ref_glyph_debilitate; } //85 debilitate
	else if var_random<245 { return ref_glyph_ruthless; } //85 ruthless
	else if var_random<320 { return ref_glyph_courage; } //75 courage
	else if var_random<345 { return ref_glyph_counter; } //25 counterattack
	else if var_random<420 { return ref_glyph_shield; } //75 shield
	else if var_random<445 { return ref_glyph_medic; } //25 medic
	else if var_random<460 { return ref_glyph_tenacity; } //15 tenacity
	else if var_random<485 { return ref_glyph_bulwark; } //25 bulwark
	else if var_random<500 { return ref_glyph_curse; } //15 curse
	else if var_random<570 { return ref_glyph_memento; } //70 memento
	else if var_random<630 { return ref_glyph_recovery; } //25 recovery
	//else if var_random<630 { return ref_glyph_bless; } //35 recovery
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}