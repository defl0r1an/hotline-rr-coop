d3d_set_projection_ortho(0, 0, global.wview, global.hview, 0);
flicker += 0.25;
if (visiblekaka == 0 || visiblekaka == -1)
{
    d3d_set_projection_ortho(0, 0, global.wview, global.hview, 0);
    draw_sprite_tiled_ext(sprHLM2Noise, flicker, flicker + (shake * 5), shake * 5, 0.5, 0.5, merge_color(make_color_hsv((current_time / 12) % 255, 255, 255), c_orange, shake), 0.15 + random(shake - 0.75));
    d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
}
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
