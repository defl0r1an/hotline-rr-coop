if (path_index >= 0)
{
    path_end();
}
image_xscale = 2;
image_yscale = 2;
var myx = (argument1 - 12) + random(24);
var myy = (argument2 - 12) + random(24);
while (!place_free(myx, myy))
{
    myx += (-2 + random(4));
    myy += (-2 + random(4));
}
if (!mp_grid_path(global.grid, argument0, x, y, (argument1 - 12) + random(24), (argument2 - 12) + random(24), true))
{
    alert = 0;
}
else
{
    path_start(argument0, 3, path_action_stop, 1);
}
image_xscale = 1;
image_yscale = 1;
