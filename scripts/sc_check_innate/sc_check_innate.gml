function sc_check_innate(argument0, argument1) {
    ///argument0 = ref_glyph
    ///argument1 = variable identifier. IE card_has_rush
    
    var old_glyph_a = -1;
    var old_glyph_b = -1;
    
    if (variable_instance_get(targetcard, argument1) && targetcard.card_glyph_a != argument0) {
        if (targetcard.card_glyph_b != -1) {
            old_glyph_b = targetcard.card_glyph_b;
            targetcard.card_glyph_c = old_glyph_b;
            ob_main.main_card_glyph_c[targetcard.num_in_all] = targetcard.card_glyph_c; 
			targetcard.card_glyph_b = -1;
        }
        
        if (targetcard.card_glyph_a != -1) {
            old_glyph_a = targetcard.card_glyph_a;
            
            if (targetcard.card_glyph_b == -1) {
                targetcard.card_glyph_b = old_glyph_a;
            }             
            ob_main.main_card_glyph_b[targetcard.num_in_all] = targetcard.card_glyph_b; 
        }
        
        targetcard.card_glyph_a = argument0; 
        ob_main.main_card_glyph_a[targetcard.num_in_all] = targetcard.card_glyph_a; 
    } else if (!variable_instance_get(targetcard, argument1) && targetcard.card_glyph_a == argument0) {
        targetcard.card_glyph_a = -1;
		if targetcard.card_glyph_b != -1
		{
			targetcard.card_glyph_a = targetcard.card_glyph_b;
			targetcard.card_glyph_b = -1;
		}
		if targetcard.card_glyph_c != -1
		{
			targetcard.card_glyph_b = targetcard.card_glyph_c;
			targetcard.card_glyph_c = -1;
		}
    }
}
