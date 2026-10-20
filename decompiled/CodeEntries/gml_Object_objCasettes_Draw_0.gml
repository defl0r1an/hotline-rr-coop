if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_self();
shader_reset();
addToSurface(global.surf3, 1);
