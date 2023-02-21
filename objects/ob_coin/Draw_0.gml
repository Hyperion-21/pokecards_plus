sc_drawrectangle(ob_control.cam_x-2,ob_control.cam_y-2,ob_control.cam_x+cam_w+2,ob_control.cam_y+cam_h+2,global.color_black,c_white,0,0.5,1,0);
//
var coin_state_sprite=floor(coin_state);
var coin_y = ob_main.option_state[opt_coin];
if coin_state_sprite=3 { coin_state_sprite=1; }
draw_sprite_general(sp_coin,0,32*coin_state_sprite,32*coin_y,24,24,x,y,2,2,0,c_white,c_white,c_white,c_white,1);


