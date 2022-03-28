if !instance_exists(ob_control) and !instance_exists(ob_event) {
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	// MAIN
	var area_sp_x=location_type[roadmap_area], area_sp_y=0;
	if area_sp_x>=6 and area_sp_x<=11 { area_sp_x-=6; area_sp_y=1; }
	else if area_sp_x>=12 and area_sp_x<=16 { area_sp_x-=12; area_sp_y=2; }
	else if area_sp_x>=17 { area_sp_x-=17; area_sp_y=3; }
	//
	sc_drawrectangle(road_win_x-2,road_win_y-2,road_win_x+240,road_win_y+112,c_white,global.color_white,2,0,1,0);
	draw_sprite_general(sp_area,0,240*area_sp_x,112*area_sp_y,240,112,road_win_x,road_win_y,1,1,0,c_white,c_white,c_white,c_white,1);
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	draw_set_font(fn_matchup);
	draw_set_halign(fa_center);
	//
	if event_kind[2][roadmap_area]=-1 {
		var i=0;
		repeat (2) {
			sc_drawrectangle(event_button_x[i],event_button_y[i],event_button_x[i]+42,event_button_y[i]+42,global.color_black,global.color_white,2,0.8,0.5,0);
			draw_sprite_general(sp_sheet,0,16*(1+event_kind[i][roadmap_area]*2),16*13,26,26,event_button_x[i]+9,event_button_y[i]+9,1,1,0,c_white,c_white,c_white,c_white,1);
			sc_drawtext(event_button_x[i]+22,event_button_y[i]+51,event_name[i][roadmap_area],global.color_white,global.color_black,1,1,0,-1);
			i++;
		}
	}
	else {
		var i=0;
		repeat (3) {
			sc_drawrectangle(event_button_x[i],event_button_y[i],event_button_x[i]+42,event_button_y[i]+42,global.color_black,global.color_white,2,0.8,0.5,0);
			draw_sprite_general(sp_sheet,0,16*(1+event_kind[i][roadmap_area]*2),16*13,26,26,event_button_x[i]+9,event_button_y[i]+9,1,1,0,c_white,c_white,c_white,c_white,1);
			sc_drawtext(event_button_x[i]+22,event_button_y[i]+51,event_name[i][roadmap_area],global.color_white,global.color_black,1,1,0,-1);
			i++;
		}
	}
	//
	draw_set_halign(fa_right);
	var money_x=road_win_x+237, money_y=road_win_y+2, money_color=global.color_card_light;
	if effect_money_error>0 { money_x+=irandom_range(-2,2); money_y+=irandom_range(-2,2); money_color=global.color_damage; }
	sc_drawtext(money_x,money_y,"$" + string(money),money_color,global.color_black,1,1,0,-1);
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	draw_set_alpha(1);
	//
	var bar_amount=(roadmap_area*100)/(roadmap_area_max-1);
	draw_healthbar(road_win_x+2,road_win_y-17,road_win_x+237,road_win_y-14,bar_amount,global.color_progress_dark,global.color_progress_light,global.color_progress_light,0,true,false);
	draw_sprite_general(sp_sheet,0,16*1,16*11,16,16,road_win_x-2+(bar_amount*235)/100,road_win_y-24,1,1,0,c_white,c_white,c_white,c_white,1);
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	draw_set_font(fn_m6x11);
	draw_set_halign(fa_center);
	//
	if menu_options_hover=true { var menu_alpha=1; } else { var menu_alpha=0.5; }
	draw_sprite_general(sp_sheet,0,16*7,16*9,16,16,screen_main_x+32,screen_main_y+126,1,1,0,c_white,c_white,c_white,c_white,menu_alpha);
	sc_drawtext(screen_main_x+40,screen_main_y+126+21,"Options",global.color_white,global.color_black,menu_alpha,menu_alpha,0,-1);
	if menu_deck_hover=true { var menu_alpha=1; } else { var menu_alpha=0.5; }
	draw_sprite_general(sp_sheet,0,16*8,16*9,16,16,screen_main_x+cam_w-48,screen_main_y+126,1,1,0,c_white,c_white,c_white,c_white,menu_alpha);
	sc_drawtext(screen_main_x+cam_w-39,screen_main_y+126+21,"Deck",global.color_white,global.color_black,menu_alpha,menu_alpha,0,-1);
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	// OPTIONS
	if menu_back_options_hover=true { var menu_alpha=1; } else { var menu_alpha=0.5; }
	draw_sprite_general(sp_sheet,0,16*8,16*9,16,16,screen_options_x+cam_w-32,screen_main_y+136,1,1,0,c_white,c_white,c_white,c_white,menu_alpha);
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	// DECK
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	if menu_back_deck_hover=true { var menu_alpha=1; } else { var menu_alpha=0.5; }
	draw_sprite_general(sp_sheet,0,16*7,16*9,16,16,screen_deck_x+16,screen_main_y+136,1,1,0,c_white,c_white,c_white,c_white,menu_alpha);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if fade_black>0 {
	sc_drawrectangle(-2,-2,room_width+2,room_height+2,global.color_black,c_white,0,fade_black,1,0);
}
//
//if textbox_active=true { sc_drawrectangle(screen_main_x+4,screen_main_y+cam_h-52,screen_main_x+cam_w-6,screen_main_y+cam_h-6,c_black,c_white,1,0.5,1,1); }
//if text_string!="" { sc_drawtext(screen_main_x+12,screen_main_y+cam_h-48,text_show,c_white,c_black,1,0.5,0,233); }
//————————————————————————————————————————————————————————————————————————————————————————————————————
if event_transition=ref_event_victory or event_transition=ref_event_defeat {
	draw_set_halign(fa_center);
	//
	if event_transition=ref_event_victory {
		draw_set_font(fn_m6x11_large);
		sc_drawtext(screen_main_x+cam_w/2,screen_main_y+cam_h/2-17,"VICTORY",global.color_player,global.color_black,1,1,0,-1);
		draw_set_font(fn_matchup);
		sc_drawtext(screen_main_x+cam_w/2,screen_main_y+cam_h/2+5,"Received $" + string(money_add),global.color_card_light,global.color_black,1,1,0,-1);
	}
	else if event_transition=ref_event_defeat {
		draw_set_font(fn_m6x11_large);
		sc_drawtext(screen_main_x+cam_w/2,screen_main_y+cam_h/2-10,"DEFEAT",global.color_enemy,global.color_black,1,1,0,-1);
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if cursor_hide=false { var mouse_alpha=1; } else { var mouse_alpha=0.5; }
draw_sprite_general(sp_sheet,0,16*(mouse_cursor+1),16*0,16,16,mouse_x-5,mouse_y-5,1,1,0,c_white,c_white,c_white,c_white,mouse_alpha);