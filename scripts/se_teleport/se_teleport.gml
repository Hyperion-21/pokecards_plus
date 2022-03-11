function se_teleport(argument0,argument1,argument2,argument3,argument4) {
/// @param x
/// @param y
/// @param dir
/// @param fade
/// @param quick
//————————————————————————————————————————————————————————————————————————————————————————————————————
if argument3=true and (ob_char.x!=argument0 or ob_char.y!=argument1) {
	ob_control.fade_black+=0.05;
}
//
if ob_control.fade_black=1 or argument3=false {
	ob_char.x=argument0;
	ob_char.y=argument1;
	x=argument0;
	y=argument1;
	ob_char.anim_dir=argument2;
	if argument4=true { ob_control.quick_transition=true; }
}
//
if ob_char.x=argument0 and ob_char.y=argument1 {
	if ob_control.fade_black>0 { ob_control.fade_black-=0.05; }
	if ob_control.fade_black=0 {
		x=start_x;
		y=start_y;
		event_state++;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}