//OB_EVENT
//————————————————————————————————————————————————————————————————————————————————————————————————————
if object_get_name(object_index)="ob_event_001" and ob_char.jumping_state=0 and (place_meeting(x,y,ob_char) or event_state>0) {
	switch (event_state) {
		case 0: se_event(true);
		case 1: se_teleport(64+8,6464+8,1,true,true); break;
		case 2: se_event(false); break;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
else if object_get_name(object_index)="ob_event_002" and ob_char.jumping_state=0 and (place_meeting(x,y,ob_char) or event_state>0) {
	switch (event_state) {
		case 0: se_event(true);
		case 1: se_teleport(4032+8,4304+8,0,true,true); break;
		case 2: se_event(false); break;
	}
}