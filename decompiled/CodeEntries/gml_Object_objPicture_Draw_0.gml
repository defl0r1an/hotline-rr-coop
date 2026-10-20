if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
draw_sprite_ext(sprite_index, image_index, x, y + add_y, 1, 1, image_angle, image_blend, image_alpha);
shader_reset();
if (objEffector.fade == 1)
{
    add_y -= 1;
    objEffector.amount += 8;
}
