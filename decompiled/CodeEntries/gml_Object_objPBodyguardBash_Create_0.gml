if (global.xbox == 1)
{
    scrInitXboxButtons();
}
energie = 1 + floor(random(4));
image_index = 3;
image_speed = 0;
ammo = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
repeat (3)
{
    my_id = instance_create((x - 2) + random(2), (y - 2) + random(2), objWeaponThrow);
    my_id.image_index = 37;
    my_id.direction = random(360);
    my_id.speed = 2 + random(0.5);
}
