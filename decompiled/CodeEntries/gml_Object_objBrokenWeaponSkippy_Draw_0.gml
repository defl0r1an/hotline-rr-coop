if (GlowSkippy == 0 && image_index == 3)
{
    image_xscale = 1.25;
    image_yscale = 1.5;
    dir += (glow * 4);
    yy = -abs(lengthdir_x(1.5, dir));
}
else
{
    yy = lerp(yy, 0, 0.25);
}
draw_set_blend_mode(bm_add);
draw_set_alpha(0.5);
draw_circle_colour(x, y, (10 + (0.1 * speed)) - ((1 - glow) * 10), merge_color(c_black, merge_color(color0, color1, GlowSkippy), glow), c_black, 0);
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprite_index, image_index, x, y + yy, 1, 1, image_angle, image_blend, image_alpha);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y + yy, 1, 1, image_angle, merge_color(c_black, merge_color(color0, color1, GlowSkippy), glow), image_alpha);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprBrokenSkippyGlow, image_index, x, y + yy, 1, 1, image_angle, merge_color(c_black, merge_color(color0, color1, GlowSkippy), glow), image_alpha);
draw_set_blend_mode(bm_add);
i = 0;
repeat (8)
{
    draw_sprite_ext(sprBrokenSkippyGlow, image_index, x + i, y + yy, 1, 1, image_angle, merge_color(c_black, merge_color(color0, color1, GlowSkippy), glow), 0.75 - (i / 4));
    draw_sprite_ext(sprBrokenSkippyGlow, image_index, x - i, y + yy, 1, 1, image_angle, merge_color(c_black, merge_color(color0, color1, GlowSkippy), glow), 0.75 - (i / 4));
    draw_sprite_ext(sprBrokenSkippyGlow, image_index, x, y + yy + i, 1, 1, image_angle, merge_color(c_black, merge_color(color0, color1, GlowSkippy), glow), 0.75 - (i / 4));
    draw_sprite_ext(sprBrokenSkippyGlow, image_index, x, (y + yy) - i, 1, 1, image_angle, merge_color(c_black, merge_color(color0, color1, GlowSkippy), glow), 0.75 - (i / 4));
    i += 1;
}
draw_set_blend_mode(bm_normal);
