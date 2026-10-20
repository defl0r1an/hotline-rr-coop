if (sprite_index == sprBoss4Die)
{
    if (global.maskindex == 26 && global.maskon == 1)
    {
        shader_set(shd_russell_enemy);
    }
    draw_self();
    shader_reset();
}
