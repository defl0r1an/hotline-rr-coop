if (speed == 0)
{
    if (bled == 0)
    {
        bled = 1;
        instance_create(x, y, objBloodPool);
    }
}
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
view_xview[0] = lerp(view_xview[0], x - (view_wview[0] / 2), 0.25);
view_yview[0] = lerp(view_yview[0], y - (view_hview[0] / 2), 0.25);
