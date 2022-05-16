if trash=true { depth=100; }
//
if instance_exists(ob_control) and ob_control.card_focus=-1 and ob_main.cursor_hide=false {
	if berries_total>0 and mouse_x>=x+4 and mouse_y>=y+4 and mouse_x<x+sprite_width-4 and mouse_y<y+sprite_height-4 {
		ob_control.tooltip_text="Berries: ";
		if berries_total_type[0]>=1 {
			ob_control.tooltip_text=ob_control.tooltip_text + string(berries_total_type[0]) + "x Oran";
		}
		if berries_total_type[1]>=1 {
			if berries_total_type[0]>=1 { ob_control.tooltip_text=ob_control.tooltip_text + ", "; }
			ob_control.tooltip_text=ob_control.tooltip_text + string(berries_total_type[1]) + "x Leppa";
		}
		if berries_total_type[2]>=1 {
			if berries_total_type[0]>=1 or berries_total_type[1]>=1 { ob_control.tooltip_text=ob_control.tooltip_text + ", "; }
			ob_control.tooltip_text=ob_control.tooltip_text + string(berries_total_type[2]) + "x Lum";
		}
		if berries_total_type[3]>=1 {
			if berries_total_type[0]>=1 or berries_total_type[1]>=1 or berries_total_type[2]>=1 { ob_control.tooltip_text=ob_control.tooltip_text + ", "; }
			ob_control.tooltip_text=ob_control.tooltip_text + string(berries_total_type[3]) + "x Enigma";
		}
		ob_control.tooltip_text=ob_control.tooltip_text + ".";
		ob_control.tooltip_lines=1;
	}
}
else if instance_exists(ob_event) and occupy_id=-1 and ob_main.cursor_hide=false {
	if mouse_x>=x+4 and mouse_y>=y+4 and mouse_x<x+sprite_width-4 and mouse_y<y+sprite_height-4 {
		if ob_event.event_kind=ref_event_levelup {
			if ob_main.card_level_player_limit<10 {
				ob_event.tooltip_text="// LEVEL UP //\nThe card's level is raised, for a maximum of " + string(ob_main.card_level_player_limit) +
				".\nDefeat gym leaders to raise this limit.";
				ob_event.tooltip_lines=3;
			}
			else {
				ob_event.tooltip_text="// LEVEL UP //\nThe card's level is raised, for a maximum of " + string(ob_main.card_level_player_limit) + ".";
				ob_event.tooltip_lines=2;
			}
		}
		else if ob_event.event_kind=ref_event_evolution {
			ob_event.tooltip_text="// EVOLUTION //\nThe Pokemon evolves into its next form,\nbut multiple forms may yield unstable results.";
			ob_event.tooltip_lines=3;
		}
		else if ob_event.event_kind=ref_event_glyph {
			ob_event.tooltip_text=sc_glyph_text(ob_event.glyph_add_id,false);
			ob_event.tooltip_lines=sc_glyph_text(ob_event.glyph_add_id,true);
		}
		else if ob_event.event_kind=ref_event_tribute {
			ob_event.tooltip_text="// TRIBUTE //\nTransfers the innate strength of one Pokemon into another.\nTributes always stack, but multiple attempts may result in failure...";
			ob_event.tooltip_lines=3;
		}
	}
}