if (global.hardmode == 1)
{
    image_speed = -0.32;
}
else
{
    image_speed = 0;
}
dead = 0;
if (room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3 || room == rmPoliceHQFloor3TigerHard)
{
    sprite = 1891;
}
else
{
    sprite = 481;
}
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
hurtindex = 0;
targetindex = 0;
bottom = 465;
