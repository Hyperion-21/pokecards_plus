window_set_caption("PCL Mod Config");

global.mod_gen3to8 = true;
global.mod_megaforms = true;
global.mod_qol = true;
global.mod_speed = true;
global.mod_campfire = true;

instance_create_depth(0, 40*1, 0, ob_initbutton, {init_id : 1});
instance_create_depth(0, 40*2, 0, ob_initbutton, {init_id : 2});
instance_create_depth(0, 40*3, 0, ob_initbutton, {init_id : 3});
instance_create_depth(0, 40*4, 0, ob_initbutton, {init_id : 4});
instance_create_depth(0, 40*5, 0, ob_initbutton, {init_id : 5});

