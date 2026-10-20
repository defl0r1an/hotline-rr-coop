if (global.IgelEmotionsWait > 0)
{
    global.IgelEmotionsWait -= 1;
}
if (global.IgelEmotionsWait <= 0 && global.IgelEmotionsEnd == 1)
{
    global.IgelEmotionsEnd = 0;
}
if ("IgelPain")
{
    exit;
}
if (global.IgelEmotions == "IgelBlink")
{
    if (global.IgelEmotionsEnd == 0)
    {
        if (global.IgelEmotionsimageindex < sprite_get_number(asset_get_index("sprMasks" + string(global.IgelEmotions))))
        {
            global.IgelEmotionsimageindex += 0.25;
        }
        if (global.IgelEmotionsimageindex == sprite_get_number(asset_get_index("sprMasks" + string(global.IgelEmotions))))
        {
            global.IgelEmotionsimageindex = 0;
            global.IgelEmotionsWait = 10 + round(random(450));
            global.IgelEmotionsEnd = 1;
        }
    }
}
if (global.IgelEmotions == "IgelAngry" || global.IgelEmotions == "IgelBoring")
{
    if (global.IgelEmotionsEnd == 0)
    {
        if (global.IgelEmotionsimageindex < sprite_get_number(asset_get_index("sprMasks" + string(global.IgelEmotions))))
        {
            global.IgelEmotionsimageindex += 0.25;
        }
        if (global.IgelEmotionsimageindex == sprite_get_number(asset_get_index("sprMasks" + string(global.IgelEmotions))))
        {
            global.IgelEmotionsimageindex = 0;
            global.IgelEmotionsWait = 10 + round(random(450));
            global.IgelEmotions = "IgelBlink";
            global.IgelEmotionsEnd = 1;
        }
    }
}
