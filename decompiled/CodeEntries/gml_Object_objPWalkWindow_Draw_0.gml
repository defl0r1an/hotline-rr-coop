if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
if (sprite_index == last_sprite)
{
    nothing = 1;
}
else
{
    scrUpdateMaskPos(sprite_index);
    last_sprite = sprite_index;
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (sprite_index == sprPWalkLedge)
{
    yscale_old = image_yscale;
    image_yscale = 1;
    scrDrawMask(1);
    image_yscale = yscale_old;
}
if (sprite_index == sprPClimbLedge)
{
    if (room != rmHotel3)
    {
        dir = 0;
        if (image_index >= 2)
        {
            dir = -45;
        }
        if (image_index >= 3)
        {
            dir = -90;
        }
    }
    else
    {
        dir = 180;
        if (image_index >= 2)
        {
            dir = -120;
        }
        if (image_index >= 3)
        {
            dir = -90;
        }
    }
    xscale_old = image_xscale;
    image_xscale = 1;
    scrDrawMaskLedge(0);
    image_xscale = xscale_old;
}
shader_reset();
