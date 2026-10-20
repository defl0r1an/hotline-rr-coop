if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y - abs(lengthdir_x(speed * 3, dir)), image_xscale + (0.1 * speed), image_yscale + (0.1 * speed), image_angle, image_blend, image_alpha);
dir += 10;
if (dir > 360)
{
    dir = 0;
}
shader_reset();
