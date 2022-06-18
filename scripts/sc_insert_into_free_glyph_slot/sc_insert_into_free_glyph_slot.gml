// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_insert_into_free_glyph_slot(card_id_in_space, glyph_id){
	if card_id_in_space.card_glyph_a=-1 {
		card_id_in_space.card_glyph_a=glyph_id;
		return true;
	}
	else if card_id_in_space.card_glyph_b=-1 {
		card_id_in_space.card_glyph_b=glyph_id;
		return true;
	}
	else if card_id_in_space.card_glyph_c=-1 {
		card_id_in_space.card_glyph_c=glyph_id;
		return true;
	}
	return false;
}