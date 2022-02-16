function se_text(argument0,argument1,argument2) {
/// @param text
/// @param textbox
/// @param last
//————————————————————————————————————————————————————————————————————————————————————————————————————
ob_control.textbox_active=argument1;
//
if ob_control.text_next=false { ob_control.text_string=argument0; }
else {
	if argument2=true { ob_control.textbox_active=false; }
	event_state+=1;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}