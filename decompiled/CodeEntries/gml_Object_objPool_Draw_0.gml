if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_sprite_ext(sprPool, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();
