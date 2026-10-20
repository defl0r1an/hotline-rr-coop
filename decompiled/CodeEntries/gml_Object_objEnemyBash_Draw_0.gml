if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
draw_set_blend_mode(bm_add);
draw_circle_color(x, y, 48 + random(6), make_color_hsv(0, 0, 30), c_black, 0);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
dir = point_direction(x, y, mouse_x, mouse_y);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (global.maskindex == 11 && global.hardmode == 0 && scrCurrentWeaponExt(global.willemweapon) != -123)
{
    draw_sprite_ext(sprWeapons, scrCurrentWeaponExt(global.willemweapon), x + lengthdir_x(15, image_angle + 90), y + lengthdir_y(15, image_angle + 90), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
scrDrawMask(1);
shader_reset();
