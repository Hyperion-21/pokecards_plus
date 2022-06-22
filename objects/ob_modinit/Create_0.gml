window_set_fullscreen(false);
window_set_caption("PCL Mod Config");

global.mod_gen3to8 = undefined;
global.mod_megaforms = undefined;
global.mod_qol = undefined;
global.mod_speed = undefined;
global.mod_campfire = undefined;

i = 1;
max_button = 5;

while i <= max_button {
	instance_create_depth(2, 40*i, 0, ob_initbutton, {init_id : i});
	i++;
}

instance_create_depth(2, 40*(i+1), 0, ob_initbutton_start);