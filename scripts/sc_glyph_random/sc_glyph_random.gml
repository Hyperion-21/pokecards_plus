function sc_glyph_random() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
var var_random=irandom(799);
//
if var_random<75 { return ob_main.ref_glyph_lucky; } //75 lucky
else if var_random<175 { return ob_main.ref_glyph_harvest; } //100 harvest
else if var_random<275 { return ob_main.ref_glyph_weakness; } //100 weakness
else if var_random<375 { return ob_main.ref_glyph_ruthless; } //100 ruthless
else if var_random<450 { return ob_main.ref_glyph_courage; } //75 courage
else if var_random<490 { return ob_main.ref_glyph_piercing; } //40 sneak attack
else if var_random<530 { return ob_main.ref_glyph_counter; } //40 counterattack
else if var_random<605 { return ob_main.ref_glyph_shield; } //75 shield
else if var_random<625 { return ob_main.ref_glyph_medic; } //20 medic
else if var_random<635 { return ob_main.ref_glyph_tenacity; } //10 tenacity
else if var_random<655 { return ob_main.ref_glyph_bulwark; } //20 bulwark
else if var_random<695 { return ob_main.ref_glyph_fork; } //40 fork attack
else if var_random<715 { return ob_main.ref_glyph_vampire; } //20 vampire
else if var_random<725 { return ob_main.ref_glyph_curse; } //10 curse
else if var_random<800 { return ob_main.ref_glyph_memento; } //75 memento
//————————————————————————————————————————————————————————————————————————————————————————————————————
}