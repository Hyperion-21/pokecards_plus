if text_alpha>0 {
	text_alpha-=0.01;
	if damage_direct_unique=true { y-=0.25; }
	else { y-=0.2; }
}
//
if text_alpha<=0 and damage_direct_unique=false {
	instance_destroy();
}
else if text_alpha<=0 and damage_direct_unique=true {
	y=original_y;
	damage_num=0;
}
