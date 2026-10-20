if (destroyed == 0)
{
    image_xscale = 3;
    image_yscale = 3;
    global.my_id = id;
    bullets = 0;
    with (objBullet)
    {
        if (place_meeting(x, y, global.my_id))
        {
            if (object_index == objBulletSkippy && global.my_id.sprite_index == sprTVBigBroken)
            {
                if (skippy == 0 && instance_exists(objBackgroundColor) && objBackgroundColor.lifeIgel != 0)
                {
                    global.BuffSkippy = 0;
                    objBackgroundColor.lifeIgel -= Igel;
                    if (random(10) < 5)
                    {
                        global.IgelEmotions = "IgelAngry";
                        global.IgelEmotionsimageindex = 0;
                        global.IgelEmotionsWait = 0;
                        global.IgelEmotionsEnd = 0;
                    }
                }
            }
            global.my_id.bullets += 1;
            my_id = instance_create(x, y, objSmokeHit);
            my_id.color1 = 8421504;
            my_id.color2 = 4210752;
            my_id.image_angle = image_angle;
            my_id.direction = image_angle;
            my_id.speed = random(1);
            if (object_index != objBulletSkippyLaser)
            {
                instance_destroy();
            }
            alert = 1;
        }
    }
    image_xscale = 1;
    image_yscale = 1;
    global.shake = 3;
    audio_play_sound(sndBottleBreak, 0, false);
    audio_play_sound(sndTaser, 0, false);
    sprite_index = sprPornLightBroken;
    i = 0;
    dired = image_angle + diradd;
    repeat (5 + round(random(2)))
    {
        my_id = instance_create(x + lengthdir_x(5, (image_angle - 45) + (i * 7.5)), y + lengthdir_y(5, (image_angle - 45) + (i * 7.5)), objTVShards);
        my_id.direction = ((image_angle + diradd + random_range(-10, 10)) - 45) + (i * 7.5);
        my_id.speed = 1 + random(3);
        i += 1;
    }
    repeat (4)
    {
        my_id = instance_create(x, y, objFireSpark);
        my_id.direction = random(360);
        my_id.speed = 3 + random(3);
        my_id.image_angle = my_id.direction;
    }
    my_id = instance_create(x, y, objFurniture);
    my_id.direction = image_angle;
    my_id.sprite_index = sprite_index;
    my_id.mask_index = mask_index;
    my_id.solid = 1;
    my_id.visible = false;
    mask_index = sprNothing;
    destroyed = 1;
}
