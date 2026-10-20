if (!(myxspeed == 0 && myyspeed == 0) && active == 1)
{
    if (leaksled > 0)
    {
        if (leakstep == 0 && legindex >= (legindex - 5))
        {
            my_id = instance_create(x, y, objLegSledLeak);
            leakstep = 1;
        }
        if (leakstep == 1 && legindex <= (legindex + 5))
        {
            my_id = instance_create(x, y, objLegSledLeak);
            leakstep = 0;
        }
        my_id.image_index = legindex;
        my_id.image_angle = legdir;
        my_id.image_alpha = clamp(leaksled - alphaundead, 0, 1);
        leaksled -= random_range(0.05, 0.1);
    }
}
if (breathtime >= 0)
{
    breathtime--;
}
else if (visible == true)
{
    my_id = instance_create(x + lengthdir_x(2, dir), y + lengthdir_y(2, dir), objSmokeBreathing);
    my_id.direction = dir;
    my_id.image_alpha = clamp(leaksled - 0.25 - alphaundead, 0, 1);
    my_id.image_angle = my_id.direction - random_range(4, -4);
    my_id.speed = 0.15 - random_range(0.025, -0.025);
    randomexhale = round(random_range(1, 3));
    audio_sound_pitch(audio_play_sound(asset_get_index("sndExhale" + string(randomexhale)), 0, false), 0.8 + random(0.3));
    audio_sound_gain(asset_get_index("sndExhale" + string(randomexhale)), clamp(leaksled - 0.25 - alphaundead, 0, 1), 0);
    breathtime = 230 + round(random(90));
}
if (sprite_index == sprPJacketWalkTrauma)
{
    bloodsled = alphaundead;
}
else
{
    bloodsled = 0;
}
if (!(myxspeed == 0 && myyspeed == 0))
{
    if (bloodstep > 0)
    {
        bloodstep -= 1;
    }
    else if (bloodsled > 0)
    {
        my_id = instance_create(x, y, objLegSled);
        my_id.image_speed = 0;
        my_id.sprite_index = sprLegSledsNude2;
        my_id.image_blend = make_colour_rgb(146, 54, 46);
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
        bloodstep = 10;
        bloodscale = -bloodscale;
    }
}
global.test = 0;
view_xview[0] = xview;
view_yview[0] = yview;
if (sprite_index == sprPKeyLockOpen || sprite_index == sprPKeyHeadLockOpen)
{
    if (image_index < 4)
    {
        image_index += 0.2;
    }
    else
    {
        if (global.talked == 0 || room == rmMorgue)
        {
            active = 1;
        }
        with (objLockedDoor)
        {
            image_index = 1;
        }
        with (objMorgueDoor)
        {
            image_index = 1;
        }
        sprite_index = sprPWalkHospital;
    }
    exit;
}
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
if (instance_exists(objPhoneConversation) || global.headdoctor == 1)
{
    valid = 0;
}
else
{
    valid = 1;
}
factor = 1;
if (visible == true && sprite_index != sprPHospitalHeadache2)
{
    if (global.xbox == 0)
    {
        aimfar = keyboard_check_direct(vk_shift);
    }
    else
    {
        aimfar = checkbutton(0, getid(9));
    }
    if (global.ShiftLook == 1)
    {
        aimfar = 1;
    }
}
if (changeroom)
{
    view_xview[0] = objPlayer.x - (view_wview[0] / 2);
    view_yview[0] = objPlayer.y - (view_hview[0] / 2);
    changeroom = 0;
}
if (aimfar && valid)
{
    if (global.xbox == 1)
    {
        viewx = objPlayer.x + (rightthumb_x(0) * 0.0045);
        viewy = objPlayer.y - (rightthumb_y(0) * 0.003);
    }
    else
    {
        factor = 1.8;
        if (global.hardmode == 0)
        {
            viewx = objPlayer.x + ((((display_mouse_get_x() - (display_get_width() * 0.5)) * view_wview[0]) / display_get_width()) * factor);
            viewy = objPlayer.y + ((((display_mouse_get_y() - (display_get_height() * 0.5)) * view_hview[0]) / display_get_height()) * factor);
        }
        else
        {
            viewx = objPlayer.x - ((((display_mouse_get_x() - (display_get_width() * 0.5)) * view_wview[0]) / display_get_width()) * factor);
            viewy = objPlayer.y - ((((display_mouse_get_y() - (display_get_height() * 0.5)) * view_hview[0]) / display_get_height()) * factor);
        }
    }
    viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), viewx, viewy) * 0.1;
    viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), viewx, viewy);
    view_xview[0] += lengthdir_x(viewspeed, viewdir);
    view_yview[0] += lengthdir_y(viewspeed, viewdir);
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    if (room != rmMorgue)
    {
        view_angle[0] = lengthdir_y(objDizzy.dizziness * 10, lengthdir_x(objDizzy.dizziness * 20, global.dir * 3));
    }
    else
    {
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
    }
    if (global.hardmode == 1)
    {
        view_angle[0] = view_angle[0] - 180;
    }
}
else if (objPlayer.active == 0 && (instance_exists(objPhoneConversation) || global.headdoctor == 1))
{
    with (global.doctor)
    {
        valid = 0;
        vdist = point_distance(x, y, (room_width / 2) - ((1 - valid) * 88), room_height / 2);
        vdir = point_direction((room_width / 2) - ((1 - valid) * 88), room_height / 2, x, y);
        viewspeed = point_distance((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
        viewdir = point_direction((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
        if (object_index == objGuardRead)
        {
            view_xview[0] = lerp(view_xview[0], x - (view_wview[0] / 2), 0.05);
            view_yview[0] = lerp(view_yview[0], y - (view_hview[0] / 2), 0.05);
        }
        else
        {
            view_xview[0] = lerp(view_xview[0], x - (view_wview[0] / 2), 0.05);
            view_yview[0] = lerp(view_yview[0], y - (view_hview[0] / 2), 0.05);
        }
        view_angle[0] = lengthdir_y(objDizzy.dizziness * 10, lengthdir_x(objDizzy.dizziness * 20, global.dir * 3));
        if (global.hardmode == 1)
        {
            view_angle[0] = view_angle[0] - 180;
        }
    }
}
else if (objPlayer.active == 0)
{
    with (global.my_id)
    {
        valid = 0;
        vdist = point_distance(x, y, (room_width / 2) - ((1 - valid) * 88), room_height / 2);
        vdir = point_direction((room_width / 2) - ((1 - valid) * 88), room_height / 2, x, y);
        viewspeed = point_distance((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
        viewdir = point_direction((view_xview[0] + (view_wview[0] / 2)) - ((1 - valid) * 88), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
        if (object_index == objLukeMorgueCutScene)
        {
            view_xview[0] = lerp(view_xview[0], xTruck - (view_wview[0] / 2), 0.035);
            view_yview[0] = lerp(view_yview[0], yTruck - (view_hview[0] / 2), 0.035);
        }
        else
        {
            view_xview[0] = lerp(view_xview[0], x - (view_wview[0] / 2), 0.035);
            view_yview[0] = lerp(view_yview[0], y - (view_hview[0] / 2), 0.035);
        }
        view_angle[0] = lengthdir_y(objDizzy.dizziness * 10, lengthdir_x(objDizzy.dizziness * 20, global.dir * 3));
        if (global.hardmode == 1)
        {
            view_angle[0] = view_angle[0] - 180;
        }
    }
}
else
{
    viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(24, dir), y + lengthdir_y(24, dir)) * 0.1;
    viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(24, dir), y + lengthdir_y(24, dir));
    view_xview[0] += lengthdir_x(viewspeed, viewdir);
    view_yview[0] += lengthdir_y(viewspeed, viewdir);
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    if (room != rmMorgue)
    {
        view_angle[0] = lengthdir_y(objDizzy.dizziness * 10, lengthdir_x(objDizzy.dizziness * 20, global.dir * 3));
    }
    else
    {
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
    }
    if (global.hardmode == 1)
    {
        view_angle[0] = view_angle[0] - 180;
    }
}
if (sprite_index == sprPHospitalHeadache)
{
    if (global.shake < 6)
    {
        global.shake += 0.25;
    }
    with (objDizzy)
    {
        if (dizziness > 0.1)
        {
            dizziness -= 0.005;
        }
    }
}
else if (global.shake > 0)
{
    global.shake -= 0.5;
}
xview = view_xview[0];
yview = view_yview[0];
view_xview[0] = (xview - global.shake) + (global.shake * 2);
view_yview[0] = (yview - global.shake) + (global.shake * 2);
if ((place_meeting(x, y, objHospitalPlant) || place_meeting(x, y, objPelletPlant)) && !place_meeting(x, y, objDoctorPatrol))
{
    plant = 1;
}
else
{
    plant = 0;
}
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
    if (!instance_exists(objLightingEngineMorgue))
    {
        scrPlayerHospitalMove();
    }
    else
    {
        scrPlayerMoveKeyboard();
    }
    if (global.xbox == 1)
    {
        scrXboxPlayerHospitalMouse();
    }
}
