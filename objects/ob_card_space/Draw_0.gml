if trash=true {
	draw_sprite_general(sp_sheet,0,16*37+4,16*0,sprite_width,sprite_height,x,y,1,1,0,c_white,c_white,c_white,c_white,0.5);
}
else if trash=false {
	if instance_exists(ob_event) {
		if mouse_x>=x+4 and mouse_y>=y+4 and mouse_x<x+sprite_width-4 and mouse_y<y+sprite_height-4 { var var_event_alpha=1; }
		else { var var_event_alpha=0.5; }
		//
		if ob_event.event_kind!=ref_event_tribute or ob_event.event_space_id[1]!=id {
			draw_sprite_general(sp_sheet,0,16*(1+ob_event.event_kind*2),16*15,26,26,x+16,y+26,1,1,0,c_white,c_white,c_white,c_white,var_event_alpha);
		}
		//
		if ob_event.event_kind=ref_event_levelup {
			draw_set_font(fn_matchup);
			draw_set_halign(fa_center);
			if occupy_id!=-1 and occupy_id.card_level<ob_main.card_level_player_limit and occupy_id.card_innate>0 and ob_main.event_cost_standby_levelup>0 {
				if ob_main.money-ob_main.event_cost_standby>=ob_main.event_cost_standby_levelup { var money_color=global.color_card_light; }
				else { var money_color=global.color_damage; }
				sc_drawtext(x+28,y-34,"Cost: $" + string(ob_main.event_cost_standby_levelup) + " / $" + string(ob_main.money-ob_main.event_cost_standby),
				money_color,global.color_black,1,1,0,-1);
				//
				with (occupy_id) {
					ob_event.levelup_new_hp=sc_card_level_stats_main(0,card_level+1);
					ob_event.levelup_new_atk=sc_card_level_stats_main(1,card_level+1);
					ob_event.levelup_new_def=sc_card_level_stats_main(2,card_level+1);
				}
				var hp_diff=ob_event.levelup_new_hp-occupy_id.card_full_hp;
				var atk_diff=ob_event.levelup_new_atk-occupy_id.card_full_atk;
				var def_diff=ob_event.levelup_new_def-occupy_id.card_full_def;
				//
				var levelup_info_text="+" + string(hp_diff) + " HP / +" + string(atk_diff) + " ATK / +" + string(def_diff) + " DEF";
				sc_drawtext(x+28,y-20,levelup_info_text,global.color_card_mid,global.color_black,1,1,0,-1);
			}
		}
		//
		if ob_event.event_kind=ref_event_glyph {
			draw_sprite_general(sp_sheet,0,16*(ob_event.glyph_add_id+1),16*6,12,11,x+41,y+4,1,1,0,c_white,c_white,c_white,c_white,var_event_alpha);
		}
	}
	//
	draw_sprite_general(sp_sheet,0,16*33+4,16*0,sprite_width,sprite_height,x,y,1,1,0,
	global.color_background_tile,global.color_background_tile,global.color_background_tile,global.color_background_tile,1);
	draw_sprite_general(sp_sheet,0,16*33+4,16*0,sprite_width,sprite_height,x,y,1,1,0,c_white,c_white,c_white,c_white,0.4); //to lighten color
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