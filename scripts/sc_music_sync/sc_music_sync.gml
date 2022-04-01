function sc_music_sync() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
var music_pos=audio_sound_get_track_position(ob_main.music_player), music_length=audio_sound_length(ob_main.music_player);
if audio_is_playing(ms_main) { var music_total_beats=80; }
else { return false; }
//
if ob_main.music_beat_margin=0 and music_pos mod (music_length/music_total_beats)<=0.05 {
	ob_main.music_beat_margin=15;
	return true;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}