if (global.surfaces)
{
    if (surface_exists(global.surface[curs]))
    {
        draw_surface_ext(global.surface[curs], 0, 0, 1/3, 1/3, 0, c_white, 1);
    }
    if (global.maskindex == 26 && global.maskon == 1)
    {
        shader_set(shd_russell_furniture);
    }
    if (surface_exists(global.surface2[curs]))
    {
        draw_surface_ext(global.surface2[curs], 0, 0, 1/3, 1/3, 0, c_white, 1);
    }
    shader_reset();
}
