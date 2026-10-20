valid = 1;
vdist = point_distance(x, y, (room_width / 2) - ((1 - valid) * 88), room_height / 2);
vdir = point_direction((room_width / 2) - ((1 - valid) * 88), room_height / 2, x, y);
viewspeed = point_distance((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
viewdir = point_direction((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
view_xview[0] += lengthdir_x(viewspeed, viewdir);
view_yview[0] += lengthdir_y(viewspeed, viewdir);
scrHardMode();
if (sprite_index == sprPClimbLedge)
{
    if (image_index < 10)
    {
        image_index += 0.2;
    }
    else
    {
        if (room == rmHotel3)
        {
            global.executionx = x - 15;
            global.executiony = y + 54;
            my_id = instance_create(96, 496, objPlayerMouse);
            if (global.maskindex == 6 && global.hardmode == 1)
            {
                my_id.sprite_index = sprPWalkButterfly;
            }
        }
        else
        {
            global.executionx = x + 26;
            global.executiony = y + 34;
            my_id = instance_create(x - 30, y + 54, objPlayerMouse);
            if (global.maskindex == 6 && global.hardmode == 1)
            {
                my_id.sprite_index = sprPWalkButterfly;
            }
        }
        instance_destroy();
    }
}
if (global.hardmode == 0)
{
    if (active == 0)
    {
        exit;
    }
    if (sprite_index == sprPClimbLedge)
    {
        exit;
    }
    if (keyboard_check_direct(ord(global.downkey)))
    {
        if (sprite_index == sprPWalkWindow)
        {
            image_index += 0.2;
            if (y < 528)
            {
                y += 1;
            }
            image_yscale = 1;
        }
        if (sprite_index == sprPWalkLedge)
        {
            image_index += 0.2;
            if (y < 464)
            {
                y += 1;
            }
            else
            {
                sprite_index = sprPClimbLedge;
                image_yscale = 1;
                image_index = 0;
            }
            image_yscale = 1;
        }
    }
    if (keyboard_check_direct(ord(global.upkey)))
    {
        if (active == 0)
        {
            exit;
        }
        if (sprite_index == sprPClimbLedge)
        {
            exit;
        }
        if (sprite_index == sprPWalkWindow)
        {
            image_index -= 0.2;
            if (y > 368)
            {
                y -= 1;
            }
            image_yscale = -1;
        }
        if (sprite_index == sprPWalkLedge)
        {
            image_index += 0.2;
            if (y > 192)
            {
                y -= 1;
            }
            image_yscale = 1;
        }
    }
}
else
{
    if (active == 0)
    {
        exit;
    }
    if (sprite_index == sprPClimbLedge)
    {
        exit;
    }
    if (keyboard_check_direct(ord(global.upkey)))
    {
        if (sprite_index == sprPWalkWindow)
        {
            image_index += 0.2;
            if (y < 528)
            {
                y += 1;
            }
            image_yscale = 1;
        }
        if (sprite_index == sprPWalkLedge)
        {
            image_index += 0.2;
            if (y < 464)
            {
                y += 1;
            }
            else
            {
                sprite_index = sprPClimbLedge;
                if (room != rmHotel3)
                {
                    image_yscale = 1;
                }
                image_index = 0;
            }
            image_yscale = 1;
        }
    }
    if (keyboard_check_direct(ord(global.downkey)))
    {
        if (active == 0)
        {
            exit;
        }
        if (sprite_index == sprPClimbLedge)
        {
            exit;
        }
        if (sprite_index == sprPWalkWindow)
        {
            image_index -= 0.2;
            if (y > 368)
            {
                y -= 1;
            }
            image_yscale = -1;
        }
        if (sprite_index == sprPWalkLedge)
        {
            image_index += 0.2;
            if (y > 192)
            {
                y -= 1;
            }
            image_yscale = 1;
        }
    }
}
