image_speed = 0.25;
bled = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
ammo = 0;
dir = direction;
End = 0;
Petting = choose(1, 2);
sound = 0;
light = 0;
if (!instance_exists(objEnemy))
{
    global.dogsave -= 1;
}
