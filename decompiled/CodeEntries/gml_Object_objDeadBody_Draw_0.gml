if (sprite_index == sprBodyguardDead)
{
    if (global.maskindex == 26 && global.maskon == 1)
    {
        shader_set(shd_russell_player);
    }
}
else if (sprite_index == sprBoss2Clubbed)
{
    if (global.maskindex == 26 && global.maskon == 1)
    {
        shader_set(shd_russell_player);
    }
}
else if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();
