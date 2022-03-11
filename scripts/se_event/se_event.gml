function se_event(argument0) {
/// @param initialize
//————————————————————————————————————————————————————————————————————————————————————————————————————
if argument0=true {
	move_x=0;
	move_y=0;
	//
	ob_control.event_active=true;
	event_state++;
}
else {
	ob_control.event_active=false;
	event_state=0;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}