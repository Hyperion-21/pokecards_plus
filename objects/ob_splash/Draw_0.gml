//ob_splash
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_sprite_ext(sp_splash_title,0,x,y+text_rel_y,1,1,0,text_color,1);
//
draw_set_halign(fa_right);
draw_set_font(fn_m3x6);
sc_drawtext(ob_main.screen_main_x+ob_main.cam_w-3,ob_main.screen_main_y+ob_main.cam_h-14,ob_main.game_version,global.color_card_light,global.color_black,0.25,0.25,0,-1);