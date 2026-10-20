update = 0;
if (sprite_index == sprHoboAttack)
{
    sprite_index = sprHoboWalkBat;
    update = 1;
}
if (update == 1)
{
    image_speed = 0;
    image_yscale = -image_yscale;
}
if (sprite_index == sprHoboAttackDoubleBarrel2 || sprite_index == sprHoboAttackDoubleBarrel1)
{
    sprite_index = sprHoboWalkDoubleBarrel;
}
