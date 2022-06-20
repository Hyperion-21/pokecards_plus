if (instance_exists(ob_control))
{
    card_bonus_atk = 0;
    card_bonus_def = 0;
    card_penalty_atk = 0;
    card_penalty_def = 0;
    
    var space_slot = -1;
    for (var i = 0; i <= 9; i++)
    {
        if (ob_control.card_space_id[i] == id)
        {
            space_slot = i;
        }
    }
    
    // glyph: courage
    if (((space_slot > 0 && space_slot <= 4) || (space_slot > 5 && space_slot <= 9)) &&
        ob_control.card_space_id[space_slot - 1].occupy_id != -1 && sc_glyph_check(ob_control.card_space_id[space_slot - 1].occupy_id, ref_glyph_courage, true))
    {
        card_bonus_atk += 2;
    }
    if (((space_slot >= 0 && space_slot < 4) || (space_slot >= 5 && space_slot < 9)) &&
        ob_control.card_space_id[space_slot + 1].occupy_id != -1 && sc_glyph_check(ob_control.card_space_id[space_slot + 1].occupy_id, ref_glyph_courage, true))
    {
        card_bonus_atk += 2;
    }
    
    // glyph: shield
    if (((space_slot > 0 && space_slot <= 4) || (space_slot > 5 && space_slot <= 9)) &&
        ob_control.card_space_id[space_slot - 1].occupy_id != -1 && sc_glyph_check(ob_control.card_space_id[space_slot - 1].occupy_id, ref_glyph_shield, true))
    {
        card_bonus_def += 1;
    }
    if (((space_slot >= 0 && space_slot < 4) || (space_slot >= 5 && space_slot < 9)) &&
        ob_control.card_space_id[space_slot + 1].occupy_id != -1 && sc_glyph_check(ob_control.card_space_id[space_slot + 1].occupy_id, ref_glyph_shield, true))
    {
        card_bonus_def += 1;
    }
    
    // glyph: debilitate
    if ((space_slot >= 0 && space_slot <= 4 && ob_control.card_space_id[space_slot + 5].occupy_id != -1 &&
        sc_glyph_check(ob_control.card_space_id[space_slot + 5].occupy_id, ref_glyph_debilitate, true)) ||
        (space_slot >= 5 && space_slot <= 9 && ob_control.card_space_id[space_slot - 5].occupy_id != -1 &&
        sc_glyph_check(ob_control.card_space_id[space_slot - 5].occupy_id, ref_glyph_debilitate, true)))
    {
        card_penalty_atk += 1;
    }
    
    // glyph: ruthless
    if ((space_slot >= 0 && space_slot <= 4 && ob_control.card_space_id[space_slot + 5].occupy_id != -1 &&
        sc_glyph_check(ob_control.card_space_id[space_slot + 5].occupy_id, ref_glyph_ruthless, true)) ||
        (space_slot >= 5 && space_slot <= 9 && ob_control.card_space_id[space_slot - 5].occupy_id != -1 &&
        sc_glyph_check(ob_control.card_space_id[space_slot - 5].occupy_id, ref_glyph_ruthless, true)))
    {
        card_penalty_def += 2;
    }
}

