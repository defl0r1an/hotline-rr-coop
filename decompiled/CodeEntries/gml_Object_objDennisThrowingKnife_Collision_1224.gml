if (life > 0)
{
    if (other.sprite_index == sprEDodgerWalk)
    {
        other.sprite_index = sprEDodgerDodge;
        other.image_speed = 0.35;
        other.image_index = 0;
        other.speed = 0;
        path_end();
    }
    if (other.sprite_index == sprEDodgerDodge && other.image_index > 4 && other.image_index <= 8)
    {
        other.sprite_index = sprEDodgerDodge;
        other.image_speed = 0.35;
        other.image_index = 5;
        other.speed = 0;
        path_end();
    }
}
