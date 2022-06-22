draw_text(0, 0, "Pocket Crystal League Mod Configuration");

cursor_sprite=sp_splash_title_kana;

global.tempsave = "Savefile: data_" + string(global.mod_gen3to8) + string(global.mod_megaforms) + string(global.mod_qol) + string(global.mod_speed) + string(global.mod_campfire) + ".sav";

draw_text(0, 40*6, global.tempsave);