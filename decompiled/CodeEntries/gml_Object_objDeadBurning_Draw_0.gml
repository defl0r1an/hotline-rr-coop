var saturated;
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
    self.saturated = 100;
}
else
{
    saturated = 0;
}
alphaground += burnspeed;
draw_sprite_ext(sprBombGround, image_index, xstart + lengthdir_x(30, direction), ystart + lengthdir_y(30, direction), image_xscale, image_yscale, groundangle, image_blend, alphaground);
if (global.maskindex != 26 && global.maskon == 1)
{
    color += 0.15;
    alpha = lerp(alpha, 0, 0.015);
    draw_set_alpha(alpha - 0.5);
    draw_set_blend_mode(bm_add);
    draw_circle_colour(x, y, 32 + random_range(0.25, -0.15), merge_color(make_colour_hsv(30.16, clamp(74.9 - saturated, 0, 100), 100), c_black, 0.95), c_black, 0);
    draw_circle_colour(x, y, 25 + random_range(0.25, -0.25), merge_color(make_colour_hsv(30.16, clamp(74.9 - saturated, 0, 100), 100), c_black, 0.8), c_black, 0);
    draw_circle_colour(x, y, 16 + random_range(0.5, -0.5), merge_color(merge_colour(make_colour_hsv(30.16, clamp(74.9 - saturated, 0, 100), 100), make_colour_hsv(0, clamp(100 - saturated, 0, 100), 100), 0.5 + lengthdir_x(0.5, color * 8)), c_black, 0.75), c_black, 0);
    draw_set_alpha(1);
    i = 0;
    ii = 0.3;
    repeat (4)
    {
        xtrail[i] = lerp(xtrail[i], x, ii);
        ytrail[i] = lerp(ytrail[i], y, ii);
        draw_sprite_ext(sprite_index, image_index - (i / 2), xtrail[i], ytrail[i], image_xscale - (i / 16), image_yscale - (i / 16), direction, merge_colour(make_colour_hsv(0, clamp(100 - saturated, 0, 100), 100), make_colour_hsv(0, clamp(100 - saturated, 0, 100), 50.2), i / 4), alpha - (i / 5));
        i += 1;
        ii -= 0.036;
    }
    draw_set_blend_mode(bm_normal);
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);
shader_reset();
