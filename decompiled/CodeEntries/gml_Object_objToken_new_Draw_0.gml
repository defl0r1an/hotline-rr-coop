if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
if (instance_exists(objPlayer))
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 32 || global.maskindex == 1)
    {
        draw_set_blend_mode(bm_add);
        if (global.maskindex == 1)
        {
            draw_circle_color(x, y + abs(lengthdir_x(1.5, dir)), 5 + abs(lengthdir_x(2, dir)), merge_color(c_purple, c_black, 0.5), c_black, 0);
        }
        draw_set_blend_mode(bm_normal);
        draw_sprite_ext(sprite_index, image_index, x, y + abs(lengthdir_x(1.5, dir)), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        dir += 4;
    }
    else
    {
        draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
}
else
{
    draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
shader_reset();
