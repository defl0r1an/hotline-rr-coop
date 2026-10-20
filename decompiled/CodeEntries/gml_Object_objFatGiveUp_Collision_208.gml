global.my_id = id;
image_xscale = 1.5;
image_yscale = 1.5;
with (objBullet)
{
    if (place_meeting(x, y, global.my_id))
    {
        my_id = instance_create(x, y, objBloodSmoke);
        audio_play_sound(choose(sndBulletHit1, sndBulletHit2, sndBulletHit3), 0, false);
        my_id.direction = (direction - 170) + random(10);
        my_id.speed = 1;
        my_id.image_angle = my_id.direction;
        my_id.image_xscale = 0.8 + random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        if (caliber == 0)
        {
            instance_destroy();
        }
    }
}
image_xscale = 1;
image_yscale = 1;
edir = other.direction;
test = 0;
repeat (2)
{
    my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
    my_id.image_xscale = 1 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
    my_id.sprite_index = sprBloodSplatSmall;
    my_id.direction = my_id.image_angle;
    my_id.speed = 2 + random(4);
}
my_id = instance_create((x - 3) + random(6) + lengthdir_x(8, edir), (y - 3) + random(6) + lengthdir_y(8, edir), objBloodDrop);
my_id.image_xscale = 1 - random(0.2);
my_id.image_yscale = my_id.image_xscale;
my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
my_id.direction = my_id.image_angle;
my_id.speed = 1 + random(5);
my_id = instance_create((x - 3) + random(6) + lengthdir_x(16, edir), (y - 3) + random(6) + lengthdir_y(16, edir), objBloodSmoke);
my_id.image_xscale = 1.2 - random(0.2);
my_id.image_yscale = my_id.image_xscale;
my_id.image_angle = (edir - 20) + random(40);
my_id.direction = my_id.image_angle;
my_id.speed = 2 + random(1);
my_id.friction = 0.15;
if (hp != 0)
{
    hp--;
}
else
{
    my_id = instance_create(x, y, objDeadBody);
    my_id.direction = edir - 180;
    my_id.speed = 0.5;
    if (sprite_index == sprEFatGunnerGiveUp)
    {
        my_id.sprite_index = sprEFatGunDead;
    }
    else
    {
        my_id.sprite_index = sprEFatDead;
    }
    my_id.image_index = 2 + floor(random(2));
    my_id.image_angle = my_id.direction;
    instance_destroy();
}
