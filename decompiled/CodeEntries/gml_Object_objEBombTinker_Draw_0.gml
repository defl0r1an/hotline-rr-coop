if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (sprite_index == sprEWalkUnarmed && stop == 0)
{
    draw_sprite_ext(sprELegs, image_index * 2, x + 1, y + 1, image_xscale, image_yscale, angle, c_black, 0.5);
    draw_sprite_ext(sprELegs, image_index * 2, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha);
}
shader_reset();
