global.my_id = id;
bullets = 0;
with (objBullet)
{
    if (place_meeting(x, y, global.my_id))
    {
        my_id = instance_create(x, y, objBloodSmoke);
        my_id.direction = (direction - 170) + random(10);
        my_id.speed = 1;
        my_id.image_angle = my_id.direction;
        my_id.image_xscale = 0.8 + random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
        {
            my_id.decadenced = 1;
        }
        if (caliber == 0)
        {
            instance_destroy();
        }
        global.my_id.bullets += 1;
    }
}
repeat (bullets)
{
    my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, 270), (y - 3) + random(6) + lengthdir_y(8, 270), objBloodDrop);
    my_id.image_xscale = 1 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = point_direction(x + lengthdir_x(8, 270), y + lengthdir_y(8, 270), my_id.x, my_id.y);
    my_id.sprite_index = sprBloodSplatSmall;
    my_id.direction = my_id.image_angle;
    my_id.speed = 2 + random(4);
    if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
    {
        my_id.decadenced = 1;
    }
}
repeat (1 + random(bullets))
{
    my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, 270), (y - 3) + random(6) + lengthdir_y(8, image_angle), objBloodDrop);
    my_id.image_xscale = 1 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = point_direction(x + lengthdir_x(8, 270), y + lengthdir_y(8, 270), my_id.x, my_id.y);
    my_id.direction = my_id.image_angle;
    my_id.speed = 1 + random(5);
    if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
    {
        my_id.decadenced = 1;
    }
}
repeat (bullets)
{
    my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, 270), (y - 3) + random(6) + lengthdir_y(16, 270), objBloodSmoke);
    my_id.image_xscale = 1.2 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = 270 + random(40);
    my_id.direction = my_id.image_angle;
    my_id.speed = 2 + random(1);
    my_id.friction = 0.15;
    if ((room == rmHouse1Downstairs && instance_exists(objBoss1)) || instance_exists(objVan))
    {
        my_id.decadenced = 1;
    }
}
audio_play_sound(choose(sndBulletHit1, sndBulletHit2, sndBulletHit3), 0, false);
my_id = instance_create(x, y, objWalrusDieHard);
my_id.sprite_index = sprWalrusDieShot;
instance_destroy();
