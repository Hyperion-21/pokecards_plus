randomize(); //random seed
game_name="Pocket Card League";
game_version="v0.0.0.24";
window_set_caption(game_name + " (" + string(game_version) + ")");
//————————————————————————————————————————————————————————————————————————————————————————————————————
depth=-1000;
//
view_set_visible(view_camera[0],true);
view_set_xport(view_camera[0],0);
view_set_yport(view_camera[0],0);
view_set_wport(view_camera[0],512);
view_set_hport(view_camera[0],288);
camera_set_view_pos(view_camera[0],x,y);
camera_set_view_size(view_camera[0],512,288);
camera_set_view_target(view_camera[0],ob_control);
camera_set_view_border(view_camera[0],99999,99999);
camera_set_view_speed(view_camera[0],-1,-1);
surface_resize(application_surface,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]));
//
var screen_w=display_get_width(), screen_h=display_get_height();
var i=0, biggest_screen_size_found=false;
do {
	i+=1;
	if 512*i>=screen_w or 288*i>=screen_h {
		biggest_screen_size_found=true;
	}
} until (biggest_screen_size_found=true);
window_set_size(512*(i-1),288*(i-1));
//
display_reset(0,true);
window_set_fullscreen(false);
//————————————————————————————————————————————————————————————————————————————————————————————————————
global.sound_level=10;
global.music_level=10;
//
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
global.color_background_a=make_colour_rgb(59,57,53);
global.color_background_b=make_colour_rgb(59,57,53);
global.color_background_tile=make_colour_rgb(64,62,58);