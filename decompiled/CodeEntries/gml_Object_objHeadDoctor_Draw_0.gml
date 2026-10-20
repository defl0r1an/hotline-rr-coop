draw_set_blend_mode(bm_add);
draw_circle_color(x, y, 48 + random(6), make_color_hsv(0, 0, 30), c_black, 0);
draw_set_blend_mode(bm_normal);
if (sprite_index == sprHeadDoctorWalk || sprite_index == sprHeadDoctorWalkDocument)
{
    legindex = image_index * 2;
}
else
{
    legindex = 0;
}
draw_sprite_ext(sprHeadDoctorLegs, legindex, x + 1, y + 1, image_xscale, image_yscale, direction, c_black, 0.5);
draw_sprite_ext(sprHeadDoctorLegs, legindex, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);
if (state == "Typing" || state == "EndTyping" || state == "CaughtTyping")
{
    draw_sprite_ext(sprHospitalArmchair, image_index, (x + 1) - 7, y + 1, image_xscale, image_yscale, direction + 90, c_black, 0.5);
    draw_sprite_ext(sprHospitalArmchair, image_index, x - 7, y, image_xscale, image_yscale, direction + 90, image_blend, image_alpha);
    if (state == "Typing" || state == "CaughtTyping")
    {
        draw_sprite_ext(sprHeadDoctorLegsSit, image_index, x + 1, y + 1, image_xscale, image_yscale, direction, c_black, 0.5);
        draw_sprite_ext(sprHeadDoctorLegsSit, image_index, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);
        draw_sprite_ext(sprHeadDoctorTable, 0, x + 11, y + 3, image_xscale, image_yscale, -90, c_black, 0.5);
        draw_sprite_ext(sprHeadDoctorTable, 0, x + 10, y + 2, image_xscale, image_yscale, -90, image_blend, image_alpha);
    }
}
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, direction, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, direction, image_blend, image_alpha);
if (state == "CaughtTyping")
{
    headdir = scrRotate(headdir, point_direction(x, y, objPlayer.x, objPlayer.y), 10);
    draw_sprite_ext(sprHeadDoctorHeadTrue, 0, x + -3, y + 1, image_xscale, image_yscale, headdir, image_blend, image_alpha);
}
draw_set_color(c_black);
draw_set_font(fntDate);
draw_set_color(c_white);
