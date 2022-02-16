function sc_drawtext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8) {
/// @param x
/// @param y
/// @param text
/// @param color
/// @param border_color
/// @param alpha
/// @param border_alpha
/// @param jiggle_amount
/// @param line_break
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_set_color(argument4); draw_set_alpha(argument6);
draw_text_ext(argument0-(irandom(argument7)+1),argument1,string(argument2),-1,argument8);
draw_text_ext(argument0+(irandom(argument7)+1),argument1,string(argument2),-1,argument8);
draw_text_ext(argument0,argument1-(irandom(argument7)+1),string(argument2),-1,argument8);
draw_text_ext(argument0,argument1+(irandom(argument7)+1),string(argument2),-1,argument8);
//
draw_set_color(argument3); draw_set_alpha(argument5);
draw_text_ext(argument0,argument1,string(argument2),-1,argument8);
//————————————————————————————————————————————————————————————————————————————————————————————————————
}