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
if (sprite_index == sprEDodgerWalk)
{
    sprite_index = sprEDodgerDodge;
    image_speed = 0.25;
    image_index = 0;
    alert = 1;
    speed = 0;
    path_speed = 0;
}
if (sprite_index == sprEDodgerDodge && image_index > 4 && image_index <= 8)
{
    sprite_index = sprEDodgerDodge;
    image_speed = 0.25;
    image_index = 4;
    alert = 1;
    speed = 0;
    path_speed = 0;
}
if (sprite_index == sprEDodgerDodge && image_index > 10)
{
    sprite_index = sprEDodgerDodge;
    image_speed = 0.25;
    image_index = 2;
    speed = 0;
    path_speed = 0;
}
