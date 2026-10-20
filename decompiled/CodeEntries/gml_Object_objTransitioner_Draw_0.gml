if (instance_exists(objPlayerMouseHouse) || instance_exists(objPlayerBikerHouse))
{
    if (room == rmSequence13)
    {
        if (global.done == 0)
        {
            exit;
        }
    }
    else
    {
        exit;
    }
}
dir += 8;
if (sprite == 1022 || sprite == 1023 || sprite == 2440)
{
    index = 0;
    if (addx == 1)
    {
        index = 0;
    }
    if (addx == -1)
    {
        index = 2;
    }
    if (addy == 1)
    {
        index = 3;
    }
    if (addy == -1)
    {
        index = 1;
    }
    draw_sprite_ext(sprite, index, x + lengthdir_x(abs(addx) * 3, dir), y + lengthdir_y(abs(addy) * 3, dir), 1, 1, 0, c_white, 1);
    exit;
}
if (addx == -1)
{
    draw_sprite_ext(sprite, dir * 0.0625, x + lengthdir_x(4, dir), y, 1, 1, -90, c_white, 1);
}
if (addx == 1)
{
    draw_sprite_ext(sprite, dir * 0.0625, x + lengthdir_x(4, dir), y, 1, 1, 90, c_white, 1);
}
if (addy == 1)
{
    draw_sprite_ext(sprite, dir * 0.0625, x, y + lengthdir_x(4, dir), 1, 1, 0, c_white, 1);
}
if (addy == -1)
{
    draw_sprite_ext(sprite, dir * 0.0625, x, y + lengthdir_x(4, dir), 1, 1, 180, c_white, 1);
}
