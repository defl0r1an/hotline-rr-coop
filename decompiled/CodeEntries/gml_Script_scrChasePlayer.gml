if (instance_exists(objPlayer) && global.notarget == 0)
{
    path_end();
    if (mp_grid_path(global.grid, path, x, y, (objPlayer.x - 32) + random(64), (objPlayer.y - 32) + random(64), true) > 0)
    {
        path_start(path, 2, path_action_stop, 1);
        speed = 0;
    }
    else
    {
        direction = round(direction * 0.1) * 10;
    }
}
