cam_x=camera_get_view_x(view_camera[0]);
cam_y=camera_get_view_y(view_camera[0]);
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_set_font(fn_m3x6);
//
draw_set_halign(fa_left);
var var_text=string(card_berrydeck_total) + "x Berry Deck";
sc_drawrectangle(10,cam_h-20,14+string_width(var_text),cam_h-9,make_colour_rgb(40,40,40),make_colour_rgb(40,40,40),1,0.5,0);
sc_drawtext(13,cam_h-21,var_text,make_colour_rgb(230,230,230),c_black,0.1,0,0,-1);
//
draw_set_halign(fa_right);
var var_text=string(card_maindeck_total) + "x Main Deck";
sc_drawrectangle(cam_w-15-string_width(var_text),cam_h-20,cam_w-11,cam_h-9,make_colour_rgb(40,40,40),make_colour_rgb(40,40,40),1,0.5,0);
sc_drawtext(cam_w-12,cam_h-21,var_text,make_colour_rgb(230,230,230),c_black,0.1,0,0,-1);
//
draw_set_halign(fa_center);
if card_draw_points>0 {
	if card_hand_total=card_hand_max {
		var var_message="You can't hold more than " + string(card_hand_max) + " cards in your hand. Discard or play some to draw more."
		var var_message_color=make_colour_rgb(225,168,160);
	}
	else if card_draw_points<=2 {
		var var_message="You may draw a card from your main deck, or 2 berries."
		var var_message_color=make_colour_rgb(160,193,225);
	}
	else if card_draw_points>2 {
		var var_message="You may draw a card from your main deck, or 2 berries (2x)."
		var var_message_color=make_colour_rgb(160,193,225);
	}
	//
	if helpmsg_dismissed=false {
		sc_drawrectangle(cam_w/2-string_width(var_message)/2-5,219,cam_w/2+string_width(var_message)/2+3,230,make_colour_rgb(40,40,40),make_colour_rgb(40,40,40),1,0.8,0);
		sc_drawtext(cam_w/2,218,var_message,var_message_color,make_colour_rgb(40,40,40),1,0.5,0,-1);
	}
	//
	draw_set_halign(fa_left);
	if card_draw_points>=card_drawcost_berry {
		sc_drawrectangle(27,193,49,204,make_colour_rgb(40,40,40),make_colour_rgb(40,40,40),1,0.5,0);
		sc_drawtext(30,192,"Draw",make_colour_rgb(160,193,225),make_colour_rgb(40,40,40),1,0.5,0,-1);
	}
	if card_draw_points>=card_drawcost_main {
		sc_drawrectangle(cam_w-50,193,cam_w-28,204,make_colour_rgb(40,40,40),make_colour_rgb(40,40,40),1,0.5,0);
		sc_drawtext(cam_w-47,192,"Draw",make_colour_rgb(160,193,225),make_colour_rgb(40,40,40),1,0.5,0,-1);
	}
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
if tooltip_text!="" {
	if mouse_x+17+string_width(tooltip_text)<cam_w {
		draw_set_halign(fa_left);
		sc_drawrectangle(mouse_x+9,mouse_y-4,mouse_x+18+string_width(tooltip_text),mouse_y+12,make_colour_rgb(40,40,40),make_colour_rgb(230,230,230),1,0.8,0);
		sc_drawtext(mouse_x+15,mouse_y-2,tooltip_text,make_colour_rgb(230,230,230),make_colour_rgb(40,40,40),1,0.5,0,-1);
	}
	else {
		draw_set_halign(fa_right);
		sc_drawrectangle(mouse_x-14-string_width(tooltip_text),mouse_y-4,mouse_x-5,mouse_y+12,make_colour_rgb(40,40,40),make_colour_rgb(230,230,230),1,0.8,0);
		sc_drawtext(mouse_x-8,mouse_y-2,tooltip_text,make_colour_rgb(230,230,230),make_colour_rgb(40,40,40),1,0.5,0,-1);
	}
}
tooltip_text="";
//————————————————————————————————————————————————————————————————————————————————————————————————————
if fade_black>0 {
	sc_drawrectangle(cam_x-8,cam_y-8,cam_x+cam_w+8,cam_y+cam_h+8,c_black,c_white,0,fade_black,0);
}
//
if textbox_active=true { sc_drawrectangle(cam_x+4,cam_y+cam_h-52,cam_x+cam_w-6,cam_y+cam_h-6,c_black,c_white,1,0.5,1); }
if text_string!="" { sc_drawtext(cam_x+12,cam_y+cam_h-48,text_show,c_white,c_black,1,0.5,0,233); }
//————————————————————————————————————————————————————————————————————————————————————————————————————
if cursor_hide=false { var mouse_alpha=1; } else { var mouse_alpha=0.5; }
draw_sprite_general(sp_sheet,0,16*(mouse_cursor+1),16*0,16,16,mouse_x-5,mouse_y-5,1,1,0,c_white,c_white,c_white,c_white,mouse_alpha);