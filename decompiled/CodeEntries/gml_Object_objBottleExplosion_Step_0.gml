if (round(random(3)) == 2)
{
    dir = random(360);
    dist = random(20);
    my_id = instance_create(x + lengthdir_x(dist, dir), y + lengthdir_y(dist, dir), objFlameParticle);
    my_id.direction = dir;
    my_id.speed = (dist * 0.025) + random(1);
}
if (collision_circle(x, y, 28, objPlayer, 0, 1))
{
    with (objPlayer)
    {
        audio_play_sound(sndCatchFire, 0, false);
        my_id = instance_create(x, y, objBurningGuy);
        my_id.direction = direction;
        my_id.player = 1;
        instance_destroy();
    }
}
