scrHearPoint(object_index, 500);
image_speed = 0.25;
ExplosionAnim = 0;
global.ExplosionAnim = image_index;
global.shake = 25;
global.ExplosionImpact = 6;
audio_play_sound(sndBigExplosionIgel, 0, false);
circlescale = 0;
circlealpha = 1;
Explosionend = 0;
i = 0;
repeat (16)
{
    my_id = instance_create(x, y, objSteam);
    my_id.direction = i + random_range(10, -10);
    my_id.speed = 3 + random(1);
    my_id.image_angle = my_id.direction;
    i += 30;
}
image_xscale = 0;
image_yscale = image_xscale;
scale = 0;
explore = 0;
