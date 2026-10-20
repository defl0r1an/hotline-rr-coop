if (image_index < 19)
{
    image_index += 0.2;
}
else
{
    my_id = instance_create(x, y, objPWalkWindow);
    if (sprite_index == sprPClimbWindow)
    {
        my_id.sprite_index = sprPWalkLedge;
    }
    else
    {
        my_id.sprite_index = sprPWalkWindow;
    }
    if (room == rmHotel3)
    {
        my_id.image_yscale = -1;
        my_id.image_xscale = -1;
    }
    instance_destroy();
}
factor = 1.8;
if (global.hardmode == 0)
{
    viewx = x + ((((display_mouse_get_x() - (display_get_width() * 0.5)) * view_wview[0]) / display_get_width()) * factor);
    viewy = y + ((((display_mouse_get_y() - (display_get_height() * 0.5)) * view_hview[0]) / display_get_height()) * factor);
}
else
{
    viewx = x - ((((display_mouse_get_x() - (display_get_width() * 0.5)) * view_wview[0]) / display_get_width()) * factor);
    viewy = y - ((((display_mouse_get_y() - (display_get_height() * 0.5)) * view_hview[0]) / display_get_height()) * factor);
}
viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), viewx, viewy) * 0.1;
viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), viewx, viewy);
view_xview[0] = x - (view_wview[0] / 2);
view_yview[0] = y - (view_hview[0] / 2);
vdist = point_distance(x, y, room_width / 2, room_height / 2);
vdir = point_direction(room_width / 2, room_height / 2, x, y);
if (instance_exists(objDizzy))
{
    view_angle[0] = lengthdir_y(objDizzy.dizziness * 10, lengthdir_x(objDizzy.dizziness * 20, global.dir * 3));
}
scrHardMode();
