if buttonstate { sprite_index = sp_initbutton_on; } 
else { sprite_index = sp_initbutton_off; }

draw_self();

switch (init_id) {
	case 1:
		draw_text(id.x + 40, id.y,"Generations 3-8 Pokemon"); 
		ob_roominit.mod_gen3to8 = buttonstate ? true : false;
		break;
	case 2:
		draw_text(id.x + 40, id.y,"Mega Evolutions and Forms"); 
		ob_roominit.mod_megaforms = buttonstate ? true : false;
		break;
	case 3:
		draw_text(id.x + 40, id.y,"Quality of Life Patches"); 
		ob_roominit.mod_qol = buttonstate ? true : false;
		break;
	case 4:
		draw_text(id.x + 40, id.y,"Speed Into Health Patch"); 
		ob_roominit.mod_speed = buttonstate ? true : false;
		break;
	case 5:
		draw_text(id.x + 40, id.y,"Campfires"); 
		ob_roominit.mod_campfire = buttonstate ? true : false;
		break;
}