if (collision_circle(x + lengthdir_x(-90, image_angle), y + lengthdir_y(-90, image_angle), 90, objPlayer, 0, 1) && open == 0)
{
    image_speed = 0.15;
    volume = clamp(1 - (point_distance(x, y, objPlayer.x, objPlayer.y) / 180), 0, 1);
    audio_play_sound(sndMorgueCell, 0, false);
    audio_sound_gain(sndMorgueCell, volume, 0);
    open = 1;
}
if (image_index > 6 && image_index < 8)
{
    moveTruck = lerp(moveTruck, -22, 0.25);
}
if (image_index > 8)
{
    moveTruck = lerp(moveTruck, -20, 0.15);
}
