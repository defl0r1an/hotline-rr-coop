if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
if (instance_exists(objPlayerCarEnter))
{
    shake = objPlayerCarEnter.temp_shake;
}
else
{
    shake = 0;
}
draw_sprite_ext(sprite_index, image_index, x + shake, y + shake, image_xscale, image_yscale, image_angle, c_white, 1);
shader_reset();
