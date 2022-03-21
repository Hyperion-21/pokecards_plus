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
sc_drawtext(scoreboard_x+16+player_hp_draw_x,scoreboard_y+9+player_hp_draw_y,string(player_hp),global.color_player,global.color_black,1,0.5,0,-1);
sc_drawtext(scoreboard_x+34,scoreboard_y+9,"/",global.color_white,global.color_black,1,0.5,0,-1);
sc_drawtext(scoreboard_x+52+enemy_hp_draw_x,scoreboard_y+9+enemy_hp_draw_y,string(enemy_hp),global.color_enemy,global.color_black,1,0.5,0,-1);
//
var bar_amount=((player_hp)*100)/(hp_max*2);
draw_healthbar(scoreboard_x+2,scoreboard_y+2,scoreboard_x+65,scoreboard_y+5,bar_amount,global.color_enemy,global.color_player,global.color_player,0,true,false);
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
if battler_turn=2 {
	var_message="(Adversary's turn)";
	var_message_color=global.color_enemy;
}
else if first_turn_attack_warning=true {
	var_message="You can't attack on your first turn.";
	var_message_color=global.color_damage;
}
else if (card_draw_points>0 and card_hand_total=card_hand_max) or hand_full_draw_warning=true {
	var_message="You can't hold more than " + string(card_hand_max) + " cards in your hand. Discard or play one to draw more.";
	var_message_color=global.color_damage;
}
else if card_draw_points>0 {
	var_message="You may draw cards. You have " + string(card_draw_points) + " DP (Draw Points) remaining.";
	var_message_color=global.color_player;
}
//
if tooltip_timer>0 and var_message!="" {
	var tooltip_alpha=(tooltip_timer*100/tooltip_timer_max)/100;
	sc_drawrectangle(cam_x+cam_w/2-string_width(var_message)/2-5,cam_y+219,cam_x+cam_w/2+string_width(var_message)/2+3,cam_y+230,
	global.color_black,global.color_black,1,tooltip_alpha*0.8,tooltip_alpha,0);
	sc_drawtext(cam_x+cam_w/2,cam_y+218,var_message,var_message_color,global.color_black,tooltip_alpha*2,tooltip_alpha/2,0,-1);
}
//
draw_set_halign(fa_center);
if card_draw_points>=card_drawcost_berry and card_berrydeck_total>0 {
	sc_drawrectangle(cam_x+26,cam_y+188,cam_x+50,cam_y+209,global.color_black,global.color_black,1,0.5,1,0);
	sc_drawtext(cam_x+39,cam_y+187,"Berry",global.color_player,global.color_black,1,0.5,0,-1);
	sc_drawtext(cam_x+39,cam_y+197,string(card_drawcost_berry) + " DP",global.color_player,global.color_black,1,0.5,0,-1);
}
if card_draw_points>=card_drawcost_main and card_maindeck_total>0 {
	sc_drawrectangle(cam_x+cam_w-50,cam_y+188,cam_x+cam_w-28,cam_y+209,global.color_black,global.color_black,1,0.5,1,0);
	sc_drawtext(cam_x+cam_w-38,cam_y+187,"Main",global.color_player,global.color_black,1,0.5,0,-1);
	sc_drawtext(cam_x+cam_w-38,cam_y+197,string(card_drawcost_main) + " DP",global.color_player,global.color_black,1,0.5,0,-1);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
var dpboard_x=cam_x+cam_w-39;
var dpboard_y=button_nextturn_id.y+3;
//
draw_set_halign(fa_right);
sc_drawrectangle(dpboard_x,dpboard_y,dpboard_x+26,dpboard_y+15,global.color_black,global.color_white,1,0.25,0.5,0);
sc_drawtext(dpboard_x+9,dpboard_y+1,string(card_draw_points),global.color_white,global.color_black,1,1,0,-1);
draw_sprite_general(sp_sheet,0,16*2,16*12,16,16,dpboard_x+9,dpboard_y,1,1,0,c_white,c_white,c_white,c_white,1);
//————————————————————————————————————————————————————————————————————————————————————————————————————
//ob_control & ob_deckbuild
if tooltip_text!="" {
	draw_set_font(fn_m3x6);
	if mouse_x+17+string_width(tooltip_text)<cam_x+cam_w {
		draw_set_halign(fa_left);
		sc_drawrectangle(mouse_x+9,mouse_y-4,mouse_x+18+string_width(tooltip_text),mouse_y+12,global.color_black,global.color_white,1,0.8,1,0);
		sc_drawtext(mouse_x+15,mouse_y-2,tooltip_text,global.color_white,global.color_black,1,0.5,0,-1);
	}
	else {
		draw_set_halign(fa_right);
		sc_drawrectangle(mouse_x-14-string_width(tooltip_text),mouse_y-4,mouse_x-5,mouse_y+12,global.color_black,global.color_white,1,0.8,1,0);
		sc_drawtext(mouse_x-8,mouse_y-2,tooltip_text,global.color_white,global.color_black,1,0.5,0,-1);
	}
}
tooltip_text="";
//————————————————————————————————————————————————————————————————————————————————————————————————————
if AI_report_toggle=true {
	draw_set_halign(fa_left);
	sc_drawrectangle(cam_x-2,cam_y-2,cam_x+cam_w+2,cam_y+cam_h+2,c_black,c_black,0,0.4,1,0);
	sc_drawtext(cam_x+4,cam_y,AI_report,c_aqua,c_black,1,0.5,0,-1);
}