if (objEffector.brus <= 0 && image_index <= 29)
{
    image_index += 0.15;
}
else if (image_index > 29)
{
    objEffector.brus = 18;
    my_id = instance_create(224, 272, objDeadBody);
    my_id.sprite_index = sprPantherDeadStripCult;
    my_id.image_yscale = -1;
    my_id.depth = -1;
    my_id = instance_create(224, 272, objBloodPool);
    my_id = instance_create(288, 272, objPWorship);
    my_id.image_angle = 90;
    instance_destroy();
}
if (image_index >= 6 && state == 0)
{
    global.blink = 1;
    audio_play_sound(sndCut1, 0, false);
    repeat (4)
    {
        my_id = instance_create(x + lengthdir_x(16, image_angle), y + lengthdir_y(16, image_angle), objBloodDrop);
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = image_angle - 30 - random_range(-15, 15);
        my_id.sprite_index = sprBloodSplatSmall;
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(4);
    }
    repeat (1 + random(1))
    {
        my_id = instance_create(x + lengthdir_x(16, image_angle), y + lengthdir_y(16, image_angle), objBloodDrop);
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = image_angle - 30 - random_range(-30, 30);
        my_id.direction = my_id.image_angle;
        my_id.speed = 1 + random(5);
    }
    repeat (2)
    {
        my_id = instance_create(x + lengthdir_x(16, image_angle), y + lengthdir_y(16, image_angle), objBloodSmoke);
        my_id.image_xscale = 1.2 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = image_angle - 30 - random_range(-10, 10);
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(1);
        my_id.friction = 0.15;
    }
    state++;
}
if (image_index >= 9 && state == 1)
{
    objEffector.brus = 8;
    state++;
    image_index = 10;
}
if (image_index >= 13 && state == 2)
{
    objEffector.brus = 12;
    state++;
    image_index = 14;
}
if (image_index >= 16 && state == 3)
{
    audio_play_sound(sndCut2, 0, false);
    repeat (2)
    {
        my_id = instance_create(x + lengthdir_x(16, image_angle), y + lengthdir_y(16, image_angle), objBloodDrop);
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = (image_angle + 100) - random_range(-15, 15);
        my_id.sprite_index = sprBloodSplatSmall;
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(4);
    }
    repeat (1 + random(1))
    {
        my_id = instance_create(x + lengthdir_x(16, image_angle), y + lengthdir_y(16, image_angle), objBloodDrop);
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = (image_angle + 100) - random_range(-15, 15);
        my_id.direction = my_id.image_angle;
        my_id.speed = 1 + random(5);
    }
    repeat (2)
    {
        my_id = instance_create(x + lengthdir_x(16, image_angle), y + lengthdir_y(16, image_angle), objBloodSmoke);
        my_id.image_xscale = 1.2 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = (image_angle + 100) - random_range(-10, 10);
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(1);
        my_id.friction = 0.15;
    }
    state++;
}
if (image_index >= 18.5 && state == 4)
{
    dir = point_direction(0, 0, 30, -3) + image_angle + 90;
    dist = point_distance(0, 0, 30, -3);
    my_id = instance_create(x + lengthdir_x(dist, dir), y + lengthdir_y(dist, dir), objDecorativeWeapon);
    my_id.speed = 1.5 + random(1.5);
    my_id.direction = image_angle + 90;
    my_id.depth = -2;
    my_id.friction = 0.1;
    my_id.image_index = 47;
    my_id.sprite_index = sprButterflyBlood;
    state++;
}
if (image_index >= 19 && state == 5)
{
    objEffector.brus = 12;
    state++;
    image_index = 20;
}
if (image_index >= 20 && state == 6)
{
    audio_play_sound(sndScalping, 0, false);
    state++;
}
