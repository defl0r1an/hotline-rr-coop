if (global.maskindex == 26 && global.maskon == 1)
{
    shader_set(shd_russell_player);
}
shake = lerp(shake, clamp(engine - 0.25, 0, 1), 0.05);
alpha[0] = 0.5;
alpha[1] = 1;
blend[0] = 0;
blend[1] = 16777215;
offset[0] = 1;
offset[1] = 0;
weapondir = point_direction(0, 0, (-39 + change) - weaponmove, 1) + image_angle;
dist = point_distance(0, 0, (-39 + change) - weaponmove, 1);
weaponx = x + lengthdir_x(dist, weapondir);
weapony = y + lengthdir_y(dist, weapondir);
temp_shake = random_range(-shake, shake);
for (i = 0; i < 2; i++)
{
    if (sprite_index != sprGolfCart)
    {
        draw_sprite_ext(asset_get_index("sprCarBottom" + thrashed), bottomindex, x + offset[i] + temp_shake, y + offset[i] + temp_shake, image_xscale, image_yscale, image_angle, blend[i], alpha[i]);
    }
    if (weaponindex != -1 && global.maskindex == 1 && global.maskon == 1)
    {
        draw_set_blend_mode(bm_add);
        draw_circle_color(weaponx, weapony, light + random(light / 2), make_color_hsv(0, 0, 30), c_black, 0);
        draw_set_blend_mode(bm_normal);
        draw_sprite_ext(sprWeapons, weaponindex, x + lengthdir_x(dist, weapondir - 1), y + lengthdir_y(dist, weapondir - 1), image_xscale, image_yscale, (image_angle - 90) + weaponangle, c_black, 0.5);
        draw_sprite_ext(sprWeapons, weaponindex, weaponx, weapony, image_xscale, image_yscale, (image_angle - 90) + weaponangle, blend[i], alpha[i]);
        d3d_set_fog(true, c_white, 0, 0);
        draw_sprite_ext(sprWeapons, weaponindex, weaponx, weapony, image_xscale, image_yscale, (image_angle - 90) + weaponangle, blend[i], 0.1 + lengthdir_x(0.1, weaponfog));
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (sprite_index != sprGolfCart)
    {
        draw_sprite_ext(asset_get_index("sprPlayerCarTrunk" + thrashed), 0, x + offset[i] + temp_shake, y + offset[i] + temp_shake, image_xscale, image_yscale, image_angle, c_black, shadow);
        draw_sprite_ext(asset_get_index("sprPlayerCarTrunk" + thrashed), trunkindex, x + offset[i] + temp_shake, y + offset[i] + temp_shake, image_xscale, image_yscale, image_angle, blend[i], alpha[i]);
    }
    draw_sprite_ext(sprite_index, image_index, x + offset[i] + temp_shake, y + offset[i] + temp_shake, image_xscale, image_yscale, image_angle, blend[i], alpha[i]);
}
shader_reset();
