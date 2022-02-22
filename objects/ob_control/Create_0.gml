randomize(); //random seed
game_name="Faraway Road";
game_version="v0.0.0.8";
window_set_caption(game_name + " " + string(game_version));
//————————————————————————————————————————————————————————————————————————————————————————————————————
depth=-1000;
//
camera_set_view_pos(view_camera[0],x,y);
camera_set_view_size(view_camera[0],512,288);
camera_set_view_target(view_camera[0],ob_control);
camera_set_view_border(view_camera[0],99999,99999);
camera_set_view_speed(view_camera[0],-1,-1);
cam_x=camera_get_view_x(view_camera[0]);
cam_y=camera_get_view_y(view_camera[0]);
cam_w=camera_get_view_width(view_camera[0]);
cam_h=camera_get_view_height(view_camera[0]);
surface_resize(application_surface,cam_w,cam_h);
//
display_reset(0,true);
window_set_fullscreen(false);
//————————————————————————————————————————————————————————————————————————————————————————————————————
global.sound_level=10;
global.music_level=10;
//————————————————————————————————————————————————————————————————————————————————————————————————————
var button_create;
button_create=instance_create_layer(cam_w-54,150,"instances",ob_button_31x24);
button_create.button_id=0;
button_create=instance_create_layer(cam_w-91,212,"instances",ob_button_16x16);
button_create.button_id=1;
//————————————————————————————————————————————————————————————————————————————————————————————————————
var i=0;
repeat (10) {
	if i<=4 { card_space_id[i]=instance_create_layer(100+64*(i),59,"instances",ob_card_space); }
	else { card_space_id[i]=instance_create_layer(100+64*(i-5),149,"instances",ob_card_space); }
	i+=1;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
card_maindeck_total=50;
var i=0;
repeat (card_maindeck_total) {
	card_cat_creation=0;
	card_maindeck[i]=instance_create_layer(cam_w-67,181,"instances",ob_card);
	card_maindeck[i].num_in_maindeck=i;
	i+=1;
}
//
card_berrydeck_total=50;
var i=0;
repeat (card_berrydeck_total) {
	card_cat_creation=1;
	card_berrydeck[i]=instance_create_layer(10,181,"instances",ob_card);
	card_berrydeck[i].num_in_berrydeck=i;
	i+=1;
}
//
card_hand_total=0;
var i=0;
repeat (card_maindeck_total+card_berrydeck_total) {
	card_hand[i]=-1;
	i+=1;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
mouse_cursor=0;
cursor_hide=false;
tooltip_text="";
card_focus=-1; //id
card_hold=-1; //id
card_focus_hand=-1;
button_sorthand=false;
button_nextturn=false;
//————————————————————————————————————————————————————————————————————————————————————————————————————
event_active=false;
reset_objects=false;
screen_transition=false;
//
fade_black=0;
textbox_active=false;
text_string="";
text_show="";
text_charnum=1;
text_timer=0;
text_timermax=1;
text_next=false;