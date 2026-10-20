bullets = 0;
with (objBullet)
{
    if (place_meeting(x, y, objGuyWithHelmet))
    {
        my_id = instance_create(x, y, objBloodSmoke);
        my_id.direction = (direction - 170) + random(10);
        my_id.speed = 1;
        my_id.image_angle = my_id.direction;
        my_id.image_xscale = 0.8 + random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        if (caliber == 0)
        {
            instance_destroy();
        }
        objGuyWithHelmet.bullets += 1;
    }
}
my_id = instance_create(x, y, objDeadBody);
audio_play_sound(choose(sndBulletHit1, sndBulletHit2, sndBulletHit3), 0, false);
if (bullets > 1)
{
    my_id.sprite_index = choose(sprGuyWithHelmetDeadShotgun, sprGuyWithHelmetDeadShotgun, sprGuyWithHelmetDeadShotgun);
}
else
{
    my_id.sprite_index = choose(sprGuyWithHelmetDead, sprGuyWithHelmetDead, sprGuyWithHelmetDead);
}
my_id.image_index = floor(random(4));
my_id.direction = edir;
my_id.speed = 1.5 + random(1) + (bullets * 0.15);
my_id.image_angle = my_id.direction;
if (my_id.sprite_index == sprGuyWithHelmetDead)
{
    repeat (4)
    {
        my_id = instance_create((x - 3) + random(6), y - 3, objBloodSmoke);
        my_id.image_xscale = 1.2 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = (edir - 20) + random(40);
        my_id.direction = my_id.image_angle;
        my_id.speed = 2 + random(1);
        my_id.friction = 0.15;
        my_id = instance_create((x - 3) + random(6), (y - 3) + random(6), objBloodDrop);
        my_id.image_xscale = 1 - random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        my_id.image_angle = point_direction(x, y, my_id.x, my_id.y);
        my_id.direction = my_id.image_angle;
        my_id.speed = 1 + random(5);
    }
    scrGoreShot(x, y, other.direction - 180, other.x, other.y, 1);
}
if (my_id.sprite_index == sprGuyWithHelmetDeadShotgun)
{
    if (my_id.image_index == 0)
    {
        scrGoreShotgun(x, y, other.direction - 180, 0, 0, 0, 0, 0, 1);
    }
    if (my_id.image_index == 1)
    {
        scrGoreShotgun(x, y, other.direction - 180, 0, 0, 0, 0, 0, 1);
    }
    if (my_id.image_index == 2)
    {
        scrGoreShotgun(x, y, other.direction - 180, 1, x + lengthdir_x(18, my_id.direction + (20 * my_id.image_yscale)), y + lengthdir_y(18, my_id.direction + (20 * my_id.image_yscale)), my_id.direction - (90 * my_id.image_yscale), 0, 0);
    }
    if (my_id.image_index == 3)
    {
        scrGoreShotgun(x, y, other.direction - 180, 1, x + lengthdir_x(23, my_id.direction), y + lengthdir_y(23, my_id.direction), my_id.direction, 1, 0);
    }
}
my_id = instance_create(x, y, objMCHelmet);
my_id.direction = random(360);
my_id.speed = 5 + random(2);
instance_destroy();
