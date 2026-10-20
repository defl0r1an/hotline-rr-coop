if ((instance_exists(objPlayer) && point_distance(x, y, objPlayer.x, objPlayer.y) > 28) || global.maskindex == 1)
{
    draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if ((instance_exists(objPlayer) && point_distance(x, y, objPlayer.x, objPlayer.y) < 28) || global.maskindex == 1)
{
    if (global.maskindex == 1)
    {
        draw_set_blend_mode(bm_add);
        draw_circle_color(x, y, 6 + random(3), make_color_hsv(0, 0, 30), c_black, 0);
        draw_set_blend_mode(bm_normal);
    }
    draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_black, 0.5);
    draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.25 + lengthdir_x(0.25, dir));
    d3d_set_fog(false, c_black, 0, 0);
    dir += 2.5;
}
