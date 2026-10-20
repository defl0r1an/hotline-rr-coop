if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
draw_sprite_ext(bottom, hurtindex, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(bottom, hurtindex, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();
if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (hurtindex < targetindex)
{
    hurtindex += 0.25;
}
if (image_index > 0)
{
    image_index -= 0.5;
}
if (global.maskon == 1)
{
    scrDrawMask(1);
}
if (sprite_index == sprPBatKill || sprite_index == sprPBashBoss2)
{
    draw_sprite_ext(sprPBatKillArms, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (sprite_index == sprPClubKill)
{
    draw_sprite_ext(sprPClubKillArms, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (sprite_index == sprPPipeKill)
{
    draw_sprite_ext(sprPPipeKillArms, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (sprite_index == sprPBrickKill)
{
    draw_sprite_ext(sprPBrickKillArms, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (sprite_index == sprPKillPan)
{
    draw_sprite_ext(sprPKillPanArms, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (sprite_index == sprPKillPot)
{
    draw_sprite_ext(sprPKillPotArms, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (sprite_index == sprPNightStickKill)
{
    draw_sprite_ext(sprPNightStickKillArms, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (sprite_index == sprPJacketKillSkateboard2)
{
    draw_sprite_ext(sprPJacketKillSkateboardArms2, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
shader_reset();
