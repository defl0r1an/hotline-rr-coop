if (global.hardmode == 0 || global.hardmodemasks[13] == 1)
{
    instance_destroy();
}
else
{
    sprite_index = sprMasksDropFrontHard;
    image_index = 13;
}
