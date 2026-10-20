global.BuffSkippy = 0;
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
instance_destroy();
