if effect_type!=-1 {
	if effect_alpha>0 { effect_alpha-=0.02; }
	else { instance_destroy(); }
	//
	if grow_effect=true { scale_add+=0.01; }
}
