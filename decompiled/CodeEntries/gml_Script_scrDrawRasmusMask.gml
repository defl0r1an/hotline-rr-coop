if (global.rasmusEmCd > 0)
{
    global.rasmusEmCd--;
}
if (global.emspr == 2372)
{
    if (global.rasmusEmCd <= 0)
    {
        global.emspr = choose(2366, 2365, 2369, 2888, 2889);
        global.rasmusEmCd = 360 + round(random_range(-60, 60));
        global.rasmusEmIndex = 0;
    }
}
else if (global.rasmusEmIndex <= sprite_get_number(global.emspr))
{
    global.rasmusEmIndex += 0.15;
}
else
{
    global.emspr = 2372;
    global.rasmusEmIndex = 0;
}
if (global.rasmustalk == 1)
{
    global.emspr = 2371;
    global.rasmusEmIndex += 0.15;
}
draw_sprite_ext(global.emspr, global.rasmusEmIndex, x + maddx + 1, y + maddy + 1, image_xscale, image_yscale, dir, c_black, 0.25);
draw_sprite_ext(global.emspr, global.rasmusEmIndex, x + maddx, y + maddy, image_xscale, image_yscale, dir, image_blend, image_alpha);
