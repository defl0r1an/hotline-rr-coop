if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
if (shake > 0)
{
    shake -= 0.5;
}
if (scrIsSearching(sprite_index))
{
    nothing = 1;
}
else
{
    draw_sprite_ext(sprELegs, image_index * 2, x + 1, y + 1, image_xscale, image_yscale, direction, c_black, 0.5);
    draw_sprite_ext(sprELegs, image_index * 2, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);
}
draw_sprite_ext(sprite_index, image_index, ((x + 1) - shake) + random(shake * 0.5), ((y + 1) - shake) + random(shake * 0.5), image_xscale, image_yscale, direction, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, (x - shake) + random(shake * 0.5), (y - shake) + random(shake * 0.5), image_xscale, image_yscale, direction, image_blend, image_alpha);
shader_reset();
