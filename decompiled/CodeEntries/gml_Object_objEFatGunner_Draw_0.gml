if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
if (sprite_index == sprEFatGunDie || scrIsSearching(sprite_index) || speed < 0.5)
{
    nothing = 1;
}
if (sprite_index != sprEFatGunAttackMelee && sprite_index != sprEFatGunAttack && sprite_index != sprEFatGunReload && sprite_index != sprEFatGunDie)
{
    draw_sprite_ext(sprEFatLegs, image_index * 2, x + 1, y + 1, image_xscale, image_yscale, direction, c_black, 0.5);
    draw_sprite_ext(sprEFatLegs, image_index * 2, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);
}
else if (speed > 0)
{
    draw_sprite_ext(sprEFatLegs, floor((image_index1 * speed) / 3), x + 1, y + 1, image_xscale, image_yscale, direction, c_black, 0.5);
    draw_sprite_ext(sprEFatLegs, floor((image_index1 * speed) / 3), x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, direction, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);
shader_reset();
