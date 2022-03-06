if !instance_exists(ob_control) {
	draw_sprite_general(sp_area,0,240*0,112*0,240,112,cam_x-104,cam_y-21,3,3,0,c_white,c_white,c_white,c_white,1);
	//
	sc_drawrectangle(cam_x-2,cam_y-2,cam_x+cam_w+2,cam_y+cam_h+2,global.color_black,c_white,0,0.98,1,0);
	sc_drawrectangle(cam_x+134,cam_y+95,cam_x+cam_w-136,cam_y+cam_h-79,c_white,global.color_white,2,0,1,0);
	//
	draw_sprite_general(sp_area,0,240*0,112*0,240,112,cam_x+136,cam_y+97,1,1,0,c_white,c_white,c_white,c_white,1);
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	sc_drawrectangle(cam_x+191-9,cam_y+132-9,cam_x+191+33,cam_y+132+33,global.color_black,global.color_white,2,0.8,0.5,0);
	sc_drawrectangle(cam_x+295-9,cam_y+132-9,cam_x+295+33,cam_y+132+33,global.color_black,global.color_white,2,0.8,0.5,0);
	draw_sprite_general(sp_sheet,0,16*(1+event_a[0]*2),16*13,26,26,cam_x+191,cam_y+132,1,1,0,c_white,c_white,c_white,c_white,1);
	draw_sprite_general(sp_sheet,0,16*(1+event_b[0]*2),16*13,26,26,cam_x+295,cam_y+132,1,1,0,c_white,c_white,c_white,c_white,1);
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	draw_set_alpha(1);
	//
	var bar_amount=15;
	draw_healthbar(cam_x+138,cam_y+80,cam_x+cam_w-139,cam_y+83,bar_amount,global.color_progress_dark,global.color_progress_light,global.color_progress_light,0,true,false);
	draw_sprite_general(sp_sheet,0,16*1,16*11,16,16,cam_x+134+(bar_amount*235)/100,cam_y+73,1,1,0,c_white,c_white,c_white,c_white,1);
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	draw_set_font(fn_m6x11);
	draw_set_halign(fa_center);
	sc_drawtext(cam_x+191+13,cam_y+132+49,"Battle",global.color_white,global.color_black,1,1,0,-1);
	sc_drawtext(cam_x+295+13,cam_y+132+49,"Card Pack",global.color_white,global.color_black,1,1,0,-1);
	//
	draw_sprite_general(sp_sheet,0,16*7,16*9,16,16,cam_x+32,cam_y+126,1,1,0,c_white,c_white,c_white,c_white,0.5);
	sc_drawtext(cam_x+40,cam_y+126+21,"Options",global.color_white,global.color_black,0.5,0.5,0,-1);
	draw_sprite_general(sp_sheet,0,16*8,16*9,16,16,cam_x+cam_w-48,cam_y+126,1,1,0,c_white,c_white,c_white,c_white,0.5);
	sc_drawtext(cam_x+cam_w-39,cam_y+126+21,"Deck",global.color_white,global.color_black,0.5,0.5,0,-1);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if cursor_hide=false { var mouse_alpha=1; } else { var mouse_alpha=0.5; }
draw_sprite_general(sp_sheet,0,16*(mouse_cursor+1),16*0,16,16,mouse_x-5,mouse_y-5,1,1,0,c_white,c_white,c_white,c_white,mouse_alpha);