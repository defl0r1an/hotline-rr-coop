if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_wall);
}
draw_sprite_ext(sprite_index, 1, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (weapon == 0)
{
    draw_set_blend_mode(bm_add);
    draw_circle_color(x, y, light + random(light / 2), make_color_hsv(0, 0, 30), c_black, 0);
    draw_set_blend_mode(bm_normal);
    draw_sprite_ext(sprWeapons, 45, x + weaponx, y + weapony, image_xscale, image_yscale, image_angle, c_black, 0.5);
    draw_sprite_ext(sprWeapons, 45, x + weaponx, ((y + weapony) - 1) + lengthdir_x(1, 0), image_xscale, image_yscale, image_angle, image_blend, 1);
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(sprWeapons, 45, x + weaponx, ((y + weapony) - 1) + lengthdir_x(1, 0), image_xscale, image_yscale, image_angle, image_blend, 0.1 + lengthdir_x(0.1, 0));
    d3d_set_fog(false, c_black, 0, 0);
}
draw_sprite_ext(sprUSSRSupplyBoxOpen, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprUSSRSupplyBoxOpen, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (weapon == 0)
{
    draw_set_blend_mode(bm_add);
    draw_circle_color(x, y, light1 + random(light1 / 2), make_color_hsv(0, 0, 30), c_black, 0);
    draw_set_blend_mode(bm_normal);
}
shader_reset();
