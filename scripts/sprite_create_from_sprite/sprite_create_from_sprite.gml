function sprite_create_from_sprite(sprite, subimg, xscale, yscale, rot, width, height, origin_x, origin_y) 
{
    var surface = surface_create(width, height);
    surface_set_target(surface);
    draw_clear_alpha(c_black, 0);
    gpu_set_blendmode(bm_normal);
    gpu_set_texfilter(0);
    draw_sprite_ext(sprite, subimg, 0, 0, xscale, yscale, rot, c_white, 1);
    surface_reset_target();
    var sprite_new = sprite_create_from_surface(surface, 0, 0, width, height, 0, 0, origin_x, origin_y);
    surface_free(surface);
    return sprite_new;
}
