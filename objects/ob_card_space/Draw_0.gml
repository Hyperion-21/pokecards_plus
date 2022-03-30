if trash=true {
	draw_sprite_general(sp_sheet,0,16*37+4,16*0,sprite_width-1,sprite_height,x,y,1,1,0,c_white,c_white,c_white,c_white,0.5); //width-1 to avoid out-of-bounds texture glitch
	if effect_use>0 { draw_sprite_general(sp_sheet,0,16*37+4,16*5,sprite_width-1,sprite_height,x,y,1,1,0,c_white,c_white,c_white,c_white,effect_use); }
}
else if trash=false {
	if instance_exists(ob_event) {
		if mouse_x>=x+4 and mouse_y>=y+4 and mouse_x<x+sprite_width-4 and mouse_y<y+sprite_height-4 { var var_event_alpha=1; }
		else { var var_event_alpha=0.5; }
		//
		if ob_event.event_kind!=ob_main.ref_event_tribute or ob_event.event_space_id[1]!=id {
			draw_sprite_general(sp_sheet,0,16*(1+ob_event.event_kind*2),16*15,26,26,x+16,y+26,1,1,0,c_white,c_white,c_white,c_white,var_event_alpha);
		}
		//
		if ob_event.event_kind=ob_main.ref_event_glyph {
			draw_sprite_general(sp_sheet,0,16*(ob_event.glyph_add_id+1),16*6,12,11,x+41,y+4,1,1,0,c_white,c_white,c_white,c_white,var_event_alpha);
		}
	}
	//
	draw_sprite_general(sp_sheet,0,16*33+4,16*0,sprite_width,sprite_height,x,y,1,1,0,c_white,c_white,c_white,c_white,1);
	if effect_use>0 { draw_sprite_general(sp_sheet,0,16*33+4,16*5,sprite_width,sprite_height,x,y,1,1,0,c_white,c_white,c_white,c_white,effect_use); }
	//
	var i=0, var_berries_total;
	var_berries_total[0]=berries_total_type[0];
	var_berries_total[1]=berries_total_type[1];
	var_berries_total[2]=berries_total_type[2];
	var_berries_total[3]=berries_total_type[3];
	repeat (berries_total) {
		var ii=0, berry_drawn=false;
		do {
			if var_berries_total[ii]>0 {
				draw_sprite_general(sp_sheet,0,16*(ii+1),16*4,5,5,x+5+6*i,y+70,1,1,0,c_white,c_white,c_white,c_white,1);
				var_berries_total[ii]--;
				berry_drawn=true;
			}
			ii++;
		} until (berry_drawn=true);
		i++;
	}
}