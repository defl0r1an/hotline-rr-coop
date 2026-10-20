if (object_get_parent(object_index) == 332)
{
    exit;
}
if (sprite_index == sprPoliceWalkM16)
{
    sprite_index = choose(sprPoliceWalkM16, sprPoliceWalkShotgun);
}
if (sprite_index == sprPoliceWalkM16)
{
    ammo = 20;
}
if (sprite_index == sprPoliceWalkShotgun)
{
    ammo = 6;
}
