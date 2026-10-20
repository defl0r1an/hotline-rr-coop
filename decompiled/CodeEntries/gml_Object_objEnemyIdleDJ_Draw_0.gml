if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
angle = direction;
vinylangle = 0;
draw_sprite_ext(sprVinylRecord, 0, x + 1, y + 1, image_xscale, image_yscale, vinylangle, c_black, 0.5);
draw_sprite_ext(sprVinylRecord, 0, x, y, image_xscale, image_yscale, vinylangle, image_blend, image_alpha);
vinylangle += 4;
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha);
draw_set_color(c_white);
shader_reset();
