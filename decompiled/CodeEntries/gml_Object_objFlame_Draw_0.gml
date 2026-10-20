dir += 0.15;
draw_set_blend_mode(bm_add);
draw_circle_colour(x + lengthdir_y(wave, image_angle), y + lengthdir_x(wave, image_angle), (image_xscale * 32) + random_range(0.25, -0.15), merge_color(c_orange, c_black, 0.95), c_black, 0);
draw_circle_colour(x + lengthdir_y(wave, image_angle), y + lengthdir_x(wave, image_angle), (image_xscale * 25) + random_range(0.25, -0.25), merge_color(c_orange, c_black, 0.8), c_black, 0);
draw_circle_colour(x + lengthdir_y(wave, image_angle), y + lengthdir_x(wave, image_angle), (image_xscale * 16) + random_range(0.5, -0.5), merge_color(merge_colour(c_orange, c_red, 0.5 + lengthdir_x(0.5, dir * 8)), c_black, 0.75), c_black, 0);
i = 0;
repeat (4)
{
    draw_sprite_ext(sprite_index, image_index - (i / 2), x + lengthdir_y(wave, image_angle), y + lengthdir_x(wave, image_angle), image_xscale + (i / 6), image_yscale + (i / 6), image_angle, merge_colour(c_orange, c_red, i / 4), alpha - (i / 4));
    i += 1;
}
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprite_index, image_index, x + lengthdir_y(wave, image_angle), y + lengthdir_x(wave, image_angle), image_xscale, image_yscale, image_angle, merge_colour(c_white, merge_color(c_red, c_orange, 0.95), 0.5 + lengthdir_x(0.5, dir * 24)), image_alpha);
i = 0;
repeat (8)
{
    draw_sprite_ext(sprFireBall, 0, x + lengthdir_x(i, image_angle) + lengthdir_y(wave, image_angle), y + lengthdir_y(0, image_angle) + lengthdir_x(wave, image_angle), image_xscale, image_yscale, random(360), merge_colour(c_orange, c_white, 0.5 + lengthdir_x(0.5, dir * 4)), image_alpha);
    i += 2;
}
