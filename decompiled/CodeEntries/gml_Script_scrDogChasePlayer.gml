if (instance_exists(objPlayer))
{
    path_end();
    if (mp_grid_path(global.grid, path, x, y, (objPlayer.x - 64) + random(128), (objPlayer.y - 64) + random(128), true) > 0)
    {
        path_start(path, 4, path_action_stop, 1);
        speed = 0;
    }
}
