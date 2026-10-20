if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
glow = random(1);
shake1 = random_range(shake, -shake);
colorGlow = merge_color(c_black, merge_color(merge_color(color0, color1, GlowSkippy), make_color_hsv((current_time / 12) % 255, 255, 255), random(1)), glow);
draw_set_blend_mode(bm_add);
draw_set_alpha(0.5);
draw_circle_colour(x + shake1, y + shake1, (10 + (0.1 * speed)) - ((1 - glow) * 10), colorGlow, c_black, 0);
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale * left, angle + shake1, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x + shake1, y + shake1, image_xscale, image_yscale * left, angle + shake1, image_blend, image_alpha);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x + shake1, y + shake1, image_xscale, image_yscale * left, angle + shake1, colorGlow, 0.75);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprThrowWeaponsGlow, image_index, x + shake1, y + shake1, image_xscale, image_yscale * left, angle + shake1, colorGlow, image_alpha);
draw_set_blend_mode(bm_add);
i = 0;
repeat (8)
{
    draw_sprite_ext(sprThrowWeaponsGlow, image_index, x + i + shake1, y + shake1, image_xscale, image_yscale * left, angle + shake1, colorGlow, 0.75 - (i / 4));
    draw_sprite_ext(sprThrowWeaponsGlow, image_index, (x - i) + shake1, y + shake1, image_xscale, image_yscale * left, angle + shake1, colorGlow, 0.75 - (i / 4));
    draw_sprite_ext(sprThrowWeaponsGlow, image_index, x + shake1, y + i + shake1, image_xscale, image_yscale * left, angle + shake1, colorGlow, 0.75 - (i / 4));
    draw_sprite_ext(sprThrowWeaponsGlow, image_index, x + shake1, (y - i) + shake1, image_xscale, image_yscale * left, angle + shake1, colorGlow, 0.75 - (i / 4));
    i += 1;
}
draw_set_blend_mode(bm_normal);
shader_reset();
