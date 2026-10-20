flicker += 0.25;
if (visiblekaka == 0 || visiblekaka == -1)
{
    exit;
}
colorGlow = merge_color(merge_color(c_lime, c_green, 0.75), c_lime, 0.5 + lengthdir_x(0.5, flicker * 8));
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, c_black, 0.5);
if (point_distance(x, y, objPlayer.x, objPlayer.y) < 24 && unlock == 0 && speed == 0)
{
    draw_sprite_ext(sprite_index, image_index, (x - 1) + lengthdir_x(1, dir), (y - 1) + lengthdir_x(1, dir), 1, 1, image_angle, image_blend, image_alpha);
}
else
{
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, image_blend, image_alpha);
    draw_sprite_ext(sprWeapons, 43, x - 1, y - 3, 1, 1, image_angle - 90, image_blend, image_alpha);
    draw_set_blend_mode(bm_subtract);
    draw_roundrect_colour_ext(x - 7, y - 10, x + 6, y + 1, 0, 0, merge_color(c_white, c_black, light), c_white, 0);
    draw_set_blend_mode(bm_add);
    draw_sprite_ext(sprWeapons, 43, x - 1, y - 3, 1, 1, image_angle - 90, colorGlow, light - 0.25);
    draw_set_blend_mode(bm_normal);
    draw_sprite_ext(sprWeaponsGlow, 43, x - 1, y - 3, 1, 1, image_angle - 90, colorGlow, light);
    draw_set_blend_mode(bm_add);
    i = 0;
    repeat (8)
    {
        draw_sprite_ext(sprWeaponsGlow, image_index, x + i, y - 3, 1, 1, image_angle - 90, colorGlow, light - 0.45 - (i / 4));
        draw_sprite_ext(sprWeaponsGlow, image_index, x - i, y - 3, 1, 1, image_angle - 90, colorGlow, light - 0.45 - (i / 4));
        draw_sprite_ext(sprWeaponsGlow, 43, x - 1, (y + i) - 3, 1, 1, image_angle - 90, colorGlow, light - 0.45 - (i / 4));
        draw_sprite_ext(sprWeaponsGlow, 43, x - 1, y - i - 3, 1, 1, image_angle - 90, colorGlow, light - 0.45 - (i / 4));
        i += 1;
    }
    draw_set_blend_mode(bm_normal);
}
if (point_distance(x, y, objPlayer.x, objPlayer.y) < 24 && unlock == 0 && speed == 0)
{
    draw_sprite_ext(sprIgelBriefcaseCover, image_index, (x - 1) + lengthdir_x(1, dir), (y - 1) + lengthdir_x(1, dir), 1, 1, image_angle, image_blend, image_alpha);
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(sprite_index, image_index, (x - 1) + lengthdir_x(1, dir), (y - 1) + lengthdir_x(1, dir), 1, 1, image_angle, image_blend, 0.1 + lengthdir_x(0.1, dir));
    d3d_set_fog(false, c_black, 0, 0);
    dir += 4;
}
else
{
    draw_sprite_ext(sprIgelBriefcaseCover, image_index, x, y, 1, 1, image_angle, image_blend, image_alpha);
}
shader_reset();
