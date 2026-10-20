if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_wall);
}
draw_sprite_ext(sprite_index, image_index, x, y + 2, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_set_blend_mode(bm_subtract);
if (instance_exists(objPlayer))
{
    global.myy = objPlayer.y * 0.1;
}
while (global.myy > 31)
{
    global.myy -= 31;
}
scrDrawSpriteAsVertex(1019, x + 2, y + 3, 28, 2, 0, global.myy, 16777215);
draw_set_blend_mode(bm_normal);
shader_reset();
