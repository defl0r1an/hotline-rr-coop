if (state == 0 && open == 1)
{
    audio_play_sound(sndSwing1, 10, false);
    state = 1;
}
if (state == 1 || (global.maskindex == 1 && on == 1 && state != 2))
{
    if (image_index < 8)
    {
        image_index += 0.15;
    }
    if (image_index > 7)
    {
        my_id = instance_create(x - 2, y, objSecretMask);
        my_id.image_index = 17;
        my_id.rotspeed = 0;
        my_id.depth = -3;
        my_id.image_angle = image_angle;
        image_index = 8;
        state = 2;
    }
}
if (state == 2 && instance_exists(objPlayer) && point_distance(x, y, objPlayer.x, objPlayer.y) < 150 && event == 0 && global.hardmodemasks[17] == 0)
{
    scrSetRasmusEvent(choose("A haute cuisine dish"), 11, 100, "mystical");
    event = 1;
}
image_angle += (speed * diradd * 10);
image_blend = merge_color(c_ltgray, c_white, speed * 0.5);
