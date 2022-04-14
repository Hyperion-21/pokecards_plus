//ob_card_splash
//————————————————————————————————————————————————————————————————————————————————————————————————————
x+=1;
if x>=screen_main_x+cam_w+84 { x-=512+168; }
//
if potential_y!=y {
	if potential_y>y {
		var step_y=ceil((potential_y-y)/5);
		y+=step_y;
	}
	else if potential_y<y {
		var step_y=ceil((y-potential_y)/5);
		y-=step_y;
	}
}
