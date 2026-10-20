if (global.hardmode == 1)
{
    instance_destroy();
}
image_speed = 0;
alarm[0] = 1 + random(200);
sprite_index = choose(sprNerkushaIdle, sprNerkushaIdle2);
if (random(100) >= 85)
{
    sprite_index = sprNerkushaLaughter;
}
tvari = 1;
