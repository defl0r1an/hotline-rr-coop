with (objPlayer)
{
    global.test = 1;
}
if (global.test == 1)
{
    pdir = point_direction(objPlayer.x, objPlayer.y, x, y);
    repeat (8)
    {
        my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, pdir), (y - 3) + random(6) + lengthdir_y(8, pdir), objBloodDrop);
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
        my_id.sprite_index = sprBloodSplatSmall;
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(4);
    }
    repeat (2 + random(3))
    {
        my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, pdir), (y - 3) + random(6) + lengthdir_y(8, pdir), objBloodDrop);
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
        my_id.direction = my_id.image_angle;
        my_id.speed = 1 + random(5);
    }
    repeat (4)
    {
        my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, pdir), (y - 3) + random(6) + lengthdir_y(16, pdir), objBloodSmoke);
        my_id.image_xscale = 1.2 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = (pdir - 20) + random(40);
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(1);
        my_id.friction = 0.15;
    }
    with (objPlayerBiker)
    {
        my_id = instance_create(x, y, objPlayerBikerHouse);
        my_id.dir = dir;
        my_id.sprite_index = sprBoss2Walk;
        instance_destroy();
    }
    my_id = instance_create(x, y, objDeadBody);
    my_id.direction = point_direction(objPlayer.x, objPlayer.y, x, y);
    my_id.speed = 2;
    my_id.sprite_index = sprCeoDead;
    my_id.image_index = 2;
    my_id.image_angle = my_id.direction;
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    audio_play_sound(sndHit, 0, false);
    instance_destroy();
}
with (objCEO)
{
    instance_destroy();
}
