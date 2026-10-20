draw_sprite_ext(asset_get_index("sprMasks" + string(global.IgelEmotions)), global.IgelEmotionsimageindex, x + maddx + 1, y + maddy + 1, image_xscale, image_yscale, dir + global.PShaking, c_black, 0.25);
draw_sprite_ext(asset_get_index("sprMasks" + string(global.IgelEmotions)), global.IgelEmotionsimageindex, x + maddx, y + maddy, image_xscale, image_yscale, dir + global.PShaking, image_blend, image_alpha);
d3d_set_fog(true, merge_color(merge_color(merge_color(c_lime, c_green, 0.75), c_lime, 0.5 + lengthdir_x(0.5, global.flicker * 8)), merge_color(merge_color(c_red, c_maroon, 0.75), c_red, 0.5 + lengthdir_x(0.5, global.flicker * 8)), global.GlowSkippy), 0, 0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(asset_get_index("sprMasks" + string(global.IgelEmotions)), global.IgelEmotionsimageindex, x + maddx, y + maddy, image_xscale, image_yscale, dir + global.PShaking, image_blend, global.GlowSkippy - (global.GlowSkippy / 1.5) - global.GlowSkippyEnd);
d3d_set_fog(false, c_black, 0, 0);
if (sprite_exists(asset_get_index("sprMasks" + string(global.IgelEmotions) + "Glow")) && global.powerIgel == 1)
{
    draw_set_alpha(clamp(global.colorEyes / 28, 0, 0.25));
    draw_circle_colour(x + maddx, y + maddy, (image_xscale * 10) + random(1), merge_color(c_black, merge_color(merge_color(merge_color(c_lime, c_green, 0.75), c_lime, abs(lengthdir_x(1, global.colorEyes))), merge_color(merge_color(c_red, c_maroon, 0.75), c_red, abs(lengthdir_x(1, global.colorEyes))), global.GlowSkippy), image_alpha), c_black, 0);
    draw_circle_colour(x + maddx, y + maddy, (image_xscale * 4) + random(1), merge_color(c_black, merge_color(c_white, c_ltgray, 0.5), image_alpha), c_black, 0);
    draw_set_alpha(1);
    i = 0;
    repeat (4)
    {
        draw_sprite_ext(asset_get_index("sprMasks" + string(global.IgelEmotions) + "Glow"), global.IgelEmotionsimageindex, x + maddx + i, y + maddy, image_xscale, image_yscale, dir, merge_color(merge_color(merge_color(c_lime, c_green, 0.75), c_lime, abs(lengthdir_x(1, global.colorEyes))), merge_color(merge_color(c_red, c_maroon, 0.75), c_red, abs(lengthdir_x(1, global.colorEyes))), global.GlowSkippy), clamp(global.colorEyes / 28, 0, 1) - 0.75 - (i / 2));
        draw_sprite_ext(asset_get_index("sprMasks" + string(global.IgelEmotions) + "Glow"), global.IgelEmotionsimageindex, (x + maddx) - i, y + maddy, image_xscale, image_yscale, dir, merge_color(merge_color(merge_color(c_lime, c_green, 0.75), c_lime, abs(lengthdir_x(1, global.colorEyes))), merge_color(merge_color(c_red, c_maroon, 0.75), c_red, abs(lengthdir_x(1, global.colorEyes))), global.GlowSkippy), clamp(global.colorEyes / 28, 0, 1) - 0.75 - (i / 2));
        draw_sprite_ext(asset_get_index("sprMasks" + string(global.IgelEmotions) + "Glow"), global.IgelEmotionsimageindex, x + maddx, y + maddy + i, image_xscale, image_yscale, dir, merge_color(merge_color(merge_color(c_lime, c_green, 0.75), c_lime, abs(lengthdir_x(1, global.colorEyes))), merge_color(merge_color(c_red, c_maroon, 0.75), c_red, abs(lengthdir_x(1, global.colorEyes))), global.GlowSkippy), clamp(global.colorEyes / 28, 0, 1) - 0.75 - (i / 2));
        draw_sprite_ext(asset_get_index("sprMasks" + string(global.IgelEmotions) + "Glow"), global.IgelEmotionsimageindex, x + maddx, (y + maddy) - i, image_xscale, image_yscale, dir, merge_color(merge_color(merge_color(c_lime, c_green, 0.75), c_lime, abs(lengthdir_x(1, global.colorEyes))), merge_color(merge_color(c_red, c_maroon, 0.75), c_red, abs(lengthdir_x(1, global.colorEyes))), global.GlowSkippy), clamp(global.colorEyes / 28, 0, 1) - 0.75 - (i / 2));
        i += 0.5;
    }
    if (persistent != true)
    {
        my_id = instance_create(x + maddx, y + maddy, objTrail);
        my_id.sprite_index = asset_get_index("sprMasks" + string(global.IgelEmotions) + "Glow");
        my_id.direction = dir + lengthdir_x(3, global.colorEyes * 12);
        my_id.speed = -1 - random(0.5);
        my_id.image_angle = my_id.direction;
        my_id.image_index = global.IgelEmotionsimageindex;
        my_id.image_alpha = clamp(((global.colorEyes / 48) - lengthdir_x(0.15, global.colorEyes * 8)) / 64, 0, 1);
        my_id.image_blend = merge_color(merge_color(merge_color(c_lime, c_green, 0.75), c_lime, abs(lengthdir_x(1, global.colorEyes))), merge_color(merge_color(c_red, c_maroon, 0.75), c_red, abs(lengthdir_x(1, global.colorEyes))), global.GlowSkippy);
        my_id.image_speed = 0;
        global.colorEyes += 0.5;
    }
}
draw_set_blend_mode(bm_normal);
