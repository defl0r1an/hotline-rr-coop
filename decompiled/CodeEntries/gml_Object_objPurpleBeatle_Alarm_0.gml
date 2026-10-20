if (speed < 1)
{
    if (round(random(1)) == 0)
    {
        image_speed = 0.1;
        sprite_index = sprPurpleBeatleIdle;
        image_index = 0;
        speed = 0;
        alarm[0] = 100 + random(200);
    }
    else
    {
        direction = random(360);
        speed = 0.5;
        sprite_index = sprPurpleBeatleWalk;
        image_speed = 0.15;
        alarm[0] = 30 + random(60);
    }
}
