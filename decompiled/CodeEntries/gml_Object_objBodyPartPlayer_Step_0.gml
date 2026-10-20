image_angle += (speed * rotspeed);
scrMoveSolidOn();
if (!place_free(x, y))
{
    lastx = x - hspeed;
    lasty = y - vspeed;
    move_bounce_solid(0);
    x = lastx;
    y = lasty;
    speed *= 0.5;
}
scrMoveSolidOff();
if (speed == 0 && bled == 0 && global.maskindex != 19)
{
    bled = 1;
    my_id = instance_create(x, y, objBloodPool);
    my_id.image_xscale = 0.5;
    my_id.image_yscale = 0.5;
}
if (speed == 0 || (sprite_index == sprPJacketDeadPieces && image_index != 1))
{
    sled = 0;
}
if (sled == 1)
{
    otkat -= 0.75;
    otkat2 -= 0.75;
    if (otkat <= 0)
    {
        otkat = 2;
        my_id = instance_create(x - lengthdir_x(8, image_angle), y - lengthdir_y(8, image_angle), objBloodSled);
        my_id.image_xscale = 1;
        my_id.image_yscale = 1;
        my_id.image_angle = direction + choose(random_range(-4, 4));
    }
    if (otkat2 <= 0)
    {
        otkat2 = 6;
        my_id = instance_create(x - lengthdir_x(8, image_angle), y - lengthdir_y(8, image_angle), objGuts2);
        my_id.speed = random(1);
        my_id.direction = (image_angle - 180) + random_range(-10, 10);
    }
}
if (bled == 1)
{
    if (wait > 0)
    {
        wait -= 1;
    }
}
if (global.maskindex != 7 && !instance_exists(objMaskOwlDrop))
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
    scrHardMode();
}
