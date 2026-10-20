surface_set_target(global.surf1);
draw_clear(make_color_hsv(155, 5 - random(5), 200 + random(5)));
draw_set_blend_mode(bm_subtract);
with (objLight)
{
    if (visible == true)
    {
        draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, radius * (1 + random(0.1)), merge_color(c_black, color, strength * (0.9 + random(0.1))), c_black, 0);
    }
}
with (objDreamPeopleMorgue)
{
    if (sprite_index == sprEWalkUnarmed && visible == true)
    {
        draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, 96 * (1 + random(0.1)), merge_color(c_black, c_red, 1 * (0.9 + random(0.1))), c_black, 0);
    }
}
with (objPlayer)
{
    if (visible == true)
    {
        draw_sprite_ext(sprPWalkHospitalUndeadEyes, image_index, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16, image_xscale, image_yscale, dir, merge_color(c_black, c_white, clamp(alphaundead, 0, 1)), 1);
        draw_sprite_ext(sprPWalkHospitalUndeadEyes, image_index, (x - view_xview[0]) + 16 + 0.5, (y - view_yview[0]) + 16, image_xscale, image_yscale, dir, merge_color(c_black, c_white, clamp(alphaundead - 0.25, 0, 1)), 0.75);
        draw_sprite_ext(sprPWalkHospitalUndeadEyes, image_index, ((x - view_xview[0]) + 16) - 0.5, (y - view_yview[0]) + 16, image_xscale, image_yscale, dir, merge_color(c_black, c_white, clamp(alphaundead - 0.25, 0, 1)), 0.75);
        draw_sprite_ext(sprPWalkHospitalUndeadEyes, image_index, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16 + 0.5, image_xscale, image_yscale, dir, merge_color(c_black, c_white, clamp(alphaundead - 0.25, 0, 1)), 0.75);
        draw_sprite_ext(sprPWalkHospitalUndeadEyes, image_index, (x - view_xview[0]) + 16, ((y - view_yview[0]) + 16) - 0.5, image_xscale, image_yscale, dir, merge_color(c_black, c_white, clamp(alphaundead - 0.25, 0, 1)), 0.75);
    }
}
with (objUndead)
{
    spriteEyes = asset_get_index(sprite_get_name(head) + "Eyes");
    draw_sprite_ext(spriteEyes, headindex, (x - view_xview[0]) + 16 + maddx, (y - view_yview[0]) + 16 + maddy, image_xscale, image_yscale, dir - (shakehead / 4), image_blend, image_alpha);
    draw_sprite_ext(spriteEyes, headindex, (x - view_xview[0]) + 16 + maddx + 0.5, (y - view_yview[0]) + 16 + maddy, image_xscale, image_yscale, dir - (shakehead / 4), image_blend, 0.75);
    draw_sprite_ext(spriteEyes, headindex, ((x - view_xview[0]) + 16 + maddx) - 0.5, (y - view_yview[0]) + 16 + maddy, image_xscale, image_yscale, dir - (shakehead / 4), image_blend, 0.75);
    draw_sprite_ext(spriteEyes, headindex, (x - view_xview[0]) + 16 + maddx, (y - view_yview[0]) + 16 + maddy + 0.5, image_xscale, image_yscale, dir - (shakehead / 4), image_blend, 0.75);
    draw_sprite_ext(spriteEyes, headindex, (x - view_xview[0]) + 16 + maddx, ((y - view_yview[0]) + 16 + maddy) - 0.5, image_xscale, image_yscale, dir - (shakehead / 4), image_blend, 0.75);
}
with (objBoss1Undead)
{
    if (sprite_index == sprBoss1Walk)
    {
        draw_sprite_ext(sprHeadFatUndeadEyes, 1, (x - view_xview[0]) + 16 + maddx, (y - view_yview[0]) + 16 + maddy, image_xscale, image_yscale, image_angle, image_blend, 1);
        draw_sprite_ext(sprHeadFatUndeadEyes, 1, (x - view_xview[0]) + 16 + 0.5 + maddx, (y - view_yview[0]) + 16 + maddy, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprHeadFatUndeadEyes, 1, (((x - view_xview[0]) + 16) - 0.5) + maddx, (y - view_yview[0]) + 16 + maddy, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprHeadFatUndeadEyes, 1, (x - view_xview[0]) + 16 + maddx, (y - view_yview[0]) + 16 + 0.5 + maddy, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprHeadFatUndeadEyes, 1, (x - view_xview[0]) + 16 + maddx, (((y - view_yview[0]) + 16) - 0.5) + maddy, image_xscale, image_yscale, image_angle, image_blend, 0.75);
    }
}
with (objLukeMorgueCutScene)
{
    if (sprite_exists(asset_get_index(sprite_get_name(spriteTruck) + "Eyes")))
    {
        spriteEyes = asset_get_index(sprite_get_name(spriteTruck) + "Eyes");
        draw_sprite_ext(spriteEyes, indexTruck, (xTruck - view_xview[0]) + 16, (yTruck - view_yview[0]) + 16, image_xscale, image_yscale, image_angle + -90, lightTruck, 1);
        draw_sprite_ext(spriteEyes, indexTruck, (xTruck - view_xview[0]) + 16 + 0.5, (yTruck - view_yview[0]) + 16, image_xscale, image_yscale, image_angle + -90, lightTruck, 0.75);
        draw_sprite_ext(spriteEyes, indexTruck, ((xTruck - view_xview[0]) + 16) - 0.5, (yTruck - view_yview[0]) + 16, image_xscale, image_yscale, image_angle + -90, lightTruck, 0.75);
        draw_sprite_ext(spriteEyes, indexTruck, (xTruck - view_xview[0]) + 16, (yTruck - view_yview[0]) + 16 + 0.5, image_xscale, image_yscale, image_angle + -90, lightTruck, 0.75);
        draw_sprite_ext(spriteEyes, indexTruck, (xTruck - view_xview[0]) + 16, ((yTruck - view_yview[0]) + 16) - 0.5, image_xscale, image_yscale, image_angle + -90, lightTruck, 0.75);
    }
}
with (objUndeadLocust)
{
    if (headsprite == 2887 && sprite_index == sprUndeadLocustBody)
    {
        colorEyes = merge_color(c_black, c_white, alphaeyes);
        alphaeyes = 1;
        draw_sprite_ext(sprHeadUndeadLocustEyes, image_index, (x - view_xview[0]) + 16 + lengthdir_x(14, image_angle), (y - view_yview[0]) + 16 + lengthdir_y(14, image_angle), image_xscale, image_yscale, headdir, colorEyes, 1);
        draw_sprite_ext(sprHeadUndeadLocustEyes, image_index, (x - view_xview[0]) + 16 + 0.5 + lengthdir_x(14, image_angle), (y - view_yview[0]) + 16 + lengthdir_y(14, image_angle), image_xscale, image_yscale, headdir, colorEyes, 0.75);
        draw_sprite_ext(sprHeadUndeadLocustEyes, image_index, (((x - view_xview[0]) + 16) - 0.5) + lengthdir_x(14, image_angle), (y - view_yview[0]) + 16 + lengthdir_y(14, image_angle), image_xscale, image_yscale, headdir, colorEyes, 0.75);
        draw_sprite_ext(sprHeadUndeadLocustEyes, image_index, (x - view_xview[0]) + 16 + lengthdir_x(14, image_angle), (y - view_yview[0]) + 16 + 0.5 + lengthdir_y(14, image_angle), image_xscale, image_yscale, headdir, colorEyes, 0.75);
        draw_sprite_ext(sprHeadUndeadLocustEyes, image_index, (x - view_xview[0]) + 16 + lengthdir_x(14, image_angle), (((y - view_yview[0]) + 16) - 0.5) + lengthdir_y(14, image_angle), image_xscale, image_yscale, headdir, colorEyes, 0.75);
    }
    if (sprite_index == sprUndeadLocustStart)
    {
        draw_sprite_ext(sprUndeadLocustStartEyes, image_index, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 1);
        draw_sprite_ext(sprUndeadLocustStartEyes, image_index, (x - view_xview[0]) + 16 + 0.5, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprUndeadLocustStartEyes, image_index, ((x - view_xview[0]) + 16) - 0.5, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprUndeadLocustStartEyes, image_index, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16 + 0.5, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprUndeadLocustStartEyes, image_index, (x - view_xview[0]) + 16, ((y - view_yview[0]) + 16) - 0.5, image_xscale, image_yscale, image_angle, image_blend, 0.75);
    }
}
if (global.Paranormal == 1)
{
    with (objLukeMorgueOpen)
    {
        draw_sprite_ext(sprMorgueDeadBodyEyes, indexDeadBoby, (xTruck - view_xview[0]) + 16, ((yTruck + yFixTruck) - view_yview[0]) + 16, image_xscale, image_yscale, image_angle + -90, image_blend, 1);
        draw_sprite_ext(sprMorgueDeadBodyEyes, indexDeadBoby, (xTruck - view_xview[0]) + 16 + 0.5, ((yTruck + yFixTruck) - view_yview[0]) + 16, image_xscale, image_yscale, image_angle + -90, image_blend, 0.75);
        draw_sprite_ext(sprMorgueDeadBodyEyes, indexDeadBoby, ((xTruck - view_xview[0]) + 16) - 0.5, ((yTruck + yFixTruck) - view_yview[0]) + 16, image_xscale, image_yscale, image_angle + -90, image_blend, 0.75);
        draw_sprite_ext(sprMorgueDeadBodyEyes, indexDeadBoby, (xTruck - view_xview[0]) + 16, ((yTruck + yFixTruck) - view_yview[0]) + 16 + 0.5, image_xscale, image_yscale, image_angle + -90, image_blend, 0.75);
        draw_sprite_ext(sprMorgueDeadBodyEyes, indexDeadBoby, (xTruck - view_xview[0]) + 16, (((yTruck + yFixTruck) - view_yview[0]) + 16) - 0.5, image_xscale, image_yscale, image_angle + -90, image_blend, 0.75);
    }
    with (objVictimUndeadGetUpLean)
    {
        draw_sprite_ext(sprVictimUndeadGetUpLeanEyes, image_index, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 1);
        draw_sprite_ext(sprVictimUndeadGetUpLeanEyes, image_index, (x - view_xview[0]) + 16 + 0.5, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprVictimUndeadGetUpLeanEyes, image_index, ((x - view_xview[0]) + 16) - 0.5, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprVictimUndeadGetUpLeanEyes, image_index, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16 + 0.5, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprVictimUndeadGetUpLeanEyes, image_index, (x - view_xview[0]) + 16, ((y - view_yview[0]) + 16) - 0.5, image_xscale, image_yscale, image_angle, image_blend, 0.75);
    }
    with (objGurneyHospitalDeadBody)
    {
        draw_sprite_ext(sprMorgueDeadBodyEyes, image_index, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 1);
        draw_sprite_ext(sprMorgueDeadBodyEyes, image_index, (x - view_xview[0]) + 16 + 0.5, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprMorgueDeadBodyEyes, image_index, ((x - view_xview[0]) + 16) - 0.5, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprMorgueDeadBodyEyes, image_index, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16 + 0.5, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprMorgueDeadBodyEyes, image_index, (x - view_xview[0]) + 16, ((y - view_yview[0]) + 16) - 0.5, image_xscale, image_yscale, image_angle, image_blend, 0.75);
    }
    with (objCorpseTruckMetalDeadBody)
    {
        draw_sprite_ext(sprMorgueDeadBodyEyes, image_index, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 1);
        draw_sprite_ext(sprMorgueDeadBodyEyes, image_index, (x - view_xview[0]) + 16 + 0.5, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprMorgueDeadBodyEyes, image_index, ((x - view_xview[0]) + 16) - 0.5, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprMorgueDeadBodyEyes, image_index, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16 + 0.5, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprMorgueDeadBodyEyes, image_index, (x - view_xview[0]) + 16, ((y - view_yview[0]) + 16) - 0.5, image_xscale, image_yscale, image_angle, image_blend, 0.75);
    }
    with (objGurneyHospitalDeadBodySpecial)
    {
        draw_sprite_ext(sprGurneyHospitalDeadBodySpecialEyes, image_index, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 1);
        draw_sprite_ext(sprGurneyHospitalDeadBodySpecialEyes, image_index, (x - view_xview[0]) + 16 + 0.5, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprGurneyHospitalDeadBodySpecialEyes, image_index, ((x - view_xview[0]) + 16) - 0.5, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprGurneyHospitalDeadBodySpecialEyes, image_index, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16 + 0.5, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprGurneyHospitalDeadBodySpecialEyes, image_index, (x - view_xview[0]) + 16, ((y - view_yview[0]) + 16) - 0.5, image_xscale, image_yscale, image_angle, image_blend, 0.75);
    }
    with (objGurneyHospitalDeadBody2)
    {
        draw_sprite_ext(sprGurneyHospitalDeadBody2Eyes, image_index, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 1);
        draw_sprite_ext(sprGurneyHospitalDeadBody2Eyes, image_index, (x - view_xview[0]) + 16 + 0.5, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprGurneyHospitalDeadBody2Eyes, image_index, ((x - view_xview[0]) + 16) - 0.5, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprGurneyHospitalDeadBody2Eyes, image_index, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16 + 0.5, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprGurneyHospitalDeadBody2Eyes, image_index, (x - view_xview[0]) + 16, ((y - view_yview[0]) + 16) - 0.5, image_xscale, image_yscale, image_angle, image_blend, 0.75);
    }
    with (objGurneyHospitalDeadBodyFat)
    {
        draw_sprite_ext(sprGurneyHospitalDeadBodyFatEyes, image_index, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 1);
        draw_sprite_ext(sprGurneyHospitalDeadBodyFatEyes, image_index, (x - view_xview[0]) + 16 + 0.5, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprGurneyHospitalDeadBodyFatEyes, image_index, ((x - view_xview[0]) + 16) - 0.5, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprGurneyHospitalDeadBodyFatEyes, image_index, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16 + 0.5, image_xscale, image_yscale, image_angle, image_blend, 0.75);
        draw_sprite_ext(sprGurneyHospitalDeadBodyFatEyes, image_index, (x - view_xview[0]) + 16, ((y - view_yview[0]) + 16) - 0.5, image_xscale, image_yscale, image_angle, image_blend, 0.75);
    }
}
with (objTableGuard)
{
    draw_circle_color((x - view_xview[0]) + 16 + 23, (y - view_yview[0]) + 16 + -5, 3 + random(0.5), merge_color(color0, c_black, 0.05), c_black, 0);
    draw_circle_color((x - view_xview[0]) + 16 + 23, (y - view_yview[0]) + 16 + -5, 7.5 + random(2.5), merge_color(color0, c_black, 0.25), c_black, 0);
    draw_circle_color((x - view_xview[0]) + 16 + 23, (y - view_yview[0]) + 16 + -5, 15 + random(3.5), merge_color(color0, c_black, 0.5), c_black, 0);
    draw_sprite_ext(sprTableGuardLampe, 1, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, color0, 1);
}
with (objPlayer)
{
    if (visible == true)
    {
        draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, 15 + random(0.5), merge_color(merge_color(c_black, c_white, 0.05), c_black, alphaundead), c_black, 0);
        draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, 30 + random(2.5), merge_color(merge_color(c_black, c_white, 0.15), c_black, alphaundead), c_black, 0);
        draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, 60 + random(5), merge_color(c_dkgray, c_black, alphaundead), c_black, 0);
    }
}
with (objMorgueDoor)
{
    draw_sprite_ext(sprMorgueDoorHGlow, image_index, (x - view_xview[0]) + 16, (y - view_yview[0]) + 16, image_xscale, image_yscale, image_angle, image_blend, 1);
}
draw_set_blend_mode(bm_normal);
surface_reset_target();
if (!on)
{
    exit;
}
