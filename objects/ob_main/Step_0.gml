if mouse_check_button(mb_right) { cursor_hide=true; }
else { cursor_hide=false; }
//
if keyboard_check_pressed(vk_f5) { game_restart(); } //< delete later, testing
//————————————————————————————————————————————————————————————————————————————————————————————————————
if roadmap_create=true {
	var i=0;
	repeat (3) {
		var ii=0;
		repeat (10) {
			if i<2 { event[i][ii]=irandom_range(0,1); }
			else { event[i][ii]=irandom_range(-1,1); }
			//
			if event[i][ii]=0 { event_name[i][ii]="Battle"; }
			else if event[i][ii]=1 { event_name[i][ii]="Card Pack"; }
			//
			do {
				area[ii]=irandom(21);
			} until (area[ii]!=11 and area[ii]!=13 and area[ii]!=15); //rocket HQs & city
			ii+=1;
		}
		i+=1;
	}
	roadmap_create=false;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if keyboard_check_pressed(vk_enter) {
	if !instance_exists(ob_control) { instance_create_layer(x,y,"instances",ob_control); }
}