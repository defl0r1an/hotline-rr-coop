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
global.my_id = id;
bounced = 1;
move_bounce_all(0);
speed *= 0.15;
audio_play_sound(sndHitWall, 0, false);
