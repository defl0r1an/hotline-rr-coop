if (image_index < 16)
{
    image_index += 0.2;
}
if (image_index >= 12 && !dead_bruh)
{
    depth = 1;
    if (!instance_exists(objPlayerBikerHouse))
    {
        my_id = instance_create(x + lengthdir_x(11, image_angle - 180), y + lengthdir_y(11, image_angle - 180), objPlayerBikerHouse);
        if (global.gotbeaten == 1)
        {
            my_id.sprite_index = sprBikerWalkHealed;
        }
        else
        {
            my_id.sprite_index = sprBoss2Walk;
        }
        my_id2 = instance_create(x + lengthdir_x(18, image_angle), y + lengthdir_y(18, image_angle), objPoliceHat);
        my_id2.sprite_index = sprJanitorCap;
        my_id2.direction = random(360);
        my_id2.speed = 2 + random(1);
        dead_bruh = 1;
    }
}
if (image_index >= 3)
{
    if (bled == 0)
    {
        bled = 1;
        audio_play_sound(sndHit, 0, false);
        audio_play_sound(sndCut1, 0, false);
        repeat (5)
        {
            my_id = instance_create(x + lengthdir_x(11, image_angle - 10), y + lengthdir_y(11, image_angle - 10), objBloodSquirt);
            my_id.image_angle = (image_angle - 120) + random(60);
        }
        repeat (5)
        {
            my_id = instance_create(x + lengthdir_x(11, image_angle - 10), y + lengthdir_y(11, image_angle - 10), objBloodSmoke);
            my_id.image_angle = (image_angle - 120) + random(60);
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 == random(1);
        }
    }
}
