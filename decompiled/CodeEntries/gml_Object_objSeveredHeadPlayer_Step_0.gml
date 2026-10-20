if (!place_free(x + (hspeed * 2), y))
{
    hspeed = -hspeed;
}
if (!place_free(x, y + (vspeed * 2)))
{
    vspeed = -vspeed;
}
image_speed = speed * 0.5;
if (speed < 0.7)
{
    friction = 0.005;
}
else
{
    friction = 0.05;
}
image_angle = direction;
if (bled < 7)
{
    if (prevdir <= 90 && dir > 90)
    {
        bled += 1;
        instance_create(x, y, objBloodSplat);
    }
    if (prevdir <= 270 && dir > 270)
    {
        bled += 1;
        instance_create(x, y, objBloodSplat);
    }
}
if (global.maskindex != 7)
{
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
    viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
    view_angle[0] = lengthdir_y(vdist * 0.01, vdir * 2);
    global.chargeSkippy = lerp(global.chargeSkippy, 0, 0.025);
    if (global.zoomdeaths == 1)
    {
        global.zoomwview = lerp(global.zoomwview, global.wview / 4, 0.15);
        global.zoomhview = lerp(global.zoomhview, global.hview / 4, 0.15);
    }
    view_xview[0] = lerp(view_xview[0], x - (view_wview[0] / 2), 0.05);
    view_yview[0] = lerp(view_yview[0], y - (view_hview[0] / 2), 0.05);
}
scrHardMode();
