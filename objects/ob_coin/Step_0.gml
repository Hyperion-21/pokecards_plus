y+=coin_vspeed;
//
if y<ground_y {
	coin_vspeed++;
}
else if y=ground_y and times_bounced<(coin_bounce*-1) {
	sc_playsound(sn_coin,50,false,false);
	coin_vspeed=coin_bounce+times_bounced;
	times_bounced+=2;
}
//
if y>ground_y {
	y=ground_y;
	coin_vspeed=0;
}
//
if times_bounced<(coin_bounce*-1) {
	coin_state+=((coin_bounce*-1)/50)-(times_bounced/50);
	if coin_state>=4 { coin_state=0; }
}
else {
	final_timer--;
	if final_timer=0 {
		if floor(coin_state)=0 {
			ob_control.battler_turn=1;
			ob_control.card_draw_points=5;
		}
		else {
			ob_control.battler_turn=2;
			ob_control.enemycard_draw_points=5;
		}
		ob_control.tooltip_timer=ob_control.tooltip_timer_max;
		ob_control.turn_splash_timer=ob_control.turn_splash_timer_max;
		//
		instance_destroy();
	}
}