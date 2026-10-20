if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_enemy);
}
if (light > 0)
{
    light -= 1;
}
draw_set_blend_mode(bm_add);
draw_circle_color(x, y, 48 + random(6) + light, make_color_hsv(0, 0, 30), c_black, 0);
draw_set_blend_mode(bm_normal);
if (sprite_index != sprJonesStartChainsaw)
{
    draw_sprite_ext(sprJonesLegs, image_index * 2, x + 1, y + 1, image_xscale, image_yscale, direction, c_black, 0.5);
    draw_sprite_ext(sprJonesLegs, image_index * 2, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, direction, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprJonesWalkChainsawEyes, image_index, x, y, image_xscale, image_yscale, direction, image_blend, alphaEyes);
if (sprite_index == sprJonesSprintChainsaw)
{
    draw_sprite_ext(sprPSprintChainsawHot, image_index, x, y, image_xscale, image_yscale, direction, merge_color(c_red, c_orange, 0.5), HotWeaponAlpha);
    draw_sprite_ext(sprPSprintChainsawHot, image_index, x, y, image_xscale, image_yscale, direction, merge_color(c_white, c_ltgray, 0.5), HotWeaponAlpha / 9);
    HotWeaponSwitch = 1;
    HotWeaponSpeed = 0.0075;
}
else
{
    HotWeaponSwitch = 0;
}
HotWeaponAlpha = lerp(HotWeaponAlpha, HotWeaponSwitch, HotWeaponSpeed);
draw_set_blend_mode(bm_normal);
shader_reset();
if (sound == 0)
{
    audio_play_sound(sndChainsawStart, 100, false);
    sound = -1;
}
