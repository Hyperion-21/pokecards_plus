var moddata = file_text_open_write("moddata.txt");
file_text_write_string(moddata, string(global.mod_gen3to8) + string(global.mod_megaforms) + string(global.mod_qol) + string(global.mod_speed) + string(global.mod_campfire));
file_text_close(moddata);

room_goto(rm_main);