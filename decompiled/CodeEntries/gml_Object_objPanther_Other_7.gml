if (sprite_index == sprPantherSit)
{
    image_speed = 0;
    exit;
}
if (sprite_index == sprPantherHitback)
{
    state = 1;
    sprite_index = sprPantherRun;
    exit;
}
