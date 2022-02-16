function se_look(argument0,argument1,argument2) {
/// @param id
/// @param face_char
/// @param dir
//————————————————————————————————————————————————————————————————————————————————————————————————————
if argument1=true {
	if ob_char.anim_dir=0 { argument0.anim_dir=1; }
	else if ob_char.anim_dir=1 { argument0.anim_dir=0; }
	else if ob_char.anim_dir=2 { argument0.anim_dir=3; }
	else if ob_char.anim_dir=3 { argument0.anim_dir=2; }
}
else { argument0.anim_dir=argument2; }
//
event_state+=1;
//————————————————————————————————————————————————————————————————————————————————————————————————————
}