if (sprite_index == sprESwatStumble)
{
    sprite_index = sprSwatWalkM16;
    direction = angle;
    speed = 2;
    exit;
}
if (sprite_index == sprSwatAttackM16)
{
    sprite_index = sprSwatWalkM16;
    exit;
}
if (sprite_index == sprESwatReloadM16)
{
    ammo = 20;
    reloadammo = 0;
    sprite_index = sprSwatWalkM16;
    exit;
}
