if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
if (sprite_index == sprESwatStumble)
{
    nothing = 1;
}
if (light > 0)
{
    light -= 1;
}
draw_set_blend_mode(bm_add);
draw_circle_color(x, y, 48 + random(6) + light, make_color_hsv(0, 0, 30), c_black, 0);
draw_set_blend_mode(bm_normal);
if (scrIsSearching(sprite_index) || sprite_index == sprSwatAttackM16 || sprite_index == sprESwatReloadM16)
{
    nothing = 1;
}
else
{
    draw_sprite_ext(sprSwatLegs, image_index * 2, x + 1, y + 1, image_xscale, image_yscale, angle, c_black, 0.5);
    draw_sprite_ext(sprSwatLegs, image_index * 2, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha);
draw_set_color(c_white);
shader_reset();
