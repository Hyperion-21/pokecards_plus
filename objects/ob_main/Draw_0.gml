if !instance_exists(ob_control) and !instance_exists(ob_event) and !instance_exists(ob_splash) {
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	// MAIN
	var area_sp_x=location_type[roadmap_area], area_sp_y=0;
	if area_sp_x>=6 and area_sp_x<=11 { area_sp_x-=6; area_sp_y=1; }
	else if area_sp_x>=12 and area_sp_x<=16 { area_sp_x-=12; area_sp_y=2; }
	else if area_sp_x>=17 { area_sp_x-=17; area_sp_y=3; }
	//
	var rel_hud=ceil(moving_hud);
	//
	sc_drawrectangle(road_win_x-2,road_win_y-2,road_win_x+240,road_win_y+112,c_white,global.color_white,2,0,1,0);
	draw_sprite_general(sp_area,0,240*area_sp_x,112*area_sp_y,240,112,road_win_x,road_win_y,1,1,0,c_white,c_white,c_white,c_white,1);
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	draw_set_font(fn_matchup);
	draw_set_halign(fa_center);
	//
	if event_kind[2][roadmap_area]=-1 { var var_event_num=2; }
	else { var var_event_num=3; }
	//
	var i=0;
	repeat (var_event_num) {
		var event_sprite_x=16*(1+event_kind[i][roadmap_area]*2);
		if event_kind[i][roadmap_area]=ref_event_gymbattle { event_sprite_x=16*(1+13*2); }
		else if event_kind[i][roadmap_area]=ref_event_tutorial { event_sprite_x=16*(1+0*2); }
		else if event_kind[i][roadmap_area]=ref_event_grass { event_sprite_x=16*(1+10*2); }
		else if event_kind[i][roadmap_area]=ref_event_fire { event_sprite_x=16*(1+11*2); }
		else if event_kind[i][roadmap_area]=ref_event_water { event_sprite_x=16*(1+12*2); }
		//
		sc_drawrectangle(event_button_x[i],event_button_y[i],event_button_x[i]+42,event_button_y[i]+42,global.color_black,global.color_white,2,0.8,0.5,0);
		draw_sprite_general(sp_sheet,0,event_sprite_x,16*13,26,27,event_button_x[i]+9,event_button_y[i]+9-rel_hud,1,1,0,c_white,c_white,c_white,c_white,1);
		sc_drawtext(event_button_x[i]+22,event_button_y[i]+51,event_name[i][roadmap_area],global.color_white,global.color_black,1,1,0,-1);
		//
		if event_kind[i][roadmap_area]=ref_event_battle or event_kind[i][roadmap_area]=ref_event_gymbattle or event_kind[i][roadmap_area]=ref_event_tutorial {
			if trainer_sprite[roadmap_area]<=playericon_max {
				draw_sprite_general(sp_sheet,0,16*((trainer_sprite[roadmap_area] mod 2)+1),16*(11+trainer_skin[roadmap_area]),16,16,
				event_button_x[i]+25,event_button_y[i]+27,1,1,0,c_white,c_white,c_white,c_white,1);
				draw_sprite_general(sp_sheet,0,16*(trainer_sprite[roadmap_area]+3),16*11,16,16,event_button_x[i]+25,event_button_y[i]+27,1,1,0,
				trainer_hair_color[roadmap_area],trainer_hair_color[roadmap_area],trainer_hair_color[roadmap_area],trainer_hair_color[roadmap_area],1);
				draw_sprite_general(sp_sheet,0,16*(trainer_sprite[roadmap_area]+3),16*12,16,16,event_button_x[i]+25,event_button_y[i]+27,1,1,0,
				c_white,c_white,c_white,c_white,1);
			}
			else {
				draw_sprite_general(sp_sheet,0,16*(trainer_sprite[roadmap_area]+3),16*11,16,16,event_button_x[i]+25,event_button_y[i]+27,1,1,0,
				c_white,c_white,c_white,c_white,1);
			}
		}
		if event_kind[i][roadmap_area]=ref_event_glyph {
			draw_sprite_general(sp_sheet,0,16*(event_glyph_add[i][roadmap_area]+1),16*6,12,11,event_button_x[i]+29,event_button_y[i]+3,1,1,0,c_white,c_white,c_white,c_white,0.8);
		}
		//
		i++;
	}
	//
	draw_set_halign(fa_right);
	var money_x=road_win_x+237, money_y=road_win_y+2+rel_hud, money_color=global.color_card_light;
	if effect_money_error>0 { money_x+=irandom_range(-2,2); money_y+=irandom_range(-2,2); money_color=global.color_damage; }
	sc_drawtext(money_x,money_y,"$" + string(money_show),money_color,global.color_black,1,1,0,-1);
	//
	draw_set_halign(fa_center);
	var zone_name_text="";
	if roadmap_area=roadmap_current_max-1 or area_zone=area_zone_max-1 or (area_zone=0 and roadmap_area<=2 and zone_first_lap=true) { zone_name_text=zone_name; }
	else if zone_first_lap=true { zone_name_text="Road to: " + zone_name; }
	else if zone_first_lap=false { zone_name_text="Outskirts: " + zone_name; }
	sc_drawtext(road_win_x+120,road_win_y+120,zone_name_text,global.color_white,global.color_black,0.5,0.5,0,-1);
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	draw_set_alpha(1);
	//
	var bar_amount=(roadmap_area*100)/(roadmap_current_max-1);
	draw_healthbar(road_win_x+2,road_win_y-17-rel_hud,road_win_x+237,road_win_y-14-rel_hud,bar_amount,
	global.color_roadmap_bar_back,global.color_roadmap_bar,global.color_roadmap_bar,0,true,false);
	//
	draw_sprite_general(sp_sheet,0,16*4,16*15,16,16,road_win_x-2+(100*228)/100,road_win_y-24-rel_hud,1,1,0,c_white,c_white,c_white,c_white,1);
	draw_sprite_general(sp_sheet,0,16*((option_state[opt_playericon] mod 2)+1),16*11,16,16,road_win_x-2+(bar_amount*228)/100,road_win_y-23-rel_hud,1,1,0,
	c_white,c_white,c_white,c_white,1);
	draw_sprite_general(sp_sheet,0,16*(option_state[opt_playericon]+3),16*11,16,16,road_win_x-2+(bar_amount*228)/100,road_win_y-23-rel_hud,1,1,0,
	global.color_character,global.color_character,global.color_character,global.color_character,1);
	draw_sprite_general(sp_sheet,0,16*(option_state[opt_playericon]+3),16*12,16,16,road_win_x-2+(bar_amount*228)/100,road_win_y-23-rel_hud,1,1,0,c_white,c_white,c_white,c_white,1);
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	draw_set_font(fn_m6x11);
	draw_set_halign(fa_center);
	//
	if menu_options_hover=true { var menu_alpha=1; } else { var menu_alpha=0.5; }
	draw_sprite_general(sp_sheet,0,16*7,16*9,16,16,screen_main_x+32-rel_hud*2,screen_main_y+126,1,1,0,c_white,c_white,c_white,c_white,menu_alpha);
	sc_drawtext(screen_main_x+40-rel_hud*2,screen_main_y+126+21,"Options",global.color_white,global.color_black,menu_alpha,menu_alpha,0,-1);
	if menu_deck_hover=true { var menu_alpha=1; } else { var menu_alpha=0.5; }
	draw_sprite_general(sp_sheet,0,16*8,16*9,16,16,screen_main_x+cam_w-48+rel_hud*2,screen_main_y+126,1,1,0,c_white,c_white,c_white,c_white,menu_alpha);
	sc_drawtext(screen_main_x+cam_w-39+rel_hud*2,screen_main_y+126+21,"Deck",global.color_white,global.color_black,menu_alpha,menu_alpha,0,-1);
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	// OPTIONS
	if menu_back_options_hover=true { var menu_alpha=1; } else { var menu_alpha=0.5; }
	draw_sprite_general(sp_sheet,0,16*8,16*9,16,16,screen_options_x+cam_w-32+rel_hud*2,screen_main_y+136,1,1,0,c_white,c_white,c_white,c_white,menu_alpha);
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	draw_set_font(fn_matchup); //must be the same font as in mouse check for string width
	draw_set_halign(fa_left);
	//
	var i=0;
	repeat (options_total) {
		if option_focus[i]=true { var option_alpha=1; }
		else { var option_alpha=0.5; }
		sc_drawtext(screen_options_x+option_x[i],screen_main_y+option_y[i],option_name[i],global.color_white,global.color_black,option_alpha,option_alpha,0,-1);
		sc_drawtext(screen_options_x+option_x[i]+string_width(option_name[i])+rel_hud*2,screen_main_y+option_y[i],option_state_text[i],
		global.color_white,global.color_black,option_alpha,option_alpha,0,-1);
		if i=opt_playericon {
			draw_sprite_general(sp_sheet,0,16*((option_state[i] mod 2)+1),16*11,16,16,
			screen_options_x+option_x[i]+string_width(option_name[i])+rel_hud*2,screen_main_y+option_y[i]-1,1,1,0,c_white,c_white,c_white,c_white,1);
			draw_sprite_general(sp_sheet,0,16*(option_state[i]+3),16*11,16,16,
			screen_options_x+option_x[i]+string_width(option_name[i])+rel_hud*2,screen_main_y+option_y[i]-1,1,1,0,
			global.color_character,global.color_character,global.color_character,global.color_character,1);
			draw_sprite_general(sp_sheet,0,16*(option_state[i]+3),16*12,16,16,
			screen_options_x+option_x[i]+string_width(option_name[i])+rel_hud*2,screen_main_y+option_y[i]-1,1,1,0,c_white,c_white,c_white,c_white,1);
		}
		i++;
	}
	//
	var i=0;
	repeat (colorsetup_total) {
		sc_drawtext(screen_options_x+colorsetup_main_x[i],screen_main_y+colorsetup_y[i],colorsetup_name[i],
		make_colour_rgb(colorsetup_r[i],colorsetup_g[i],colorsetup_b[i]),global.color_black,1,1,0,-1);
		//
		if colorsetup_focus_r[i]=true { var option_alpha=1; }
		else { var option_alpha=0.5; }
		sc_drawtext(screen_options_x+colorsetup_r_x[i]+rel_hud*2,screen_main_y+colorsetup_y[i],"R " + string(colorsetup_r[i]),
		global.color_white,global.color_black,option_alpha,option_alpha,0,-1);
		//
		if colorsetup_focus_g[i]=true { var option_alpha=1; }
		else { var option_alpha=0.5; }
		sc_drawtext(screen_options_x+colorsetup_g_x[i]+rel_hud*2,screen_main_y+colorsetup_y[i],"G " + string(colorsetup_g[i]),
		global.color_white,global.color_black,option_alpha,option_alpha,0,-1);
		//
		if colorsetup_focus_b[i]=true { var option_alpha=1; }
		else { var option_alpha=0.5; }
		sc_drawtext(screen_options_x+colorsetup_b_x[i]+rel_hud*2,screen_main_y+colorsetup_y[i],"B " + string(colorsetup_b[i]),
		global.color_white,global.color_black,option_alpha,option_alpha,0,-1);
		//
		i++;
	}
	//
	if option_state[opt_bg_type]!=3 { var option_alpha=1; }
	else { var option_alpha=0.5; }
	var bg_preview_x=screen_options_x+355, bg_preview_y=screen_main_y+option_y[opt_bg_type]+5;
	sc_drawrectangle(bg_preview_x-2,bg_preview_y-2,bg_preview_x+96,bg_preview_y+64,global.color_black,c_white,0,option_alpha,0,0);
	draw_sprite_general(sp_back_pixel,0,0,0,1,1,bg_preview_x,bg_preview_y,96,64,0,
	global.color_background_a,global.color_background_b,global.color_background_a,global.color_background_b,option_alpha);
	for (var i=0; i<=2; i+=2;) {
		draw_sprite_ext(sp_back_pixel,0,bg_preview_x+16*0,bg_preview_y+16*i,16,16,0,global.color_background_tile,option_alpha);
		draw_sprite_ext(sp_back_pixel,0,bg_preview_x+16*2,bg_preview_y+16*i,16,16,0,global.color_background_tile,option_alpha);
		draw_sprite_ext(sp_back_pixel,0,bg_preview_x+16*4,bg_preview_y+16*i,16,16,0,global.color_background_tile,option_alpha);
		draw_sprite_ext(sp_back_pixel,0,bg_preview_x+16*1,bg_preview_y+16*(i+1),16,16,0,global.color_background_tile,option_alpha);
		draw_sprite_ext(sp_back_pixel,0,bg_preview_x+16*3,bg_preview_y+16*(i+1),16,16,0,global.color_background_tile,option_alpha);
		draw_sprite_ext(sp_back_pixel,0,bg_preview_x+16*5,bg_preview_y+16*(i+1),16,16,0,global.color_background_tile,option_alpha);
	}
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	// DECK
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	if menu_back_deck_hover=true { var menu_alpha=1; } else { var menu_alpha=0.5; }
	draw_sprite_general(sp_sheet,0,16*7,16*9,16,16,screen_deck_x+16-rel_hud*2,screen_main_y+136,1,1,0,c_white,c_white,c_white,c_white,menu_alpha);
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	// TOOLTIP
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	sc_draw_tooltip_text(screen_main_x+cam_w);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if type_chart=true {
	sc_drawrectangle(-2,-2,room_width+2,room_height+2,global.color_black,c_white,0,0.9,0,0);
	draw_sprite_ext(sp_type_chart,0,camera_get_view_x(view_camera[0])+102,camera_get_view_y(view_camera[0])+26,1,1,0,c_white,1);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if fade_black>0 {
	sc_drawrectangle(-2,-2,room_width+2,room_height+2,global.color_black,c_white,0,fade_black,1,0);
}
if fade_black_exit_battle>0 {
	sc_drawrectangle(-2,-2,room_width+2,room_height+2,global.color_black,c_white,0,fade_black_exit_battle,1,0);
}
//
//if textbox_active=true { sc_drawrectangle(screen_main_x+4,screen_main_y+cam_h-52,screen_main_x+cam_w-6,screen_main_y+cam_h-6,c_black,c_white,1,0.5,1,1); }
//if text_string!="" { sc_drawtext(screen_main_x+12,screen_main_y+cam_h-48,text_show,c_white,c_black,1,0.5,0,233); }
//————————————————————————————————————————————————————————————————————————————————————————————————————
if event_transition=ref_event_victory or event_transition=ref_event_defeat {
	draw_set_halign(fa_center);
	//
	if event_transition=ref_event_victory {
		draw_set_font(fn_m6x11_XL);
		sc_drawtext(screen_main_x+cam_w/2,screen_main_y+cam_h/2-17,"VICTORY",global.color_player,global.color_black,1,1,0,-1);
		draw_set_font(fn_matchup);
		sc_drawtext(screen_main_x+cam_w/2,screen_main_y+cam_h/2+5,"Received $" + string(money_prize),global.color_card_light,global.color_black,1,1,0,-1);
	}
	else if event_transition=ref_event_defeat {
		draw_set_font(fn_m6x11_XL);
		sc_drawtext(screen_main_x+cam_w/2,screen_main_y+cam_h/2-10,"DEFEAT",global.color_enemy,global.color_black,1,1,0,-1);
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_sprite_ext(sp_border_shading,0,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),1,1,0,c_white,option_state[opt_edge]/100);
//————————————————————————————————————————————————————————————————————————————————————————————————————
if cursor_hide=false { var mouse_alpha=1; } else { var mouse_alpha=0.5; }
draw_sprite_general(sp_sheet,0,16*(mouse_cursor+1),16*0,16,16,mouse_x-5,mouse_y-5,1,1,0,c_white,c_white,c_white,c_white,mouse_alpha);