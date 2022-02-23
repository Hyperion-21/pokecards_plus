draw_sprite_general(sp_sheet,0,16*37+4,16*0,sprite_width,sprite_height,x,y,1,1,0,c_white,c_white,c_white,c_white,1);
//
var i=0, var_berries_total;
var_berries_total[0]=berries_total_type[0];
var_berries_total[1]=berries_total_type[1];
var_berries_total[2]=berries_total_type[2];
var_berries_total[3]=berries_total_type[3];
repeat (berries_total) {
	var ii=0, berry_drawn=false;
	do {
		if var_berries_total[ii]>0 {
			draw_sprite_general(sp_sheet,0,16*(ii+1),16*4,5,5,x+5+6*i,y+70,1,1,0,c_white,c_white,c_white,c_white,1);
			var_berries_total[ii]-=1;
			berry_drawn=true;
		}
		ii+=1;
	} until (berry_drawn=true);
	i+=1;
}