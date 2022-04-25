function sc_playsound(argument0,argument1,argument2,argument3) {
/// @param sound
/// @param priority
/// @param loops
/// @param stop_prev_music
//————————————————————————————————————————————————————————————————————————————————————————————————————
var sound_volume=0, music_volume_multiplier=0.5, random_pitch=false;
//
switch (argument0) {
	case ms_main: sound_volume=ob_main.option_state[opt_music]*music_volume_multiplier; break;
	case ms_league: sound_volume=ob_main.option_state[opt_music]*music_volume_multiplier; break;
	case ms_battle_intro: sound_volume=ob_main.option_state[opt_music]*music_volume_multiplier; break;
	case ms_battle: sound_volume=ob_main.option_state[opt_music]*music_volume_multiplier; break;
	case ms_battle_2: sound_volume=ob_main.option_state[opt_music]*music_volume_multiplier; break;
	case ms_battle_3: sound_volume=ob_main.option_state[opt_music]*music_volume_multiplier; break;
	case ms_battle_4: sound_volume=ob_main.option_state[opt_music]*music_volume_multiplier; break;
	case ms_tutorial: sound_volume=ob_main.option_state[opt_music]*music_volume_multiplier; break;
	case ms_victory: sound_volume=ob_main.option_state[opt_music]*music_volume_multiplier; break;
	case ms_defeat: sound_volume=ob_main.option_state[opt_music]*music_volume_multiplier; break;
	case ms_ending: sound_volume=ob_main.option_state[opt_music]*music_volume_multiplier; break;
	//
	case sn_money: sound_volume=(ob_main.option_state[opt_sound]/100)*0.5; break;
	case sn_text: sound_volume=(ob_main.option_state[opt_sound]/100)*0.4; break;
	default: sound_volume=(ob_main.option_state[opt_sound]/100);
}
//
if argument3=true {
	audio_stop_sound(ms_main);
	audio_stop_sound(ms_league);
	audio_stop_sound(ms_battle_intro);
	audio_stop_sound(ms_battle);
	audio_stop_sound(ms_battle_2);
	audio_stop_sound(ms_battle_3);
	audio_stop_sound(ms_battle_4);
	audio_stop_sound(ms_tutorial);
	audio_stop_sound(ms_victory);
	audio_stop_sound(ms_defeat);
	audio_stop_sound(ms_ending);
}
//
audio_sound_gain(argument0,sound_volume,0);
if random_pitch=true { audio_sound_pitch(argument0,irandom_range(90,110)/100); }
audio_stop_sound(argument0);
//
return audio_play_sound(argument0,argument1,argument2);
//————————————————————————————————————————————————————————————————————————————————————————————————————
}