if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
if (light > 0)
{
    light -= 1;
}
draw_set_blend_mode(bm_add);
draw_circle_color(x, y, 48 + random(6) + light, make_color_hsv(0, 0, 30), c_black, 0);
draw_set_blend_mode(bm_normal);
if (sprite_index == sprBoss2Computer || sprite_index == sprMCBikerDodge)
{
    nothing = 1;
}
else
{
    draw_sprite_ext(sprBikerLegs, image_index * 2, x + 1, y + 1, image_xscale, image_yscale, direction, c_black, 0.5);
    draw_sprite_ext(sprBikerLegs, image_index * 2, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, direction, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);
shader_reset();
draw_set_color(c_white);
with (objWeapon)
{
    if (global.maskindex != 27)
    {
        if (global.maskindex == 26 && global.maskon == 1)
        {
            draw_sprite_ext(sprArrowHLM1, 0, x, (y - 8) + lengthdir_x(4, dir * 2), 1, 1, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(sprArrow, 0, x, (y - 8) + lengthdir_x(4, dir * 2), 1, 1, 0, c_white, 1);
        }
    }
}
