function sc_setmaincolor() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
switch (global.windowcolor_id) {
	case 0:
		global.windowcolor=make_colour_rgb(220,220,220);
		global.windowcolor_name="WHITE";
		break;
	case 1:
		global.windowcolor=make_colour_rgb(251,132,132);
		global.windowcolor_name="RED";
		break;
	case 2:
		global.windowcolor=make_colour_rgb(251,192,132);
		global.windowcolor_name="ORANGE";
		break;
	case 3:
		global.windowcolor=make_colour_rgb(251,251,132);
		global.windowcolor_name="YELLOW";
		break;
	case 4:
		global.windowcolor=make_colour_rgb(185,251,132);
		global.windowcolor_name="GREEN";
		break;
	case 5:
		global.windowcolor=make_colour_rgb(132,251,162);
		global.windowcolor_name="TEAL";
		break;
	case 6:
		global.windowcolor=make_colour_rgb(132,251,251);
		global.windowcolor_name="CYAN";
		break;
	case 7:
		global.windowcolor=make_colour_rgb(132,162,251);
		global.windowcolor_name="BLUE";
		break;
	case 8:
		global.windowcolor=make_colour_rgb(191,132,251);
		global.windowcolor_name="PURPLE";
		break;
	case 9:
		global.windowcolor=make_colour_rgb(251,132,221);
		global.windowcolor_name="PINK";
		break;
}
//————————————————————————————————————————————————————————————————————————————————————————————————————
}