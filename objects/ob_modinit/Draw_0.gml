draw_text(2, 0, "Pocket Crystal League Mod Configuration");

//cursor_sprite=sp_splash_title_kana;

global.tempsave = "data_" + string(global.mod_gen3to8) + string(global.mod_megaforms) + string(global.mod_qol) + string(global.mod_speed) + string(global.mod_campfire) + ".sav";

draw_text(2, 40*i, "Savefile: " + global.tempsave);

draw_sprite_general(sp_sheet,0,16,16*0,16,16,mouse_x-5,mouse_y-5,2,2,0,c_white,c_white,c_white,c_white,1);