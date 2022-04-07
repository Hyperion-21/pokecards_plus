function sc_glyph_check(argument0,argument1,argument2) {
/// @param card_id
/// @param glyph
/// @param affected_by_mist
//————————————————————————————————————————————————————————————————————————————————————————————————————
var var_mist=false;
//
if argument2=true {
	var i=0;
	repeat (10) {
		if ob_control.card_space_id[i].occupy_id!=-1 {
			var card_check=ob_control.card_space_id[i].occupy_id;
			if card_check.card_glyph_a=ob_main.ref_glyph_mist or card_check.card_glyph_b=ob_main.ref_glyph_mist or card_check.card_glyph_c=ob_main.ref_glyph_mist {
				var_mist=true; //glyph: mist
			}
		}
		i++;
	}
}
//
if var_mist=false and (argument0.card_glyph_a=argument1 or argument0.card_glyph_b=argument1 or argument0.card_glyph_c=argument1) {
	return true;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}