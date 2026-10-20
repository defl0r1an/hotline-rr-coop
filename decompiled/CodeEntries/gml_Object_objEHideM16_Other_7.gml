reload = 20;
ammo = 20;
if (sprite_index == sprEM16Crouching && ammo <= 0)
{
    image_index = 5;
    image_speed = -1;
}
if (sprite_index == sprEHidingReload)
{
    sprite_index = sprEM16Crouching;
    image_index = 5;
    image_speed = 0;
}
alert = 0;
