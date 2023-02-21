//ob_splash
//————————————————————————————————————————————————————————————————————————————————————————————————————
draw_sprite_ext(sp_splash_title,0,x,y+text_rel_y,1,1,0,text_color,1);
draw_sprite_ext(sp_splash_title_kana,0,x+(cam_w/2-78),y+201,1,1,0,text_color,1);
//
draw_set_font(fn_m3x6);
draw_set_halign(fa_right);
sc_drawtext(screen_main_x+cam_w-3,screen_main_y+cam_h-14,"PCL " + game_version,global.color_card_light,global.color_black,0.25,0.25,0,-1);
sc_drawtext(screen_main_x+cam_w-3,screen_main_y+cam_h-24,"PCL++ " + pclp_version,global.color_card_light,global.color_black,0.25,0.25,0,-1);
draw_set_halign(fa_left);
sc_drawtext(screen_main_x+5,screen_main_y+cam_h-24,"Created by Moodytail",global.color_card_light,global.color_black,0.25,0.25,0,-1);
sc_drawtext(screen_main_x+5,screen_main_y+cam_h-14,"Original Mod by Hyperion_21, Tukurai and DarkAnarchist ",global.color_card_light,global.color_black,0.25,0.25,0,-1);


draw_set_halign(fa_center);
draw_set_font(fn_m6x11_L);
sc_drawtext(screen_main_x+(cam_w/2),screen_main_y+cam_h-40,"Save File: " + string(ob_main.savestate +1),global.color_card_light,global.color_black,1,0.25,0,-1);
draw_set_font(fn_m3x6);
draw_set_halign(fa_right);