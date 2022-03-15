depth=-1000;
//
cam_x=camera_get_view_x(view_camera[0]);
cam_y=camera_get_view_y(view_camera[0]);
cam_w=ob_main.cam_w;
cam_h=ob_main.cam_h;
//————————————————————————————————————————————————————————————————————————————————————————————————————
instance_create_layer(cam_x-2,cam_y-2,"instances",ob_background);
//
var i=0;
repeat (18) {
	var ii=0;
	repeat (5) {
		instance_create_layer(cam_x+i*32,cam_y+ii*64+(i mod 2)*32,"instances",ob_background_tile);
		ii++;
	}
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
var button_create;
button_nextturn_id=instance_create_layer(cam_x+cam_w-76,cam_y+134,"instances",ob_button_31x24);
button_nextturn_id.button_id=0;
button_create=instance_create_layer(cam_x+76,cam_y+197,"instances",ob_button_16x16); //cam_w-91
button_create.button_id=1;
//————————————————————————————————————————————————————————————————————————————————————————————————————
instance_create_layer(cam_x+cam_w/2-24,cam_y+cam_h/2-24,"instances",ob_coin);
//————————————————————————————————————————————————————————————————————————————————————————————————————
player_directdamage_id=instance_create_layer(cam_x+cam_w-62,cam_y+112,"instances",ob_damage_num);
player_directdamage_id.damage_direct_unique=true;
player_directdamage_id.text_color=global.color_player;
enemy_directdamage_id=instance_create_layer(cam_x+cam_w-26,cam_y+112,"instances",ob_damage_num);
enemy_directdamage_id.damage_direct_unique=true;
enemy_directdamage_id.text_color=global.color_enemy;
//————————————————————————————————————————————————————————————————————————————————————————————————————
var i=0;
repeat (11) {
	if i<=4 { //0-4 enemy side
		card_space_id[i]=instance_create_layer(cam_x+100+64*(i),cam_y+44,"instances",ob_card_space);
		card_space_id[i].trash=false;
	}
	else if i<=9 { //5-9 player side
		card_space_id[i]=instance_create_layer(cam_x+100+64*(i-5),cam_y+134,"instances",ob_card_space);
		card_space_id[i].trash=false;
	}
	else { //10 trash
		card_space_id[i]=instance_create_layer(cam_x+10,cam_y+44,"instances",ob_card_space);
		card_space_id[i].trash=true;
	}
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
card_maindeck_total=ob_main.maindeck_total;
var i=0;
repeat (card_maindeck_total) {
	card_cat_creation=0;
	card_maindeck[i]=instance_create_layer(cam_x+cam_w-67,cam_y+181,"instances",ob_card);
	card_maindeck[i].num_in_maindeck=i;
	i++;
}
//
card_berrydeck_total=ob_main.berrydeck_total;
var i=0;
repeat (card_berrydeck_total) {
	card_cat_creation=1;
	card_berrydeck[i]=instance_create_layer(cam_x+10,cam_y+181,"instances",ob_card);
	card_berrydeck[i].num_in_berrydeck=i;
	i++;
}
//
card_hand_total=0;
card_hand_max=12;
var i=0;
repeat (card_hand_max+1) { //+1 to replace value when using last card when hand is full
	card_hand[i]=-1;
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
enemycard_maindeck_total=50;
var i=0;
repeat (enemycard_maindeck_total) {
	card_cat_creation=0;
	enemycard_maindeck[i]=instance_create_layer(cam_x+cam_w-67,cam_y-100,"instances",ob_card);
	//enemycard_maindeck[i].num_in_maindeck=i;
	enemycard_maindeck[i].card_enemy=true;
	i++;
}
//
enemycard_berrydeck_total=999;
var i=0;
repeat (enemycard_berrydeck_total) {
	card_cat_creation=1;
	enemycard_berrydeck[i]=instance_create_layer(cam_x+10,cam_y-100,"instances",ob_card);
	//enemycard_berrydeck[i].num_in_berrydeck=i;
	enemycard_berrydeck[i].card_enemy=true;
	i++;
}
//
enemycard_hand_total=0;
var i=0;
repeat (card_hand_max+1) { //+1 to replace value when using last card when hand is full
	enemycard_hand[i]=-1;
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
tooltip_text="";
tooltip_timer=0;
tooltip_timer_max=300;
first_turn_attack_warning=false;
hand_full_draw_warning=false;
//
hp_max=20;
player_hp=hp_max;
enemy_hp=hp_max;
player_effect_damaged=0;
enemy_effect_damaged=0;
//
turn_num=1;
battler_turn=0; //0 stand-by, 1 player, 2 enemy
enemy_turn_timer=0;
enemy_turn_phase=-1;
enemy_turn_phase_draw=1;
enemy_turn_phase_play=2;
enemy_turn_phase_attack=3;
enemy_play_delay=0;
//
card_draw_points=0;
enemycard_draw_points=0;
enemycard_playplan_id=-1;
enemyspace_playplan=-1;
card_drawcost_main=2;
card_drawcost_berry=1;
//
card_focus=-1; //id
card_hold=-1; //id
card_focus_hand=-1;
//
button_sorthand=false;
button_nextturn=false;
//
AI_report="";
AI_report_toggle=false;
AI_threshold[0]=20;
AI_threshold[1]=100;
AI_threshold[2]=0;
AI_threshold[3]=0;
AI_threshold[4]=0;
//————————————————————————————————————————————————————————————————————————————————————————————————————
//event_active=false;
//reset_objects=false;
//
textbox_active=false;
text_string="";
text_show="";
text_charnum=1;
text_timer=0;
text_timermax=1;
text_next=false;