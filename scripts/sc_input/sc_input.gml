function sc_input(argument0,argument1) {
/// @param input
/// @param hold
//————————————————————————————————————————————————————————————————————————————————————————————————————
if argument0="01" {
	if argument1=true
		and (keyboard_check(vk_tab)) {
		return true;
	}
	else if argument1=false
		and (keyboard_check_pressed(vk_tab)) {
		return true;
	}
}
else if argument0="02" { //circle
	if argument1=true
		and ((keyboard_check(ord("D")))
		or gamepad_button_check(global.gamepad_current,gp_face2)) {
		return true;
	}
	else if argument1=false
		and ((keyboard_check_pressed(ord("D")))
		or gamepad_button_check_pressed(global.gamepad_current,gp_face2)) {
		return true;
	}
}
else if argument0="03" { //triangle
	if argument1=true
		and ((keyboard_check(ord("W")))
		or gamepad_button_check(global.gamepad_current,gp_face4)) {
		return true;
	}
	else if argument1=false
		and ((keyboard_check_pressed(ord("W")))
		or gamepad_button_check_pressed(global.gamepad_current,gp_face4)) {
		return true;
	}
}
else if argument0="04" { //square
	if argument1=true
		and ((keyboard_check(ord("A")))
		or gamepad_button_check(global.gamepad_current,gp_face3)) {
		return true;
	}
	else if argument1=false
		and ((keyboard_check_pressed(ord("A")))
		or gamepad_button_check_pressed(global.gamepad_current,gp_face3)) {
		return true;
	}
}
else if argument0="05" { //l1
	if argument1=true
		and ((keyboard_check(ord("Q")))
		or gamepad_button_check(global.gamepad_current,gp_shoulderl)) {
		return true;
	}
	else if argument1=false
		and ((keyboard_check_pressed(ord("Q")))
		or gamepad_button_check_pressed(global.gamepad_current,gp_shoulderl)) {
		return true;
	}
}
else if argument0="06" { //r1
	if argument1=true
		and ((keyboard_check(ord("E")))
		or gamepad_button_check(global.gamepad_current,gp_shoulderr)) {
		return true;
	}
	else if argument1=false
		and ((keyboard_check_pressed(ord("E")))
		or gamepad_button_check_pressed(global.gamepad_current,gp_shoulderr)) {
		return true;
	}
}
else if argument0="07" { //l2
	if argument1=true
		and ((keyboard_check(vk_tab))
		or gamepad_button_check(global.gamepad_current,gp_shoulderlb)) {
		return true;
	}
	else if argument1=false
		and ((keyboard_check_pressed(vk_tab))
		or gamepad_button_check_pressed(global.gamepad_current,gp_shoulderlb)) {
		return true;
	}
}
else if argument0="08" { //r2
	if argument1=true
		and ((keyboard_check(vk_shift))
		or gamepad_button_check(global.gamepad_current,gp_shoulderrb)) {
		return true;
	}
	else if argument1=false
		and ((keyboard_check_pressed(vk_shift))
		or gamepad_button_check_pressed(global.gamepad_current,gp_shoulderrb)) {
		return true;
	}
}
else if argument0="up" {
	if argument1=true
		and ((keyboard_check(vk_up))
		or gamepad_button_check(global.gamepad_current,gp_padu) or gamepad_axis_value(global.gamepad_current,gp_axislv)<0) {
		return true;
	}
	else if argument1=false
		and ((keyboard_check_pressed(vk_up))
		or gamepad_button_check_pressed(global.gamepad_current,gp_padu) or (gamepad_axis_value(global.gamepad_current,gp_axislv)<0 and global.gamepad_lvaxis=false)) {
		global.gamepad_lvaxis=true;
		return true;
	}
}
else if argument0="down" {
	if argument1=true
		and ((keyboard_check(vk_down))
		or gamepad_button_check(global.gamepad_current,gp_padd) or gamepad_axis_value(global.gamepad_current,gp_axislv)>0) {
		return true;
	}
	else if argument1=false
		and ((keyboard_check_pressed(vk_down))
		or gamepad_button_check_pressed(global.gamepad_current,gp_padd) or (gamepad_axis_value(global.gamepad_current,gp_axislv)>0 and global.gamepad_lvaxis=false)) {
		global.gamepad_lvaxis=true;
		return true;
	}
}
else if argument0="left" {
	if argument1=true
		and ((keyboard_check(vk_left))
		or gamepad_button_check(global.gamepad_current,gp_padl) or gamepad_axis_value(global.gamepad_current,gp_axislh)<0) {
		return true;
	}
	else if argument1=false
		and ((keyboard_check_pressed(vk_left))
		or gamepad_button_check_pressed(global.gamepad_current,gp_padl) or (gamepad_axis_value(global.gamepad_current,gp_axislh)<0 and global.gamepad_lhaxis=false)) {
		global.gamepad_lhaxis=true;
		return true;
	}
}
else if argument0="right" {
	if argument1=true
		and ((keyboard_check(vk_right))
		or gamepad_button_check(global.gamepad_current,gp_padr) or gamepad_axis_value(global.gamepad_current,gp_axislh)>0) {
		return true;
	}
	else if argument1=false
		and ((keyboard_check_pressed(vk_right))
		or gamepad_button_check_pressed(global.gamepad_current,gp_padr) or (gamepad_axis_value(global.gamepad_current,gp_axislh)>0 and global.gamepad_lhaxis=false)) {
		global.gamepad_lhaxis=true;
		return true;
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}