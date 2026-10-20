image_speed = 0;
bled = 0;
hurtindex = 0;
targetindex = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
ammo = 0;
if (room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3)
{
    enemy = 555;
}
else
{
    enemy = 554;
}
if (global.maskindex == 6)
{
    speeddennis = 0.225;
}
else
{
    speeddennis = 0.15;
}
