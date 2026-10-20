xx += 0.45;
xxx += 0.25;
draw_set_blend_mode(bm_add);
color1 = merge_color(c_orange, c_red, 0.5 + lengthdir_x(0.5, dir));
color2 = merge_color(c_green, c_lime, 0.5 + lengthdir_x(0.5, dir));
dir += 0.35;
if (global.hardmode == 1)
{
    draw_sprite_tiled_ext(sprite_index, image_index, xxx, y, 1, 1, merge_color(c_black, color1, amount), 0.175);
    draw_sprite_tiled_ext(sprite_index, image_index, xx, y, 1, 1, merge_color(c_black, color2, amount), 0.275);
}
else
{
    draw_sprite_tiled_ext(sprite_index, image_index, xxx, y, 1, 1, merge_color(c_black, color1, amount), 0.075);
    draw_sprite_tiled_ext(sprite_index, image_index, xx, y, 1, 1, merge_color(c_black, color2, amount), 0.175);
}
draw_set_blend_mode(bm_normal);
amount = clamp(lengthdir_x(0.5, dir), 0.5, 1);
