draw_set_color(c_white);
draw_set_font(fntDate);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (mode == "Mask Coord")
{
    draw_text(x - 75, y - 30, "mode:" + mode);
    draw_text(x - 75, y - 20, "image_index:" + string(image_index));
    draw_text(x - 75, y - 10, "mask x:" + string(d_maskx));
    draw_text(x - 75, y + 5, "mask y:" + string(d_masky));
    draw_text(x - 75, y + 15, "mask angle:" + string(d_maskangle));
    draw_sprite_ext(sprMaskDebug, maskindex, x + d_maskx, y + d_masky, image_xscale, image_yscale, d_maskangle, image_blend, image_alpha);
    image_angle = 0;
}
else if (mode == "Origin Set")
{
    draw_sprite_ext(sprCursor, 4, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_text(x - 75, y - 30, "mode:" + mode);
    draw_text(x - 75, y - 20, "rotationspeed:" + string(rotationspeed));
    draw_text(x - 75, y - 10, "origin x:" + string(originx));
    draw_text(x - 75, y + 5, "origin y:" + string(originy));
    if (rotationspeed == 0)
    {
        image_angle = 0;
    }
    image_angle += rotationspeed;
}
if (mode == "Animation")
{
    draw_text(x - 75, y - 30, "mode:" + mode);
    draw_text(x - 75, y - 20, "image_index:" + string(image_index));
    draw_text(x - 75, y - 10, "image_speed:" + string(image_speed));
    draw_sprite_ext(sprMaskDebug, 1, x + maskx[floor(image_index)], y + masky[floor(image_index)], image_xscale, image_yscale, maskangle[floor(image_index)], image_blend, image_alpha);
    image_angle = 0;
}
