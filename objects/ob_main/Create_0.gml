randomize(); //random seed
game_name="Pocket Crystal League";
game_version="v0.0.0.72";
window_set_caption(game_name);
//————————————————————————————————————————————————————————————————————————————————————————————————————
depth=-2000;
//
screen_options_x=0;
screen_main_x=512;
screen_deck_x=1024;
x=screen_main_x;
//
screen_main_y=0;
y=screen_main_y;
//
road_win_x=screen_main_x+136;
road_win_y=screen_main_y+97;
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
cam_w=camera_get_view_width(view_camera[0]);
cam_h=camera_get_view_height(view_camera[0]);
//
surface_resize(application_surface,cam_w,cam_h);
//————————————————————————————————————————————————————————————————————————————————————————————————————
mouse_cursor=0;
cursor_hide=false;
screen_transition=-1;
auto_deck_transition=false;
moving_hud=0;
//
roadmap_area_max=16;
roadmap_get_details=true;
event_transition=-1; //same as events, 300 victory, 301 defeat, 999 main menu
fade_black=0;
fade_black_exit_battle=0;
//
menu_options_hover=false;
menu_deck_hover=false;
menu_back_options_hover=false;
menu_back_deck_hover=false;
//————————————————————————————————————————————————————————————————————————————————————————————————————
normal_poke_id_max=251; //normal (non-secret and non-environment) poke cards
secret_cards_total=2;
environment_cards_total=3;
//
deck_setup_max=5; //0: current (always), 1-5: saved setups
maindeck_total_max=2000;
berrydeck_total_max=100; //per berry
//
money_add=0;
money_subtract=0;
effect_money_error=0;
ref_event_battle=0;
ref_event_freecard=1;
ref_event_cardpack=2;
ref_event_berry=3;
ref_event_levelup=4;
ref_event_evolution=5;
ref_event_glyph=6;
ref_event_tribute=7;
ref_event_loop=8;
ref_event_grass=100;
ref_event_fire=101;
ref_event_water=102;
ref_event_gymbattle=200;
ref_event_victory=300; //only for transitions
ref_event_defeat=301; //only for transitions
ref_event_exitbattle=302; //only for transitions
ref_mainmenu=999; //only for transitions
//
for (var i=0; i<=200; i++;) {
	event_cost[i]=0;
}
event_cost[ref_event_cardpack]=100;
event_cost[ref_event_berry]=50;
event_cost[ref_event_levelup]=100;
event_cost[ref_event_evolution]=200;
event_cost[ref_event_glyph]=150;
//
tooltip_text="";
tooltip_lines=0;
current_glyph_add=-1;
innate_max=6;
//————————————————————————————————————————————————————————————————————————————————————————————————————
glyph_common_amount=16;
//
ref_glyph_lucky=00;
ref_glyph_harvest=01;
ref_glyph_weakness=02;
ref_glyph_ruthless=03;
ref_glyph_courage=04;
ref_glyph_piercing=05;
ref_glyph_counter=06;
ref_glyph_shield=07;
ref_glyph_medic=08;
ref_glyph_tenacity=09;
ref_glyph_bulwark=10;
ref_glyph_fork=11;
ref_glyph_vampire=12;
ref_glyph_curse=13;
ref_glyph_memento=14;
ref_glyph_berserk=15;
//
ref_glyph_mist=16;
ref_glyph_transform=17;
//————————————————————————————————————————————————————————————————————————————————————————————————————
options_total=9;
//
opt_fullscreen=0;
opt_vsync=1;
opt_filter=2;
opt_scaling=3;
opt_music=4;
opt_sound=5;
opt_autodeck=6;
opt_edge=7;
opt_bg_type=8;
//
for (var i=0; i<options_total; i++;) {
	if i=opt_fullscreen { option_name[i]="Fullscreen: "; }
	else if i=opt_vsync { option_name[i]="Vertical Synchronization: "; }
	else if i=opt_filter { option_name[i]="Pixel Interpolation: "; }
	else if i=opt_scaling { option_name[i]="Window Scaling: "; }
	else if i=opt_music { option_name[i]="Music: "; }
	else if i=opt_sound { option_name[i]="Sound Effects: "; }
	else if i=opt_autodeck { option_name[i]="New Cards: "; }
	else if i=opt_edge { option_name[i]="Edge Shading: "; }
	else if i=opt_bg_type { option_name[i]="Battle Background Style: "; }
	//
	option_x[i]=20;
	option_y[i]=17+20*i;
	option_focus[i]=false;
	option_state_text[i]="";
}
//
colorsetup_total=3;
bg_rgb_divisor=2;
//
opt_bg_a=0;
opt_bg_b=1;
opt_bg_tile=2;
//
for (var i=0; i<colorsetup_total; i++;) {
	if i=opt_bg_a { colorsetup_name[i]="Battle Background Color A: "; }
	else if i=opt_bg_b { colorsetup_name[i]="Battle Background Color B: "; }
	else if i=opt_bg_tile { colorsetup_name[i]="Battle Background Color C: "; }
	//
	colorsetup_main_x[i]=20;
	colorsetup_r_x[i]=colorsetup_main_x[i]+166;
	colorsetup_g_x[i]=colorsetup_r_x[i]+38;
	colorsetup_b_x[i]=colorsetup_g_x[i]+38;
	colorsetup_y[i]=17+12*i+20*options_total;
	colorsetup_focus_r[i]=false;
	colorsetup_focus_g[i]=false;
	colorsetup_focus_b[i]=false;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
instance_create_layer(screen_main_x,screen_main_y,"instances",ob_splash);
instance_create_layer(screen_main_x,screen_main_y,"instances",ob_background);
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
config_file="config.sav";
data_file="data.sav";
sc_config_load();
//sc_config_save();
sc_data_load();
//sc_data_save();
//————————————————————————————————————————————————————————————————————————————————————————————————————
music_player=sc_playsound(ms_main,100,true,true);
music_beat_margin=0;
//————————————————————————————————————————————————————————————————————————————————————————————————————
global.color_white=make_colour_rgb(230,230,230);
global.color_black=make_colour_rgb(40,40,40);
global.color_gray=make_colour_rgb(190,190,190);
global.color_card_light=make_colour_rgb(233,230,222);
global.color_card_dark=make_colour_rgb(205,198,181);
global.color_card_gold=make_colour_rgb(226,204,161);
global.color_player=make_colour_rgb(160,193,225);
global.color_enemy=make_colour_rgb(221,172,159);
global.color_fullhp=make_colour_rgb(176,223,159);
global.color_damage=make_colour_rgb(225,168,160);
global.color_direct_damage=make_colour_rgb(205,162,227);
global.color_progress_light=make_colour_rgb(180,218,255);
global.color_progress_dark=make_colour_rgb(91,88,80);
global.color_background_a=make_colour_rgb(colorsetup_r[opt_bg_a]/bg_rgb_divisor,colorsetup_g[opt_bg_a]/bg_rgb_divisor,colorsetup_b[opt_bg_a]/bg_rgb_divisor);
global.color_background_b=make_colour_rgb(colorsetup_r[opt_bg_b]/bg_rgb_divisor,colorsetup_g[opt_bg_b]/bg_rgb_divisor,colorsetup_b[opt_bg_b]/bg_rgb_divisor);
global.color_background_tile=make_colour_rgb(colorsetup_r[opt_bg_tile]/bg_rgb_divisor,colorsetup_g[opt_bg_tile]/bg_rgb_divisor,colorsetup_b[opt_bg_tile]/bg_rgb_divisor);