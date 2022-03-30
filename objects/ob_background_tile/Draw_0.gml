//ob_background_tile
//————————————————————————————————————————————————————————————————————————————————————————————————————
if ob_main.option_state[ob_main.opt_bg_type]=0 or ob_main.option_state[ob_main.opt_bg_type]=1 {
	draw_sprite_ext(sprite_index,0,x,y,32,32,0,global.color_background_tile,1);
}