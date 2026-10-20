if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_wall);
}
draw_sprite_ext(sprite_index, 1, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (weapon == 0)
{
    draw_sprite_ext(sprite_index, 2, x, y, image_xscale, image_yscale, image_angle, c_black, 0.5);
    draw_sprite_ext(sprite_index, 2, x, (y - 1) + lengthdir_x(1, dir), image_xscale, image_yscale, image_angle, image_blend, 1);
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(sprite_index, 2, x, (y - 1) + lengthdir_x(1, dir), image_xscale, image_yscale, image_angle, image_blend, 0.1 + lengthdir_x(0.1, dir));
    d3d_set_fog(false, c_black, 0, 0);
    draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, c_black, 0.5 - (move / 2));
}
if (active == 0)
{
    if (instance_exists(objPlayer) && point_distance(x, y, objPlayer.x, objPlayer.y) < 28)
    {
        draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_black, 0.5);
        draw_sprite_ext(sprite_index, 0, x, y - abs(lengthdir_x(1, dir1)), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        d3d_set_fog(true, c_white, 0, 0);
        draw_sprite_ext(sprite_index, 0, x, y - abs(lengthdir_x(1, dir1)), image_xscale, image_yscale, image_angle, image_blend, 0.1 + lengthdir_x(0.1, dir1));
        d3d_set_fog(false, c_black, 0, 0);
        dir1 += 2.5;
    }
    else
    {
        draw_sprite_ext(sprite_index, 0, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
        draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
}
else
{
    draw_sprite_ext(sprite_index, 0, (x + 1) - (move * 15), (y + 1) - (move * 20), image_xscale, image_yscale, image_angle + (move * 20), c_black, 0.5);
    draw_sprite_ext(sprite_index, 0, x - (move * 15), y - (move * 20), image_xscale, image_yscale, image_angle + (move * 20), image_blend, image_alpha);
}
if (weapon == 0)
{
    draw_set_blend_mode(bm_add);
    draw_circle_color(x, y, 14 + random(7), make_color_hsv(0, 0, 30 - (move * 30)), c_black, 0);
    draw_set_blend_mode(bm_normal);
}
shader_reset();
