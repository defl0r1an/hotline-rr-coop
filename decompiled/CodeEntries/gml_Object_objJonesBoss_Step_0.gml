if (global.xbox == 1)
{
    scrXboxRestart();
}
if (keyboard_check_pressed(ord(global.restartkey)))
{
    event_perform(ev_keypress, ord("R"));
}
if (place_meeting(x, y, objBloodPool))
{
    bloodsled = 1;
}
if (bloodstep > 0)
{
    bloodstep -= 1;
}
else if (bloodsled > 0)
{
    my_id = instance_create(x, y, objLegSled);
    my_id.image_speed = 0;
    my_id.sprite_index = sprLegSleds;
    if (bloodscale == 1)
    {
        my_id.image_index = 0;
    }
    else
    {
        my_id.image_index = 1;
    }
    my_id.image_angle = direction;
    my_id.image_alpha = bloodsled;
    bloodsled -= random_range(0.05, 0.1);
    bloodstep = 10;
    bloodscale = -bloodscale;
}
if (sprite_index == sprJonesStartChainsaw && (image_index == 3.08 || image_index == 9.02))
{
    repeat (3 + round(random(1)))
    {
        my_id = instance_create(x + lengthdir_x(5, direction + 90), y + lengthdir_x(5, direction + 90), objSteam);
        my_id.speed = 1 + random(1);
        my_id.friction = 0.1;
        my_id.direction = direction + 90;
    }
}
if (sprite_index == sprJonesSprintChainsaw)
{
    if (round(random(6)) == 2)
    {
        instance_create(x + lengthdir_x(11, direction), y + lengthdir_y(11, direction), objSteam);
    }
}
if (state == 2 || state == 3)
{
    global.player_lock = 0;
}
else
{
    global.player_lock = 1;
}
if (state == -3 || state == -2 || state == -1 || state == 0 || state == 1)
{
    with (objJonesBoss)
    {
        vdist = point_distance(x, y, room_width / 2, room_height / 2);
        vdir = point_direction(room_width / 2, room_height / 2, x, y);
        viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
        viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
        view_angle[0] = lengthdir_y(vdist * 0.01, vdir * 2);
        view_xview[0] = lerp(view_xview[0], x - (view_wview[0] / 2), 0.05);
        view_yview[0] = lerp(view_yview[0], y - (view_hview[0] / 2), 0.05);
        scrHardMode();
    }
}
if (state == -1 || state == -2 || state == -3)
{
    my_id = instance_create(x, y, objTrailEyes);
    my_id.speed = -0.25 - random(0.125);
    my_id.direction = image_angle;
    my_id.image_angle = my_id.direction;
    my_id.image_index = image_index;
    my_id.image_alpha = alphaEyes;
    my_id.image_speed = 0;
    my_id.image_xscale = image_xscale;
    my_id.image_yscale = image_yscale;
}
if (state == -3)
{
    if (point_distance(x, y, 106, 48) > 1)
    {
        move_towards_point(106, 48, 0.5);
        image_speed = speed * 0.1;
    }
    else
    {
        with (objFluorescentLamp)
        {
            if (CrocodileMan == 1)
            {
                broken = 1;
                audio_play_sound(sndFluorescentLampStart, 0, false);
            }
        }
        alphaEyes = 0;
        speed = 0;
        image_index = 0;
        image_speed = 0;
        state = -1;
    }
}
if (state == -1)
{
    x = lerp(x, 106, 0.5);
    if (objEffector.amount >= 180)
    {
        if (room == rmSecretSewer)
        {
            scrGetMessage(1);
        }
        state = 0;
        test = objPlayer.persistent;
        objPlayer.active = 0;
        objPlayer.aimfar = 1;
        objPlayer.persistent = false;
        global.loaded = 1;
        global.loaded = 0;
        objPlayer.persistent = test;
    }
}
if (state == 0)
{
    sprite_index = sprJonesStartChainsaw;
    image_index = 0;
    if (!instance_exists(objPhoneConversation))
    {
        if (objEffector.amount >= 180)
        {
            if (room == rmSecretSewer)
            {
                scrGetMessage(2);
            }
            state = 1;
            test = objPlayer.persistent;
            objPlayer.persistent = false;
            global.loaded = 1;
            global.loaded = 0;
            objPlayer.persistent = test;
        }
    }
}
if (state == 1)
{
    view_xview[0] = x - (view_wview[0] / 2);
    view_yview[0] = y - (view_hview[0] / 2);
    if (!instance_exists(objPhoneConversation))
    {
        if (global.playing == 0)
        {
            sxeasy_play(global.MadnessAlligatorLoop);
            global.playing = 1;
        }
        image_index = 0;
        sprite_index = sprJonesStartChainsaw;
        image_speed = 0.11;
        sound = 0;
        if (instance_exists(objPlayer))
        {
            with (objPlayer)
            {
                my_id = instance_create(x, y, objPlayerMouse);
                my_id.active = 0;
                my_id.sprite_index = sprPWalkLighter;
                my_id.ammo = ammo;
                my_id.maskon = 1;
                my_id.maskindex = global.maskindex;
                my_id.Spark = -1;
                instance_destroy();
            }
        }
        state = 2;
    }
}
if (instance_exists(objPlayer))
{
    global.test = 0;
    if (state == 3)
    {
        move_towards_point(objPlayer.x, objPlayer.y, speedSprint);
        speedSprint = lerp(speedSprint, 5.5, 0.05);
    }
    with (objThrowingWeapon)
    {
        if (place_meeting(x, y, objJonesBoss))
        {
            audio_stop_sound(sndChainsawStart);
            global.test = 1;
            objJonesBoss.pdir = objThrowingWeapon.direction;
            my_id = instance_create(x, y, objBrokenBottle);
            audio_play_sound(sndGlass1, 0, false);
            instance_destroy();
        }
    }
    if (global.test == 1)
    {
        repeat (8)
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, pdir), (y - 3) + random(6) + lengthdir_y(8, pdir), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
            my_id.sprite_index = sprBloodSplatSmall;
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(4);
        }
        repeat (2 + random(3))
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, pdir), (y - 3) + random(6) + lengthdir_y(8, pdir), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
            my_id.direction = my_id.image_angle;
            my_id.speed = 1 + random(5);
        }
        repeat (4)
        {
            my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, pdir), (y - 3) + random(6) + lengthdir_y(16, pdir), objBloodSmoke);
            my_id.image_xscale = 1.2 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = (pdir - 20) + random(40);
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(1);
            my_id.friction = 0.15;
        }
        my_id = instance_create(x, y, objJonesKnocked);
        my_id.direction = pdir;
        my_id.speed = 2;
        my_id.image_angle = my_id.direction;
        my_id = instance_create(x, y, objWeaponThrow);
        my_id.hotalpha = HotWeaponAlpha;
        my_id.image_index = 26;
        my_id.direction = (pdir - 180) + random_range(-30, 30);
        my_id.speed = 2 + random(1);
        audio_play_sound(sndHit, 0, false);
        audio_play_sound(sndPunch, 0, false);
        audio_play_sound(sndBonesBreak, 0, false);
        audio_play_sound(sndFloorCleared, 0, false);
        global.playing = 0;
        instance_destroy();
    }
}
else
{
    speed = 0;
    exit;
}
scrMoveSolidOn();
if (state == 3)
{
    image_speed = speed * 0.1;
}
if (place_meeting(x + lengthdir_x(8, image_angle), y + lengthdir_y(8, image_angle), objPlayer) && sprite_index == sprJonesSprintChainsaw)
{
    global.my_id = id;
    if (HotWeaponAlpha > 0.65)
    {
        audio_play_sound(sndOverheatingAttack, 0, false);
    }
    scrPlayerDieMelee();
}
scrMoveSolidOff();
