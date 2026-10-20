if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
if (speed > 0 && sprite_index != sprBodyguardKnockedOutTKnife && sprite_index != sprBodyguardGetUp)
{
    draw_sprite_ext(sprBodyguardLegs, legindex, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, direction, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);
shader_reset();
