function sc_gamescaling() {
//————————————————————————————————————————————————————————————————————————————————————————————————————
if global.gamescaling=0 { window_set_size(427,240); }
else if global.gamescaling=1 { window_set_size(854,480); }
else if global.gamescaling=2 { window_set_size(1281,720); }
else if global.gamescaling=3 { window_set_size(1921,1080); }
else if global.gamescaling=4 { window_set_size(2562,1440); }
//————————————————————————————————————————————————————————————————————————————————————————————————————
}