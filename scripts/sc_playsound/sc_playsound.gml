function sc_playsound(argument0,argument1,argument2,argument3,argument4) {
/// @param sound
/// @param priority
/// @param only_volume
/// @param loops
/// @param is_music
//————————————————————————————————————————————————————————————————————————————————————————————————————
var sound_volume=0, random_pitch=true;
//
switch(argument0) {
	case sn_swing: sound_volume=1; break;
	case sn_jump: sound_volume=0.2; break;
	case sn_text: sound_volume=1; break;
	//case sn_ok: sound_volume=1; break;
	//case sn_no: sound_volume=1; break;
	//case sn_optmove: sound_volume=0.8; break;
	//case sn_text: sound_volume=0.5; random_pitch=false; break;
	//case sn_hit01: sound_volume=0.2; break;
	//case sn_hit02: sound_volume=0.2; break;
	//case sn_hit03: sound_volume=0.2; break;
	//case sn_kill: sound_volume=0.2; break;
	//case sn_heal: sound_volume=0.2; break;
	//case sn_gold: sound_volume=0.05; break;
	//case sn_handrub: sound_volume=0.1; break;
	//case sn_hearts: sound_volume=0.1; break;
	//case sn_levelup: sound_volume=0.2; break;
	//
	case -1: sound_volume=0; break; //stops music
	//case ms_main: sound_volume=0.5; break;
	//case ms_town: sound_volume=0.5; break;
	//case ms_boss: sound_volume=0.5; break;
	//
	default: sound_volume=0.1; //pokemon cries
}
if argument4=false { //sound effect
	audio_sound_gain(argument0,sound_volume*(global.sound_level/10),0);
	if argument2=false {
		if random_pitch=true { audio_sound_pitch(argument0,irandom_range(90,110)/100); }
		audio_stop_sound(argument0);
	}
}
else { //music
	if argument0!=-1 { audio_sound_gain(argument0,sound_volume*(global.music_level/10),0); }
	//
	if argument2=false {
		audio_stop_sound(ms_main);
		audio_stop_sound(ms_town);
		audio_stop_sound(ms_boss);
	}
}
//
if argument0!=-1 and argument2=false { audio_play_sound(argument0,argument1,argument3); }
//————————————————————————————————————————————————————————————————————————————————————————————————————
}