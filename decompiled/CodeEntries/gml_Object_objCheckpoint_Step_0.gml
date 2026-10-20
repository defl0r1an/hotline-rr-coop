if (instance_exists(objLevelComplete))
{
    instance_destroy();
    exit;
}
if (!surface_exists(surface))
{
    surface = surface_create(global.viewwview, global.viewhview);
}
surface_set_target(surface);
draw_clear_alpha(c_black, 0);
i = 0;
repeat (11)
{
    alpha = 1 - (addx * 0.022727272727272728);
    if (global.maskindex == 26 && global.maskon == 1)
    {
        color = merge_color(c_maroon, merge_color(c_red, c_maroon, random(1)), alpha);
    }
    else
    {
        color = merge_color(c_white, merge_color(c_aqua, c_white, random(1)), alpha);
    }
    if (round(random(5)) == 2 && on)
    {
        myx = -1 + random(2);
    }
    else
    {
        myx = 0;
    }
    if (lvisible[i] == 1)
    {
        if (frac(i * 0.5) == 0)
        {
            draw_sprite_part_ext(sprFloorCleared, 0, 0, i, 224, 1, ((global.viewwview / 2) - 110.5) + addx + myx, (global.viewhview / 3) + i + addy[i], 1, 1, color, alpha);
        }
        else
        {
            draw_sprite_part_ext(sprFloorCleared, 0, 0, i, 224, 1, ((global.viewwview / 2) - 110.5 - addx) + myx, (global.viewhview / 3) + i + addy[i], 1, 1, color, alpha);
        }
    }
    i += 1;
}
if (on == 1)
{
    if (addx > 0)
    {
        addx -= 2;
    }
    if (addx == 4)
    {
        blink = 1;
    }
}
else if (addx < 44)
{
    addx += 2;
}
else
{
    instance_destroy();
}
surface_reset_target();
