draw_set_font(fn_m6x11);
//
var damage_text="", damage_color=c_white;
if damage_extra=0 { damage_text=string(damage_num); }
else { damage_text=string(damage_num) + "+" + string(damage_extra); }
if damage_direct=false { damage_color=make_colour_rgb(225,168,160); }
else { damage_color=make_colour_rgb(226,204,161); }
//
if text_move=false {
	sc_drawrectangle(x+offset_x-6-floor(string_width(damage_text)/2),y-4,x+offset_x+4+ceil(string_width(damage_text)/2),y+15,
	make_colour_rgb(40,40,40),make_colour_rgb(40,40,40),1,text_alpha/2,text_alpha/2,0);
}
//
draw_set_halign(fa_center);
sc_drawtext(x+offset_x,y,damage_text,damage_color,make_colour_rgb(40,40,40),text_alpha,text_alpha/1.5,0,-1);