if (!instance_exists(objPhoneConversation))
{
    if (reload > 0)
    {
        reload -= 1;
    }
    else
    {
        reload = 10;
        if (talk < talks)
        {
            scrGetMessage(talk);
            objEffector.image_xscale = 2;
            objEffector.image_yscale = 2;
            talk += 1;
        }
        else
        {
            objEffector.fade = 1;
            objEffector.next = 1;
            objEffector.nextroom = room_next(room);
        }
    }
}
else
{
    if (frac(talk * 0.5) > 0)
    {
        object = 987;
    }
    else
    {
        object = 988;
    }
    with (object)
    {
        image_index += 0.1;
        valid = 0;
        vdist = point_distance(x, y, (room_width / 2) - ((1 - valid) * 88), room_height / 2);
        vdir = point_direction((room_width / 2) - ((1 - valid) * 88), room_height / 2, x, y);
        if (global.hardmode == 0)
        {
            viewspeed = point_distance((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
            viewdir = point_direction((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
        }
        else
        {
            viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2) + ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
            viewdir = point_direction(view_xview[0] + (view_wview[0] / 2) + ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
        }
        view_xview[0] = lerp(view_xview[0], x - (view_wview[0] / 2), 0.05);
        view_yview[0] = lerp(view_yview[0], y - (view_hview[0] / 2), 0.05);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
    }
}
