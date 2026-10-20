image_xscale = 0.5;
image_yscale = 0.5;
target = instance_nearest(x, y, objEHideTrigger);
if (!mp_grid_path(global.grid, argument0, x, y, target.x, target.y, true))
{
    path_end();
}
else
{
    path_start(argument0, 2, path_action_stop, 1);
}
image_xscale = 1;
image_yscale = 1;
alert = 5;
