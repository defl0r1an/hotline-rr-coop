if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
if (on == 1)
{
    sprite_index = sprMetalDetectorAlarm;
    image_speed = 0.25;
}
else
{
    sprite_index = sprMetalDetector;
    image_speed = 0;
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();
