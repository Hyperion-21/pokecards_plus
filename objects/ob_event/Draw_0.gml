//————————————————————————————————————————————————————————————————————————————————————————————————————
//ob_control, ob_event & ob_deckbuild
if tooltip_text!="" {
	draw_set_font(fn_m3x6);
	if mouse_x+17+string_width(tooltip_text)<ob_main.screen_deck_x+ob_main.cam_w {
		draw_set_halign(fa_left);
		sc_drawrectangle(mouse_x+9,mouse_y-4,mouse_x+18+string_width(tooltip_text),mouse_y+12,global.color_black,global.color_white,1,0.8,1,0);
		sc_drawtext(mouse_x+15,mouse_y-2,tooltip_text,global.color_white,global.color_black,1,0.5,0,-1);
	}
	else {
		draw_set_halign(fa_right);
		sc_drawrectangle(mouse_x-14-string_width(tooltip_text),mouse_y-4,mouse_x-5,mouse_y+12,global.color_black,global.color_white,1,0.8,1,0);
		sc_drawtext(mouse_x-8,mouse_y-2,tooltip_text,global.color_white,global.color_black,1,0.5,0,-1);
	}
}
tooltip_text="";