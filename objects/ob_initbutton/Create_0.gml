buttonstate = true;
window_set_size(window_get_width() * 2, window_get_height() * 2);

if file_exists("moddata.txt") {
	
	var moddata = file_text_open_read("moddata.txt");
	var moddata_string = file_text_read_string(moddata);
	if string_length(moddata_string) == 5 { buttonstate = string_char_at(moddata_string, init_id); } 
}