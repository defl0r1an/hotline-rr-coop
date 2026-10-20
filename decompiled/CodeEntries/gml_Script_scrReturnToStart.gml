if (path_index >= 0)
{
    path_end();
}
image_xscale = 2;
image_yscale = 2;
while (!place_free(start_x, start_y))
{
    start_x += (-2 + random(4));
    start_y += (-2 + random(4));
}
if (!mp_grid_path(global.grid, argument0, x, y, start_x, start_y, true))
{
    alert = 0;
}
else
{
    path_start(argument0, 2.5, path_action_stop, 1);
}
image_xscale = 1;
image_yscale = 1;
