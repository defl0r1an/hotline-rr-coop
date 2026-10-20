if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_sprite_ext(sprite_index, 0, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
diradd += 0.4;
dir = lerp(dir, lengthdir_x(60, diradd), 0.25);
image_index += 0.4;
draw_sprite_ext(sprFanGuard, image_index, x, y, image_xscale, image_yscale, image_angle + clamp(dir, -35, 35), image_blend, image_alpha);
shader_reset();
