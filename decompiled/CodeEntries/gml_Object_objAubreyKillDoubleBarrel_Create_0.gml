image_speed = 0;
bled = 0;
hurtindex = 0;
targetindex = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
ammo = objPlayer.ammo;
if (room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3 || room == rmPoliceHQFloor3TigerHard)
{
    sprite = 1954;
}
else
{
    sprite = 1903;
}
