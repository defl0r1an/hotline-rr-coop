if (global.maskindex == 26 && global.maskon == 1)
{
    image_blend = c_gray;
}
else
{
    image_blend = merge_color(c_white, c_yellow, random(1));
}
alpha -= 0.03;
startx += lengthdir_x(speed / 1.6, direction);
starty += lengthdir_y(speed / 1.6, direction);
