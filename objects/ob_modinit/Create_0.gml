if variable_global_exists("mod_gen3to8") { room_goto(rm_main); }

draw_set_font(fn_m6x11);
window_set_fullscreen(false);
window_set_caption("PCL Mod Config");

global.mod_gen3to8 = undefined;
global.mod_megaforms = undefined;
global.mod_qol = undefined;
global.mod_speed = undefined;
global.mod_campfire = undefined;

instance_create_depth(2, 55, 0, ob_initbutton, {init_id : 1});
instance_create_depth(2, 95, 0, ob_initbutton, {init_id : 2});
instance_create_depth(2, 135, 0, ob_initbutton, {init_id : 5});

instance_create_depth(2, 200, 0, ob_initbutton, {init_id : 3});
instance_create_depth(2, 240, 0, ob_initbutton, {init_id : 4});

instance_create_depth(2, 325, 0, ob_initbutton_start);