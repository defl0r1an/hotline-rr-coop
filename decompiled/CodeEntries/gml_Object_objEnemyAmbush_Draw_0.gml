if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
if (shake > 0)
{
    shake -= 0.5;
}
if (shooting == 0)
{
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, direction, c_black, 0.5);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);
}
else
{
    draw_sprite_ext(spritehand, 0, (x - shake) + random(shake * 0.5), (y - shake) + random(shake * 0.5), image_xscale, image_yscale, dir, image_blend, image_alpha);
    draw_sprite_ext(sprEMafiaAmbushBody, 0, x, y, image_xscale, image_yscale, direction, c_black, 0.5);
    draw_sprite_ext(sprEMafiaAmbushBody, 0, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);
}
shader_reset();
