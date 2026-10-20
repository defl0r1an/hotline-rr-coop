if (detonation == 1)
{
    exit;
}
global.my_id = id;
with (objDoorH2)
{
    if (sprite_index == sprBombDoorH)
    {
        if (place_meeting(x, y, global.my_id))
        {
            image_angle += 1;
        }
    }
}
with (objDoorV2)
{
    if (sprite_index == sprBombDoorV)
    {
        if (place_meeting(x, y, global.my_id))
        {
            image_angle += 1;
        }
    }
}
bounce = 1;
wait = 60;
friction = 0.1;
move_bounce_all(0);
speed *= 0.3;
audio_play_sound(sndHitWall, 0, false);
detonation = 1;
global.my_id = id;
with (objDoorH2)
{
    if (sprite_index == sprBombDoorH || sprite_index == sprBombDoorV)
    {
        if (place_meeting(x, y, global.my_id))
        {
            image_angle += 1;
        }
    }
}
