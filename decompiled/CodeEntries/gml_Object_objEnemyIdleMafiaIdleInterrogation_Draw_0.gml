if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
draw_set_blend_mode(bm_add);
draw_circle_color(x, y, 48 + random(6), make_color_hsv(0, 0, 30), c_black, 0);
draw_set_blend_mode(bm_normal);
angle = direction;
if (sprite_index == sprEMafiaIdleInterrogation)
{
    draw_sprite_ext(sprEDrinkingLegs, image_index, x + 1 + lengthdir_x(12, angle), y + 1 + lengthdir_y(12, angle), image_xscale, image_yscale, angle, c_black, 0.5);
    draw_sprite_ext(sprEDrinkingLegs, image_index, x + lengthdir_x(12, angle), y + lengthdir_y(12, angle), image_xscale, image_yscale, angle, image_blend, image_alpha);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha);
draw_set_color(c_white);
shader_reset();
