// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_glyph_exists_on_card(card_id_in_space, glyph_id){
	if card_id_in_space.card_glyph_a != glyph_id or card_id_in_space.card_glyph_b != glyph_id or card_id_in_space.card_glyph_c != glyph_id {
		return true;
	}
	return false;
}