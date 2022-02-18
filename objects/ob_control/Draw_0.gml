cam_x=camera_get_view_x(view_camera[0]);
cam_y=camera_get_view_y(view_camera[0]);
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_set_font(fn_m3x6);
//
if tooltip_text!="" {
	if mouse_x+17+string_width(tooltip_text)<cam_x+cam_w {
		draw_set_halign(fa_left);
		sc_drawrectangle(mouse_x+9,mouse_y-4,mouse_x+18+string_width(tooltip_text),mouse_y+12,c_black,c_white,1,0.75,0);
		sc_drawtext(mouse_x+15,mouse_y-2,tooltip_text,make_colour_rgb(230,230,230),make_colour_rgb(40,40,40),1,0.5,0,-1);
	}
	else {
		draw_set_halign(fa_right);
		sc_drawrectangle(mouse_x-14-string_width(tooltip_text),mouse_y-4,mouse_x-5,mouse_y+12,c_black,c_white,1,0.75,0);
		sc_drawtext(mouse_x-8,mouse_y-2,tooltip_text,make_colour_rgb(230,230,230),make_colour_rgb(40,40,40),1,0.5,0,-1);
	}
}
tooltip_text="";
//
if fade_black>0 {
	sc_drawrectangle(cam_x-8,cam_y-8,cam_x+cam_w+8,cam_y+cam_h+8,c_black,c_white,0,fade_black,0);
}
//
if textbox_active=true { sc_drawrectangle(cam_x+4,cam_y+cam_h-52,cam_x+cam_w-6,cam_y+cam_h-6,c_black,c_white,1,0.5,1); }
if text_string!="" { sc_drawtext(cam_x+12,cam_y+cam_h-48,text_show,c_white,c_black,1,0.5,0,233); }
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_sprite_general(sp_sheet,0,16*1,16*0,16,16,mouse_x,mouse_y,1,1,0,c_white,c_white,c_white,c_white,1);