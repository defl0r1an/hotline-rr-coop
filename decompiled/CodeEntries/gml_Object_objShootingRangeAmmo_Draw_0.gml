draw_sprite_ext(sprite_index, 0, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprShootingRangeAmmoTop, index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprShootingRangeAmmoTop, index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (arrow)
{
    draw_sprite_ext(sprArrow, 0, x + lengthdir_x(16 + (4 * sin(dir)), image_angle - 90), y + lengthdir_y(16 + (4 * sin(dir)), image_angle - 90), 1, 1, image_angle + 180, c_white, 1);
}
dir += 0.125;
