if (other.object_index == objDennisThrowingKnife)
{
    if (other.speed <= 0)
    {
        exit;
    }
}
if (other.object_index == objThrowingKnife)
{
    if (other.speed <= 0)
    {
        exit;
    }
}
if (sprite_index == sprEDodgerGunWalk)
{
    sprite_index = sprEDodgerGunDodge;
    image_speed = 0.25;
    image_index = 0;
    alert = 1;
    speed = 0;
    path_speed = 0;
}
if (sprite_index == sprEDodgerGunDodge && image_index > 3 && image_index <= 8)
{
    sprite_index = sprEDodgerGunDodge;
    image_speed = 0.25;
    image_index = 4;
    alert = 1;
    speed = 0;
    path_speed = 0;
}
if (sprite_index == sprEDodgerGunDodge && image_index > 8)
{
    sprite_index = sprEDodgerGunDodge;
    image_speed = 0.25;
    image_index = 2;
    speed = 0;
    path_speed = 0;
}
