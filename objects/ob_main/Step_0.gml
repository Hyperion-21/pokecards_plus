if mouse_check_button(mb_right) { cursor_hide=true; }
else { cursor_hide=false; }
//
if keyboard_check_pressed(vk_f5) { game_restart(); } //< delete later, testing
//————————————————————————————————————————————————————————————————————————————————————————————————————
if map_create=true {
	var i=0;
	repeat (2) {
		var ii=0;
		repeat (10) {
			event_x[i][ii]=character_x+(irandom_range(6,8)*32*(ii+1));
			if i=0 { event_y[i][ii]=irandom_range(1,4)*32; }
			else if i=1 { event_y[i][ii]=irandom_range(5,8)*32; }
			event_kind[i][ii]=0;
			//
			ii+=1;
		}
		i+=1;
	}
	//
	var i=0;
	repeat (ceil(room_width/16)) {
		var ii=0;
		repeat (ceil(room_height/16)) {
			var empty_tile_sub=irandom(99)+1;
			//
			if empty_tile_sub<=90 { tile_sub[i][ii]=1; } //empty
			else { tile_sub[i][ii]=irandom_range(2,5); } //grass
			//
			var empty_tile_above=irandom(99)+1;
			//
			if empty_tile_sub>90 or empty_tile_above<=95 { tile_above[i][ii]=-1; } //empty
			else if empty_tile_above<=99 { tile_above[i][ii]=3; } //trees
			else { tile_above[i][ii]=irandom_range(1,2); } //rocks
			//
			ii+=1;
		}
		i+=1;
	}
	//
	map_create=false;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if keyboard_check_pressed(vk_enter) {
	if !instance_exists(ob_control) { instance_create_layer(x,y,"instances",ob_control); }
}