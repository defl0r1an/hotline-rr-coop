if (global.maskindex == 26 && global.maskon == 1)
{
    image_blend = merge_color(c_white, merge_color(c_gray, c_dkgray, random(1)), random(1));
}
else
{
    image_blend = merge_color(c_white, merge_color(c_yellow, c_orange, random(1)), random(1));
}
