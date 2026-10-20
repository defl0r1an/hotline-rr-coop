if (global.xbox == 1)
{
    exit;
}
if (fade == 1)
{
    exit;
}
image_index = 0;
if (global.gotbeaten == 1)
{
    sprite_index = sprBikerDriveOffUnmasked;
}
else
{
    sprite_index = sprMCDriveOff;
}
fade = 1;
