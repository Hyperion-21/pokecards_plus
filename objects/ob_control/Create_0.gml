depth=-1000;
//
cam_x=camera_get_view_x(view_camera[0]);
cam_y=camera_get_view_y(view_camera[0]);
//————————————————————————————————————————————————————————————————————————————————————————————————————
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
button_sorthand_id=instance_create_layer(cam_x+76,cam_y+197,"instances",ob_button_16x16);
button_sorthand_id.button_id=1;
if ob_main.playing_tutorial=false {
	button_create=instance_create_layer(cam_x+cam_w-20,cam_y+4,"instances",ob_button_16x16);
	button_create.button_id=2;
}
button_create=instance_create_layer(cam_x+76,cam_y+180,"instances",ob_button_16x16);
button_create.button_id=3;
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
	}
	else if i<=9 { //5-9 player side
		card_space_id[i]=instance_create_layer(cam_x+100+64*(i-5),cam_y+134,"instances",ob_card_space);
	}
	else { //10 trash
		card_space_id[i]=instance_create_layer(cam_x+10,cam_y+44,"instances",ob_card_space);
		card_space_id[i].trash=true;
	}
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
card_maindeck_total=0;
var i=0;
repeat (ob_main.maindeck_total) {
	if ob_main.serial_card_indeck[ob_main.main_card_serial[i]][0]=true {
		card_maindeck_total++;
	}
	i++;
}
//
var i=0, card_shuffle;
repeat (card_maindeck_total) {
	if ob_main.playing_tutorial=true {
		if ob_main.main_card_id[i]=001 or ob_main.main_card_id[i]=004 or ob_main.main_card_id[i]=007 { card_shuffle[i]=0; } //bulbasaur, charmander, squirtle
		else if ob_main.main_card_id[i]=152 or ob_main.main_card_id[i]=155 or ob_main.main_card_id[i]=158 { card_shuffle[i]=2; } //chikorita, cyndaquil, totodile
		else if ob_main.main_card_id[i]=016 { card_shuffle[i]=4; } //pidgey
		else if ob_main.main_card_id[i]=021 { card_shuffle[i]=1; } //spearow
		else if ob_main.main_card_id[i]=019 { card_shuffle[i]=3; } //rattata
	}
	else {
		do {
			var shuffle_taken=false;
			card_shuffle[i]=irandom(card_maindeck_total-1);
			//
			var ii=0;
			repeat (i) {
				if card_shuffle[i]=card_shuffle[ii] { shuffle_taken=true; }
				ii++;
			}
		} until (shuffle_taken=false);
	}
	i++;
}
//
var i=0, ii=0;
repeat (ob_main.maindeck_total) {
	if ob_main.serial_card_indeck[ob_main.main_card_serial[i]][0]=true {
		create_card_cat=0;
		create_card_id=ob_main.main_card_id[i];
		create_card_level=ob_main.main_card_level[i];
		create_card_glyph_a=ob_main.main_card_glyph_a[i];
		create_card_glyph_b=ob_main.main_card_glyph_b[i];
		create_card_glyph_c=ob_main.main_card_glyph_c[i];
		create_card_innate=ob_main.main_card_innate[i];
		create_card_form_value=ob_main.main_card_form_value[i];
		//
		create_enemy_randomizer=false;
		create_enemy_costcount=false;
		//
		card_maindeck[card_shuffle[ii]]=instance_create_layer(cam_x+cam_w-67,cam_y+181,"instances",ob_card);
		card_maindeck[card_shuffle[ii]].num_in_maindeck=card_shuffle[ii];
		//
		ii++;
	}
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
card_berrydeck_total=0;
var i=0, berry_num;
repeat (4) {
	card_berrydeck_total+=ob_main.berry_num_used[i][0];
	berry_num[i]=ob_main.berry_num_used[i][0];
	i++;
}
//
var i=0, card_shuffle;
repeat (card_berrydeck_total) {
	do {
		var shuffle_taken=false;
		card_shuffle[i]=irandom(card_berrydeck_total-1);
		//
		var ii=0;
		repeat (i) {
			if card_shuffle[i]=card_shuffle[ii] { shuffle_taken=true; }
			ii++;
		}
	} until (shuffle_taken=false);
	i++;
}
//
var i=0, ii=0;
repeat (ob_main.berrydeck_total) {
	if berry_num[ob_main.berry_card_id[i]-3000]>0 {
		create_card_cat=1;
		create_card_id=ob_main.berry_card_id[i];
		//
		card_berrydeck[card_shuffle[ii]]=instance_create_layer(cam_x+10,cam_y+181,"instances",ob_card);
		card_berrydeck[card_shuffle[ii]].num_in_berrydeck=card_shuffle[ii];
		//
		berry_num[ob_main.berry_card_id[i]-3000]--;
		ii++;
	}
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
card_hand_total=0;
card_hand_max=12;
var i=0;
repeat (card_hand_max+1) { //+1 to replace value when using last card when hand is full
	card_hand[i]=-1;
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
sc_enemy_deck(ob_main.trainer_kind[ob_main.roadmap_area]);
for (var i=0; i<=3; i++;) {
	enemy_deck_fullcost[i]=0;
}
//
var i=0, card_shuffle;
repeat (enemycard_maindeck_total) {
	if ob_main.playing_tutorial=true {
		card_shuffle[i]=enemycard_maindeck_total-1-i;
	}
	else {
		do {
			var shuffle_taken=false;
			card_shuffle[i]=irandom(enemycard_maindeck_total-1);
			//
			var ii=0;
			repeat (i) {
				if card_shuffle[i]=card_shuffle[ii] { shuffle_taken=true; }
				ii++;
			}
		} until (shuffle_taken=false);
	}
	i++;
}
//
var i=0;
repeat (enemycard_maindeck_total) {
	create_card_cat=0;
	create_card_id=enemy_card_id[card_shuffle[i]];
	create_card_level=enemy_card_level[card_shuffle[i]];
	create_card_glyph_a=enemy_card_glyph_a[card_shuffle[i]];
	create_card_glyph_b=enemy_card_glyph_b[card_shuffle[i]];
	create_card_glyph_c=enemy_card_glyph_c[card_shuffle[i]];
	create_card_innate=enemy_card_innate[card_shuffle[i]];
	create_card_form_value=enemy_card_form_value[card_shuffle[i]];
	//
	create_enemy_randomizer=true;
	create_enemy_costcount=true;
	//
	enemycard_maindeck[i]=instance_create_layer(cam_x+cam_w-67,cam_y-100,"instances",ob_card);
	enemycard_maindeck[i].card_enemy=true;
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
sc_enemy_berry_deck();
//
var i=0, card_shuffle;
repeat (enemycard_berrydeck_total) {
	do {
		var shuffle_taken=false;
		card_shuffle[i]=irandom(enemycard_berrydeck_total-1);
		//
		var ii=0;
		repeat (i) {
			if card_shuffle[i]=card_shuffle[ii] { shuffle_taken=true; }
			ii++;
		}
	} until (shuffle_taken=false);
	i++;
}
//
var i=0;
repeat (enemycard_berrydeck_total) {
	create_card_cat=1;
	create_card_id=enemy_berry_id[card_shuffle[i]];
	//
	enemycard_berrydeck[i]=instance_create_layer(cam_x+10,cam_y-100,"instances",ob_card);
	enemycard_berrydeck[i].card_enemy=true;
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
enemycard_hand_total=0;
var i=0;
repeat (card_hand_max+1) { //+1 to replace value when using last card when hand is full
	enemycard_hand[i]=-1;
	i++;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
tooltip_text="";
tooltip_lines=0;
tooltip_timer=0;
tooltip_timer_max=300;
first_turn_attack_warning=false;
hand_full_draw_warning=false;
//
tutorial_textbox_line_current=4; //first tutorial line in battle
tutorial_textbox_line_max=21; //last tutorial line in battle
tutorial_textbox_line_newturn_seen=false;
tutorial_textbox_line_drawn_seen=false;
tutorial_textbox_line_attacked_seen=false;
//
if ob_main.playing_tutorial=true { hp_max=ob_main.battle_hp[0]; }
else if ob_main.playing_gym=false and ob_main.playing_elite=false and ob_main.playing_champion=false { hp_max=ob_main.battle_hp[ob_main.area_zone]; }
else { hp_max=ob_main.battle_hp[ob_main.area_zone+1]; }
//
player_hp=hp_max;
enemy_hp=hp_max;
player_effect_damaged=0;
enemy_effect_damaged=0;
//
turn_num=1;
battler_turn=0; //0 stand-by, 1 player, 2 enemy
enemy_turn_timer=0;
//
card_draw_points=0;
card_draw_click=false; //to avoid drawing multiple cards with a single click when their number in deck is in descending order
enemycard_draw_points=0;
card_drawcost_main=2;
card_drawcost_berry=1;
//
enemycard_playplan_id=-1;
enemycard_discardplan_id=-1;
enemyspace_playplan_slot=-1;
enemyberry_playplan[0]=0; //oran
enemyberry_playplan[1]=0; //leppa
enemyberry_playplan[2]=0; //lum
enemyberry_playplan[3]=0; //enigma
space_poke_possible[0][0]=false;
//
for (var i=0; i<=3; i++;) {
	berry_spawn[i]=0;
	enemyberry_spawn[i]=0;
}
//
card_focus=-1; //id
card_hold=-1; //id
card_focus_hand=-1;
//
button_sorthand=false;
button_nextturn=false;
