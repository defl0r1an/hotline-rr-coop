if (other.object_index == objWallSoftH || other.object_index == objWallSoftV)
{
    move_bounce_all(0);
    speed *= 0.3;
    if (image_index == 5 || image_index == 8 || image_index == 18)
    {
        audio_play_sound(sndKnifeWall, 0, false);
    }
    else
    {
        audio_play_sound(sndHitWall, 0, false);
    }
    bounce = 1;
}
if (other.object_index == objWallBoardsH || other.object_index == objWallBoardsH)
{
    move_bounce_all(0);
    speed *= 0.3;
    if (image_index == 5 || image_index == 8 || image_index == 18)
    {
        audio_play_sound(sndKnifeWall, 0, false);
    }
    else
    {
        audio_play_sound(sndHitWall, 0, false);
    }
    bounce = 1;
}
if (other.object_index == objGlassPanelH)
{
    if (vspeed > 0)
    {
        other.add = -1;
    }
    else
    {
        other.add = 1;
    }
    with (other.id)
    {
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
        if (!audio_is_playing(sndGlass1) && !audio_is_playing(sndGlass2))
        {
            audio_play_sound(choose(sndGlass1, sndGlass2), 0, false);
        }
    }
    exit;
}
if (other.object_index == objGlassPanelV)
{
    if (hspeed > 0)
    {
        other.add = -1;
    }
    else
    {
        other.add = 1;
    }
    with (other.id)
    {
        i = 0;
        repeat (24)
        {
            my_id = instance_create(x, y + (i * 1.5), objShard);
            my_id.speed = random(5);
            my_id.direction = ((90 + (add * 90)) - 8) + random(16);
            i += 1;
        }
        instance_create(x, y, objGlassPanelVBroken);
        instance_destroy();
        if (!audio_is_playing(sndGlass1) && !audio_is_playing(sndGlass2))
        {
            audio_play_sound(choose(sndGlass1, sndGlass2), 0, false);
        }
    }
    exit;
}
