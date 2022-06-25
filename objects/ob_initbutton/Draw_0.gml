if buttonstate { sprite_index = sp_initbutton_on; } 
else { sprite_index = sp_initbutton_off; }

draw_self();

draw_set_color(buttonstate ? #ffffff : #999999);

switch (init_id) {
	case 1:
		draw_text(id.x + 42, id.y + 2,"Generations 3-8 Pokemon/Forms"); 
		draw_set_font(fn_m3x6);
		draw_text(id.x + 42, id.y + 18,"Toggles if Pokemon or forms that originate from Generations 3-8 are able to spawn."); 
		global.mod_gen3to8 = buttonstate;
		break;
	case 2:
		draw_text(id.x + 42, id.y + 2,"Mega Evolutions"); 
		draw_set_font(fn_m3x6);
		draw_text(id.x + 42, id.y + 18,"Toggles if Mega Evolution is able to occur."); 
		global.mod_megaforms = buttonstate;
		break;
	case 3:
		draw_text(id.x + 42, id.y + 2,"Quality of Life Patches (WIP)"); 
		draw_set_font(fn_m3x6);
		draw_text(id.x + 42, id.y + 18,"Toggles quality of life patches, such as increased card pack size, inventory in events, etc."); 
		global.mod_qol = buttonstate;
		break;
	case 4:
		draw_text(id.x + 42, id.y + 2,"Speed Into Health Patch (WIP)"); 
		draw_set_font(fn_m3x6);
		draw_text(id.x + 42, id.y + 18,"Toggles if a Pokemon's speed stat is integrated into its health stat. Buffs fast Pokemon, nerfs slow Pokemon."); 
		global.mod_speed = buttonstate;
		break;
	case 5:
		draw_text(id.x + 42, id.y + 2,"Campfires and Sacrifices"); 
		draw_set_font(fn_m3x6);
		draw_text(id.x + 42, id.y + 18,"Toggles if the Campfire or Sacrifice event occurs."); 
		global.mod_campfire = buttonstate;
		break;
}

draw_set_font(fn_m6x11);
draw_set_color(#ffffff);