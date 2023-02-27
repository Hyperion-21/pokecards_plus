function sc_card_cost_map(argument0,argument1,argument2,argument3,argument4) {
/// 0 @param cost_total
/// 1 @param enigma
/// 2 @param card_type_a
/// 3 @param card_type_b
/// 4 @param cost_position
//————————————————————————————————————————————————————————————————————————————————————————————————————
//1 cost: A
if argument0=1 and argument1=false and argument4=0 { return argument2; }
//1 cost, enigma: EN
else if argument0=1 and argument1=true and argument4=0  { return 20; }
//2 cost, 1 type: A/A
else if argument0=2 and argument1=false and argument3=-1 and argument4=0 { return argument2; }
else if argument0=2 and argument1=false and argument3=-1 and argument4=1 { return argument2; }
//2 cost, 2 types: A/B
else if argument0=2 and argument1=false and argument3>=0 and argument4=0 { return argument2; }
else if argument0=2 and argument1=false and argument3>=0 and argument4=1 { return argument3; }
//2 cost, enigma: EN/A
else if argument0=2 and argument1=true and argument4=0 { return 20; }
else if argument0=2 and argument1=true and argument4=1 { return argument2; }



//3 cost, 1 type, enigma: EN/A/A
else if argument0=3 and argument1=true and argument3=-1 and argument4=0 && card_glyph_a != ref_glyph_picky && card_glyph_b != ref_glyph_picky && card_glyph_c != ref_glyph_picky { return 20; }
else if argument0=3 and argument1=true and argument3=-1 and argument4=0 { return argument2; }
else if argument0=3 and argument1=true and argument3=-1 and argument4=1 { return argument2; }
else if argument0=3 and argument1=true and argument3=-1 and argument4=2 { return argument2; }
//3 cost, 2 types, enigma: EN/A/B
else if argument0=3 and argument1=true and argument3>=0 and argument4=0 && card_glyph_a != ref_glyph_picky && card_glyph_b != ref_glyph_picky && card_glyph_c != ref_glyph_picky  { return 20; }
else if argument0=3 and argument1=true and argument3>=0 and argument4=0 { return argument2; }
else if argument0=3 and argument1=true and argument3>=0 and argument4=1 { return argument2; }
else if argument0=3 and argument1=true and argument3>=0 and argument4=2 { return argument3; }
//
else { return -1; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
}

