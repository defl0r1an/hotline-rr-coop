if (point_distance(x, y, objPlayer.x, objPlayer.y) < 50 && sprite_index == sprECrawlPieceFront)
{
    dead = 1;
    speed = 0;
    sprite_index = sprECrawlPieceFrontDieJones;
    image_index = 0;
    imagespeed = 0.2;
}
if (speed > 0 && friction > 0)
{
    if (speed <= 0.2)
    {
        friction = 0;
        speed = 0;
    }
    exit;
}
with (objDoorH)
{
    solid = 1;
}
with (objDoorV)
{
    solid = 1;
}
with (objShootThrough)
{
    test = solid;
    solid = 1;
}
image_speed = imagespeed;
if (dead == 0)
{
    speed = 0;
    if (image_index > 0 && image_index < 3)
    {
        speed = 0.65;
    }
    if (image_index > 5 && image_index < 9)
    {
        speed = 0.65;
    }
    if (image_index > 12)
    {
        speed = 0.65;
    }
}
if (speed > 0)
{
    direction = image_angle;
    bloodsled -= 1;
    if (bloodsled == 0)
    {
        my_id = instance_create(x, y, objBloodSled);
        my_id.image_angle = direction;
        my_id.image_index = round(random(2));
        bloodsled = 13;
    }
    gutssled -= 1;
    if (gutssled <= 0 && speed != 0)
    {
        my_id = instance_create(x - lengthdir_x(10, image_angle), y - lengthdir_y(10, image_angle), objGuts2);
        my_id.speed = random(0.5);
        my_id.direction = direction;
        my_id.image_xscale = choose(1, -1);
        gutssled = 11;
    }
}
with (objDoorH)
{
    solid = 0;
}
with (objDoorV)
{
    solid = 0;
}
with (objShootThrough)
{
    solid = test;
}
