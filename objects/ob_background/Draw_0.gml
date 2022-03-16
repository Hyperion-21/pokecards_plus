//ob_background
//————————————————————————————————————————————————————————————————————————————————————————————————————
//draw_sprite_general(sprite_index,0,0,0,1,1,x-2,y-2,512+4,288+4,0,global.color_background_a,global.color_background_b,global.color_background_a,global.color_background_b,1);
//————————————————————————————————————————————————————————————————————————————————————————————————————
var area_sp_x=ob_main.location_type[ob_main.roadmap_area], area_sp_y=0;
if area_sp_x>=6 and area_sp_x<=11 { area_sp_x-=6; area_sp_y=1; }
else if area_sp_x>=12 and area_sp_x<=16 { area_sp_x-=12; area_sp_y=2; }
else if area_sp_x>=17 { area_sp_x-=17; area_sp_y=3; }
//
draw_sprite_general(sp_area,0,240*area_sp_x,112*area_sp_y,240,112,x-104,y-21,3,3,0,c_white,c_white,c_white,c_white,1);
sc_drawrectangle(x-2,y-2,x+512+2,y+288+2,global.color_black,c_white,0,0.6,1,0);