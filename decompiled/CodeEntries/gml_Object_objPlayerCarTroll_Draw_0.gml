shakecar = random_range(shake, -shake);
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
draw_sprite_ext(sprCarBottom, 0, x + shakecar + 1, y + shakecar + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprCarBottom, 0, x + shakecar, y + shakecar, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x + shakecar + 1, y + shakecar + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x + shakecar, y + shakecar, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprPlayerCarTrunk, 0, x + shakecar + 1, y + shakecar + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprPlayerCarTrunk, 0, x + shakecar, y + shakecar, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();
