d3d_set_projection_ortho(0, 0, global.wview, global.hview, 0);
draw_set_alpha(alpha1 - random(0.1));
draw_rectangle(global.wview, global.hview, 0, 0, false);
draw_set_color(c_white);
draw_set_alpha((alpha / 2) - random(0.1));
draw_rectangle(global.wview, global.hview, 0, 0, false);
draw_set_blend_mode(bm_add);
draw_set_alpha(1);
draw_set_circle_precision(10 + random(30));
draw_circle_color(global.wview / 2, global.hview / 2, 380 + (scale * 380), c_black, merge_color(c_black, c_gray, clamp(alpha - random(0.1), 0, 1)), 0);
draw_set_circle_precision(24);
draw_set_blend_mode(bm_max);
draw_sprite_tiled_ext(sprHLM2Noise, current_time / 6, 0, 0, 1, 1, c_white, (alpha / 2) + random(0.25));
draw_set_blend_mode(bm_normal);
d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
alpha1 = lerp(alpha1, 0, 0.2);
scale = lerp(scale, 1, 0.05);
if (alpha > 0)
{
    alpha -= 0.05;
}
else
{
    instance_destroy();
}
