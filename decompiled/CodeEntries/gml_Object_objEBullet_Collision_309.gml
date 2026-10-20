if (other.object_index == objWallSoftH || other.object_index == objWallSoftV)
{
    my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objHit);
    my_id.image_angle = direction;
    my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objSmokeHit);
    my_id.image_angle = direction;
    my_id.direction = random(360);
    my_id.speed = random(0.5);
    repeat (4)
    {
        my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objDebris);
        my_id.direction = random(360);
        my_id.speed = random(4);
    }
    exit;
}
if (other.solid == 1)
{
    move_contact_solid(direction, speed * 2);
}
else
{
    x -= hspeed;
    y -= vspeed;
    move_contact_all(direction, speed * 2);
}
my_id = instance_create(x, y, objSmokeHit);
my_id.image_angle = direction;
my_id.direction = direction - 180;
my_id.speed = random(1);
amount = random(0.5);
my_id.color1 = merge_color(c_gray, c_dkgray, amount);
my_id.color2 = merge_color(c_dkgray, c_black, amount);
repeat (4 + random(6))
{
    dir = -65 + random(130);
    my_id = instance_create(x + lengthdir_x(8, (image_angle - 180) + dir), y + lengthdir_y(8, (image_angle - 180) + dir), objSpark);
    my_id.direction = (image_angle - 180) + dir;
    my_id.image_angle = (image_angle - 180) + dir;
    my_id.speed = 2 + (random(5) * random(1));
}
if (global.maskindex != 15 && global.hardmode == 0)
{
    instance_destroy();
}
repeat (4)
{
    my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objDebris);
    my_id.direction = direction - 140 - random(80);
    my_id.speed = random(4);
}
if (global.maskindex != 15 && global.hardmode == 0)
{
    instance_destroy();
}
if (global.maskindex == 15 && global.hardmode == 1)
{
    if (random(10) > 5 && speed >= 0.6)
    {
        direction = direction - 140 - random(80);
        image_angle = direction;
        speed /= 1.2;
        speed = clamp(speed, 0.6, 20);
        image_xscale = 0.5;
        image_yscale = 0.5;
        audio_play_sound(choose(sndBulletImpact, sndBulletImpact1, sndBulletImpact2, sndBulletImpact3, sndBulletImpact4, sndBulletImpact5), 10, false);
    }
    else
    {
        instance_destroy();
    }
}
else
{
    instance_destroy();
}
