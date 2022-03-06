if !instance_exists(ob_control) {
	var i=0;
	repeat (ceil(room_width/16)) {
		var ii=0;
		repeat (ceil(room_height/16)) {
			draw_sprite_general(sp_sheet,0,16*tile_sub[i][ii],16*13,16,16,i*16,ii*16,1,1,0,c_white,c_white,c_white,c_white,1);
			if tile_above[i][ii]!=-1 { draw_sprite_general(sp_sheet,0,16*tile_above[i][ii],16*14,16,16,i*16,ii*16,1,1,0,c_white,c_white,c_white,c_white,1); }
			ii+=1;
		}
		i+=1;
	}
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	var i=0;
	repeat (2) {
		var ii=0;
		repeat (10) {
			draw_set_color(global.color_black); draw_set_alpha(0.25);
			if ii>0 { draw_line_width(event_x[i][ii-1]+16,event_y[i][ii-1],event_x[i][ii]-16,event_y[i][ii],2); }
			else { draw_line_width(character_original_x+16,character_original_y,event_x[i][ii]-16,event_y[i][ii],2); }
			ii+=1;
		}
		i+=1;
	}
	//
	var i=0;
	repeat (2) {
		var ii=0;
		repeat (10) {
			draw_sprite_general(sp_sheet,0,16*(3+event_kind[i][ii]),16*12,16,16,event_x[i][ii]-16,event_y[i][ii]-16,2,2,0,c_white,c_white,c_white,c_white,1);
			ii+=1;
		}
		i+=1;
	}
	//
	draw_sprite_general(sp_sheet,0,16*1,16*11,16,16,character_x-16,character_y-16,2,2,0,c_white,c_white,c_white,c_white,1);
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	sc_drawrectangle(cam_x-2,cam_y-2,cam_x+160,cam_y+cam_h+2,global.color_black,c_white,0,1,1,0);
	sc_drawrectangle(cam_x+cam_w-160,cam_y-2,cam_x+cam_w+2,cam_y+cam_h+2,global.color_black,c_white,0,1,1,0);
	sc_drawrectangle(cam_x-2,cam_y-2,cam_x+cam_w+2,cam_y+80,global.color_black,c_white,0,1,1,0);
	sc_drawrectangle(cam_x-2,cam_y+cam_h-80,cam_x+cam_w+2,cam_y+cam_h+2,global.color_black,c_white,0,1,1,0);
	//
	sc_drawrectangle(cam_x+160,cam_y+80,cam_x+cam_w-160,cam_y+cam_h-80,c_white,global.color_white,2,0,1,0);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if cursor_hide=false { var mouse_alpha=1; } else { var mouse_alpha=0.5; }
draw_sprite_general(sp_sheet,0,16*(mouse_cursor+1),16*0,16,16,mouse_x-5,mouse_y-5,1,1,0,c_white,c_white,c_white,c_white,mouse_alpha);