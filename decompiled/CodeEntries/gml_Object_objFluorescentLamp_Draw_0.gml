if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_wall);
}
if (random(100) <= 15)
{
    light = choose(0, 1);
}
else
{
    light = 1;
}
draw_sprite_ext(sprite_index, image_index, x + 1, y, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_set_blend_mode(bm_add);
if ((image_index == 1 || image_index == 2) && broken == 1)
{
    draw_sprite_ext(sprFluorescentLampGlow, 2, x, y, image_xscale, image_yscale, image_angle, image_blend, light / 2);
}
if ((image_index == 1 || image_index == 3) && broken == 1)
{
    draw_sprite_ext(sprFluorescentLampGlow, 3, x, y, image_xscale, image_yscale, image_angle, image_blend, light / 2);
}
draw_set_blend_mode(bm_normal);
if ((image_index == 1 || image_index == 2) && broken == 1)
{
    draw_sprite_ext(sprFluorescentLampGlow, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, light);
}
if ((image_index == 1 || image_index == 3) && broken == 1)
{
    draw_sprite_ext(sprFluorescentLampGlow, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, light);
}
shader_reset();
if (instance_exists(objPlayer) && CrocodileMan == 1)
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 90 && broken == -1 && global.done == 0)
    {
        broken = 1;
        audio_play_sound(sndFluorescentLampStart, 0, false);
    }
}
