depth=-1100;
//
if ob_main.playing_tutorial=true { coin_state=2; } //makes you always go first
else { coin_state=choose(0,2); }
//
ground_y=y;
coin_vspeed=0;
coin_bounce=-14;
times_bounced=0;
//
final_timer=40;