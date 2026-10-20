if (energie <= 0)
{
    if (noise == 0)
    {
        objEffector.brus = 4 + floor(random(4));
        with (objPlayerCouch)
        {
            sprite_index = sprPlayerCouchGoofyAss;
        }
        sprite_index = sprDreamPrukolTable;
        mask_index = sprNothing;
        noise = 1;
    }
}
if (instance_exists(objTVReturn) && on == 0)
{
    if (objTVReturn.sprite_index == sprTVBigBroken)
    {
        image_speed = 0.15;
    }
    if (image_index <= 9)
    {
        button = 0;
    }
    if (image_index >= 11)
    {
        if (fail <= 85)
        {
            objTVReturn.stage = "broken";
        }
        else
        {
            objTVReturn.stage = "fail";
            if (failsound == 0)
            {
                audio_play_sound(sndGrunt, 1, false);
                failsound = 1;
            }
        }
    }
    if (image_index >= 14)
    {
        failsound = 0;
        fail = random(100);
        image_speed = 0;
        image_index = 0;
        if (objTVReturn.stage != "fail")
        {
            on = 1;
        }
    }
    if (image_index > 10 && button == 0)
    {
        audio_play_sound(sndPunch, 10, false);
        button = 1;
    }
    if (image_index > 11 && button == 1)
    {
        audio_play_sound(sndPhone, 10, false);
        button = 2;
    }
}
if (instance_exists(objTVReturn) && on == 0)
{
    if (objTVReturn.sprite_index == sprTVBigBroken)
    {
        image_speed = 0.15;
    }
    if (image_index <= 9)
    {
        button = 0;
    }
    if (image_index >= 11)
    {
        if (fail <= 85)
        {
            objTVReturn.stage = "broken";
        }
        else
        {
            objTVReturn.stage = "fail";
            if (failsound == 0)
            {
                audio_play_sound(sndGrunt, 1, false);
                failsound = 1;
            }
        }
    }
    if (image_index >= 14)
    {
        failsound = 0;
        fail = random(100);
        image_speed = 0;
        image_index = 0;
        if (objTVReturn.stage != "fail")
        {
            on = 1;
        }
    }
    if (image_index > 10 && button == 0)
    {
        audio_play_sound(sndPunch, 10, false);
        button = 1;
    }
    if (image_index > 11 && button == 1)
    {
        audio_play_sound(sndPhone, 10, false);
        button = 2;
    }
}
if (global.maskindex != 27 && global.maskon == 1)
{
    i = 0;
    repeat (room_width / 16)
    {
        tile_layer_delete_at(100, i, 16);
        tile_layer_delete_at(100, i, 0);
        tile_layer_delete_at(100, i, -16);
        tile_layer_delete_at(100, i, -32);
        tile_layer_delete_at(100, i, -48);
        i += 16;
    }
    i = 0;
    repeat (14)
    {
        tile_layer_delete_at(100, 192 + i, 32);
        tile_layer_delete_at(100, 192 + i, 48);
        i += 16;
    }
    with (all)
    {
        if (collision_rectangle(0, -50, room_width, 27, id, 0, 0) || collision_rectangle(213, -50, 405, 52, id, 0, 0))
        {
            instance_destroy();
        }
    }
    instance_destroy();
}
if (create == 0 && global.maskon == 1 && global.maskindex == 27)
{
    my_id = instance_create(251, 33, objHomelessBed);
    my_id.image_angle = -5 + random(10);
    instance_create(300, 55, objUnderwear);
    create = 1;
}
if (instance_exists(objHorBarrier) && !instance_exists(objEnemy))
{
    with (objHorBarrier)
    {
        instance_destroy();
    }
}
