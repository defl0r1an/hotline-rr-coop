if (global.holiday != 1 && destroy == 1)
{
    instance_destroy();
}
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (sprite_index == sprYOLKA)
{
    exit;
}
dir += 1;
glowcolor0 = 16711935;
glowcolordark0 = 0;
glowcolor1 = 16776960;
glowcolordark1 = 0;
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, merge_color(glowcolor0, glowcolordark0, 0.5 + lengthdir_x(0.5, dir)), image_alpha);
draw_sprite_ext(sprite_index, 2, x, y, image_xscale, image_yscale, image_angle, merge_color(glowcolordark1, glowcolor1, 0.5 + lengthdir_x(0.5, dir)), image_alpha);
draw_set_blend_mode(bm_add);
i = 0;
repeat (8)
{
    draw_sprite_ext(sprite_index, 1, x + i, y, 1, 1, image_angle, merge_color(glowcolor0, glowcolordark0, 0.5 + lengthdir_x(0.5, dir)), 0.5 - (i / 4));
    draw_sprite_ext(sprite_index, 1, x - i, y, 1, 1, image_angle, merge_color(glowcolor0, glowcolordark0, 0.5 + lengthdir_x(0.5, dir)), 0.5 - (i / 4));
    draw_sprite_ext(sprite_index, 1, x, y + i, 1, 1, image_angle, merge_color(glowcolor0, glowcolordark0, 0.5 + lengthdir_x(0.5, dir)), 0.5 - (i / 4));
    draw_sprite_ext(sprite_index, 1, x, y - i, 1, 1, image_angle, merge_color(glowcolor0, glowcolordark0, 0.5 + lengthdir_x(0.5, dir)), 0.5 - (i / 4));
    draw_sprite_ext(sprite_index, 2, x + i, y, 1, 1, image_angle, merge_color(glowcolordark1, glowcolor1, 0.5 + lengthdir_x(0.5, dir)), 0.5 - (i / 4));
    draw_sprite_ext(sprite_index, 2, x - i, y, 1, 1, image_angle, merge_color(glowcolordark1, glowcolor1, 0.5 + lengthdir_x(0.5, dir)), 0.5 - (i / 4));
    draw_sprite_ext(sprite_index, 2, x, y + i, 1, 1, image_angle, merge_color(glowcolordark1, glowcolor1, 0.5 + lengthdir_x(0.5, dir)), 0.5 - (i / 4));
    draw_sprite_ext(sprite_index, 2, x, y - i, 1, 1, image_angle, merge_color(glowcolordark1, glowcolor1, 0.5 + lengthdir_x(0.5, dir)), 0.5 - (i / 4));
    i += 1;
}
draw_set_blend_mode(bm_normal);
shader_reset();
