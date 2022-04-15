if instance_exists(ob_control) {
	if button_id=0 and ob_control.battler_turn=1 { draw_sprite_general(sp_sheet,0,16*3,16*(7+(ceil(button_state)*2)),31,24,x,y,1,1,0,c_white,c_white,c_white,c_white,1); }
	else if button_id=0 and ob_control.battler_turn!=1 { draw_sprite_general(sp_sheet,0,16*5,16*(7+(ceil(button_state)*2)),31,24,x,y,1,1,0,c_white,c_white,c_white,c_white,1); }
	else if button_id=1 { draw_sprite_general(sp_sheet,0,16*button_id,16*(7+(ceil(button_state)*2)),16,16,x,y,1,1,0,c_white,c_white,c_white,c_white,1); }
	else if button_id=2 { draw_sprite_general(sp_sheet,0,16*button_id,16*(7+(ceil(button_state)*2)),16,16,x,y,1,1,0,c_white,c_white,c_white,c_white,0.5); }
}
else if instance_exists(ob_event) {
	if button_id=0 { draw_sprite_general(sp_sheet,0,16*3,16*(7+(ceil(button_state)*2)),31,24,x,y,1,1,0,c_white,c_white,c_white,c_white,1); }
	else if button_id=1 { draw_sprite_general(sp_sheet,0,16*5,16*(7+(ceil(button_state)*2)),31,24,x,y,1,1,0,c_white,c_white,c_white,c_white,1); }
	else if button_id=2 { draw_sprite_general(sp_sheet,0,16*1,16*(8+(ceil(button_state)*2)),16,16,x,y,1,1,0,c_white,c_white,c_white,c_white,1); }
}
else if instance_exists(ob_deckbuild) {
	if button_id<10 { draw_sprite_general(sp_sheet,0,16*(13+button_id),16*(7+ceil(button_state)),16,16,x,y,1,1,0,c_white,c_white,c_white,c_white,1); }
	else { draw_sprite_general(sp_sheet,0,16*(13+10),16*(7+ceil(button_state)),16,16,x,y,1,1,0,c_white,c_white,c_white,c_white,1); }
}