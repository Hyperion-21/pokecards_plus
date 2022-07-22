draw_set_font(fn_m6x11_XL);
draw_text(2, 2, "Pocket Crystal League Mod Configuration");
draw_set_font(fn_m6x11_L);
draw_text(2, 30, "Major Content Packages:");
draw_text(2, 180, "Minor Patches:");
draw_set_font(fn_m6x11);

//cursor_sprite=sp_splash_title_kana;

global.tempsave = "data_" + string(global.mod_gen3to8) + string(global.mod_megaforms) + string(global.mod_campfire) + "_v1.4.0.0.sav";

draw_text(2, 305, "Savefile: " + global.tempsave);

draw_sprite_general(sp_sheet,0,21,5,8,10,mouse_x,mouse_y,2,2,0,c_white,c_white,c_white,c_white,1);