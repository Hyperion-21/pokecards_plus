function sc_setfont() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
global.font_gamemenu=fn_kp_mini;
//————————————————————————————————————————————————————————————————————————————————————————————————————
switch (global.textfont) {
	case 0:
		global.font_text=fn_m5x7_def;
		global.font_charname=fn_kp_mini;
		global.font_textoptions=fn_m5x7_def;
		global.font_mainmenu=fn_m5x7_def;
		global.font_mainsubmenu=fn_kp_mini;
		global.font_gamesubmenu=fn_kp_mini;
		global.font_hud=fn_m5x7_def;
		global.font_subhud=fn_kp_mini;
		global.font_damage=fn_kp_mini;
		global.font_gameversion=fn_kp_mini;
		global.textfont_name="M5X7 + PIXEL";
		break;
	case 1:
		global.font_text=fn_kp_def;
		global.font_charname=fn_kp_mini;
		global.font_textoptions=fn_kp_def;
		global.font_mainmenu=fn_kp_def;
		global.font_mainsubmenu=fn_kp_mini;
		global.font_gamesubmenu=fn_kp_mini;
		global.font_hud=fn_kp_def;
		global.font_subhud=fn_kp_mini;
		global.font_damage=fn_kp_mini;
		global.font_gameversion=fn_kp_mini;
		global.textfont_name="PIXEL";
		break;
	case 2:
		global.font_text=fn_km_def;
		global.font_charname=fn_km_mini;
		global.font_textoptions=fn_km_def;
		global.font_mainmenu=fn_km_def;
		global.font_mainsubmenu=fn_km_mini;
		global.font_gamesubmenu=fn_km_mini;
		global.font_hud=fn_km_def;
		global.font_subhud=fn_km_mini;
		global.font_damage=fn_km_mini;
		global.font_gameversion=fn_km_mini;
		global.textfont_name="MINI";
		break;
	case 3:
		global.font_text=fn_kh_def;
		global.font_charname=fn_kh_mini;
		global.font_textoptions=fn_kh_def;
		global.font_mainmenu=fn_kh_def;
		global.font_mainsubmenu=fn_kh_mini;
		global.font_gamesubmenu=fn_kh_mini;
		global.font_hud=fn_kh_def;
		global.font_subhud=fn_kh_mini;
		global.font_damage=fn_kh_mini;
		global.font_gameversion=fn_kh_mini;
		global.textfont_name="HIGH";
		break;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}