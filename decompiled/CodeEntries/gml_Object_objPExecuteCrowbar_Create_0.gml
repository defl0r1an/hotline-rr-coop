image_speed = 0;
bled = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
ammo = 0;
played_sound = 0;
if (room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3)
{
    enemy = 148;
    my_id1 = instance_create(x, y, objPoliceHat);
    my_id1.direction = (image_angle - 10) + random(20);
    my_id1.speed = 1 + random(2);
}
else
{
    enemy = 147;
}
energie = 1;
