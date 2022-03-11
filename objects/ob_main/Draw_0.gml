if !instance_exists(ob_control) {
	var area_sp_x=area[roadmap_area], area_sp_y=0;
	if area_sp_x>=6 and area_sp_x<=11 { area_sp_x-=6; area_sp_y=1; }
	else if area_sp_x>=12 and area_sp_x<=16 { area_sp_x-=12; area_sp_y=2; }
	else if area_sp_x>=17 { area_sp_x-=17; area_sp_y=3; }
	//
	var win_x=cam_x+136, win_y=cam_y+97;
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	draw_sprite_general(sp_area,0,240*area_sp_x,112*area_sp_y,240,112,cam_x-104,cam_y-21,3,3,0,c_white,c_white,c_white,c_white,1);
	//
	sc_drawrectangle(cam_x-2,cam_y-2,cam_x+cam_w+2,cam_y+cam_h+2,global.color_black,c_white,0,0.98,1,0);
	sc_drawrectangle(win_x-2,win_y-2,win_x+240,win_y+112,c_white,global.color_white,2,0,1,0);
	//
	draw_sprite_general(sp_area,0,240*area_sp_x,112*area_sp_y,240,112,win_x,win_y,1,1,0,c_white,c_white,c_white,c_white,1);
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	draw_set_font(fn_m6x11);
	draw_set_halign(fa_center);
	//
	if event[2][roadmap_area]=-1 {
		var i=0;
		repeat (2) {
			sc_drawrectangle(win_x+55-9+(104*i),win_y+35-9,win_x+55+33+(104*i),win_y+35+33,global.color_black,global.color_white,2,0.8,0.5,0);
			draw_sprite_general(sp_sheet,0,16*(1+event[i][roadmap_area]*2),16*13,26,26,win_x+55+(104*i),win_y+35,1,1,0,c_white,c_white,c_white,c_white,1);
			sc_drawtext(win_x+55+13+(104*i),win_y+35+49,event_name[i][roadmap_area],global.color_white,global.color_black,1,1,0,-1);
			i++;
		}
	}
	else {
		var i=0;
		repeat (3) {
			sc_drawrectangle(win_x+36-9+(71*i),win_y+35-9,win_x+36+33+(71*i),win_y+35+33,global.color_black,global.color_white,2,0.8,0.5,0);
			draw_sprite_general(sp_sheet,0,16*(1+event[i][roadmap_area]*2),16*13,26,26,win_x+36+(71*i),win_y+35,1,1,0,c_white,c_white,c_white,c_white,1);
			sc_drawtext(win_x+36+13+(71*i),win_y+35+49,event_name[i][roadmap_area],global.color_white,global.color_black,1,1,0,-1);
			i++;
		}
	}
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	draw_sprite_general(sp_sheet,0,16*7,16*9,16,16,cam_x+32,cam_y+126,1,1,0,c_white,c_white,c_white,c_white,0.5);
	sc_drawtext(cam_x+40,cam_y+126+21,"Options",global.color_white,global.color_black,0.5,0.5,0,-1);
	draw_sprite_general(sp_sheet,0,16*8,16*9,16,16,cam_x+cam_w-48,cam_y+126,1,1,0,c_white,c_white,c_white,c_white,0.5);
	sc_drawtext(cam_x+cam_w-39,cam_y+126+21,"Deck",global.color_white,global.color_black,0.5,0.5,0,-1);
	//————————————————————————————————————————————————————————————————————————————————————————————————————
	draw_set_alpha(1);
	//
	var bar_amount=15;
	draw_healthbar(win_x+2,win_y-17,win_x+237,win_y-14,bar_amount,global.color_progress_dark,global.color_progress_light,global.color_progress_light,0,true,false);
	draw_sprite_general(sp_sheet,0,16*1,16*11,16,16,win_x-2+(bar_amount*235)/100,win_y-24,1,1,0,c_white,c_white,c_white,c_white,1);
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if fade_black>0 {
	sc_drawrectangle(cam_x-2,cam_y-2,cam_x+cam_w+2,cam_y+cam_h+2,global.color_black,c_white,0,fade_black,1,0);
}
//
//if textbox_active=true { sc_drawrectangle(cam_x+4,cam_y+cam_h-52,cam_x+cam_w-6,cam_y+cam_h-6,c_black,c_white,1,0.5,1,1); }
//if text_string!="" { sc_drawtext(cam_x+12,cam_y+cam_h-48,text_show,c_white,c_black,1,0.5,0,233); }
//————————————————————————————————————————————————————————————————————————————————————————————————————
if cursor_hide=false { var mouse_alpha=1; } else { var mouse_alpha=0.5; }
draw_sprite_general(sp_sheet,0,16*(mouse_cursor+1),16*0,16,16,mouse_x-5,mouse_y-5,1,1,0,c_white,c_white,c_white,c_white,mouse_alpha);