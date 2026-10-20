if (active == 0)
{
}
else
{
    if (global.xbox == 1)
    {
        scrXboxBikerHouseMouse();
    }
    if (global.xbox == 0)
    {
        aimfar = keyboard_check_direct(vk_shift);
    }
    else
    {
        aimfar = checkbutton(0, getid(9));
    }
    factor = 1;
    if (aimfar)
    {
        if (global.xbox == 1)
        {
            viewx = objPlayer.x + (rightthumb_x(0) * 0.0045);
            viewy = objPlayer.y - (rightthumb_y(0) * 0.003);
        }
        else if (global.hardmode == 0)
        {
            viewx = objPlayer.x + ((display_mouse_get_x() - (display_get_width() * 0.5)) * (view_wview[0] / display_get_width()) * factor);
            viewy = objPlayer.y + ((display_mouse_get_y() - (display_get_height() * 0.5)) * (view_hview[0] / display_get_height()) * factor);
        }
        else
        {
            viewx = objPlayer.x - ((display_mouse_get_x() - (display_get_width() * 0.5)) * (view_wview[0] / display_get_width()) * factor);
            viewy = objPlayer.y - ((display_mouse_get_y() - (display_get_height() * 0.5)) * (view_hview[0] / display_get_height()) * factor);
        }
        viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), viewx, viewy) * 0.1;
        viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), viewx, viewy);
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        vdist = point_distance(x, y, room_width / 2, room_height / 2);
        vdir = point_direction(room_width / 2, room_height / 2, x, y);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
    }
    else
    {
        viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(24, dir), y + lengthdir_y(24, dir)) * 0.1;
        viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(24, dir), y + lengthdir_y(24, dir));
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        vdist = point_distance(x, y, room_width / 2, room_height / 2);
        vdir = point_direction(room_width / 2, room_height / 2, x, y);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
    }
    scrHardMode();
    xview = view_xview[0];
    yview = view_yview[0];
    if (persistent == true && objEffector.fade == 1)
    {
        if (place_free(x + addx, y))
        {
            x += addx;
        }
        if (place_free(x, y + addy))
        {
            y += addy;
        }
        if (image_speed == 0)
        {
            image_index += 0.15;
        }
        legindex += 0.4;
        exit;
    }
    scrPlayerMoveKeyboard();
}
if (sprite_index == sprMCWalkNoHelmet && global.done == 1)
{
    if (room == rmMCSequence2Downstairs || room == rmMCSequence3Downstairs || room == rmMCSequence4Downstairs)
    {
        if (instance_exists(objMCBike))
        {
            if (point_distance(x, y, objMCBike.x, objMCBike.y) < 34)
            {
                active = 0;
                image_index = 0;
                legindex = 0;
                sprite_index = sprMCPutOnHelmet;
            }
        }
    }
}
if (sprite_index == sprMCPutOnHelmet)
{
    if (image_index < 3)
    {
        image_index += 0.1;
    }
    else
    {
        sprite_index = sprBoss2Walk;
        image_index = 0;
        active = 1;
    }
}
