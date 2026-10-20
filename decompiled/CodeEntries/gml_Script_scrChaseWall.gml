path_end();
if (mp_grid_path(global.grid, path, x, y, (chasex - 8) + random(16), (chasey - 8) + random(16), true) > 0)
{
    path_start(path, 2, path_action_stop, 1);
    speed = 0;
}
else
{
    direction = round(direction * 0.1) * 10;
}
