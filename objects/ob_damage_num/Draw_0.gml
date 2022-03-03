draw_set_font(fn_m6x11);
//
draw_set_halign(fa_center);
var damage_text="";
if damage_extra=0 { damage_text=string(damage_num); }
else { damage_text=string(damage_num) + "+" + string(damage_extra); }
sc_drawtext(x,y,damage_text,make_colour_rgb(225,168,160),make_colour_rgb(40,40,40),text_alpha,text_alpha/1.5,0,-1);