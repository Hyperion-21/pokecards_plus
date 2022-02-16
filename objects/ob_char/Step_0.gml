depth=0-((y-ob_control.cam_y)/2); //0 to -96
if depth<=-100 or depth>=0 { depth=-50; } //mostly for teleporting
//————————————————————————————————————————————————————————————————————————————————————————————————————
var facing_npc=false;
if jumping_state=0 {
	if anim_dir=0 and position_meeting(x,y+8,ob_npc) {
		var facing_npc_id=instance_position(x,y+8,ob_npc);
		if facing_npc_id.event_physical=true { facing_npc=true; }
	}
	else if anim_dir=1 and position_meeting(x,y-8,ob_npc) {
		var facing_npc_id=instance_position(x,y-8,ob_npc);
		if facing_npc_id.event_physical=true { facing_npc=true; }
	}
	else if anim_dir=2 and position_meeting(x-8,y,ob_npc) {
		var facing_npc_id=instance_position(x-8,y,ob_npc);
		if facing_npc_id.event_physical=true { facing_npc=true; }
	}
	else if anim_dir=3 and position_meeting(x+8,y,ob_npc) {
		var facing_npc_id=instance_position(x+8,y,ob_npc);
		if facing_npc_id.event_physical=true { facing_npc=true; }
	}
}
//
if sc_input("01",0) and attacking=false and jumping_state=0 and ob_control.event_active=false and facing_npc=true and place_free(x,y) {
	facing_npc_id.event_trigger=true;
}
else if sc_input("01",0) and ob_control.event_active=false and facing_npc=false and place_free(x,y) {
	sc_playsound(sn_swing,100,false,false,false);
	attacking=true;
	anim_frame=0;
	anim_frame_timer=0;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if sc_input("02",0) and attacking=false and jumping_state=0 and ob_control.event_active=false and place_free(x,y) {
	sc_playsound(sn_jump,100,false,false,false);
	jumping_state=1;
	anim_frame=0;
	anim_frame_timer=0;
}
//
if jumping_state=1 {
	var jump_add=(jumping_air_max-jumping_air)/3;
	if jump_add>(jumping_air_max/10) { jump_add=jumping_air_max/10; }
	else if jump_add<0.2 { jump_add=0.2; }
	jumping_air+=jump_add;
	if jumping_air>=jumping_air_max {
		jumping_air=jumping_air_max;
		jumping_state=2;
	}
}
else if jumping_state=2 {
	var jump_add=(jumping_air_max-jumping_air)/3;
	if jump_add>(jumping_air_max/10) { jump_add=jumping_air_max/10; }
	else if jump_add<0.2 { jump_add=0.2; }
	jumping_air-=jump_add;
	if jumping_air<=0 {
		jumping_air=0;
		jumping_state=0;
	}
}
//
if jumping_state=0 and !place_free(x,y) {
	var check_free_distance=4, check_free_moving=false;
	do {
		check_free_moving=false;
		if place_free(x,y+check_free_distance) { y+=1; check_free_moving=true; }
		else if place_free(x,y-check_free_distance) { y-=1; check_free_moving=true; }
		else if place_free(x+check_free_distance,y) { x+=1; check_free_moving=true; }
		else if place_free(x-check_free_distance,y) { x-=1; check_free_moving=true; }
		else if place_free(x+check_free_distance,y+check_free_distance) { x+=1; y+=1; check_free_moving=true; }
		else if place_free(x-check_free_distance,y+check_free_distance) { x-=1; y+=1; check_free_moving=true; }
		else if place_free(x+check_free_distance,y-check_free_distance) { x+=1; y-=1; check_free_moving=true; }
		else if place_free(x-check_free_distance,y-check_free_distance) { x-=1; y-=1; check_free_moving=true; }
		check_free_distance+=4;
	} until (check_free_moving=true);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if attacking=true and jumping_state=0 {
	var collision_list=ds_list_create();
	if anim_frame=0 {
		if anim_dir=0 { var collision_total=collision_ellipse_list(x-15,y-1,x-6,y+9,ob_tallgrass,false,true,collision_list,false); }
		else if anim_dir=1 { var collision_total=collision_ellipse_list(x+4,y-14,x+13,y-4,ob_tallgrass,false,true,collision_list,false); }
		else if anim_dir=2 { var collision_total=collision_ellipse_list(x-14,y-16,x-4,y-8,ob_tallgrass,false,true,collision_list,false); }
		else if anim_dir=3 { var collision_total=collision_ellipse_list(x+3,y+2,x+13,y+10,ob_tallgrass,false,true,collision_list,false); }
	}
	else if anim_frame=1 {
		if anim_dir=0 { var collision_total=collision_ellipse_list(x-10,y-1,x+1,y+11,ob_tallgrass,false,true,collision_list,false); }
		else if anim_dir=1 { var collision_total=collision_ellipse_list(x-3,y-16,x+8,y-4,ob_tallgrass,false,true,collision_list,false); }
		else if anim_dir=2 { var collision_total=collision_ellipse_list(x-16,y-10,x-4,y-2,ob_tallgrass,false,true,collision_list,false); }
		else if anim_dir=3 { var collision_total=collision_ellipse_list(x+3,y-4,x+15,y+4,ob_tallgrass,false,true,collision_list,false); }
	}
	else if anim_frame=2 {
		if anim_dir=0 { var collision_total=collision_ellipse_list(x-3,y-1,x+8,y+11,ob_tallgrass,false,true,collision_list,false); }
		else if anim_dir=1 { var collision_total=collision_ellipse_list(x-10,y-16,x+1,y-4,ob_tallgrass,false,true,collision_list,false); }
		else if anim_dir=2 { var collision_total=collision_ellipse_list(x-16,y-4,x-4,y+4,ob_tallgrass,false,true,collision_list,false); }
		else if anim_dir=3 { var collision_total=collision_ellipse_list(x+3,y-10,x+15,y-2,ob_tallgrass,false,true,collision_list,false); }
	}
	else if anim_frame=3 {
		if anim_dir=0 { var collision_total=collision_ellipse_list(x+4,y-1,x+13,y+9,ob_tallgrass,false,true,collision_list,false); }
		else if anim_dir=1 { var collision_total=collision_ellipse_list(x-15,y-14,x-6,y-4,ob_tallgrass,false,true,collision_list,false); }
		else if anim_dir=2 { var collision_total=collision_ellipse_list(x-14,y+2,x-4,y+10,ob_tallgrass,false,true,collision_list,false); }
		else if anim_dir=3 { var collision_total=collision_ellipse_list(x+3,y-16,x+13,y-8,ob_tallgrass,false,true,collision_list,false); }
	}
	if collision_total>0 {
		for (var i=0; i<collision_total; i+=1;) {
			var collision_id = ds_list_find_value(collision_list,i);
			if collision_id.hurt_cooldown=0 and collision_id.hp_curr>0 {
				collision_id.hp_curr-=1;
				collision_id.hurt_cooldown=collision_id.hurt_cooldownmax;
			}
		}
	}
	ds_list_destroy(collision_list);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if attacking=true {
	var collision_list=ds_list_create();
	if anim_frame=0 {
		if anim_dir=0 { var collision_total=collision_ellipse_list(x-15,y-1,x-6,y+9,ob_enemy,false,true,collision_list,false); }
		else if anim_dir=1 { var collision_total=collision_ellipse_list(x+4,y-14,x+13,y-4,ob_enemy,false,true,collision_list,false); }
		else if anim_dir=2 { var collision_total=collision_ellipse_list(x-14,y-16,x-4,y-8,ob_enemy,false,true,collision_list,false); }
		else if anim_dir=3 { var collision_total=collision_ellipse_list(x+3,y+2,x+13,y+10,ob_enemy,false,true,collision_list,false); }
	}
	else if anim_frame=1 {
		if anim_dir=0 { var collision_total=collision_ellipse_list(x-10,y-1,x+1,y+11,ob_enemy,false,true,collision_list,false); }
		else if anim_dir=1 { var collision_total=collision_ellipse_list(x-3,y-16,x+8,y-4,ob_enemy,false,true,collision_list,false); }
		else if anim_dir=2 { var collision_total=collision_ellipse_list(x-16,y-10,x-4,y-2,ob_enemy,false,true,collision_list,false); }
		else if anim_dir=3 { var collision_total=collision_ellipse_list(x+3,y-4,x+15,y+4,ob_enemy,false,true,collision_list,false); }
	}
	else if anim_frame=2 {
		if anim_dir=0 { var collision_total=collision_ellipse_list(x-3,y-1,x+8,y+11,ob_enemy,false,true,collision_list,false); }
		else if anim_dir=1 { var collision_total=collision_ellipse_list(x-10,y-16,x+1,y-4,ob_enemy,false,true,collision_list,false); }
		else if anim_dir=2 { var collision_total=collision_ellipse_list(x-16,y-4,x-4,y+4,ob_enemy,false,true,collision_list,false); }
		else if anim_dir=3 { var collision_total=collision_ellipse_list(x+3,y-10,x+15,y-2,ob_enemy,false,true,collision_list,false); }
	}
	else if anim_frame=3 {
		if anim_dir=0 { var collision_total=collision_ellipse_list(x+4,y-1,x+13,y+9,ob_enemy,false,true,collision_list,false); }
		else if anim_dir=1 { var collision_total=collision_ellipse_list(x-15,y-14,x-6,y-4,ob_enemy,false,true,collision_list,false); }
		else if anim_dir=2 { var collision_total=collision_ellipse_list(x-14,y+2,x-4,y+10,ob_enemy,false,true,collision_list,false); }
		else if anim_dir=3 { var collision_total=collision_ellipse_list(x+3,y-16,x+13,y-8,ob_enemy,false,true,collision_list,false); }
	}
	if collision_total>0 {
		for (var i=0; i<collision_total; i+=1;) {
			var collision_id = ds_list_find_value(collision_list,i);
			if collision_id.hurt_cooldown=0 and collision_id.hp_curr>0
				and ((jumping_state=0 and collision_id.jumping_state=0) or (jumping_state>0 and collision_id.jumping_state>0)) {
				collision_id.hp_curr-=1;
				collision_id.hurt_cooldown=collision_id.hurt_cooldownmax;
				//
				if anim_dir=0 { collision_id.knockback_y=12; }
				else if anim_dir=1 { collision_id.knockback_y=-12; }
				else if anim_dir=2 { collision_id.knockback_x=-12; }
				else if anim_dir=3 { collision_id.knockback_x=12; }
			}
		}
	}
	ds_list_destroy(collision_list);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
var anim_moving=false;
if jumping_state=0 and position_meeting(x-2,y+2,ob_tallgrass) and instance_position(x-2,y+2,ob_tallgrass).hp_curr>0
	and position_meeting(x+2,y+2,ob_tallgrass) and instance_position(x+2,y+2,ob_tallgrass).hp_curr>0
	and position_meeting(x-2,y+4,ob_tallgrass) and instance_position(x-2,y+4,ob_tallgrass).hp_curr>0
	and position_meeting(x+2,y+4,ob_tallgrass) and instance_position(x+2,y+4,ob_tallgrass).hp_curr>0 { tallgrass=true; } //range: 4x 2y
else { tallgrass=false; }
//
if sc_input("up",1) and (attacking=false or jumping_state>0) and ob_control.event_active=false and place_free(x,y) {
	if sc_input("08",1) and tallgrass=false { var move_repeat=3; }
	else if !sc_input("08",1) and tallgrass=true { var move_repeat=1; }
	else { var move_repeat=2; }
	repeat (move_repeat) {
		if place_free(x,floor(y-0.5)) { y-=0.5; }
	}
	if attacking=false and ((!sc_input("left",1) and !sc_input("right",1)) or anim_dir=0) { anim_dir=1; }
	anim_moving=true;
}
else if sc_input("down",1) and (attacking=false or jumping_state>0) and ob_control.event_active=false and place_free(x,y) {
	if sc_input("08",1) and tallgrass=false { var move_repeat=3; }
	else if !sc_input("08",1) and tallgrass=true { var move_repeat=1; }
	else { var move_repeat=2; }
	repeat (move_repeat) {
		if place_free(x,ceil(y+0.5)) { y+=0.5; }
	}
	if attacking=false and ((!sc_input("left",1) and !sc_input("right",1)) or anim_dir=1) { anim_dir=0; }
	anim_moving=true;
}
if sc_input("left",1) and (attacking=false or jumping_state>0) and ob_control.event_active=false and place_free(x,y) {
	if sc_input("08",1) and tallgrass=false { var move_repeat=3; }
	else if !sc_input("08",1) and tallgrass=true { var move_repeat=1; }
	else { var move_repeat=2; }
	repeat (move_repeat) {
		if place_free(floor(x-0.5),y) { x-=0.5; }
	}
	if attacking=false and ((!sc_input("up",1) and !sc_input("down",1)) or anim_dir=3) { anim_dir=2; }
	anim_moving=true;
}
else if sc_input("right",1) and (attacking=false or jumping_state>0) and ob_control.event_active=false and place_free(x,y) {
	if sc_input("08",1) and tallgrass=false { var move_repeat=3; }
	else if !sc_input("08",1) and tallgrass=true { var move_repeat=1; }
	else { var move_repeat=2; }
	repeat (move_repeat) {
		if place_free(ceil(x+0.5),y) { x+=0.5; }
	}
	if attacking=false and ((!sc_input("up",1) and !sc_input("down",1)) or anim_dir=2) { anim_dir=3; }
	anim_moving=true;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if anim_moving=true or attacking=true or jumping_state>0 { //playing animation
	if attacking=true { anim_set=4; anim_frame_timermax=4; } //hurt cooldowns are based on this
	else if jumping_state>0 { anim_set=0; anim_frame_timermax=8; }
	else if anim_moving=true { anim_set=0; anim_frame_timermax=10; }
	anim_frame_timer+=1;
}
else { //no animation
	anim_frame=0;
	anim_frame_timer=anim_frame_timermax-1; //only for moving
}
//
if anim_frame_timer>=anim_frame_timermax { //next frame in animation
	anim_frame+=1;
	if anim_frame>3 { //animation loop/end
		anim_frame=0;
		if attacking=true { anim_set=0; attacking=false; }
	}
	anim_frame_timer=0;
}