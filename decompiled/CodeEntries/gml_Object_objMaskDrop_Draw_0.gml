if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (image_index == 27 && sprite_get_name(scrGetMaskSkin(global.maskindex, global.selectskin[27], "Mask")) == "sprMasksHard")
{
    draw_set_blend_mode_ext(bm_inv_dest_color, bm_inv_src_color);
    draw_circle_color(x, y, 30 + random_range(0.5, -0.5), c_white, c_black, 0);
    draw_set_blend_mode(bm_normal);
}
shader_reset();
