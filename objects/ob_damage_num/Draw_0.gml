if text_alpha>0 {
	if big_font=false { draw_set_font(fn_m6x11); }
	else { draw_set_font(fn_m6x11_L); }
	//
	var damage_text="";
	if damage_extra=0 { damage_text=string(damage_num); }
	else { damage_text=string(damage_num) + "+" + string(damage_extra); }
	//
	/*if damage_direct_unique=false {
		sc_drawrectangle(x-6-floor(string_width(damage_text)/2),y-4,x+4+ceil(string_width(damage_text)/2),y+15,
		global.color_black,global.color_black,1,text_alpha/2,text_alpha/2,0);
	}*/
	//
	draw_set_color(global.color_black);
	draw_set_alpha(text_alpha/2);
	draw_set_circle_precision(16);
	draw_circle(x-1,y+6,10,false);
	//
	draw_set_halign(fa_center);
	sc_drawtext(x,y,damage_text,text_color,global.color_black,text_alpha,text_alpha/1.5,0,-1);
}