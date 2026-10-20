if (sprite_index == sprVictimDead)
{
    draw_sprite_ext(sprVictimDeadBlood, image_index, x + -32, y + -23, image_xscale, image_yscale, image_angle, image_blend, 1);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
