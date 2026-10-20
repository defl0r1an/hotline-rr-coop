if (skippy == 1)
{
    exit;
}
if (skippy == 0 && instance_exists(objBackgroundColor) && objBackgroundColor.lifeIgel != 0)
{
    objBackgroundColor.lifeIgel -= Igel;
    if (random(10) < 5)
    {
        global.IgelEmotions = "IgelAngry";
        global.IgelEmotionsimageindex = 0;
        global.IgelEmotionsWait = 0;
        global.IgelEmotionsEnd = 0;
    }
}
global.BuffSkippy = 0;
speed = 0;
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
shadowlerp = 0;
time = 60;
mask_index = sprNothing;
if (other.solid == 1)
{
    exit;
}
if (abs(other.swingspeed) < 8)
{
    other.swingspeed += (-hspeed * 0.2);
    if (other.swingspeed > 3.5)
    {
        other.swinger = 1;
    }
}
skippy = 1;
