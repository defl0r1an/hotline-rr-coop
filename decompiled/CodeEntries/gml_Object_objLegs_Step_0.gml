scrMoveSolidOn();
if (dead == 2 && image_index > 9 && speedend == 0)
{
    friction = 0.1;
    speed = 0.75;
    speedend = 1;
}
if (!place_free(x + (hspeed * 4), y))
{
    speed = 0;
    if (dead == 0)
    {
        dead = 1;
    }
}
if (!place_free(x, y + vspeed))
{
    speed = 0;
    if (dead == 0)
    {
        dead = 1;
    }
}
scrMoveSolidOff();
if (dead == 0)
{
    image_speed = speed / 2;
}
if (friction != 0.1)
{
    speed = lerp(speed, 0, 0.02);
}
if (dead == 1)
{
    speed = 0;
    image_index = 0;
    image_speed = 0;
    sprite_index = sprEDieToreHalfLegs;
    dead = 2;
}
if (speed <= 0.05 && dead == 0)
{
    dead = 1;
}
if (dead == 2)
{
    if (image_index < 17)
    {
        image_index += 0.2;
        shadow = lerp(shadow, 0, 0.05);
    }
    else
    {
        dir = image_angle;
        my_id = instance_create(x + lengthdir_x(37, dir), y + lengthdir_y(37, dir), objBloodPool);
        my_id = instance_create(x, y, objDeadBody);
        my_id.image_speed = 0;
        if (bottom == "Police" && sprite_exists(asset_get_index(sprite_get_name(sprite_index) + "Police")))
        {
            my_id.sprite_index = sprEDieToreHalfLegsPolice;
        }
        else
        {
            my_id.sprite_index = sprEDieToreHalfLegs;
        }
        my_id.image_index = image_index;
        my_id.image_angle = direction - 180;
        instance_destroy();
    }
    if (image_index >= 12 && !bled)
    {
        repeat (3 + random(2))
        {
            dir = image_angle;
            my_id = instance_create(x + lengthdir_x(37, dir), y + lengthdir_y(37, dir), objBloodSquirt);
            my_id.image_angle = image_angle + random_range(-20, 20);
        }
        repeat (4 + random(3))
        {
            dir = image_angle;
            my_id = instance_create(x + lengthdir_x(37, dir), y + lengthdir_y(37, dir), objGuts2);
            my_id.direction = image_angle + random_range(-20, 20);
            my_id.speed = 1.5 + random(1.5);
        }
        audio_play_sound(choose(sndBulletHit1, sndBulletHit2, sndBulletHit3), 0, false);
        audio_play_sound(sndBodyFall1, 0, false);
        bled = 1;
    }
}
