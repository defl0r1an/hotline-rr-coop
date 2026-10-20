if (global.hardmode == 0)
{
    if (global.level != 132 && global.level != 135 && global.level != 148 && global.level != 128)
    {
        color2 = merge_color(c_black, merge_color(merge_color(c_orange, c_red, 0.5), c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2)), 0.4 - lengthdir_x(0.1, dir * 2));
        color1 = merge_color(c_black, merge_color(c_purple, c_navy, 0.5 + lengthdir_x(0.5, dir * 2)), 0.2);
    }
    if (global.level == 128 && global.level != 132 && global.level != 135 && global.level != 148)
    {
        color2 = merge_color(c_black, merge_color(merge_color(c_dkgray, c_navy, 0.5), c_dkgray, 0.5 + lengthdir_x(0.5, dir * 2)), 0.4 - lengthdir_x(0.1, dir * 2));
        color1 = merge_color(c_black, merge_color(c_purple, c_navy, 0.5 + lengthdir_x(0.5, dir * 2)), 0.2);
    }
    if (global.level == 132 || global.level == 135 || global.level == 148)
    {
        color2 = merge_color(c_black, merge_color(merge_color(c_maroon, c_red, 0.5), c_red, 0.5 + lengthdir_x(0.5, dir * 2)), 0.4 - lengthdir_x(0.1, dir * 2));
        color1 = merge_color(c_black, merge_color(c_purple, c_navy, 0.5 + lengthdir_x(0.5, dir * 2)), 0.2);
    }
    if (global.level == 163)
    {
        color2 = merge_color(c_black, merge_color(merge_color(c_orange, c_yellow, 0.5), c_orange, 0.5 + lengthdir_x(0.5, dir * 2)), 0.4 - lengthdir_x(0.1, dir * 2));
        color1 = merge_color(c_black, merge_color(c_purple, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2)), 0.2);
    }
}
else
{
    if (global.level != 132 && global.level != 135 && global.level != 148 && global.level != 128)
    {
        color2 = merge_color(c_black, merge_color(merge_color(c_orange, c_red, 0.5), c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2)), 0.2);
        color1 = merge_color(c_black, merge_color(c_purple, c_navy, 0.5 + lengthdir_x(0.5, dir * 2)), 0.4 + lengthdir_x(0.1, dir * 2));
    }
    if (global.level == 128 && global.level != 132 && global.level != 135 && global.level != 148)
    {
        color2 = merge_color(c_black, merge_color(c_navy, c_blue, 0.5 + lengthdir_x(0.5, dir * 2)), 0.2);
        color1 = merge_color(c_black, merge_color(c_dkgray, c_navy, 0.5 + lengthdir_x(0.5, dir * 2)), 0.4 + lengthdir_x(0.1, dir * 2));
    }
    if (global.level == 132 || global.level == 135 || global.level == 148)
    {
        color2 = merge_color(c_black, merge_color(merge_color(c_maroon, c_red, 0.5), c_red, 0.5 + lengthdir_x(0.5, dir * 2)), 0.2);
        color1 = merge_color(c_black, merge_color(c_purple, c_navy, 0.5 + lengthdir_x(0.5, dir * 2)), 0.4 + lengthdir_x(0.1, dir * 2));
    }
    if (global.level == 163)
    {
        color2 = merge_color(c_black, merge_color(merge_color(c_orange, c_yellow, 0.5), c_orange, 0.5 + lengthdir_x(0.5, dir * 2)), 0.4 - lengthdir_x(0.1, dir * 2));
        color1 = merge_color(c_black, merge_color(c_purple, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2)), 0.2);
    }
}
