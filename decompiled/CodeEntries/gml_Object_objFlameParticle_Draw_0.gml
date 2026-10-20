if (global.maskindex == 26 && global.maskon == 1)
{
    image_blend = merge_color(c_white, c_gray, random((image_index * 1) / images));
    draw_set_blend_mode(bm_add);
    i = 0;
    repeat (3)
    {
        draw_sprite_ext(sprite_index, image_index - (i / 2), x, y, image_xscale + (i / 4), image_yscale + (i / 4), image_angle, merge_colour(c_gray, c_white, i / 3), 0.75 - (i / 3));
        i += 1;
    }
    draw_set_blend_mode(bm_normal);
}
else
{
    image_blend = merge_color(c_white, c_yellow, random((image_index * 1) / images));
    draw_set_blend_mode(bm_add);
    i = 0;
    repeat (3)
    {
        draw_sprite_ext(sprite_index, image_index - (i / 2), x, y, image_xscale + (i / 4), image_yscale + (i / 4), image_angle, merge_colour(c_orange, c_red, i / 3), 0.75 - (i / 3));
        i += 1;
    }
    draw_set_blend_mode(bm_normal);
}
draw_self();
