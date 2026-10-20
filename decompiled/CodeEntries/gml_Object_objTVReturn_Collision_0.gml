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
if (energie <= 0)
{
    exit;
}
energie -= bullets;
if (energie > 0)
{
    if (sprite_index == sprTVBig)
    {
        global.shake = 3;
        sprite_index = sprTVBigBreak;
        audio_play_sound(sndBottleBreak, 0, false);
        audio_play_sound(sndTaser, 0, false);
        i = 0;
        repeat (24)
        {
            my_id = instance_create(x + lengthdir_x(12, (image_angle - 45) + (i * 3.75)), y + lengthdir_y(12, (image_angle - 45) + (i * 3.75)), objTVShards);
            my_id.direction = (image_angle - 45) + (i * 3.75);
            my_id.speed = 1 + random(3);
            i += 1;
        }
    }
}
else
{
    audio_play_sound(sndBottleBreak, 0, false);
    if (life > 0)
    {
        audio_play_sound(sndTaser, 0, false);
    }
    audio_play_sound(sndExplode, 0, false);
    global.shake = 6;
    image_index = choose(0, 1);
    if (image_index == 0)
    {
        i = random(1);
        repeat (8)
        {
            length = 1 + random(2);
            my_id = instance_create(x + lengthdir_x(length, i * 45), y + lengthdir_y(length, i * 45), objFirePuff);
            my_id.image_angle = (i * 45) - 180;
            my_id.direction = my_id.image_angle - 180;
            my_id.speed = 0.5 + random(1);
            my_id.friction = 0.1;
            i += 1;
        }
        repeat (4)
        {
            my_id = instance_create((x - 4) + random(8), (y - 4) + random(8), objFireBall);
            my_id.direction = point_direction(x, y, my_id.x, my_id.y);
            my_id.speed = 0.25 + random(0.25);
        }
        repeat (16)
        {
            my_id = instance_create(x, y, objFireSpark);
            my_id.direction = random(360);
            my_id.speed = 3 + random(3);
            my_id.image_angle = my_id.direction;
        }
        repeat (16)
        {
            my_id = instance_create((x - 6) + random(12), (y - 6) + random(12), objTVBigParts);
            my_id.direction = point_direction(x, y, my_id.x, my_id.y);
            my_id.speed = 2 + random(3);
        }
        if (sprite_index == sprTVBig)
        {
            i = 0;
            repeat (24)
            {
                my_id = instance_create(x + lengthdir_x(12, (image_angle - 45) + (i * 3.75)), y + lengthdir_y(12, (image_angle - 45) + (i * 3.75)), objTVShards);
                my_id.direction = (image_angle - 45) + (i * 3.75);
                my_id.speed = 1 + random(3);
                i += 1;
            }
        }
        sprite_index = sprTVBigBroken;
        image_speed = 0;
        image_index = 0;
    }
    if (image_index == 1)
    {
        i = random(1);
        repeat (8)
        {
            length = 1 + random(2);
            my_id = instance_create(x + lengthdir_x(length, i * 45), y + lengthdir_y(length, i * 45), objFirePuff);
            my_id.image_angle = (i * 45) - 180;
            my_id.direction = my_id.image_angle - 180;
            my_id.speed = 0.5 + random(1);
            my_id.friction = 0.1;
            i += 1;
        }
        repeat (4)
        {
            my_id = instance_create((x - 4) + random(8), (y - 4) + random(8), objFireBall);
            my_id.direction = point_direction(x, y, my_id.x, my_id.y);
            my_id.speed = 0.25 + random(0.25);
        }
        repeat (16)
        {
            my_id = instance_create(x, y, objFireSpark);
            my_id.direction = random(360);
            my_id.speed = 3 + random(3);
            my_id.image_angle = my_id.direction;
        }
        repeat (16)
        {
            my_id = instance_create(((x + lengthdir_x(5, image_angle + 45)) - 3) + random(6), ((y + lengthdir_y(5, image_angle + 45)) - 3) + random(6), objTVBigParts);
            my_id.direction = point_direction(x, y, my_id.x, my_id.y);
            my_id.speed = 2 + random(3);
        }
        if (sprite_index == sprTVBig)
        {
            i = 0;
            repeat (14)
            {
                my_id = instance_create(x + lengthdir_x(12, (image_angle - 45) + (i * 3.75)), y + lengthdir_y(12, (image_angle - 45) + (i * 3.75)), objTVShards);
                my_id.direction = (image_angle - 45) + (i * 3.75);
                my_id.speed = 1 + random(3);
                i += 1;
            }
        }
        sprite_index = sprTVBigBroken;
        image_speed = 0;
        image_index = 1;
    }
}
