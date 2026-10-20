if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_furniture);
}
draw_self();
if (global.firealarmer == 0 && global.hardmode == 1 && room != rmPoliceHQFloor2)
{
    if (light > 0)
    {
        light -= 1;
    }
    draw_set_blend_mode(bm_add);
    draw_circle_color(x, y - 5, 12 + random(6) + light, make_color_hsv(0, 0, 30), c_black, 0);
    draw_set_blend_mode(bm_normal);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_black, 0.5);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.1 + lengthdir_x(0.1, dir));
    d3d_set_fog(false, c_black, 0, 0);
    dir += 4;
}
shader_reset();
