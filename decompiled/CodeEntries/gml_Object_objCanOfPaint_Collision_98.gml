if (coli == 0)
{
    audio_play_sound(sndThrow, 0, false);
    audio_play_sound(sndHitWall, 0, false);
    audio_play_sound(sndSplashWave, 0, false);
    if (image_index == 0)
    {
        my_id = instance_create(x, y, objCanOfPaint);
        my_id.direction = point_direction(objPlayer.x, objPlayer.y, x, y);
        my_id.image_angle = my_id.direction;
        my_id.image_index = 2;
        my_id.speed = 2.5;
        my_id.coli = 1;
    }
    my_id = instance_create(x, y, objCanOfPaint);
    my_id.direction = point_direction(objPlayer.x, objPlayer.y, x, y);
    my_id.image_angle = my_id.direction;
    my_id.image_index = image_index;
    my_id.sprite_index = sprCanOfPaintKnockout;
    my_id.speed = 1 + random(0.5);
    my_id.wait = 30;
    my_id.coli = 1;
    instance_destroy();
}
