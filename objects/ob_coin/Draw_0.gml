sc_drawrectangle(ob_control.cam_x-2,ob_control.cam_y-2,ob_control.cam_x+cam_w+2,ob_control.cam_y+cam_h+2,global.color_black,c_white,0,0.5,1,0);
//
var coin_state_sprite=floor(coin_state);
if coin_state_sprite=3 { coin_state_sprite=1; }
draw_sprite_general(sp_sheet,0,16*(7+(coin_state_sprite*2)),16*7,24,24,x,y,2,2,0,c_white,c_white,c_white,c_white,1);