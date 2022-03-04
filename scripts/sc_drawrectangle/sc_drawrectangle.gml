function sc_drawrectangle(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9) {
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param back_color
/// @param border_color
/// @param border_width
/// @param back_alpha
/// @param border_alpha
/// @param ext_black_border_alpha
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_set_color(argument4); draw_set_alpha(argument7);
draw_rectangle(argument0+1,argument1+1,argument2,argument3,false);
//
draw_set_color(global.color_black); draw_set_alpha(argument9);
draw_line_width(argument0-1,argument1-1,argument0-1,argument3+1,argument6);
draw_line_width(argument0-1,argument1-1,argument2+1,argument1-1,argument6);
draw_line_width(argument0-1,argument3+1,argument2+1,argument3+1,argument6);
draw_line_width(argument2+1,argument1-1,argument2+1,argument3+1,argument6);
//
draw_set_color(argument5); draw_set_alpha(argument8);
draw_line_width(argument0,argument1,argument0,argument3,argument6);
draw_line_width(argument0,argument1,argument2,argument1,argument6);
draw_line_width(argument0,argument3,argument2,argument3,argument6);
draw_line_width(argument2,argument1,argument2,argument3,argument6);
//————————————————————————————————————————————————————————————————————————————————————————————————————
}