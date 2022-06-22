if buttonstate { sprite_index = sp_initbutton_on; } 
else { sprite_index = sp_initbutton_off; }

draw_self();

switch (init_id) {
	case 1:
		draw_text(id.x + 42, id.y,"Generations 3-8 Pokemon/Forms"); 
		global.mod_gen3to8 = buttonstate;
		break;
	case 2:
		draw_text(id.x + 42, id.y,"Mega Evolutions"); 
		global.mod_megaforms = buttonstate;
		break;
	case 3:
		draw_text(id.x + 42, id.y,"Quality of Life Patches"); 
		global.mod_qol = buttonstate;
		break;
	case 4:
		draw_text(id.x + 42, id.y,"Speed Into Health Patch"); 
		global.mod_speed = buttonstate;
		break;
	case 5:
		draw_text(id.x + 42, id.y,"Campfires"); 
		global.mod_campfire = buttonstate;
		break;
}