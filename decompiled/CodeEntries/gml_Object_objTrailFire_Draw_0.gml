draw_set_blend_mode(bm_add);
i = 0;
repeat (4)
{
    d3d_set_fog(true, blend, 0, 0);
    draw_sprite_ext(sprite_index, image_index, x + i, y, image_xscale, image_yscale, image_angle, c_white, image_alpha - 0.5 - (i / 2));
    draw_sprite_ext(sprite_index, image_index, x - i, y, image_xscale, image_yscale, image_angle, c_white, image_alpha - 0.5 - (i / 2));
    draw_sprite_ext(sprite_index, image_index, x, y + i, image_xscale, image_yscale, image_angle, c_white, image_alpha - 0.5 - (i / 2));
    draw_sprite_ext(sprite_index, image_index, x, y - i, image_xscale, image_yscale, image_angle, c_white, image_alpha - 0.5 - (i / 2));
    d3d_set_fog(false, c_black, 0, 0);
    i += 0.5;
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, merge_color(c_white, c_ltgray, 0.5), image_alpha / 4);
draw_set_blend_mode(bm_normal);
