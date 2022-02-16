if event_physical=true and hp_curr>0 {
	var sprite_color=c_white;
	if hurt_cooldown>0 {
		sprite_color=make_colour_rgb(255,200,200);
	}
	draw_sprite_part_ext(sp_spritesheet01,0,(anim_set_x*16)+(anim_frame*16),(anim_set_y*16)+(anim_dir*16),16,16,x-8,y-12,1,1,sprite_color,1);
	//
	if tallgrass=true { draw_sprite_part_ext(sp_spritesheet01,0,(1*16)+(anim_frame*16),(1*16),16,16,x-8,y-11,1,1,c_white,1); }
}