grid_tilesize = 40;
grid_offset = 0;
grid_speed = 0.05;
grid_xsize = view_wport[0] / grid_tilesize;
grid_ysize = view_hport[0] / grid_tilesize;
xx = -1;
repeat (grid_xsize + 1)
{
    xx += 1;
    yy = -1;
    repeat (grid_ysize + 1)
    {
        yy += 1;
        grid_xtranslate[xx, yy] = random(10);
        grid_ytranslate[xx, yy] = random(10);
        grid_u[xx, yy] = xx / grid_xsize;
        grid_v[xx, yy] = yy / grid_ysize;
        if (xx == 0)
        {
            grid_u[xx, yy] = grid_offset;
        }
        if (yy == 0)
        {
            grid_v[xx, yy] = grid_offset;
        }
        if (xx == grid_xsize)
        {
            grid_u[xx, yy] = 1 - grid_offset;
        }
        if (yy == grid_ysize)
        {
            grid_v[xx, yy] = 1 - grid_offset;
        }
    }
}
