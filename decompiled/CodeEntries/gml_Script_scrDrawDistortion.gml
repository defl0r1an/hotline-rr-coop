if (grid_offset < 0.02)
{
    grid_offset += 0.0001;
}
yy = -1;
repeat (grid_ysize + 1)
{
    yy += 1;
    grid_xtranslate[0, yy] += random(grid_speed);
    grid_ytranslate[0, yy] += random(grid_speed);
}
draw_set_color(c_white);
texture = surface_get_texture(global.surf2);
xx = 0;
repeat (grid_xsize)
{
    xx += 1;
    draw_primitive_begin_texture(pr_trianglestrip, texture);
    yy = -1;
    repeat (grid_ysize + 1)
    {
        yy += 1;
        xtex = grid_u[xx - 1, yy] + (sin(grid_xtranslate[xx - 1, yy]) * grid_offset);
        ytex = grid_v[xx - 1, yy] + (sin(grid_xtranslate[xx - 1, yy]) * grid_offset);
        draw_vertex_texture((xx - 1) * grid_tilesize, yy * grid_tilesize, xtex, ytex);
        grid_xtranslate[xx, yy] += grid_speed;
        grid_ytranslate[yy, yy] += grid_speed;
        xtex = grid_u[xx, yy] + (sin(grid_xtranslate[xx, yy]) * grid_offset);
        ytex = grid_v[xx, yy] + (sin(grid_xtranslate[xx, yy]) * grid_offset);
        draw_vertex_texture(xx * grid_tilesize, yy * grid_tilesize, xtex, ytex);
    }
    draw_primitive_end();
}
