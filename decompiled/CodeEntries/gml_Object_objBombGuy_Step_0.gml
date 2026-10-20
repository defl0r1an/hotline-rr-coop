if (global.hardmode == 0)
{
    exit;
}
if (!event)
{
    if (point_distance(x, y, global.mousex, global.mousey) < 100 && global.hardmodemasks[2] == 0)
    {
        scrSetRasmusEvent(choose("Wait a little...", "Not now"), 10, 100, "mystical");
        event = 1;
    }
}
if (on == 0)
{
    global.test = 0;
    with (objDoorV)
    {
        if (sprite_index == sprBombDoorV)
        {
            if (image_angle > 0 || image_angle < 0)
            {
                global.test = 1;
                my_x = x;
                my_y = y;
                i = 0;
                sparks = 10 + floor(random(20));
                repeat (sparks)
                {
                    my_id = instance_create(my_x, my_y, objSpark1);
                    my_id.direction = (i * 360) / sparks;
                    my_id.speed = 1.6 + lengthdir_x(0.2, my_id.direction * sparks * 0.25);
                    my_id.image_angle = my_id.direction;
                    i += 1;
                }
                repeat (8 + random(8))
                {
                    my_id = instance_create(my_x, my_y, objSpark2);
                    my_id.direction = random(360);
                    my_id.speed = random(0.6);
                }
                instance_create(my_x, my_y, objElectricLight);
            }
        }
    }
    with (objDoorH2)
    {
        if (sprite_index == sprBombDoorH)
        {
            if (image_angle > 0 || image_angle < 0)
            {
                global.test = 1;
                my_x = x;
                my_y = y;
                i = 0;
                sparks = 10 + floor(random(20));
                repeat (sparks)
                {
                    my_id = instance_create(my_x, my_y, objSpark1);
                    my_id.direction = (i * 360) / sparks;
                    my_id.speed = 1.6 + lengthdir_x(0.2, my_id.direction * sparks * 0.25);
                    my_id.image_angle = my_id.direction;
                    i += 1;
                }
                repeat (8 + random(8))
                {
                    my_id = instance_create(my_x, my_y, objSpark2);
                    my_id.direction = random(360);
                    my_id.speed = random(0.6);
                }
                instance_create(my_x, my_y, objElectricLight);
            }
        }
    }
    if (global.test == 1)
    {
        my_x = x;
        my_y = y;
        i = 0;
        sparks = 30 + floor(random(20));
        repeat (sparks)
        {
            my_id = instance_create(my_x, my_y, objSpark1);
            my_id.direction = (i * 360) / sparks;
            my_id.speed = 1.6 + lengthdir_x(0.2, my_id.direction * sparks * 0.25);
            my_id.image_angle = my_id.direction;
            i += 1;
        }
        repeat (16 + random(8))
        {
            my_id = instance_create(my_x, my_y, objSpark2);
            my_id.direction = random(360);
            my_id.speed = random(0.6);
        }
        instance_create(my_x, my_y, objElectricLight);
        audio_play_sound(sndElectric, 0, false);
        on = 1;
    }
}
if (sprite_index == sprTigerDiePistol && image_index < 19)
{
    image_index += 0.15;
}
