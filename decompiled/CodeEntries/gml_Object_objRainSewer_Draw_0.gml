draw_set_blend_mode(bm_add);
cam_x = view_xview[0] + offset_x;
cam_y = view_yview[0] + offset_y;
cam_w = view_wview[0];
cam_h = view_hview[0];
center_x = cam_x + (cam_w / 2);
center_y = cam_y + (cam_h / 2);
number = image_speed;
image_index = 0;
for (i = 0; i < max_raindrops; i++)
{
    if (raindrop_active[i] && raindrop_x[i] >= cam_x && raindrop_x[i] <= (cam_x + cam_w) && raindrop_y[i] >= cam_y && raindrop_y[i] <= (cam_y + cam_h))
    {
        center_x = cam_x + (cam_w / 2) + (offset_x * 2);
        center_y = cam_y + (cam_h / 2) + offset_y;
        dist = point_distance(center_x, center_y, raindrop_x[i], raindrop_y[i]);
        dir = point_direction(center_x, center_y, raindrop_x[i], raindrop_y[i]);
        offset_factor = 0.005;
        angle_offset = point_direction(0, 0, offset_x * 2, offset_y) * offset_factor;
        dir += angle_offset;
        draw_line_width_color(raindrop_x[i] + lengthdir_x(raindrop_height[i] * dist * 0.005, dir), raindrop_y[i] + lengthdir_y(raindrop_height[i] * dist * 0.005, dir), raindrop_x[i] + lengthdir_x((raindrop_height[i] + 10) * dist * 0.005, dir), raindrop_y[i] + lengthdir_y((raindrop_height[i] + 10) * dist * 0.005, dir), 0.8 + random(0.2), merge_color(c_gray, c_green, 0.5), merge_color(c_dkgray, c_green, 0.5));
    }
}
for (i = 0; i < max_splashes; i++)
{
    if (splash_active[i])
    {
        splash_draw_x = splash_x[i];
        splash_draw_y = splash_y[i];
        if (splash_draw_x >= cam_x && splash_draw_x <= (cam_x + cam_w) && splash_draw_y >= cam_y && splash_draw_y <= (cam_y + cam_h))
        {
            draw_sprite_ext(sprRainHit, floor(splash_frame[i]), splash_draw_x, splash_draw_y, 1, 1, splash_angle[i], c_green, 0.7);
        }
    }
}
draw_set_blend_mode(bm_normal);
