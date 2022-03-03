text_alpha-=0.01;
if text_move=true { y-=0.5; }
//
if text_alpha<0 { instance_destroy(); }