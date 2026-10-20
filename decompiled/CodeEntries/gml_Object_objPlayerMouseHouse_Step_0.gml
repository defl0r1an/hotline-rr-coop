previousx = x;
previousy = y;
if (global.igelcutscenes == -1 && instance_exists(objBriefcaseIgel))
{
    active = 0;
    aimon = 0;
    legindex = 0;
    dir = point_direction(x, y, objBriefcaseIgel.x, objBriefcaseIgel.y);
    x = lerp(x, objBriefcaseIgel.x, 0.25);
    y = lerp(y, objBriefcaseIgel.y - 22, 0.25);
    exit;
}
if (sprite_index == sprPHeadExplode && image_index >= 23 && !bled)
{
    i = 0;
    repeat (8)
    {
        tempid = instance_create(x, y, objBrainChunk2);
        tempid.speed = 1.5 + random(2.2);
        tempid.direction = direction + i + random_range(-35, 35);
        tempid.image_angle = tempid.direction;
        tempid.surface = 0;
        i += 45;
    }
    i = 0;
    repeat (4)
    {
        tempid = instance_create(x, y, objSkinPiece2);
        tempid.speed = 2.4 + random(1.2);
        tempid.direction = direction + i + random_range(-35, 35);
        tempid.image_angle = tempid.direction;
        tempid.image_index = random(4);
        tempid.surface = 0;
        i += 80;
    }
    i = 0;
    repeat (8)
    {
        tempid = instance_create(x, y, objBloodSmoke);
        tempid.speed = 2.4 + random(1.2);
        tempid.direction = direction + i + random_range(-35, 35);
        tempid.image_angle = tempid.direction;
        tempid.image_index = random(4);
        tempid.surface = 0;
        i += 80;
    }
    i = 0;
    repeat (4)
    {
        tempid = instance_create(x, y, objBloodSquirt);
        tempid.speed = 2.4 + random(1.2);
        tempid.direction = direction + i + random_range(-35, 35);
        tempid.image_angle = tempid.direction;
        tempid.image_index = random(4);
        tempid.surface = 0;
        i += 80;
    }
    audio_play_sound(sndHeadshot, 0, false);
    bled = 1;
}
if (sprite_index == sprPHeadExplode)
{
    exit;
}
if (room == rmSequence13Downstairs)
{
    if (active == 0)
    {
        if (y > 224)
        {
            aimon = 0;
            dir = 90;
            legdir = dir;
            if (sprite_index == sprPWalkHospitalScalpelBlood)
            {
                global.maskindex = 1;
                if (bloodstep > 0)
                {
                    bloodstep -= 1;
                }
                else if (bloodsled > 0)
                {
                    my_id = instance_create(x, y, objLegSled);
                    my_id.image_speed = 0;
                    my_id.sprite_index = sprLegSledsNude2;
                    if (bloodscale == 1)
                    {
                        my_id.image_index = 0;
                    }
                    else
                    {
                        my_id.image_index = 1;
                    }
                    my_id.image_angle = legdir;
                    my_id.image_alpha = bloodsled;
                    bloodsled -= random_range(0.05, 0.1);
                    bloodstep = 20;
                    bloodscale = -bloodscale;
                }
                y -= 1;
                image_index += 0.1;
                legindex += 0.15;
                if (round(random(86)) == 2)
                {
                    objEffectorHouse.brus = 2 + floor(random(8));
                }
            }
            else
            {
                y -= 2;
                image_index += 0.2;
                legindex += 0.3;
            }
        }
        else
        {
            if (sprite_index == sprPWalkHospitalScalpelBlood)
            {
                global.maskindex = 0;
                maskon = 0;
                objEffectorHouse.brus = 12;
                my_id = instance_create(x, y, objScalpelBlood);
                my_id.sprite_index = sprScalpelBlood;
                my_id.image_angle = random(360);
                sprite_index = sprPWalkHospital;
            }
            aimon = 1;
            active = 1;
        }
    }
    if (sprite_index == sprPWalkUnarmed)
    {
        with (objBackgroundColorClear)
        {
            instance_create(x, y, objBackgroundColor);
            instance_destroy();
        }
    }
}
if (global.xbox == 1)
{
    scrXboxPlayerMouseHouse();
}
if (sprite_index == sprPDrink)
{
    nothing = 1;
    image_speed = 0.2;
    drank = 1;
}
global.test = 0;
with (objWeapon)
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 32)
    {
        global.test = 2;
    }
}
if (place_meeting(x, y, objKnockedOut))
{
    global.test = 1;
}
objEffector.action = global.test;
if (throwreload > 0)
{
    throwreload -= 1;
}
if (instance_exists(objPhoneConversation))
{
    valid = 0;
}
else
{
    valid = 1;
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
if (aimfar && valid)
{
    if (global.xbox == 1)
    {
        viewx = objPlayer.x + (rightthumb_x(0) * 0.0045);
        viewy = objPlayer.y - (rightthumb_y(0) * 0.003);
    }
    else if (global.hardmode == 0)
    {
        viewx = objPlayer.x + ((((display_mouse_get_x() - (display_get_width() * 0.5)) * view_wview[0]) / display_get_width()) * factor);
        viewy = objPlayer.y + ((((display_mouse_get_y() - (display_get_height() * 0.5)) * view_hview[0]) / display_get_height()) * factor);
    }
    else
    {
        viewx = objPlayer.x - ((((display_mouse_get_x() - (display_get_width() * 0.5)) * view_wview[0]) / display_get_width()) * factor);
        viewy = objPlayer.y - ((((display_mouse_get_y() - (display_get_height() * 0.5)) * view_hview[0]) / display_get_height()) * factor);
    }
    viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), viewx, viewy) * 0.1;
    viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), viewx, viewy);
    view_xview[0] += lengthdir_x(viewspeed, viewdir);
    view_yview[0] += lengthdir_y(viewspeed, viewdir);
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
    scrHardMode();
}
else if (objPlayer.active == 0 && (instance_exists(objPhoneConversation) || instance_exists(objFocus)))
{
    if (global.maskindex == 7 && global.maskon == 1)
    {
        view_wview[0] = lerp(view_wview[0], 453, 0.065);
        view_hview[0] = lerp(view_hview[0], 255, 0.065);
    }
    if (instance_exists(objLightingEngine) || instance_exists(objTutorialLight))
    {
        with (objLight)
        {
            if (targetstrength == 1)
            {
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
                view_xview[0] += lengthdir_x(viewspeed, viewdir);
                view_yview[0] += lengthdir_y(viewspeed, viewdir);
                view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
                scrHardMode();
            }
        }
    }
    with (objBoss1)
    {
        valid = 0;
        vdist = point_distance(x, y, (room_width / 2) - ((1 - valid) * 88), room_height / 2);
        vdir = point_direction((room_width / 2) - ((1 - valid) * 88), room_height / 2, x, y);
        if (global.hardmode == 0)
        {
            viewspeed = point_distance((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), (y + lengthdir_y(vdist * 0.2, vdir - 180)) - 32) * 0.1;
            viewdir = point_direction((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), (y + lengthdir_y(vdist * 0.2, vdir - 180)) - 32);
        }
        else
        {
            viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2) + ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), (y + lengthdir_y(vdist * 0.2, vdir - 180)) - 32) * 0.1;
            viewdir = point_direction(view_xview[0] + (view_wview[0] / 2) + ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), (y + lengthdir_y(vdist * 0.2, vdir - 180)) - 32);
        }
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
    }
    with (objBoss1Down)
    {
        valid = 0;
        vdist = point_distance(x, y, (room_width / 2) - ((1 - valid) * 88), room_height / 2);
        vdir = point_direction((room_width / 2) - ((1 - valid) * 88), room_height / 2, x, y);
        if (global.hardmode == 0)
        {
            viewspeed = point_distance((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), (y + lengthdir_y(vdist * 0.2, vdir - 180)) - 32) * 0.1;
            viewdir = point_direction((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), (y + lengthdir_y(vdist * 0.2, vdir - 180)) - 32);
        }
        else
        {
            viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2) + ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), (y + lengthdir_y(vdist * 0.2, vdir - 180)) - 32) * 0.1;
            viewdir = point_direction(view_xview[0] + (view_wview[0] / 2) + ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), (y + lengthdir_y(vdist * 0.2, vdir - 180)) - 32);
        }
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
    }
    with (objClubOwner)
    {
        valid = 0;
        vdist = point_distance(x, y, (room_width / 2) - ((1 - valid) * 88), room_height / 2);
        vdir = point_direction((room_width / 2) - ((1 - valid) * 88), room_height / 2, x, y);
        if (global.hardmode == 0)
        {
            viewspeed = point_distance((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), (y + lengthdir_y(vdist * 0.2, vdir - 180)) - 32) * 0.1;
            viewdir = point_direction((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), (y + lengthdir_y(vdist * 0.2, vdir - 180)) - 32);
        }
        else
        {
            viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2) + ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), (y + lengthdir_y(vdist * 0.2, vdir - 180)) - 32) * 0.1;
            viewdir = point_direction(view_xview[0] + (view_wview[0] / 2) + ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), (y + lengthdir_y(vdist * 0.2, vdir - 180)) - 32);
        }
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
    }
    with (objOldman)
    {
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
    global.test = 0;
    with (objLight)
    {
        if (targetstrength == 1)
        {
            global.test = 1;
        }
    }
    if (global.test == 0)
    {
        with (objTutorialHobo)
        {
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
            view_xview[0] += lengthdir_x(viewspeed, viewdir);
            view_yview[0] += lengthdir_y(viewspeed, viewdir);
            view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
            scrHardMode();
        }
    }
    with (objBoss4)
    {
        if (state == 2 || state == 4 || state == 6)
        {
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
            view_xview[0] += lengthdir_x(viewspeed, viewdir);
            view_yview[0] += lengthdir_y(viewspeed, viewdir);
            view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
            scrHardMode();
        }
    }
    with (objBodyguard)
    {
        if (state == 2)
        {
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
            view_xview[0] += lengthdir_x(viewspeed, viewdir);
            view_yview[0] += lengthdir_y(viewspeed, viewdir);
            view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
            scrHardMode();
        }
    }
    with (objDeadTable)
    {
        if (global.talked == 2)
        {
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
            view_xview[0] += lengthdir_x(viewspeed, viewdir);
            view_yview[0] += lengthdir_y(viewspeed, viewdir);
            view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
            scrHardMode();
        }
    }
    with (objBoss3Kneel)
    {
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
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
    }
    with (objDreamPlayer)
    {
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
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
    }
    with (objAssassinSitUzi)
    {
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
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
    }
    with (objSacrifice)
    {
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
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
    }
    with (objChief)
    {
        if (global.locked == 1)
        {
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
            view_xview[0] += lengthdir_x(viewspeed, viewdir);
            view_yview[0] += lengthdir_y(viewspeed, viewdir);
            view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
            scrHardMode();
        }
    }
    with (objPoliceHardTrigger)
    {
        if (global.locked == 1)
        {
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
            view_xview[0] += lengthdir_x(viewspeed, viewdir);
            view_yview[0] += lengthdir_y(viewspeed, viewdir);
            view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
            scrHardMode();
        }
    }
    with (objPrisoner)
    {
        if (global.locked == 0)
        {
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
            view_xview[0] += lengthdir_x(viewspeed, viewdir);
            view_yview[0] += lengthdir_y(viewspeed, viewdir);
            view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
            scrHardMode();
        }
    }
    with (objGirlfriendDeadOutline)
    {
        if (state != "None")
        {
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
            view_xview[0] += lengthdir_x(viewspeed, viewdir);
            view_yview[0] += lengthdir_y(viewspeed, viewdir);
            view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
            scrHardMode();
        }
    }
    if (room == rmStore3)
    {
        with (objBoss2Corpse)
        {
            if (state == 1)
            {
                valid = 0;
                vdist = point_distance(x, y, (room_width / 2) - ((1 - valid) * 88), room_height / 2);
                vdir = point_direction((room_width / 2) - ((1 - valid) * 88), room_height / 2, x, y);
                viewspeed = point_distance((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
                viewdir = point_direction((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
                view_xview[0] += lengthdir_x(viewspeed, viewdir);
                view_yview[0] += lengthdir_y(viewspeed, viewdir);
                view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
                scrHardMode();
            }
        }
        with (objPlayerMouseHouse)
        {
            test = 1;
            if (instance_exists(objBoss2Corpse))
            {
                if (objBoss2Corpse.state == 1)
                {
                    test = 0;
                }
            }
            if (test)
            {
                valid = 0;
                vdist = point_distance(x, y, (room_width / 2) - ((1 - valid) * 88), room_height / 2);
                vdir = point_direction((room_width / 2) - ((1 - valid) * 88), room_height / 2, x, y);
                viewspeed = point_distance((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
                viewdir = point_direction((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
                view_xview[0] += lengthdir_x(viewspeed, viewdir);
                view_yview[0] += lengthdir_y(viewspeed, viewdir);
                view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
                scrHardMode();
            }
        }
    }
    with (objHobo)
    {
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
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
    }
    with (objBoss2Crawl)
    {
        valid = 0;
        vdist = point_distance(x, y, (room_width / 2) - ((1 - valid) * 88), room_height / 2);
        vdir = point_direction((room_width / 2) - ((1 - valid) * 88), room_height / 2, x, y);
        viewspeed = point_distance((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
        viewdir = point_direction((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
    }
    with (objGirlfriend)
    {
        if (active == 1)
        {
            valid = 0;
            vdist = point_distance(x, y, (room_width / 2) - ((1 - valid) * 88), room_height / 2);
            vdir = point_direction((room_width / 2) - ((1 - valid) * 88), room_height / 2, x, y);
            viewspeed = point_distance((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
            viewdir = point_direction((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
            view_xview[0] += lengthdir_x(viewspeed, viewdir);
            view_yview[0] += lengthdir_y(viewspeed, viewdir);
            view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
            scrHardMode();
        }
    }
    with (objBoss2)
    {
        valid = 0;
        vdist = point_distance(x, y, (room_width / 2) - ((1 - valid) * 88), room_height / 2);
        vdir = point_direction((room_width / 2) - ((1 - valid) * 88), room_height / 2, x, y);
        viewspeed = point_distance((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
        viewdir = point_direction((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
    }
}
else if (active == 1 || (!instance_exists(objPhone) && !instance_exists(objBoss4) && !instance_exists(objBossPhone) && !instance_exists(objPantherCrawl) && !instance_exists(objTrain)) || (instance_exists(objBodyguard) && !instance_exists(objPicture)))
{
    vdist = point_distance(x, y, (room_width / 2) - ((1 - valid) * 88), room_height / 2);
    vdir = point_direction((room_width / 2) - ((1 - valid) * 88), room_height / 2, x, y);
    viewspeed = point_distance((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
    viewdir = point_direction((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
    view_xview[0] += lengthdir_x(viewspeed, viewdir);
    view_yview[0] += lengthdir_y(viewspeed, viewdir);
    view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
    scrHardMode();
}
else
{
    if (global.maskindex == 7 && global.maskon == 1)
    {
        view_wview[0] = lerp(view_wview[0], 453, 0.065);
        view_hview[0] = lerp(view_hview[0], 255, 0.065);
    }
    with (objPhone)
    {
        valid = 0;
        vdist = point_distance(x, y, (room_width / 2) - ((1 - valid) * 88), room_height / 2);
        vdir = point_direction((room_width / 2) - ((1 - valid) * 88), room_height / 2, x, y);
        viewspeed = point_distance((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
        viewdir = point_direction((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
    }
    with (objBossPhone)
    {
        valid = 0;
        vdist = point_distance(x, y, (room_width / 2) - ((1 - valid) * 88), room_height / 2);
        vdir = point_direction((room_width / 2) - ((1 - valid) * 88), room_height / 2, x, y);
        viewspeed = point_distance((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
        viewdir = point_direction((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
    }
    with (objTrain)
    {
        if (visible == true && global.maskindex != 7)
        {
            valid = 0;
            vdist = point_distance(x, y, (room_width / 2) - ((1 - valid) * 88), room_height / 2);
            vdir = point_direction((room_width / 2) - ((1 - valid) * 88), room_height / 2, x, y);
            viewspeed = point_distance((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
            viewdir = point_direction((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
            view_xview[0] += lengthdir_x(viewspeed, viewdir);
            view_yview[0] += lengthdir_y(viewspeed, viewdir);
            view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
            scrHardMode();
        }
    }
    with (objPicture)
    {
        valid = 0;
        vdist = point_distance(x, y, room_width / 2, room_height / 2);
        vdir = point_direction(room_width / 2, room_height / 2, x, y);
        viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x, y) * 0.2;
        viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x, y);
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
    }
    with (objPantherCrawl)
    {
        if (state == 2)
        {
            valid = 0;
            vdist = point_distance(x, y, room_width / 2, room_height / 2);
            vdir = point_direction(room_width / 2, room_height / 2, x, y);
            viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x, y) * 0.2;
            viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x, y);
            view_xview[0] += lengthdir_x(viewspeed, viewdir);
            view_yview[0] += lengthdir_y(viewspeed, viewdir);
            view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
            scrHardMode();
        }
    }
    with (objBoss4)
    {
        valid = 0;
        vdist = point_distance(x, y, (room_width / 2) - ((1 - valid) * 88), room_height / 2);
        vdir = point_direction((room_width / 2) - ((1 - valid) * 88), room_height / 2, x, y);
        viewspeed = point_distance((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
        viewdir = point_direction((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
    }
}
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
if (active == 1)
{
    scrPlayerMoveKeyboard();
}
if (sprite_index == sprPAttackButterfly || sprite_index == sprPAttackKnife || sprite_index == sprPAttackBat || sprite_index == sprPAttackPipe || sprite_index == sprPAttackClub || sprite_index == sprPAttackSword)
{
    lastx = x;
    lasty = y;
    x += lengthdir_x(24, dir);
    y += lengthdir_y(24, dir);
    global.my_id = id;
    with (objGlassPanelH)
    {
        if (place_meeting(x, y, global.my_id))
        {
            if (global.my_id.lasty < (y + 2))
            {
                add = -1;
            }
            else
            {
                add = 1;
            }
            i = 0;
            repeat (24)
            {
                my_id = instance_create(x + (i * 1.5), y, objShard);
                my_id.speed = random(5);
                my_id.direction = ((add * 90) - 8) + random(16);
                i += 1;
            }
            instance_create(x, y, objGlassPanelHBroken);
            instance_destroy();
            audio_play_sound(sndGlass1, 0, false);
            audio_play_sound(sndGlass2, 0, false);
            audio_play_sound(sndWeaponHit, 0, false);
        }
    }
    with (objEnemy)
    {
        if (place_meeting(x, y, objPlayer))
        {
            mask_index = sprWeaponMask;
            if (scrCollisionLineExt(x, y, objPlayer.lastx, objPlayer.lasty, 4, 309, 99, 131))
            {
                mask_index = sprMask;
                objPlayer.x = objPlayer.lastx;
                objPlayer.y = objPlayer.lasty;
                exit;
            }
            mask_index = sprMask;
            my_id = instance_create(x, y - 12, objScore);
            if (sprite_index == sprEWalkUnarmed)
            {
                my_id.text = "+" + string(100 * global.factor) + "pts";
                global.myscore += (100 * global.factor);
            }
            else
            {
                my_id.text = "+" + string(400 * global.factor) + "pts";
                global.myscore += (400 * global.factor);
            }
            edir = point_direction(objPlayer.lastx, objPlayer.lasty, x, y);
            repeat (8)
            {
                my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
                my_id.image_xscale = 1 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
                my_id.sprite_index = sprBloodSplatSmall;
                my_id.direction = my_id.image_angle;
                my_id.speed = 2 + random(4);
            }
            repeat (2 + random(3))
            {
                my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
                my_id.image_xscale = 1 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
                my_id.direction = my_id.image_angle;
                my_id.speed = 1 + random(5);
            }
            repeat (4)
            {
                my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, edir), (y - 3) + random(6) + lengthdir_y(16, edir), objBloodSmoke);
                my_id.image_xscale = 1.2 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                my_id.image_angle = (edir - 20) + random(40);
                my_id.direction = my_id.image_angle;
                my_id.speed = 2 + random(1);
                my_id.friction = 0.15;
            }
            my_id = instance_create(x, y, objDeadBody);
            if (object_index == objDogPatrol)
            {
                if (objPlayer.sprite_index == sprPAttackClub || objPlayer.sprite_index == sprPAttackBat || objPlayer.sprite_index == sprPAttackPipe)
                {
                    audio_play_sound(sndHit, 0, false);
                    my_id.sprite_index = sprDogDeadBlunt;
                    my_id.image_index = 3 + floor(random(3));
                }
                else
                {
                    my_id.sprite_index = sprDogDeadCut;
                    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
                    my_id.image_index = 4 + floor(random(3));
                }
            }
            else
            {
                if (objPlayer.sprite_index == sprPAttackClub || objPlayer.sprite_index == sprPAttackBat || objPlayer.sprite_index == sprPAttackPipe)
                {
                    audio_play_sound(sndHit, 0, false);
                    my_id.sprite_index = sprEBackBlunt;
                    my_id.image_index = 4 + floor(random(11));
                }
                if (objPlayer.sprite_index == sprPAttackKnife || objPlayer.sprite_index == sprPAttackButterfly)
                {
                    my_id.sprite_index = sprEBackCut;
                    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
                    my_id.image_index = 2 + floor(random(3));
                }
                if (objPlayer.sprite_index == sprPAttackSword)
                {
                    my_id.sprite_index = sprEBackSlashed;
                    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
                    audio_play_sound(sndHit, 0, false);
                    my_id.image_index = floor(random(4));
                    if (my_id.image_index == 0)
                    {
                        part = instance_create(my_id.x + lengthdir_x(22, edir), my_id.y + lengthdir_y(18, edir), objBodyPart);
                        part.image_angle = (edir - 10) + random(20);
                        part.direction = part.image_angle;
                        part.speed = 3 + random(1);
                    }
                    if (my_id.image_index == 1)
                    {
                        part = instance_create(my_id.x + lengthdir_x(12, edir), my_id.y + lengthdir_y(8, edir), objBodyPart);
                        part.image_angle = (edir - 10) + random(20);
                        part.direction = part.image_angle;
                        part.speed = 3 + random(1);
                        part.image_index = 1;
                        part.image_yscale = my_id.image_yscale;
                    }
                    if (my_id.image_index == 2)
                    {
                        part = instance_create(my_id.x + lengthdir_x(16, edir), my_id.y + lengthdir_y(12, edir), objBodyPart);
                        part.image_angle = (edir - 10) + random(20);
                        part.direction = part.image_angle;
                        part.speed = 3 + random(1);
                        part.image_index = 2;
                        part.image_yscale = my_id.image_yscale;
                    }
                }
            }
            my_id.direction = edir;
            my_id.speed = 1.5 + random(1);
            my_id.image_angle = my_id.direction;
            if (sprite_index == sprEWalkUnarmed || object_index == objDogPatrol)
            {
                noweapon = 1;
            }
            else
            {
                noweapon = 0;
            }
            if (noweapon == 0)
            {
                my_id = instance_create(x, y, objWeaponThrow);
                my_id.direction = (other.direction - 70) + random(40);
                my_id.speed = 2 + random(2);
                my_id.image_index = scrCurrentWeaponExt(sprite_index);
                my_id.ammo = ammo;
            }
            instance_destroy();
        }
    }
    x = lastx;
    y = lasty;
}
if (sprite_index == sprPAttackPunch || sprite_index == sprPJacketAttackKnuckles)
{
    lastx = x;
    lasty = y;
    x += lengthdir_x(12, dir);
    y += lengthdir_y(12, dir);
    global.my_id = id;
    with (objGlassPanelH)
    {
        if (place_meeting(x, y, global.my_id))
        {
            if (global.my_id.lasty < (y + 2))
            {
                add = -1;
            }
            else
            {
                add = 1;
            }
            i = 0;
            repeat (24)
            {
                my_id = instance_create(x + (i * 1.5), y, objShard);
                my_id.speed = random(5);
                my_id.direction = ((add * 90) - 8) + random(16);
                i += 1;
            }
            instance_create(x, y, objGlassPanelHBroken);
            instance_destroy();
            audio_play_sound(sndGlass1, 0, false);
            audio_play_sound(sndGlass2, 0, false);
            audio_play_sound(sndWeaponHit, 0, false);
        }
    }
    with (objEnemy)
    {
        if (object_index == objDogPatrol)
        {
            valid = 0;
        }
        else
        {
            valid = 1;
        }
        if (place_meeting(x, y, objPlayer) && valid == 1)
        {
            mask_index = sprWeaponMask;
            if (scrCollisionLineExt(x, y, objPlayer.lastx, objPlayer.lasty, 4, 309, 99, 131))
            {
                mask_index = sprMask;
                objPlayer.x = objPlayer.lastx;
                objPlayer.y = objPlayer.lasty;
                exit;
            }
            mask_index = sprMask;
            edir = point_direction(objPlayer.lastx, objPlayer.lasty, x, y);
            audio_play_sound(sndDoorHit, 0, false);
            my_id = instance_create(x, y, objKnockedOut);
            my_id.type = object_index;
            my_id.direction = (edir - 10) + random(20);
            my_id.angle = my_id.direction;
            with (my_id)
            {
                move_outside_solid(angle - 180, 16);
            }
            my_id.speed = 3;
            if (sprite_index == sprEWalkUnarmed)
            {
                noweapon = 1;
            }
            else
            {
                noweapon = 0;
            }
            if (noweapon == 0)
            {
                global.test = 0;
                with (objEnemy)
                {
                    if (alert == 1)
                    {
                        global.test += 1;
                    }
                }
                my_id = instance_create(x, y - 12, objScore);
                my_id.text = "+" + string((300 + (200 * global.test)) * global.factor) + "pts";
                global.myscore += ((300 + (200 * global.test)) * global.factor);
                my_id = instance_create(x, y, objWeaponThrow);
                my_id.direction = (direction - 70) + random(40);
                my_id.image_index = scrCurrentWeaponExt(sprite_index);
                my_id.speed = 2 + random(2);
                my_id.ammo = ammo;
            }
            instance_destroy();
        }
    }
    x = lastx;
    y = lasty;
}
HotWeaponAlpha = lerp(HotWeaponAlpha, HotWeaponSwitch, HotWeaponSpeed);
if (sprite_exists(asset_get_index(sprite_get_name(sprite_index) + "Hot")))
{
    HotWeapon = asset_get_index(sprite_get_name(sprite_index) + "Hot");
}
else
{
    HotWeaponAlpha = 0;
}
if (((myyspeed == 0 && myxspeed == 0) || instance_exists(objPhoneConversation)) && sprite_index == sprPWalkLighter)
{
    sprite_index = sprPIdleLighter;
    image_speed = 0.15;
    image_index = 0;
}
else if (sprite_index == sprPIdleLighter && (myyspeed != 0 || myxspeed != 0) && !instance_exists(objPhoneConversation))
{
    sprite_index = sprPWalkLighter;
    image_speed = 0;
    image_index = 0;
}
