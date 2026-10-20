if (sprite_index == sprBoss2Walk)
{
    sprite_index = sprMCBikerDodge;
    image_speed = 0.25;
    image_index = 0;
    speed = 0;
    path_speed = 0;
}
if (sprite_index == sprMCBikerDodge && image_index > 3 && image_index <= 10)
{
    sprite_index = sprMCBikerDodge;
    image_speed = 0.25;
    image_index = 4;
    speed = 0;
    path_speed = 0;
}
if (sprite_index == sprMCBikerDodge && image_index > 10)
{
    sprite_index = sprMCBikerDodge;
    image_speed = 0.25;
    image_index = 2;
    speed = 0;
    path_speed = 0;
}
