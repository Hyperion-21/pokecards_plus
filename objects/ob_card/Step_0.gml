if card_cat=0 {
	if (mouse_x>=x+2 and mouse_y>=y+2 and mouse_x<=x+14 and mouse_y<=y+13) or
		(card_type_b>=0 and mouse_x>=x+2 and mouse_y>=y+12 and mouse_x<=x+14 and mouse_y<=y+23) {
		if card_type_b>=0 and mouse_x>=x+2 and mouse_y>=y+12 and mouse_x<=x+14 and mouse_y<=y+23 { var switch_var=card_type_b; }
		else if mouse_x>=x+2 and mouse_y>=y+2 and mouse_x<=x+14 and mouse_y<=y+13 { var switch_var=card_type_a; }
		switch (switch_var) {
			case 00: ob_control.tooltip_text="Normal"; break;
			case 01: ob_control.tooltip_text="Grass"; break;
			case 02: ob_control.tooltip_text="Fire"; break;
			case 03: ob_control.tooltip_text="Water"; break;
			case 04: ob_control.tooltip_text="Electric"; break;
			case 05: ob_control.tooltip_text="Flying"; break;
			case 06: ob_control.tooltip_text="Fighting"; break;
			case 07: ob_control.tooltip_text="Psychic"; break;
			case 08: ob_control.tooltip_text="Fairy"; break;
			case 09: ob_control.tooltip_text="Ground"; break;
			case 10: ob_control.tooltip_text="Rock"; break;
			case 11: ob_control.tooltip_text="Bug"; break;
			case 12: ob_control.tooltip_text="Poison"; break;
			case 13: ob_control.tooltip_text="Ice"; break;
			case 14: ob_control.tooltip_text="Dragon"; break;
			case 15: ob_control.tooltip_text="Steel"; break;
			case 16: ob_control.tooltip_text="Ghost"; break;
			case 17: ob_control.tooltip_text="Dark"; break;
		}
	}
	else if (card_glyph_a>=0 and mouse_x>=x+43 and mouse_y>=y+2 and mouse_x<=x+55 and mouse_y<=y+13) or
		(card_glyph_b>=0 and mouse_x>=x+43 and mouse_y>=y+12 and mouse_x<=x+55 and mouse_y<=y+23) or
		(card_glyph_c>=0 and mouse_x>=x+43 and mouse_y>=y+22 and mouse_x<=x+55 and mouse_y<=y+33) {
		if card_glyph_c>=0 and mouse_x>=x+43 and mouse_y>=y+22 and mouse_x<=x+55 and mouse_y<=y+33 { var switch_var=card_glyph_c; }
		else if card_glyph_b>=0 and mouse_x>=x+43 and mouse_y>=y+12 and mouse_x<=x+55 and mouse_y<=y+23 { var switch_var=card_glyph_b; }
		else if card_glyph_a>=0 and mouse_x>=x+43 and mouse_y>=y+2 and mouse_x<=x+55 and mouse_y<=y+13 { var switch_var=card_glyph_a; }
		switch (switch_var) {
			case 00: ob_control.tooltip_text="LUCKY: draws an extra card when played."; break;
			case 01: ob_control.tooltip_text="HARVEST: all berries return to hand when fainting."; break;
			case 02: ob_control.tooltip_text="WEAKNESS: the opposing Pokemon's attack is lowered."; break;
			case 03: ob_control.tooltip_text="EXHAUSTION: the opposing Pokemon's defense is lowered."; break;
			case 04: ob_control.tooltip_text="COURAGE: raises attack of nearby friendly Pokemon."; break;
			case 05: ob_control.tooltip_text="SNEAK ATTACK: attacks the enemy trainer directly."; break;
			case 06: ob_control.tooltip_text="COUNTERATTACK: when attacked, the enemy Pokemon receives some damage."; break;
			case 07: ob_control.tooltip_text="FORCE FIELD: raises defense of nearby friendly Pokemon."; break;
			case 08: ob_control.tooltip_text="MEDIC: heals all friendly Pokemon when played."; break;
			case 09: ob_control.tooltip_text="DODGE: may evade attacks, letting them pass through directly."; break;
			case 10: ob_control.tooltip_text="BULWARK: is protected by rocks on each side when played."; break;
			case 11: ob_control.tooltip_text="FORK ATTACK: attacks enemies on both sides instead of straight ahead."; break;
			case 12: ob_control.tooltip_text="TOXIC: may poison the enemy Pokemon when attacking."; break;
			case 13: ob_control.tooltip_text="GUARD: moves in front of incoming direct attacks."; break;
			case 14: ob_control.tooltip_text="DOOM: when fainting, the enemy Pokemon may also faint."; break;
			case 15: ob_control.tooltip_text="QUICK DEFENSE: blocks opposing SNEAK ATTACKS for no damage."; break;
			case 16: ob_control.tooltip_text="SUBSTITUTE: immediately replaces a fainted Pokemon when still in hand."; break;
			case 17: ob_control.tooltip_text="MEMENTO: draws an extra card when fainting."; break;
		}
	}
	else if (card_cost_total=1 and mouse_x>=x+3 and mouse_y>=y+35 and mouse_x<=x+7 and mouse_y<=y+39) or
		(card_cost_total=2 and mouse_x>=x+3 and mouse_y>=y+35 and mouse_x<=x+11 and mouse_y<=y+39) or
		(card_cost_total=3 and mouse_x>=x+3 and mouse_y>=y+35 and mouse_x<=x+15 and mouse_y<=y+39) or
		(card_cost_total=4 and mouse_x>=x+3 and mouse_y>=y+35 and mouse_x<=x+19 and mouse_y<=y+39) {
		ob_control.tooltip_text="";
		if card_cost[0]=0 { ob_control.tooltip_text=ob_control.tooltip_text + "Oran"; }
		else if card_cost[0]=1 { ob_control.tooltip_text=ob_control.tooltip_text + "Leppa"; }
		else if card_cost[0]=2 { ob_control.tooltip_text=ob_control.tooltip_text + "Lum"; }
		else if card_cost[0]=3 { ob_control.tooltip_text=ob_control.tooltip_text + "Enigma"; }
		if card_cost[1]=0 { ob_control.tooltip_text=ob_control.tooltip_text + ", Oran"; }
		else if card_cost[1]=1 { ob_control.tooltip_text=ob_control.tooltip_text + ", Leppa"; }
		else if card_cost[1]=2 { ob_control.tooltip_text=ob_control.tooltip_text + ", Lum"; }
		else if card_cost[1]=3 { ob_control.tooltip_text=ob_control.tooltip_text + ", Enigma"; }
		if card_cost[2]=0 { ob_control.tooltip_text=ob_control.tooltip_text + ", Oran"; }
		else if card_cost[2]=1 { ob_control.tooltip_text=ob_control.tooltip_text + ", Leppa"; }
		else if card_cost[2]=2 { ob_control.tooltip_text=ob_control.tooltip_text + ", Lum"; }
		else if card_cost[2]=3 { ob_control.tooltip_text=ob_control.tooltip_text + ", Enigma"; }
		if card_cost[3]=3 { ob_control.tooltip_text=ob_control.tooltip_text + ", Enigma"; }
		ob_control.tooltip_text=ob_control.tooltip_text + ".";
	}
}