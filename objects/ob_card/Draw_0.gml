draw_sprite_general(sp_sheet,0,16*5+4,16*0,57,80,x,y,1,1,0,c_white,c_white,c_white,c_white,1);
draw_sprite_general(card_sheet,0,65*(card_grid_x-1)+1,33*(card_grid_y-1)+1,64,32,x-4,y+3,1,1,0,c_white,c_white,c_white,c_white,1);
draw_sprite_general(sp_sheet,0,16*(card_type_a+1),16*5,10,9,x+2,y+2,1,1,0,c_white,c_white,c_white,c_white,1);
if card_type_b>=0 { draw_sprite_general(sp_sheet,0,16*(card_type_b+1),16*5,10,9,x+2,y+10,1,1,0,c_white,c_white,c_white,c_white,1); }
//
draw_healthbar(x+4,y+56,x+52,y+57,card_exp,make_colour_rgb(205,198,181),make_colour_rgb(91,88,80),make_colour_rgb(91,88,80),0,true,false);
//
draw_set_font(fn_m3x6);
draw_set_halign(fa_center);
sc_drawtext(x+29,y+39,card_name,make_colour_rgb(230,230,230),make_colour_rgb(40,40,40),1,0.5,0,-1);
sc_drawtext(x+29,y+50,"lv " + string(card_level),make_colour_rgb(190,190,190),make_colour_rgb(40,40,40),1,0.5,0,-1);
//
draw_set_halign(fa_left);
sc_drawtext(x+5,y+66,string(card_atk),make_colour_rgb(230,230,230),make_colour_rgb(40,40,40),1,0.5,0,-1);
draw_set_halign(fa_center);
sc_drawtext(x+29,y+60,string(card_hp),make_colour_rgb(230,230,230),make_colour_rgb(40,40,40),1,0.5,0,-1);
draw_set_halign(fa_right);
sc_drawtext(x+53,y+66,string(card_def),make_colour_rgb(230,230,230),make_colour_rgb(40,40,40),1,0.5,0,-1);