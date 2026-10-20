shakeigel = random_range(shake, -shake);
draw_sprite_ext(sprite_index, image_index, x + (shakeigel / 4) + 1, y + (shakeigel / 4) + 1, 1, 1, image_angle, c_black, 0.5);
if (on == 1)
{
    draw_sprite_ext(sprBrokenSkippy, 3, x, (y + shakeigel) - yy, 1, 1, 180 + shakeigel, image_blend, 1);
}
draw_sprite_ext(sprite_index, image_index, x + (shakeigel / 4), y + (shakeigel / 4), 1, 1, image_angle, image_blend, 1);
if (on == 1 && fotonegativ == 1)
{
    draw_set_blend_mode_ext(bm_inv_dest_color, bm_inv_src_color);
    draw_circle_color(x + (shakeigel * 2), y + (shakeigel * 2), (Circle - (shakeigel * 6)) + lengthdir_x(12, dir * 2), c_white, c_black, 0);
    draw_set_blend_mode(bm_normal);
}
if (on == 0 && global.puzzleIgel == 1)
{
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, image_blend, 0.1 + lengthdir_x(0.1, dir));
    d3d_set_fog(false, c_black, 0, 0);
    draw_sprite_ext(sprArrow, 0, x, (y - 15) + lengthdir_x(4, dir * 2), 1, 1, 0, c_white, 1);
}
dir += 3;
