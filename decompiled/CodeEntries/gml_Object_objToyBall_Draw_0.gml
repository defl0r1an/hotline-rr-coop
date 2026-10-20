if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_sprite_ext(sprite_index, image, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image, x, y - abs(lengthdir_x(speed * 2, dir)), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
dir += (20 - (speed * 5));
shader_reset();
