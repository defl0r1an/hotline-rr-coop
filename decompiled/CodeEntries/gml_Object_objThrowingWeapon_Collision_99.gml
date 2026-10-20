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
if (image_index == 1)
{
    my_id = instance_create(x, y, objBrokenBottle);
    instance_destroy();
    audio_play_sound(sndGlass1, 0, false);
    exit;
}
move_bounce_all(0);
speed *= 0.3;
audio_play_sound(sndHitWall, 0, false);
bounce = 1;
