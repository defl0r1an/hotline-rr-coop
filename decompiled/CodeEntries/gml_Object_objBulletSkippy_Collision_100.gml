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
my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objHit);
my_id.image_angle = direction;
my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objSmokeHit);
my_id.image_angle = direction;
my_id.direction = random(360);
my_id.speed = random(0.5);
shadowlerp = 0;
time = 60;
mask_index = sprNothing;
if (other.solid == 1)
{
    exit;
}
if (abs(other.swingspeed) < 8)
{
    other.swingspeed += (-vspeed * 0.2);
    if (other.swingspeed > 3.5)
    {
        other.swinger = 1;
    }
}
skippy = 1;
