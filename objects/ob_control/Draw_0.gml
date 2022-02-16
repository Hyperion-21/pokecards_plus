cam_x=camera_get_view_x(view_camera[0]);
cam_y=camera_get_view_y(view_camera[0]);
//
draw_set_font(fn_m3x6);
//
if fade_black>0 {
	sc_drawrectangle(cam_x-8,cam_y-8,cam_x+cam_w+8,cam_y+cam_h+8,c_black,c_white,0,fade_black,0);
}
//
if textbox_active=true { sc_drawrectangle(cam_x+4,cam_y+cam_h-52,cam_x+cam_w-6,cam_y+cam_h-6,c_black,c_white,1,0.5,1); }
if text_string!="" { sc_drawtext(cam_x+12,cam_y+cam_h-48,text_show,c_white,c_black,1,0.5,0,233); }
//
draw_sprite_general(sp_sheet,0,16*5,16*0,16*3,16*4,cam_x+16,cam_y+16,1,1,0,c_white,c_white,c_white,c_white,1);
draw_sprite_general(sp_sheet,0,16*2,16*4,16*1,16*1,cam_x+16*3,cam_y+16,1,1,0,c_white,c_white,c_white,c_white,1);
sc_drawtext(cam_x+16+2,cam_y+16*3-2,"Bulbasaur",make_colour_rgb(230,230,230),make_colour_rgb(40,40,40),1,0.5,0,-1);