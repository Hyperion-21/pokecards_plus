function sc_playsound(argument0,argument1,argument2,argument3) {
/// @param sound
/// @param priority
/// @param loops
/// @param stop_prev_music
//————————————————————————————————————————————————————————————————————————————————————————————————————
var sound_volume=0, random_pitch=false;
//
switch (argument0) {
	default: sound_volume=1;
}
//
if argument3=true {
	audio_stop_sound(ms_azalea_intro);
	audio_stop_sound(ms_azalea);
}
//
audio_sound_gain(argument0,sound_volume,0);
if random_pitch=true { audio_sound_pitch(argument0,irandom_range(90,110)/100); }
audio_stop_sound(argument0);
//
return audio_play_sound(argument0,argument1,argument2);
//————————————————————————————————————————————————————————————————————————————————————————————————————
}