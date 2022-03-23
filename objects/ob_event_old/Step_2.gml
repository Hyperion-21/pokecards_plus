if ob_control.reset_objects=true and event_state=0 and (x<ob_control.cam_x or x>ob_control.cam_x+ob_control.cam_w or y<ob_control.cam_y or y>ob_control.cam_y+ob_control.cam_h) {
	x=start_x;
	y=start_y;
	anim_dir=0;
	hp_curr=hp_full;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if event_physical=true {
	depth=0-((y-ob_control.cam_y)/2); //0 to -96
	if depth<=-100 or depth>=0 { depth=-50; } //mostly for teleporting
	//
	if position_meeting(x-2,y+2,ob_tallgrass) and instance_position(x-2,y+2,ob_tallgrass).hp_curr>0
		and position_meeting(x+2,y+2,ob_tallgrass) and instance_position(x+2,y+2,ob_tallgrass).hp_curr>0
		and position_meeting(x-2,y+4,ob_tallgrass) and instance_position(x-2,y+4,ob_tallgrass).hp_curr>0
		and position_meeting(x+2,y+4,ob_tallgrass) and instance_position(x+2,y+4,ob_tallgrass).hp_curr>0 { tallgrass=true; } //range: 4x 2y
	else { tallgrass=false; }
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if event_mobile=true and ob_control.event_active=false and hp_curr>0
	and x>=ob_control.cam_x+16 and y>=ob_control.cam_y+16 and x<=ob_control.cam_x+ob_control.cam_w-16 and y<=ob_control.cam_y+ob_control.cam_h-16 {
	if move_timer=0 {
		var move_attempt=0;
		do {
			move_attempt++;
			if move_attempt<10 {
				var move_choice=irandom(3);
				if move_choice=0 { se_walk(id,0,choose(-8,-16)); }
				else if move_choice=1 { se_walk(id,0,choose(8,16)); }
				else if move_choice=2 { se_walk(id,choose(-8,-16),0); }
				else if move_choice=3 { se_walk(id,choose(8,16),0); }
			}
			else { move_x=0; move_y=0; }
		} until (move_attempt=10 or (place_free(x+move_x,y+move_y) and !place_meeting(x+move_x,y+move_y,ob_char) and !place_meeting(x+move_x,y+move_y,ob_event)
			and x+move_x>ob_control.cam_x+16 and x+move_x<ob_control.cam_x+ob_control.cam_w-16 and y+move_y>ob_control.cam_y+16 and y+move_y<ob_control.cam_y+ob_control.cam_h-16));
		move_timer=irandom(move_timer_rmax);
	}
	else if move_timer>0 and move_x=0 and move_y=0 { move_timer--; }
}
//
if move_y<0 {
	if place_free(x,floor(y-0.5)) and !place_meeting(x,floor(y-0.5),ob_char) and !place_meeting(x,floor(y-0.5),ob_event) {
		y-=0.5;
		move_y+=0.5;
	}
	else { move_y=0; }
	if move_x=0 and move_y=0 and event_state>0 { event_state++; }
	anim_dir=1;
}
else if move_y>0 {
	if place_free(x,ceil(y+0.5)) and !place_meeting(x,ceil(y+0.5),ob_char) and !place_meeting(x,ceil(y+0.5),ob_event) {
		y+=0.5;
		move_y-=0.5;
	}
	else { move_y=0; }
	if move_x=0 and move_y=0 and event_state>0 { event_state++; }
	anim_dir=0;
}
if move_x<0 {
	if place_free(floor(x-0.5),y) and !place_meeting(floor(x-0.5),y,ob_char) and !place_meeting(floor(x-0.5),y,ob_event) {
		x-=0.5;
		move_x+=0.5;
	}
	else { move_x=0; }
	if move_x=0 and move_y=0 and event_state>0 { event_state++; }
	anim_dir=2;
}
else if move_x>0 {
	if place_free(ceil(x+0.5),y) and !place_meeting(ceil(x+0.5),y,ob_char) and !place_meeting(ceil(x+0.5),y,ob_event) {
		x+=0.5;
		move_x-=0.5;
	}
	else { move_x=0; }
	if move_x=0 and move_y=0 and event_state>0 { event_state++; }
	anim_dir=3;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if hurt_cooldown>0 { hurt_cooldown--; }
//
if knockback_x>0 {
	repeat (4) {
		if place_free(ceil(x+0.5),y) and !place_meeting(ceil(x+0.5),y,ob_char) and !place_meeting(ceil(x+0.5),y,ob_event) {
			x+=0.5;
			knockback_x-=0.5;
		}
		else { knockback_x=0; }
	}
}
else if knockback_x<0 {
	repeat (4) {
		if place_free(floor(x-0.5),y) and !place_meeting(floor(x-0.5),y,ob_char) and !place_meeting(floor(x-0.5),y,ob_event) {
			x-=0.5;
			knockback_x+=0.5;
		}
		else { knockback_x=0; }
	}
}
if knockback_y>0 {
	repeat (4) {
		if place_free(x,ceil(y+0.5)) and !place_meeting(x,ceil(y+0.5),ob_char) and !place_meeting(x,ceil(y+0.5),ob_event) {
			y+=0.5;
			knockback_y-=0.5;
		}
		else { knockback_y=0; }
	}
}
else if knockback_y<0 {
	repeat (4) {
		if place_free(x,floor(y-0.5)) and !place_meeting(x,floor(y-0.5),ob_char) and !place_meeting(x,floor(y-0.5),ob_event) {
			y-=0.5;
			knockback_y+=0.5;
		}
		else { knockback_y=0; }
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if move_x!=0 or move_y!=0 { anim_frame_timer++; }
else {
	anim_frame=0;
	anim_frame_timer=anim_frame_timermax-1;
}
//
if anim_frame_timer>=anim_frame_timermax {
	anim_frame++;
	if anim_frame>3 { anim_frame=0; }
	anim_frame_timer=0;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
event_trigger=false;