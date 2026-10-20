global.done = 0;
with (objWallBrickH)
{
    sprite_index = sprSewerWallH;
}
with (objWallBrickV)
{
    sprite_index = sprSewerWallV;
}
if (global.hardmode == 0)
{
    sxeasy_play(global.SewerAlligator);
}
