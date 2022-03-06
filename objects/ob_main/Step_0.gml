if mouse_check_button(mb_right) { cursor_hide=true; }
else { cursor_hide=false; }
//
if keyboard_check_pressed(vk_f5) { game_restart(); } //< delete later, testing
//————————————————————————————————————————————————————————————————————————————————————————————————————
if roadmap_create=true {
	var i=0;
	repeat (10) {
		event_a[i]=0;
		event_b[i]=1;
		//
		i+=1;
	}
	roadmap_create=false;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if keyboard_check_pressed(vk_enter) {
	if !instance_exists(ob_control) { instance_create_layer(x,y,"instances",ob_control); }
}