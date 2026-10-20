if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_set_blend_mode(bm_add);
draw_set_alpha(0.5);
draw_circle_colour(x, y - abs(lengthdir_x(speed * 3, dir)), (10 + (0.1 * speed)) - ((1 - glow) * 10), merge_color(c_black, merge_color(color0, color1, GlowSkippy), glow), c_black, 0);
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprite_index, 1, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, 1, x, y - abs(lengthdir_x(speed * 3, dir)), image_xscale + (0.1 * speed), image_yscale + (0.1 * speed), image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, 0, x, y - abs(lengthdir_x(speed * 3, dir)), image_xscale + (0.1 * speed), image_yscale + (0.1 * speed), image_angle, merge_color(c_black, merge_color(color0, color1, GlowSkippy), glow), image_alpha);
draw_set_blend_mode(bm_add);
i = 0;
repeat (8)
{
    draw_sprite_ext(sprite_index, 0, x + i, y - abs(lengthdir_x(speed * 3, dir)), image_xscale + (0.1 * speed), image_yscale + (0.1 * speed), image_angle, merge_color(c_black, merge_color(color0, color1, GlowSkippy), glow), 0.75 - (i / 4));
    draw_sprite_ext(sprite_index, 0, x - i, y - abs(lengthdir_x(speed * 3, dir)), image_xscale + (0.1 * speed), image_yscale + (0.1 * speed), image_angle, merge_color(c_black, merge_color(color0, color1, GlowSkippy), glow), 0.75 - (i / 4));
    draw_sprite_ext(sprite_index, 0, x, (y - abs(lengthdir_x(speed * 3, dir))) + i, image_xscale + (0.1 * speed), image_yscale + (0.1 * speed), image_angle, merge_color(c_black, merge_color(color0, color1, GlowSkippy), glow), 0.75 - (i / 4));
    draw_sprite_ext(sprite_index, 0, x, y - abs(lengthdir_x(speed * 3, dir)) - i, image_xscale + (0.1 * speed), image_yscale + (0.1 * speed), image_angle, merge_color(c_black, merge_color(color0, color1, GlowSkippy), glow), 0.75 - (i / 4));
    i += 1;
}
draw_set_blend_mode(bm_normal);
dir += 10;
if (dir > 360)
{
    dir = 0;
}
shader_reset();
