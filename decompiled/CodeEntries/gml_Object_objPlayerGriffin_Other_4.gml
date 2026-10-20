if (instance_exists(objEnemy))
{
    clear = 0;
}
else
{
    clear = 1;
}
if (global.paused == 1)
{
    exit;
}
if (!instance_exists(objEffector))
{
    instance_create(x, y, objEffector);
}
if (!instance_exists(objBackgroundColor))
{
    if (room == rmJanitors)
    {
        with (objBackgroundColor)
        {
            instance_destroy();
        }
    }
    else
    {
        instance_create(x, y, objBackgroundColor);
    }
}
if (!instance_exists(objSurfacer))
{
    instance_create(x, y, objSurfacer);
}
if (persistent == true)
{
    view_xview[0] = xview;
    view_yview[0] = yview;
    with (objEffector)
    {
        vlastx = view_xview[0];
        vlasty = view_yview[0];
    }
    alarm[0] = 36;
}
else
{
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    view_xview[0] = (x + lengthdir_x(vdist * 0.2, vdir - 180)) - (view_wview[0] * 0.5);
    view_yview[0] = (y + lengthdir_y(vdist * 0.2, vdir - 180)) - (view_hview[0] * 0.5);
    view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
    with (objEffector)
    {
        vlastx = view_xview[0];
        vlasty = view_yview[0];
    }
}
