depth=-1100;
//
original_y=y;
//
damage_num=0;
damage_extra=0;
text_alpha_full=2;
text_alpha=0;
text_color=c_white;
big_font=false;
damage_direct_unique=false;
ref_turn_num=0;

if variable_global_exists("attack_crit") {
	show_crit=global.attack_crit;
	global.attack_crit = false;
}