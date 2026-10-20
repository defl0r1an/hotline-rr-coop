d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
if ((room == rmHouse3Downstairs || room == rmHouse3Basement || room == rmHouse3Upstairs) && !(global.maskindex == 14 && global.maskon))
{
    if (global.maskindex == 26 && global.maskon == 1)
    {
        colorshit = merge_color(merge_color(make_colour_rgb(25, 255, 163), c_black, 0.65), merge_color(c_ltgray, c_black, 0.65), 0.5 + lengthdir_x(0.5, cdir * 4.5));
    }
    else
    {
        colorshit = merge_color(merge_color(make_colour_rgb(25, 255, 163), c_black, 0.65), merge_color(make_colour_rgb(236, 92, 37), c_black, 0.65), 0.5 + lengthdir_x(0.5, cdir * 4.5));
    }
    draw_set_blend_mode(bm_subtract);
    draw_rectangle_color(0, 0, view_wview[0], view_hview[0], colorshit, colorshit, colorshit, colorshit, 0);
    draw_rectangle_color(0, view_hview[0], view_wview[0], view_hview[0], colorshit, colorshit, colorshit, colorshit, 0);
    draw_set_blend_mode(bm_normal);
}
draw_set_blend_mode(bm_subtract);
if (!instance_exists(objFinalDialogue) && !instance_exists(objFinalDialogue2) && !instance_exists(objBackgroundColorClear))
{
    if (instance_exists(objPlayerBiker) || instance_exists(objPlayerBikerHouse) || instance_exists(objMCStompKill) || instance_exists(objBikerTakePigMask) || instance_exists(objMCChopKill) || instance_exists(objBikerKillFat) || instance_exists(objMCKnifeKill) || instance_exists(objMCBartender) || instance_exists(objBartenderDeath) || instance_exists(objPlayerBikerHack) || instance_exists(objBikerSushi) || instance_exists(objBikerClimbDown) || instance_exists(objBikerClimbUp) || instance_exists(objBikerKillJonatan) || instance_exists(objBikerKnocked) || instance_exists(objPlayerBikerKick) || instance_exists(objBikerHeadKick) || (instance_exists(objMCBike) && (objMCBike.sprite_index == sprMCGetOnBike || objMCBike.sprite_index == sprBikerGetOnBikeWounded || objMCBike.sprite_index == sprBikerGetOnBikeUnmasked)) || (instance_exists(objPlayerDead) && (objPlayerDead.sprite_index == sprMCBackBlunt || objPlayerDead.sprite_index == sprMCFrontBlunt || objPlayerDead.sprite_index == sprMCBackCut || objPlayerDead.sprite_index == sprMCFrontMachinegun || objPlayerDead.sprite_index == sprMCBackMachinegun || objPlayerDead.sprite_index == sprMCFrontShotgun || objPlayerDead.sprite_index == sprMCBackShotgun || objPlayerDead.sprite_index == sprMCDeadDog)))
    {
        if (global.hardmode == 0)
        {
            draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 890 + random(24), c_black, make_colour_rgb(77, 250, 163), 0);
            draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 840 + random(24), make_colour_rgb(0, 28, 32), merge_color(c_ltgray, make_colour_rgb(0, 32, 47), 0.98), 0);
        }
        else
        {
            draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 520 + random(24), merge_color(make_colour_rgb(64, 255, 207), merge_color(c_black, c_ltgray, 0.02), 0.98), make_colour_rgb(64, 255, 207), 0);
            draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 880 + random(24), merge_color(c_black, c_ltgray, 0.12), c_ltgray, 0);
        }
    }
    else if (global.hardmode == 0)
    {
        if (!(global.maskindex == 26 && global.maskon == 1))
        {
            draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, (view_wview[0] * 1.6) + random(0.03 * view_wview[0]), c_black, merge_color(make_colour_rgb(195, 250, 77), make_colour_rgb(250, 132, 77), 0.25 + lengthdir_x(0.25, cdir)), 0);
        }
        draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, (view_wview[0] * 1.6) + random(0.03 * view_wview[0]), c_black, c_ltgray, 0);
    }
    else
    {
        if (!(global.maskindex == 26 && global.maskon == 1))
        {
            draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, (view_wview[0] * 1.4) + random(0.03 * view_wview[0]), merge_color(merge_color(c_orange, c_red, 0.25 + lengthdir_x(0.25, cdir)), merge_color(c_black, c_ltgray, 0.05), 0.85), merge_color(c_orange, c_red, 0.25 + lengthdir_x(0.25, cdir)), 0);
        }
        draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, (view_wview[0] * 1.6) + random(0.03 * view_wview[0]), c_black, make_colour_rgb(150, 180, 45), 0);
        draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, (view_wview[0] * 1.89) + random(0.03 * view_wview[0]), merge_color(c_black, c_ltgray, 0.002), c_ltgray, 0);
    }
}
if (instance_exists(objBackgroundColorClear))
{
    if (global.hardmode == 0)
    {
        draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 890 + random(24), c_black, make_colour_rgb(16, 36, 71), 0);
        draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 840 + random(24), make_colour_rgb(0, 28, 32), merge_color(c_ltgray, make_colour_rgb(0, 32, 47), 0.95), 0);
    }
    else
    {
        draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 520 + random(24), merge_color(make_colour_rgb(77, 250, 167), merge_color(c_black, c_ltgray, 0.05), 0.85), make_colour_rgb(77, 250, 167), 0);
        draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 880 + random(24), merge_color(c_black, c_ltgray, 0.12), c_ltgray, 0);
    }
}
if (global.maskindex == 14 && global.maskon == 1 && !global.god)
{
    draw_set_blend_mode(bm_subtract);
    draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 480 + random(24), merge_color(c_black, merge_color(c_white, c_aqua, 0.6 + lengthdir_x(0.4, cdir * 2.55)), bamount), merge_color(c_black, c_white, bamount), 0);
    draw_set_blend_mode(bm_normal);
    if (bamount < 1)
    {
        bamount += 0.05;
    }
}
if (global.maskindex == 26 && global.maskon == 1)
{
    draw_circle_color(view_wview[0] / 2, view_hview[0] / 2, 890 + random(24), c_black, c_ltgray, 0);
}
draw_set_blend_mode(bm_normal);
cdir += 1;
