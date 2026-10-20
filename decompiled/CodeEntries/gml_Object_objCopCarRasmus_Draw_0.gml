draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (taken == 0)
{
    draw_set_blend_mode(bm_add);
    draw_circle_color(x - 42, y + 1, light + random(light / 2), make_color_hsv(0, 0, 20), c_black, 0);
    draw_set_blend_mode(bm_normal);
    draw_sprite_ext(sprKeycardPolice, 0, x - 42, y + 1, image_xscale, image_yscale, dirKeycard, c_black, 0.5);
    draw_sprite_ext(sprKeycardPolice, 0, x - 42, (y + 1) - moveinst, image_xscale, image_yscale, dirKeycard, image_blend, 1);
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(sprKeycardPolice, 0, x - 42, (y + 1) - moveinst, image_xscale, image_yscale, dirKeycard, image_blend, 0.1 + lengthdir_x(0.1, moveinst));
    d3d_set_fog(false, c_black, 0, 0);
}
draw_sprite_ext(sprPoliceCarTrunk, 0, x - 1, y, image_xscale, image_yscale, image_angle, c_black, shadow);
draw_sprite_ext(sprPoliceCarTrunk, near, x - 1, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
