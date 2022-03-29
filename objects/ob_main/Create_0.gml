randomize(); //random seed
game_name="Pocket Card League";
game_version="v0.0.0.49";
window_set_caption(game_name + " (" + string(game_version) + ")");
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
//
var screen_w=display_get_width(), screen_h=display_get_height();
var i=0, biggest_screen_size_found=false;
do {
	i++;
	if 512*i>=screen_w or 288*i>=screen_h {
		biggest_screen_size_found=true;
	}
} until (biggest_screen_size_found=true);
window_set_size(512*(i-1),288*(i-1));
//
display_reset(0,true);
window_set_fullscreen(false);
//————————————————————————————————————————————————————————————————————————————————————————————————————
global.color_white=make_colour_rgb(230,230,230);
global.color_black=make_colour_rgb(40,40,40);
global.color_gray=make_colour_rgb(190,190,190);
global.color_card_light=make_colour_rgb(233,230,222);
global.color_card_dark=make_colour_rgb(205,198,181);
global.color_player=make_colour_rgb(160,193,225);
global.color_enemy=make_colour_rgb(221,172,159);
global.color_fullhp=make_colour_rgb(176,223,159);
global.color_damage=make_colour_rgb(225,168,160);
global.color_direct_damage=make_colour_rgb(226,204,161);
global.color_progress_light=make_colour_rgb(180,218,255);
global.color_progress_dark=make_colour_rgb(91,88,80);
global.color_background_a=make_colour_rgb(59,57,53);
global.color_background_b=make_colour_rgb(59,57,53);
global.color_background_tile=make_colour_rgb(64,62,58);
//————————————————————————————————————————————————————————————————————————————————————————————————————
mouse_cursor=0;
cursor_hide=false;
screen_transition=-1;
auto_deck_transition=false;
//
roadmap_area_max=20;
event_transition=-1; //same as events, 300 victory, 301 defeat
fade_black=0;
//
menu_options_hover=false;
menu_deck_hover=false;
menu_back_options_hover=false;
menu_back_deck_hover=false;
//————————————————————————————————————————————————————————————————————————————————————————————————————
normal_poke_id_max=251; //normal (non-secret and non-environment) poke cards
secret_cards_total=1;
environment_cards_total=3;
//
maindeck_total_max=2000;
berrydeck_total_max=100; //per berry
//
money_add=0;
money_subtract=0;
effect_money_error=0;
ref_event_battle=0;
ref_event_freecard=1;
ref_event_cardpack=2;
ref_event_levelup=3;
ref_event_evolution=4;
ref_event_glyph=5;
ref_event_sacrifice=6;
ref_event_grass=100;
ref_event_fire=101;
ref_event_water=102;
ref_event_gymbattle=200;
ref_event_victory=300; //only for transitions
ref_event_defeat=301; //only for transitions
//
for (var i=0; i<=200; i++;) {
	event_cost[i]=0;
}
event_cost[ref_event_cardpack]=100;
event_cost[ref_event_levelup]=100;
event_cost[ref_event_evolution]=200;
event_cost[ref_event_glyph]=150;
//————————————————————————————————————————————————————————————————————————————————————————————————————
instance_create_layer(screen_main_x,screen_main_y,"instances",ob_background);
//————————————————————————————————————————————————————————————————————————————————————————————————————
config_file="config.sav";
data_file="data.sav";
//sc_config_load();
//sc_config_save();
sc_data_load();
//sc_data_save();