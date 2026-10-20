if (on == 1)
{
    exit;
}
global.test = 0;
if (objPlayer.x < (x + 40))
{
    objPlayer.dir = 90;
    with (objPlayer)
    {
        if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objDumpster))
        {
            sprite_index = sprPLeaveBag;
            image_index = 1;
            image_speed = 0.5;
            global.test = 1;
        }
    }
    if (global.test == 0)
    {
        exit;
    }
    if (on == 0)
    {
        xview = view_xview[0];
        yview = view_yview[0];
        angle = view_angle[0];
        with (objPlayer)
        {
            vdist = point_distance(x, y, room_width / 2, room_height / 2);
            vdir = point_direction(room_width / 2, room_height / 2, x, y);
            view_xview[0] = (x + lengthdir_x(vdist * 0.2, vdir - 180)) - (view_wview[0] * 0.5);
            view_yview[0] = (y + lengthdir_y(vdist * 0.2, vdir - 180)) - (view_hview[0] * 0.5);
            view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
            scrHardMode();
        }
        global.checkpointx = objPlayer.x;
        global.checkpointy = objPlayer.y;
        on = 1;
        if (global.hardmode == 1)
        {
            my_id = instance_create(56, 228, objHobo);
            my_id.sprite_index = sprHoboWalkDoubleBarrel;
            my_id.ammo = 2;
        }
        else
        {
            my_id = instance_create(52, 304, objHobo);
        }
        my_id.direction = 260 + random(20);
    }
}
