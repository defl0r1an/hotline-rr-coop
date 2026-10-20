if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (open == 0)
{
    draw_sprite_ext(sprSecretSewerGrate, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
shader_reset();
if (!instance_exists(objPlayerMouse) || global.done == 0)
{
    exit;
}
if (enter == 0)
{
    if (objPlayer.sprite_index == sprPWalkCrowbar || objPlayer.sprite_index == sprPAttackCrowbar)
    {
        if (global.maskindex == 26 && global.maskon == 1)
        {
            draw_sprite_ext(sprArrowHLM1, 0, x, y - 20 - lengthdir_x(3, dir), image_xscale, image_yscale, 0, image_blend, image_alpha);
        }
        else
        {
            draw_sprite_ext(sprArrow, 0, x, y - 20 - lengthdir_x(3, dir), image_xscale, image_yscale, 0, image_blend, image_alpha);
        }
        dir += 4;
    }
}
