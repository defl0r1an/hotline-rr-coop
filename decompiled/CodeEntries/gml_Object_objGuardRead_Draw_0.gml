draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, direction, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);
if (state == "Look" && image_index >= 3)
{
    draw_sprite_ext(sprGuardHead, image_index, x + lengthdir_x(-8, direction), y + lengthdir_y(-8, direction), image_xscale, image_yscale, headdir, image_blend, image_alpha);
}
draw_set_color(c_white);
