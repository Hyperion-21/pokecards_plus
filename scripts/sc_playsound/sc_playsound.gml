function sc_playsound(argument0,argument1,argument2,argument3) {
/// @param sound
/// @param priority
/// @param loops
/// @param music
//————————————————————————————————————————————————————————————————————————————————————————————————————
var sound_volume=0, random_pitch=false;
//
switch (argument0) {
	case ms_main: sound_volume=(ob_main.option_state[opt_music]/100); break; //also referenced with audio_sound_gain when changing volume in options and when reset config
	case ms_league: sound_volume=(ob_main.option_state[opt_music]/100); break; //also referenced with audio_sound_gain when changing volume in options and when reset config
	case ms_battle_intro: sound_volume=(ob_main.option_state[opt_music]/100); break;
	case ms_battle: sound_volume=(ob_main.option_state[opt_music]/100); break;
	case ms_battle_2: sound_volume=(ob_main.option_state[opt_music]/100); break;
	case ms_battle_3: sound_volume=(ob_main.option_state[opt_music]/100); break;
	case ms_battle_4: sound_volume=(ob_main.option_state[opt_music]/100); break;
	case ms_tutorial: sound_volume=(ob_main.option_state[opt_music]/100); break;
	case ms_victory: sound_volume=(ob_main.option_state[opt_music]/100); break;
	case ms_defeat: sound_volume=(ob_main.option_state[opt_music]/100); break;
	case ms_ending: sound_volume=(ob_main.option_state[opt_music]/100); break;
	//
	case sn_card: sound_volume=(ob_main.option_state[opt_sound]/100)*0.6; break;
	case sn_click: sound_volume=(ob_main.option_state[opt_sound]/100)*0.4; random_pitch=true; break;
	case sn_coin: sound_volume=(ob_main.option_state[opt_sound]/100)*0.9; break;
	case sn_event: sound_volume=(ob_main.option_state[opt_sound]/100)*0.7; break;
	case sn_faint: sound_volume=(ob_main.option_state[opt_sound]/100); break;
	case sn_hurt: sound_volume=(ob_main.option_state[opt_sound]/100)*0.6; random_pitch=true; break;
	case sn_money: sound_volume=(ob_main.option_state[opt_sound]/100)*0.2; break;
	case sn_noise: sound_volume=(ob_main.option_state[opt_sound]/100)*0.2; break;
	case sn_rare: sound_volume=(ob_main.option_state[opt_sound]/100); break;
	case sn_rare_2: sound_volume=(ob_main.option_state[opt_sound]/100); break;
	case sn_text: sound_volume=(ob_main.option_state[opt_sound]/100)*0.2; break;
	case sn_upgrade: sound_volume=(ob_main.option_state[opt_sound]/100)*0.6; break;
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