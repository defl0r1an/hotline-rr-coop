if (sprite_index == sprBikerTalk || sprite_index == sprBikerGetUpEnd || (sprite_index == sprBikerGetUp && image_index > 20))
{
    draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
