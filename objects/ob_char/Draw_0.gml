var anim_rot=0, x_pos=0, y_pos=0, vfx_alpha=0, sub_draw_min=0, sub_draw_max=0;
vfx_alpha[0]=0; vfx_alpha[1]=0.6; vfx_alpha[2]=0.9; vfx_alpha[3]=0.75;
//
if anim_dir=0 {
	anim_rot[0]=270; x_pos[0]=x+4; y_pos[0]=y-17;
	anim_rot[1]=285; x_pos[1]=x_pos[0]-4; y_pos[1]=y_pos[0]-2;
	anim_rot[2]=305; x_pos[2]=x_pos[0]-11; y_pos[2]=y_pos[0]-1;
	anim_rot[3]=330; x_pos[3]=x_pos[0]-18; y_pos[3]=y_pos[0]+2;
	anim_rot[4]=0; x_pos[4]=x_pos[0]-20; y_pos[4]=y_pos[0]+11;
	anim_rot[5]=45; x_pos[5]=x_pos[0]-21; y_pos[5]=y_pos[0]+24;
	anim_rot[6]=70; x_pos[6]=x_pos[0]-14; y_pos[6]=y_pos[0]+29;
	anim_rot[7]=90; x_pos[7]=x_pos[0]-9; y_pos[7]=y_pos[0]+33;
	sub_draw_min=-1; sub_draw_max=-1; }
else if anim_dir=1 {
	anim_rot[0]=90; x_pos[0]=x-4; y_pos[0]=y+13;
	anim_rot[1]=105; x_pos[1]=x_pos[0]+4; y_pos[1]=y_pos[0]+2;
	anim_rot[2]=125; x_pos[2]=x_pos[0]+11; y_pos[2]=y_pos[0]+1;
	anim_rot[3]=150; x_pos[3]=x_pos[0]+18; y_pos[3]=y_pos[0]-2;
	anim_rot[4]=180; x_pos[4]=x_pos[0]+20; y_pos[4]=y_pos[0]-11;
	anim_rot[5]=225; x_pos[5]=x_pos[0]+21; y_pos[5]=y_pos[0]-24;
	anim_rot[6]=250; x_pos[6]=x_pos[0]+14; y_pos[6]=y_pos[0]-29;
	anim_rot[7]=270; x_pos[7]=x_pos[0]+9; y_pos[7]=y_pos[0]-33;
	sub_draw_min=0; sub_draw_max=3; }
else if anim_dir=2 {
	anim_rot[0]=180; x_pos[0]=x+13; y_pos[0]=y+2;
	anim_rot[1]=195; x_pos[1]=x_pos[0]+2; y_pos[1]=y_pos[0]-4;
	anim_rot[2]=215; x_pos[2]=x_pos[0]+1; y_pos[2]=y_pos[0]-11;
	anim_rot[3]=240; x_pos[3]=x_pos[0]-2; y_pos[3]=y_pos[0]-18;
	anim_rot[4]=270; x_pos[4]=x_pos[0]-11; y_pos[4]=y_pos[0]-20;
	anim_rot[5]=315; x_pos[5]=x_pos[0]-24; y_pos[5]=y_pos[0]-21;
	anim_rot[6]=340; x_pos[6]=x_pos[0]-29; y_pos[6]=y_pos[0]-14;
	anim_rot[7]=0; x_pos[7]=x_pos[0]-33; y_pos[7]=y_pos[0]-9;
	sub_draw_min=0; sub_draw_max=1; }
else if anim_dir=3 {
	anim_rot[0]=0; x_pos[0]=x-13; y_pos[0]=y-6;
	anim_rot[1]=15; x_pos[1]=x_pos[0]-2; y_pos[1]=y_pos[0]+4;
	anim_rot[2]=35; x_pos[2]=x_pos[0]-1; y_pos[2]=y_pos[0]+11;
	anim_rot[3]=60; x_pos[3]=x_pos[0]+2; y_pos[3]=y_pos[0]+18;
	anim_rot[4]=90; x_pos[4]=x_pos[0]+11; y_pos[4]=y_pos[0]+20;
	anim_rot[5]=135; x_pos[5]=x_pos[0]+24; y_pos[5]=y_pos[0]+21;
	anim_rot[6]=160; x_pos[6]=x_pos[0]+29; y_pos[6]=y_pos[0]+14;
	anim_rot[7]=180; x_pos[7]=x_pos[0]+33; y_pos[7]=y_pos[0]+9;
	sub_draw_min=2; sub_draw_max=3; }
//————————————————————————————————————————————————————————————————————————————————————————————————————
if jumping_state>0 { draw_sprite_part_ext(sp_spritesheet01,0,(1*16),(0*16),16,16,x-8,y-11,1,1,c_white,0.5); }
//
if attacking=true and (anim_frame>=sub_draw_min and anim_frame<=sub_draw_max) {
	draw_sprite_general(sp_spritesheet01,0,(1*16),(2*16),32,32,
	x_pos[(anim_frame*2)+floor(anim_frame_timer/(anim_frame_timermax/2))],y_pos[(anim_frame*2)+floor(anim_frame_timer/(anim_frame_timermax/2))]-jumping_air,
	1,1,anim_rot[(anim_frame*2)+floor(anim_frame_timer/(anim_frame_timermax/2))],c_white,c_white,c_white,c_white,1);
	draw_sprite_general(sp_spritesheet01,0,(3*16),(2*16),32,32,
	x_pos[(anim_frame*2)+floor(anim_frame_timer/(anim_frame_timermax/2))],y_pos[(anim_frame*2)+floor(anim_frame_timer/(anim_frame_timermax/2))]-jumping_air,
	1,1,anim_rot[(anim_frame*2)+floor(anim_frame_timer/(anim_frame_timermax/2))],c_white,c_white,c_white,c_white,vfx_alpha[anim_frame]);
}
//
draw_sprite_part_ext(sp_spritesheet01,0,(5*16)+(anim_set*16)+(anim_frame*16),(0*16)+(anim_dir*16),16,16,x-8,y-12-jumping_air,1,1,c_white,1);
//
if attacking=true and (anim_frame<sub_draw_min or anim_frame>sub_draw_max) {
	draw_sprite_general(sp_spritesheet01,0,(1*16),(2*16),32,32,
	x_pos[(anim_frame*2)+floor(anim_frame_timer/(anim_frame_timermax/2))],y_pos[(anim_frame*2)+floor(anim_frame_timer/(anim_frame_timermax/2))]-jumping_air,
	1,1,anim_rot[(anim_frame*2)+floor(anim_frame_timer/(anim_frame_timermax/2))],c_white,c_white,c_white,c_white,1);
	draw_sprite_general(sp_spritesheet01,0,(3*16),(2*16),32,32,
	x_pos[(anim_frame*2)+floor(anim_frame_timer/(anim_frame_timermax/2))],y_pos[(anim_frame*2)+floor(anim_frame_timer/(anim_frame_timermax/2))]-jumping_air,
	1,1,anim_rot[(anim_frame*2)+floor(anim_frame_timer/(anim_frame_timermax/2))],c_white,c_white,c_white,c_white,vfx_alpha[anim_frame]);
}
//
if tallgrass=true { draw_sprite_part_ext(sp_spritesheet01,0,(1*16)+(anim_frame*16),(1*16),16,16,x-8,y-11,1,1,c_white,1); }