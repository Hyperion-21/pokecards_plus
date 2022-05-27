cam_x=camera_get_view_x(view_camera[0]);
cam_y=camera_get_view_y(view_camera[0]);
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_set_alpha(1);
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_set_font(fn_m6x11);
//
if player_effect_damaged>0 { var player_hp_draw_x=irandom_range(-2,2), player_hp_draw_y=irandom_range(-2,2); }
else { var player_hp_draw_x=0, player_hp_draw_y=0; }
if enemy_effect_damaged>0 { var enemy_hp_draw_x=irandom_range(-2,2), enemy_hp_draw_y=irandom_range(-2,2); }
else { var enemy_hp_draw_x=0, enemy_hp_draw_y=0; }
//
var scoreboard_x=cam_x+cam_w-78;
var scoreboard_y=button_nextturn_id.y-31;
//
sc_drawrectangle(scoreboard_x,scoreboard_y,scoreboard_x+67,scoreboard_y+25,global.color_black,global.color_white,1,0.5,1,0);
draw_set_halign(fa_center);
sc_drawtext(scoreboard_x+16+player_hp_draw_x,scoreboard_y+9+player_hp_draw_y,string(player_hp),global.color_friendly,global.color_black,1,0.5,0,-1);
sc_drawtext(scoreboard_x+34,scoreboard_y+9,"/",global.color_white,global.color_black,1,0.5,0,-1);
sc_drawtext(scoreboard_x+52+enemy_hp_draw_x,scoreboard_y+9+enemy_hp_draw_y,string(enemy_hp),global.color_enemy,global.color_black,1,0.5,0,-1);
//
var bar_amount=((player_hp)*100)/(hp_max*2);
draw_healthbar(scoreboard_x+2,scoreboard_y+2,scoreboard_x+65,scoreboard_y+5,bar_amount,global.color_enemy,global.color_friendly,global.color_friendly,0,true,false);
//————————————————————————————————————————————————————————————————————————————————————————————————————
var trainer_sprite=ob_main.trainer_sprite[ob_main.roadmap_area];
var trainer_skin=ob_main.trainer_skin[ob_main.roadmap_area];
var trainer_color=ob_main.trainer_hair_color[ob_main.roadmap_area];
var player_icon=ob_main.option_state[opt_playericon];
//
if trainer_sprite<=playericon_max {
	draw_sprite_general(sp_sheet,0,16*((trainer_sprite mod 2)+1),16*(11+trainer_skin),16,16,scoreboard_x+44,scoreboard_y-17,1,1,0,c_white,c_white,c_white,c_white,1);
	draw_sprite_general(sp_sheet,0,16*(trainer_sprite+3),16*11,16,16,scoreboard_x+44,scoreboard_y-17,1,1,0,trainer_color,trainer_color,trainer_color,trainer_color,1);
	draw_sprite_general(sp_sheet,0,16*(trainer_sprite+3),16*12,16,16,scoreboard_x+44,scoreboard_y-17,1,1,0,c_white,c_white,c_white,c_white,1);
}
else {
	draw_sprite_general(sp_sheet,0,16*(trainer_sprite+3),16*11,16,16,scoreboard_x+44,scoreboard_y-17,1,1,0,c_white,c_white,c_white,c_white,1);
}
//
draw_sprite_general(sp_sheet,0,16*((player_icon mod 2)+1),16*11,16,16,scoreboard_x+8,scoreboard_y-17,1,1,0,c_white,c_white,c_white,c_white,1);
draw_sprite_general(sp_sheet,0,16*(player_icon+3),16*11,16,16,scoreboard_x+8,scoreboard_y-17,1,1,0,
global.color_character,global.color_character,global.color_character,global.color_character,1);
draw_sprite_general(sp_sheet,0,16*(player_icon+3),16*12,16,16,scoreboard_x+8,scoreboard_y-17,1,1,0,c_white,c_white,c_white,c_white,1);
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_set_font(fn_m3x6);
//
draw_set_halign(fa_left);
var var_text=string(card_berrydeck_total) + "x Berry Deck";
sc_drawrectangle(cam_x+10,cam_y+cam_h-20,cam_x+14+string_width(var_text),cam_y+cam_h-9,global.color_black,global.color_black,1,0.5,1,0);
sc_drawtext(cam_x+13,cam_y+cam_h-21,var_text,global.color_white,c_black,0.1,0,0,-1);
//
draw_set_halign(fa_right);
var var_text=string(card_maindeck_total) + "x Main Deck";
sc_drawrectangle(cam_x+cam_w-15-string_width(var_text),cam_y+cam_h-20,cam_x+cam_w-11,cam_y+cam_h-9,global.color_black,global.color_black,1,0.5,1,0);
sc_drawtext(cam_x+cam_w-12,cam_y+cam_h-21,var_text,global.color_white,c_black,0.1,0,0,-1);
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_set_halign(fa_center);
var var_message="", var_message_color=c_white;
//
if first_turn_attack_warning=true {
	var_message="You can't attack on your first turn.";
	var_message_color=global.color_damage;
}
else if (card_draw_points>0 and card_hand_total=card_hand_max) or hand_full_draw_warning=true {
	var_message="You can't hold more than " + string(card_hand_max) + " cards in your hand. Discard or play one to draw more.";
	var_message_color=global.color_damage;
}
else if card_draw_points>0 {
	var_message="You may draw cards. You have " + string(card_draw_points) + " DP (Draw Points) remaining.";
	var_message_color=global.color_friendly;
}
//
if tooltip_timer>0 and var_message!="" {
	var tooltip_alpha=(tooltip_timer*100/tooltip_timer_max)/100;
	sc_drawrectangle(cam_x+cam_w/2-string_width(var_message)/2-5,cam_y+219,cam_x+cam_w/2+string_width(var_message)/2+3,cam_y+230,
	global.color_black,global.color_black,1,tooltip_alpha*0.8,tooltip_alpha,0); //same alpha as turn splash
	sc_drawtext(cam_x+cam_w/2,cam_y+218,var_message,var_message_color,global.color_black,tooltip_alpha*2,tooltip_alpha/2,0,-1);
}
//
draw_set_halign(fa_center);
if card_draw_points>=card_drawcost_berry and card_berrydeck_total>0 {
	sc_drawrectangle(cam_x+26,cam_y+188,cam_x+50,cam_y+209,global.color_black,global.color_black,1,0.25,0.5,0);
	sc_drawtext(cam_x+39,cam_y+187,"Berry",global.color_character_light,global.color_black,0.9,0.5,0,-1);
	sc_drawtext(cam_x+39,cam_y+197,string(card_drawcost_berry) + " DP",global.color_character_light,global.color_black,0.9,0.5,0,-1);
}
if card_draw_points>=card_drawcost_main and card_maindeck_total>0 {
	sc_drawrectangle(cam_x+cam_w-50,cam_y+188,cam_x+cam_w-28,cam_y+209,global.color_black,global.color_black,1,0.25,0.5,0);
	sc_drawtext(cam_x+cam_w-38,cam_y+187,"Main",global.color_character_light,global.color_black,0.9,0.5,0,-1);
	sc_drawtext(cam_x+cam_w-38,cam_y+197,string(card_drawcost_main) + " DP",global.color_character_light,global.color_black,0.9,0.5,0,-1);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
var dpboard_x=cam_x+cam_w-39;
var dpboard_y=button_nextturn_id.y+3;
//
draw_set_halign(fa_right);
sc_drawrectangle(dpboard_x,dpboard_y,dpboard_x+26,dpboard_y+15,global.color_black,global.color_white,1,0.25,0.5,0);
sc_drawtext(dpboard_x+9,dpboard_y+1,string(card_draw_points),global.color_white,global.color_black,1,1,0,-1);
draw_sprite_general(sp_sheet,0,16*3,16*15,16,16,dpboard_x+9,dpboard_y,1,1,0,c_white,c_white,c_white,c_white,1);
//————————————————————————————————————————————————————————————————————————————————————————————————————
if card_focus!=-1 and card_focus.card_cat=0 and card_focus_hand!=-1 and card_hold=-1 {
	draw_set_halign(fa_center);
	draw_set_font(fn_m3x6);
	//
	for (var i=0; i<=4; i++;) {
		//IMAGINARY DAMAGE CALCULATION (similar code in AI_play_plan)
		if card_space_id[i].occupy_id!=-1 {
			//intentionally omitting glyph: transform (Ditto only)
			var bonus_dmg=false, vs_bonus_dmg=false;
			if card_focus.card_environment=false {
				bonus_dmg=sc_type_bonus(card_focus.card_type_a,card_focus.card_type_b,card_space_id[i].occupy_id.card_type_a,card_space_id[i].occupy_id.card_type_b); }
			if card_space_id[i].occupy_id.card_environment=false {
				vs_bonus_dmg=sc_type_bonus(card_space_id[i].occupy_id.card_type_a,card_space_id[i].occupy_id.card_type_b,card_focus.card_type_a,card_focus.card_type_b); }
			//
			var own_atk=card_focus.card_atk+card_space_id[i+5].card_bonus_atk-card_space_id[i+5].card_penalty_atk;
			var own_def=card_focus.card_def+card_space_id[i+5].card_bonus_def-card_space_id[i+5].card_penalty_def;
			if own_atk<0 { own_atk=0; }
			if own_def<0 { own_def=0; }
			//
			var imaginary_penalty_atk=0, imaginary_penalty_def=0;
			if sc_glyph_check(card_focus,ref_glyph_debilitate,true) { imaginary_penalty_atk=1; } //glyph: debilitate
			if sc_glyph_check(card_focus,ref_glyph_ruthless,true) { imaginary_penalty_def=2; } //glyph: ruthless
			//
			var vs_atk=card_space_id[i].occupy_id.card_atk-imaginary_penalty_atk;
			var vs_def=card_space_id[i].occupy_id.card_def-imaginary_penalty_def;
			if vs_atk<0 { vs_atk=0; }
			if vs_def<0 { vs_def=0; }
			//
			var damage_preview=own_atk-vs_def;
			if damage_preview<0 { damage_preview=0; }
			//
			var bonus_damage_preview=0;
			if bonus_dmg=true {
				bonus_damage_preview=ceil(card_focus.card_level/advantage_level_interval);
				if sc_glyph_check(card_focus,ref_glyph_adaptability,true) { bonus_damage_preview+=2; } //glyph: adaptability
			}
			//
			var damage_preview_text="";
			if sc_glyph_check(card_focus,ref_glyph_transform,true) or sc_glyph_check(card_space_id[i].occupy_id,ref_glyph_transform,true) { //glyph: transform (Ditto only)
				damage_preview_text="?";
			}
			else if sc_glyph_check(card_focus,ref_glyph_fork,true) { //glyph: fork attack
				if bonus_damage_preview=0 { damage_preview_text="+0"; }
				else { damage_preview_text="+" + string(bonus_damage_preview); }
			}
			else {
				if bonus_damage_preview=0 { damage_preview_text=string(damage_preview); }
				else { damage_preview_text=string(damage_preview) + "+" + string(bonus_damage_preview); }
			}
			if !sc_glyph_check(card_focus,ref_glyph_piercing,true) { //glyph: piercing attack (if not)
				draw_sprite_general(sp_sheet,0,16*11,16*9,24,16,card_space_id[i].x+8,card_space_id[i].y+75,1,1,0,c_white,c_white,c_white,c_white,0.8);
				sc_drawtext(card_space_id[i].x+18,card_space_id[i].y+74,damage_preview_text,global.color_friendly,global.color_black,1,1,0,-1);
			}
			//
			var damage_preview=vs_atk-own_def;
			if damage_preview<0 { damage_preview=0; }
			//
			var bonus_damage_preview=0;
			if vs_bonus_dmg=true {
				bonus_damage_preview=ceil(card_space_id[i].occupy_id.card_level/advantage_level_interval);
				if sc_glyph_check(card_space_id[i].occupy_id,ref_glyph_adaptability,true) { bonus_damage_preview+=2; } //glyph: adaptability
			}
			//
			var damage_preview_text="";
			if sc_glyph_check(card_focus,ref_glyph_transform,true) or sc_glyph_check(card_space_id[i].occupy_id,ref_glyph_transform,true) { //glyph: transform (Ditto only)
				damage_preview_text="?";
			}
			else {
				if bonus_damage_preview=0 { damage_preview_text=string(damage_preview); }
				else { damage_preview_text=string(damage_preview) + "+" + string(bonus_damage_preview); }
			}
			draw_sprite_general(sp_sheet,0,16*11,16*10,24,16,card_space_id[i].x+30,card_space_id[i].y+75,1,1,0,c_white,c_white,c_white,c_white,0.8);
			sc_drawtext(card_space_id[i].x+40,card_space_id[i].y+74,damage_preview_text,global.color_damage,global.color_black,1,1,0,-1);
		}
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if turn_splash_timer>0 and battler_turn!=0 {
	draw_set_halign(fa_center);
	draw_set_font(fn_m6x11);
	//
	if battler_turn=1 { var turn_splash_text="Player's Turn", turn_splash_color=global.color_friendly; }
	else if battler_turn=2 { var turn_splash_text="Opponent's Turn", turn_splash_color=global.color_enemy; }
	//
	var turn_splash_alpha=(turn_splash_timer*100/turn_splash_timer_max)/100;
	sc_drawrectangle(cam_x+cam_w/2-string_width(turn_splash_text)/2-5,cam_y+163,cam_x+cam_w/2+string_width(turn_splash_text)/2+3,cam_y+184,
	global.color_black,global.color_black,1,turn_splash_alpha*0.8,turn_splash_alpha,0); //same alpha as tooltip
	sc_drawtext(cam_x+cam_w/2,cam_y+167,turn_splash_text,turn_splash_color,global.color_black,turn_splash_alpha*3,turn_splash_alpha*2,0,-1);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
sc_draw_tooltip_text(cam_x+cam_w);
