if trash=true { depth=100; }
//
if effect_use>0 { effect_use-=0.02; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
if ob_control.card_focus=-1 and ob_control.cursor_hide=false {
	if berries_total>0 and mouse_x>=x+5 and mouse_y>=y+70 and mouse_x<=x+4+(6*berries_total) and mouse_y<=y+74 {
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
	}
}