hurtindex = 0;
targetindex = 0;
image_speed = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
ammo = 0;
if (room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3)
{
    bottom = 2062;
}
else
{
    bottom = 1918;
}
if (global.xbox == 1)
{
    scrInitXboxButtons();
}
edir = 0;
energie = 0;
knifekill = 0;
