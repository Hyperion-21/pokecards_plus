if (trash == true)
{
    depth = 100;
}

if (instance_exists(ob_control) && ob_control.card_focus == -1 && ob_main.cursor_hide == false)
{
    if (berries_total > 0 && mouse_x >= x + 4 && mouse_y >= y + 4 && mouse_x < x + sprite_width - 4 && mouse_y < y + sprite_height - 4)
    {
        ob_control.tooltip_text = "Berries: ";
        if (berries_total_type[0] >= 1)
        {
            ob_control.tooltip_text = ob_control.tooltip_text + string(berries_total_type[0]) + "x Oran";
        }
        if (berries_total_type[1] >= 1)
        {
            if (berries_total_type[0] >= 1)
            {
                ob_control.tooltip_text = ob_control.tooltip_text + ", ";
            }
            ob_control.tooltip_text = ob_control.tooltip_text + string(berries_total_type[1]) + "x Leppa";
        }
        if (berries_total_type[2] >= 1)
        {
            if (berries_total_type[0] >= 1 || berries_total_type[1] >= 1)
            {
                ob_control.tooltip_text = ob_control.tooltip_text + ", ";
            }
            ob_control.tooltip_text = ob_control.tooltip_text + string(berries_total_type[2]) + "x Lum";
        }
        if (berries_total_type[3] >= 1)
        {
            if (berries_total_type[0] >= 1 || berries_total_type[1] >= 1 || berries_total_type[2] >= 1)
            {
                ob_control.tooltip_text = ob_control.tooltip_text + ", ";
            }
            ob_control.tooltip_text = ob_control.tooltip_text + string(berries_total_type[3]) + "x Enigma";
        }
        ob_control.tooltip_text = ob_control.tooltip_text + ".";
        ob_control.tooltip_lines = 1;
    }
}
else if (instance_exists(ob_event) && occupy_id == -1 && ob_main.cursor_hide == false)
{
    if (mouse_x >= x + 4 && mouse_y >= y + 4 && mouse_x < x + sprite_width - 4 && mouse_y < y + sprite_height - 4)
    {
        if (ob_event.event_kind == ref_event_levelup)
        {
            if (ob_main.card_level_player_limit < 10)
            {
                ob_event.tooltip_text = "// LEVEL UP //\nThe card's level is raised, for a maximum of " + string(ob_main.card_level_player_limit) +
                    ".\nDefeat gym leaders to raise this limit.";
                ob_event.tooltip_lines = 3;
            }
            else
            {
                ob_event.tooltip_text = "// LEVEL UP //\nThe card's level is raised, for a maximum of " + string(ob_main.card_level_player_limit) + ".";
                ob_event.tooltip_lines = 2;
            }
        }
        else if (ob_event.event_kind == ref_event_evolution)
        {
            ob_event.tooltip_text = "// EVOLUTION //\nThe Pokemon evolves into its next form.\nOnly one Pokemon can be evolved at a time.";
            ob_event.tooltip_lines = 3;
        }
        else if (ob_event.event_kind == ref_event_changeform)
        {
            ob_event.tooltip_text = "// CHANGE FORM //\nThe Pokemon changes into its alternate form.\nOnly one Pokemon can be form changed.";
            ob_event.tooltip_lines = 3;
        }
        else if (ob_event.event_kind == ref_event_candy)
        {
                ob_event.tooltip_text = "// RARE CANDY //\nThe Pokemon gains a 4th heart if\nit has 3 hearts.";
                ob_event.tooltip_lines = 3;
        }
        else if (ob_event.event_kind == ref_event_megaevolve)
        {
            ob_event.tooltip_text = "// MEGA EVOLUTION OR GIGANTAMAX //\nThe Pokemon transcends its evolution.";
            ob_event.tooltip_lines = 2;
        }
        else if (ob_event.event_kind == ref_event_glyph)
        {
            ob_event.tooltip_text = sc_glyph_text(ob_event.glyph_add_id, false);
            ob_event.tooltip_lines = sc_glyph_text(ob_event.glyph_add_id, true);
        }
        else if (ob_event.event_kind == ref_event_campfire)
        {
            ob_event.tooltip_text = "// CAMPFIRE //\nIncreases the intrinsic strength of one Pokemon." +
                "\nThe card placed here will receive a boost\nto its innate parameters, or tastiness.";
            ob_event.tooltip_lines = 4;
        }
        else if (ob_event.event_kind == ref_event_deglyph)
        {
            ob_event.tooltip_text = "// DE-GLYPH //\nRemove non-innate glyphs from Pokemon.";
            ob_event.tooltip_lines = 2;
        }
        else if (ob_event.event_kind == ref_event_tribute)
        {
            if (id == ob_event.event_space_id[0])
            {
                ob_event.tooltip_text = "// TRIBUTE //\nTransfers the intrinsic strength of one Pokemon into another." +
                    "\nThe card placed here will be weakened, and unable to receive\nany further improvements.";
                ob_event.tooltip_lines = 4;
            }
            else if (id == ob_event.event_space_id[1])
            {
                ob_event.tooltip_text = "// TRIBUTE //\nTransfers the intrinsic strength of one Pokemon into another." +
                    "\nThe card placed here will gain one heart from the weakened Pokemon.";
                ob_event.tooltip_lines = 3;
            }
        }
        else if (ob_event.event_kind == ref_event_sacrifice)
        {
            if (id == ob_event.event_space_id[0])
            {
                ob_event.tooltip_text = "// SACRIFICE //\nTransfers glyphs from one Pokemon into another." +
                    "\nThe card placed here will be exhausted if it has no hearts.\nIt will lose 1 heart and glyph at a time.";
                ob_event.tooltip_lines = 4;
            }
            else if (id == ob_event.event_space_id[1])
            {
                ob_event.tooltip_text = "// SACRIFICE //\nTransfers glyphs from one Pokemon into another." +
                    "\nThe card placed here will gain 1 heart and as many glyphs\nas it can, starting from the last slot of the sacrifice.";
                ob_event.tooltip_lines = 4;
            }
        }
    }
}

if (instance_exists(ob_event) && ob_event.event_kind == ref_event_levelup)
{
    if (occupy_id != -1)
    {
        ob_main.event_cost_standby_levelup = ob_main.event_cost[ref_event_levelup] + levelup_cost_multiplier * (occupy_id.card_level - 1);
    }
    else
    {
        ob_main.event_cost_standby_levelup = 0;
    }
}

