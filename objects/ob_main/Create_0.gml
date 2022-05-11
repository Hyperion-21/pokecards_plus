randomize(); //random seed
#macro game_name "Pocket Crystal League"
#macro game_version "v0.0.0.106"
window_set_caption(game_name);
//————————————————————————————————————————————————————————————————————————————————————————————————————
depth=-2000;
//
#macro screen_options_x 0
#macro screen_main_x 512
#macro screen_deck_x 1024
x=screen_main_x;
//
#macro screen_main_y 0
y=screen_main_y;
//
#macro road_win_x screen_main_x+136
#macro road_win_y screen_main_y+97
//
view_set_visible(view_camera[0],true);
view_set_xport(view_camera[0],0);
view_set_yport(view_camera[0],0);
view_set_wport(view_camera[0],512);
view_set_hport(view_camera[0],288);
camera_set_view_pos(view_camera[0],x,y);
camera_set_view_size(view_camera[0],512,288);
//camera_set_view_target(view_camera[0],ob_main);
//camera_set_view_border(view_camera[0],-1,-1);
//camera_set_view_speed(view_camera[0],-1,-1);
//
#macro cam_w camera_get_view_width(view_camera[0])
#macro cam_h camera_get_view_height(view_camera[0])
//
surface_resize(application_surface,cam_w,cam_h);
//————————————————————————————————————————————————————————————————————————————————————————————————————
mouse_cursor=0;
cursor_hide=false;
screen_transition=-1;
auto_deck_transition=false;
moving_hud=0;
type_chart=false;
type_chart_toggle=false;
credits_screen=false;
credits_screen_toggle=false;
ending_screen=false;
ending_static_timer=-1;
//
#macro area_zone_max 9
#macro roadmap_full_max 35 //save/load, needs to be bigger than the rest (and their sum, just in case)
roadmap_current_max=0;
roadmap_road_max=16;
roadmap_outskirts_max=8;
roadmap_league_max=5;
roadmap_lab_max=3;
//
roadmap_get_details=true;
zone_name="";
event_transition=-1; //same as events, 300 victory, 301 defeat, 999 main menu
event_transition_standby=-1;
fade_black=0;
fade_black_exit=0;
fade_red_delete=0;
//
menu_options_hover=false;
menu_deck_hover=false;
menu_back_options_hover=false;
menu_back_deck_hover=false;
//
card_level_player_limit=0;
card_level_spawn_limit=0;
card_level_enemy_min=0;
card_level_enemy_limit=0;
//
maindeck_size_max=0;
enemy_maindeck_size=0;
//
playing_gym=false;
playing_elite=false;
playing_champion=false;
playing_tutorial=false;
//————————————————————————————————————————————————————————————————————————————————————————————————————
#macro textbox_total 10
for (var i=0; i<=textbox_total; i++;) { //<= so that an extra empty one is created
	textbox_string[i]="";
}
textbox_show="";
textbox_current=0;
textbox_timer=0;
textbox_timer_max=1;
textbox_char_pos=0;
//————————————————————————————————————————————————————————————————————————————————————————————————————
#macro normal_poke_id_max 251 //normal (non-secret and non-environment) poke cards
#macro secret_cards_total 2
#macro environment_cards_total 3
//
#macro deck_setup_max 5 //0: current (always), 1-5: saved setups
#macro maindeck_total_max 2000
#macro berrydeck_total_max 200 //per berry
//
#macro money_add_base 100 //100 150 200 250 300 350 400 450 500 (penalty: 20-500)
#macro money_add_area_bonus 50
#macro money_payout_base 80 //80 120 160 200 240 280 320 360 400 (penalty: 0/10-400)
#macro money_payout_area_bonus 40
#macro money_penalty_multiplier 10
#macro sell_value_multiplier 5
#macro tutorial_payout 800
//
battle_hp[0]=5; //10
battle_hp[1]=15; //30
battle_hp[2]=25; //50
battle_hp[3]=35; //70
battle_hp[4]=50; //100
battle_hp[5]=75; //150
battle_hp[6]=100; //200
battle_hp[7]=125; //250
battle_hp[8]=150; //300
battle_hp[9]=200; //400
//
money_show=0;
money_prize=0;
money_prize_min=0;
money_prize_max=0;
money_payout=0;
effect_money_error=0;
event_cost_standby=0;
#macro ref_event_battle 0
#macro ref_event_payout 1
#macro ref_event_freecard 2
#macro ref_event_cardpack 3
#macro ref_event_berry 4
#macro ref_event_levelup 5
#macro ref_event_evolution 6
#macro ref_event_glyph 7
#macro ref_event_tribute 8
#macro ref_event_loop 9
#macro ref_event_grass 100
#macro ref_event_fire 101
#macro ref_event_water 102
#macro ref_event_gymbattle 200
#macro ref_event_elitebattle 210
#macro ref_event_championbattle 220
#macro ref_event_tutorial 250
#macro ref_event_victory 300 //only for transitions
#macro ref_event_defeat 301 //only for transitions
#macro ref_event_exitbattle 302 //only for transitions
#macro ref_fly_prev 400 //only for transitions
#macro ref_fly_next 401 //only for transitions
#macro ref_mainmenu 999 //only for transitions
//
for (var i=0; i<=999; i++;) {
	event_cost[i]=0;
}
event_cost[ref_event_cardpack]=500;
event_cost[ref_event_berry]=100;
event_cost[ref_event_levelup]=100;
#macro levelup_cost_multiplier 50 //100 150 200 250 300 350 400 450 500
event_cost[ref_event_evolution]=800;
event_cost[ref_event_glyph]=500;
//
#macro innate_max 4 //failure chance uses manual values in ob_event, enemy innate uses manual values in ob_card, sc_enemy_deck uses manual values
current_glyph_add=-1;
tooltip_text="";
tooltip_lines=0;
//————————————————————————————————————————————————————————————————————————————————————————————————————
#macro glyph_common_amount 17
//
#macro ref_glyph_lucky 00
#macro ref_glyph_harvest 01
#macro ref_glyph_debilitate 02
#macro ref_glyph_ruthless 03
#macro ref_glyph_courage 04
#macro ref_glyph_piercing 05
#macro ref_glyph_counter 06
#macro ref_glyph_shield 07
#macro ref_glyph_medic 08
#macro ref_glyph_tenacity 09
#macro ref_glyph_bulwark 10
#macro ref_glyph_fork 11
#macro ref_glyph_vampire 12
#macro ref_glyph_curse 13
#macro ref_glyph_memento 14
#macro ref_glyph_berserk 15
#macro ref_glyph_adaptability 16
//
#macro ref_glyph_mist 17
#macro ref_glyph_transform 18
//————————————————————————————————————————————————————————————————————————————————————————————————————
#macro options_total 10
#macro playericon_max 15
//
#macro opt_fullscreen 0
#macro opt_vsync 1
#macro opt_filter 2
#macro opt_scaling 3
#macro opt_music 4
#macro opt_sound 5
#macro opt_autodeck 6
#macro opt_playericon 7
#macro opt_edge 8
#macro opt_bg_type 9
//
for (var i=0; i<options_total; i++;) {
	if i=opt_fullscreen { option_name[i]="Fullscreen: "; }
	else if i=opt_vsync { option_name[i]="Vertical Synchronization: "; }
	else if i=opt_filter { option_name[i]="Pixel Interpolation: "; }
	else if i=opt_scaling { option_name[i]="Window Scaling: "; }
	else if i=opt_music { option_name[i]="Music: "; }
	else if i=opt_sound { option_name[i]="Sound Effects: "; }
	else if i=opt_autodeck { option_name[i]="New Cards: "; }
	else if i=opt_playericon { option_name[i]="Player Icon: "; }
	else if i=opt_edge { option_name[i]="Edge Shading: "; }
	else if i=opt_bg_type { option_name[i]="Battle Background Style: "; }
	//
	option_x[i]=21;
	option_y[i]=18+20*i;
	option_focus[i]=false;
	option_state_text[i]="";
}
//
#macro colorsetup_total 4
#macro bg_rgb_divisor 2
//
#macro opt_bg_a 0
#macro opt_bg_b 1
#macro opt_bg_tile 2
#macro opt_c_char 3
//
for (var i=0; i<colorsetup_total; i++;) {
	if i=opt_bg_a { colorsetup_name[i]="Battle Background Color A: "; }
	else if i=opt_bg_b { colorsetup_name[i]="Battle Background Color B: "; }
	else if i=opt_bg_tile { colorsetup_name[i]="Battle Background Color C: "; }
	else if i=opt_c_char { colorsetup_name[i]="Character Color: "; }
	//
	colorsetup_main_x[i]=21;
	colorsetup_r_x[i]=colorsetup_main_x[i]+166;
	colorsetup_g_x[i]=colorsetup_r_x[i]+38;
	colorsetup_b_x[i]=colorsetup_g_x[i]+38;
	colorsetup_y[i]=18+13*i+20*options_total;
	colorsetup_focus_r[i]=false;
	colorsetup_focus_g[i]=false;
	colorsetup_focus_b[i]=false;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
instance_create_layer(screen_main_x,screen_main_y,"instances",ob_splash);
instance_create_layer(screen_main_x,screen_main_y,"instances",ob_background);
//
var i=0;
repeat (18) {
	var ii=0;
	repeat (5) {
		instance_create_layer(screen_main_x+i*32,screen_main_y+ii*64+(i mod 2)*32,"instances",ob_background_tile);
		ii++;
	}
	i++;
}
var i=0;
repeat (8) {
	var card_splash_id=instance_create_layer(screen_main_x+i*85,screen_main_y+104,"instances",ob_card_splash);
	card_splash_id.beat_direction=i mod 2;
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
#macro config_file "config.sav"
#macro data_file "data.sav"
sc_config_load();
sc_config_save();
sc_data_load();
sc_data_save();
//————————————————————————————————————————————————————————————————————————————————————————————————————
music_player=sc_playsound(ms_main,100,true,true);
music_beat_margin=0;
button_exit_game=-1;
button_reset_config=-1;
button_delete_data=-1;
//————————————————————————————————————————————————————————————————————————————————————————————————————
global.color_white=make_colour_rgb(230,230,230);
global.color_black=make_colour_rgb(40,40,40);
global.color_gray=make_colour_rgb(190,190,190);
global.color_card_light=make_colour_rgb(233,230,222);
global.color_card_mid=make_colour_rgb(205,198,181);
//global.color_card_gold=make_colour_rgb(226,204,161);
global.color_friendly=make_colour_rgb(160,193,225);
global.color_enemy=make_colour_rgb(221,172,159);
global.color_fullhp=make_colour_rgb(176,223,159);
global.color_damage=make_colour_rgb(225,168,160);
global.color_direct_damage=make_colour_rgb(205,162,227);
global.color_roadmap_bar_back=make_colour_rgb(91,88,80);
global.color_background_a=make_colour_rgb(colorsetup_r[opt_bg_a]/bg_rgb_divisor,colorsetup_g[opt_bg_a]/bg_rgb_divisor,colorsetup_b[opt_bg_a]/bg_rgb_divisor);
global.color_background_b=make_colour_rgb(colorsetup_r[opt_bg_b]/bg_rgb_divisor,colorsetup_g[opt_bg_b]/bg_rgb_divisor,colorsetup_b[opt_bg_b]/bg_rgb_divisor);
global.color_background_tile=make_colour_rgb(colorsetup_r[opt_bg_tile]/bg_rgb_divisor,colorsetup_g[opt_bg_tile]/bg_rgb_divisor,colorsetup_b[opt_bg_tile]/bg_rgb_divisor);
global.color_character=make_colour_rgb(colorsetup_r[opt_c_char],colorsetup_g[opt_c_char],colorsetup_b[opt_c_char]);
//
var progress_r=colorsetup_r[opt_c_char]*1.2, progress_g=colorsetup_g[opt_c_char]*1.2, progress_b=colorsetup_b[opt_c_char]*1.2;
if progress_r>255 { progress_r=255; }
if progress_g>255 { progress_g=255; }
if progress_b>255 { progress_b=255; }
global.color_character_light=make_colour_rgb(progress_r,progress_g,progress_b);
