if ((global.hardmode == 1 && (global.maskindex == 2 || global.maskindex == 6)) || instance_exists(objPlayerBiker) || global.maskindex == 27)
{
    draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else
{
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_black, 0.5);
    if (global.maskindex == 26 && global.maskon == 1)
    {
        shader_set(shd_russell_player);
    }
    draw_sprite_ext(sprite_index, image_index, (x - 1) + lengthdir_x(1, dir), (y - 1) + lengthdir_x(1, dir), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    shader_reset();
    draw_set_blend_mode(bm_add);
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Hot"), image_index, (x - 1) + lengthdir_x(1, dir), (y - 1) + lengthdir_x(1, dir), image_xscale, image_yscale, image_angle, merge_color(c_red, c_orange, 0.5), hotalpha);
    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Hot"), image_index, (x - 1) + lengthdir_x(1, dir), (y - 1) + lengthdir_x(1, dir), image_xscale, image_yscale, image_angle, merge_color(c_white, c_ltgray, 0.5), hotalpha / 7);
    draw_set_blend_mode(bm_normal);
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(sprite_index, image_index, (x - 1) + lengthdir_x(1, dir), (y - 1) + lengthdir_x(1, dir), image_xscale, image_yscale, image_angle, image_blend, 0.1 + lengthdir_x(0.1, dir));
    d3d_set_fog(false, c_black, 0, 0);
    dir += 4;
}
shader_reset();
