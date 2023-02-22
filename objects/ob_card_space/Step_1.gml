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
	
	// glyph: underdog
    if (space_slot >= 0 && space_slot < 4 && ob_control.card_space_id[space_slot+5].occupy_id != -1) {
		if (ob_control.card_space_id[space_slot].occupy_id != -1 && sc_glyph_check(ob_control.card_space_id[space_slot].occupy_id, ref_glyph_underdog, true) && (ob_control.card_space_id[space_slot].occupy_id.card_hp < ob_control.card_space_id[space_slot+5].occupy_id.card_hp))
		{
			card_bonus_atk += 2;
		}
	}

    if (space_slot >= 5 && space_slot < 9 && ob_control.card_space_id[space_slot-5].occupy_id != -1) {
        if (ob_control.card_space_id[space_slot].occupy_id != -1 && sc_glyph_check(ob_control.card_space_id[space_slot].occupy_id, ref_glyph_underdog, true) && (ob_control.card_space_id[space_slot].occupy_id.card_hp < ob_control.card_space_id[space_slot-5].occupy_id.card_hp))
		{
			card_bonus_atk += 2;
		}
	}
	
//	// glyph: bless
//    if (((space_slot > 0 && space_slot <= 4) || (space_slot > 5 && space_slot <= 9)) &&
//        ob_control.card_space_id[space_slot].occupy_id != -1 && sc_glyph_check(ob_control.card_space_id[space_slot].occupy_id, ref_glyph_bless, true))
//    {
//        card_bonus_atk += 1;
//    }
	

//	//	glyph: rush 
//	if (((space_slot > 0 && space_slot <= 4) || (space_slot > 5 && space_slot <= 9)) &&
//	    ob_control.card_space_id[space_slot].occupy_id != -1 && sc_glyph_check(ob_control.card_space_id[space_slot].occupy_id, ref_glyph_rush, true) && ob_control.turn_num <= 2)
//	{
//	    card_bonus_atk += ceil((ob_control.card_space_id[space_slot].occupy_id.card_full_atk*1.5)-ob_control.card_space_id[space_slot].occupy_id.card_full_atk);
//	}

	
	// glyph: adversity
    if (((space_slot > 0 && space_slot <= 4) || (space_slot > 5 && space_slot <= 9)) &&
        ob_control.card_space_id[space_slot].occupy_id != -1 && sc_glyph_check(ob_control.card_space_id[space_slot].occupy_id, ref_glyph_adversity, true) && ob_control.card_space_id[space_slot].occupy_id.card_innate = -1)
    {
        card_bonus_atk += 3;
    }
	
    // glyph: command
    if (((space_slot > 0 && space_slot <= 4) || (space_slot > 5 && space_slot <= 9)) &&
        ob_control.card_space_id[space_slot - 1].occupy_id != -1 && sc_glyph_check(ob_control.card_space_id[space_slot - 1].occupy_id, ref_glyph_command, true))
    {
        card_bonus_atk += 6;
    }
    if (((space_slot >= 0 && space_slot < 4) || (space_slot >= 5 && space_slot < 9)) &&
        ob_control.card_space_id[space_slot + 1].occupy_id != -1 && sc_glyph_check(ob_control.card_space_id[space_slot + 1].occupy_id, ref_glyph_command, true))
    {
        card_bonus_atk += 6;
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
	
    // glyph: determination
    if (((space_slot > 0 && space_slot <= 4) || (space_slot > 5 && space_slot <= 9)) &&
        ob_control.card_space_id[space_slot - 1].occupy_id != -1 && sc_glyph_check(ob_control.card_space_id[space_slot - 1].occupy_id, ref_glyph_determination, true))
    {
        card_bonus_def += 5;
    }
    if (((space_slot >= 0 && space_slot < 4) || (space_slot >= 5 && space_slot < 9)) &&
        ob_control.card_space_id[space_slot + 1].occupy_id != -1 && sc_glyph_check(ob_control.card_space_id[space_slot + 1].occupy_id, ref_glyph_determination, true))
    {
        card_bonus_def += 5;
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

