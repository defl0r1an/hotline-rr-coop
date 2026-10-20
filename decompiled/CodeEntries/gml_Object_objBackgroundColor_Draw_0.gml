if (global.hardmode == 0)
{
    bgcolor = merge_color(merge_color(c_fuchsia, c_aqua, 0.5 + lengthdir_x(0.5, cdir)), c_black, 0.3);
    color = merge_color(c_fuchsia, c_aqua, 0.5 + lengthdir_x(0.5, cdir));
    if (room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3 || room == rmSequence13 || room == rmSequence13Downstairs || instance_exists(objNight))
    {
        bgcolor = merge_color(merge_color(c_fuchsia, c_aqua, 0.5 + lengthdir_x(0.5, cdir)), c_black, 0.8);
        color = merge_color(c_fuchsia, c_aqua, 0.5 + lengthdir_x(0.5, cdir));
    }
}
else
{
    bgcolor = merge_color(merge_color(c_blue, c_aqua, 0.5 + lengthdir_x(0.5, cdir)), c_black, 0.3);
    color = merge_color(c_blue, c_aqua, 0.5 + lengthdir_x(0.5, cdir));
    if (room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3 || room == rmSequence13 || room == rmSequence13Downstairs || instance_exists(objNight))
    {
        bgcolor = merge_color(merge_color(c_blue, c_aqua, 0.5 + lengthdir_x(0.5, cdir)), c_black, 0.8);
        color = merge_color(c_blue, c_aqua, 0.5 + lengthdir_x(0.5, cdir));
    }
}
if (global.maskindex == 26 && global.maskon == 1)
{
    bgcolor = merge_color(merge_color(c_red, c_maroon, 0.5 + lengthdir_x(0.5, cdir)), c_black, 0.3);
    color = merge_color(bgcolor, c_black, 0.5 + lengthdir_x(0.5, cdir));
}
if (instance_exists(objPlayerBiker) || instance_exists(objPlayerBikerHouse) || instance_exists(objMCStompKill) || instance_exists(objBikerTakePigMask) || instance_exists(objMCChopKill) || instance_exists(objBikerKillFat) || instance_exists(objMCKnifeKill) || instance_exists(objMCBartender) || instance_exists(objBartenderDeath) || instance_exists(objPlayerBikerHack) || instance_exists(objBikerSushi) || instance_exists(objBikerClimbDown) || instance_exists(objBikerClimbUp) || instance_exists(objBikerKillJonatan) || instance_exists(objBikerKnocked) || instance_exists(objPlayerBikerKick) || instance_exists(objBikerHeadKick) || (instance_exists(objMCBike) && (objMCBike.sprite_index == sprMCGetOnBike || objMCBike.sprite_index == sprBikerGetOnBikeWounded || objMCBike.sprite_index == sprBikerGetOnBikeUnmasked)) || (instance_exists(objPlayerDead) && (objPlayerDead.sprite_index == sprMCBackBlunt || objPlayerDead.sprite_index == sprMCFrontBlunt || objPlayerDead.sprite_index == sprMCBackCut || objPlayerDead.sprite_index == sprMCFrontMachinegun || objPlayerDead.sprite_index == sprMCBackMachinegun || objPlayerDead.sprite_index == sprMCFrontShotgun || objPlayerDead.sprite_index == sprMCBackShotgun || objPlayerDead.sprite_index == sprMCDeadDog)))
{
    if (global.hardmode == 0)
    {
        bgcolor = merge_color(merge_color(merge_color(c_red, c_fuchsia, 0.5), merge_color(c_maroon, c_purple, 0.5), 0.5 + lengthdir_x(0.5, cdir)), c_black, 0.3);
        color = merge_color(merge_color(c_red, c_fuchsia, 0.5), merge_color(c_maroon, c_purple, 0.5), 0.5 + lengthdir_x(0.5, cdir));
    }
    else
    {
        bgcolor = merge_color(merge_color(merge_color(merge_color(c_red, c_fuchsia, 0.5), merge_color(c_maroon, c_purple, 0.5), 0.5 + lengthdir_x(0.5, cdir)), c_blue, 0.3), c_black, 0.3);
        color = merge_color(merge_color(merge_color(c_red, c_fuchsia, 0.5), merge_color(c_maroon, c_purple, 0.5), 0.5 + lengthdir_x(0.5, cdir)), c_blue, 0.3);
    }
}
draw_rectangle_color(view_xview[0] - 60, view_yview[0] - 60, view_xview[0] + view_wview[0] + 60, view_yview[0] + view_hview[0] + 60, bgcolor, bgcolor, c_black, c_black, 0);
texture_set_interpolation(true);
draw_set_blend_mode(bm_add);
if (surface_exists(surf1))
{
    draw_surface_ext(surf1, view_xview[0] - 60, view_yview[0] - 60, 3, 3, 0, merge_color(merge_color(color, c_black, (0.95 - random(global.blink * 0.35)) + lengthdir_x(0.05, cdir * 0.5)), c_red, random(global.blink)), 1);
}
texture_set_interpolation(false);
draw_set_blend_mode(bm_normal);
cdir += 1;
if (global.blink > 0)
{
    global.blink -= 0.02;
}
if (global.comboflash > 0)
{
    global.comboflash -= 0.02;
    draw_set_blend_mode(bm_add);
    color1 = merge_color(c_yellow, c_black, 0.6 - random(global.comboflash) - lengthdir_x(0.02, cdir * 0.5));
    color2 = merge_color(c_orange, c_black, 0.6 - random(global.comboflash) - lengthdir_x(0.02, cdir * 0.5));
    if (room == rmSequence13 || room == rmSequence13Downstairs || room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3 || room == rmPoliceHQFloor3TigerHard)
    {
        draw_set_alpha(random(global.comboflash - 0.5));
    }
    else
    {
        draw_set_alpha(random(global.comboflash));
    }
    draw_rectangle_color(view_xview[0] - 60, view_yview[0] - 60, view_xview[0] + view_wview[0] + 60, view_yview[0] + view_hview[0] + 60, color1, color1, color2, color2, 0);
    draw_set_alpha(1);
    draw_set_blend_mode(bm_normal);
}
if (room == rmSequence13 || room == rmSequence13Downstairs || room == rmPoliceHQFloor1 || room == rmPoliceHQFloor2 || room == rmPoliceHQFloor3 || room == rmPoliceHQFloor3TigerHard)
{
    color1 = merge_color(c_white, c_black, 0.6 - floor(random(1)) - lengthdir_x(0.02, cdir * 0.5));
    color2 = merge_color(c_white, c_black, 0.6 - floor(random(1)) - lengthdir_x(0.02, cdir * 0.5));
    if ((random(5000) <= 5 || scaleable == 1) && hitted <= 0)
    {
        audio_play_sound(choose(sndLighting1, sndLighting2, sndLighting3), 1, false);
        draw_set_blend_mode(bm_add);
        draw_set_alpha(1);
        draw_rectangle_color(view_xview[0] - 60, view_yview[0] - 60, view_xview[0] + view_wview[0] + 60, view_yview[0] + view_hview[0] + 60, choose(color1, color2), choose(color1, color2), choose(color1, color2), choose(color1, color2), 0);
        draw_set_blend_mode(bm_normal);
        scaleable = 0;
        hitted = 1;
    }
    if (hitted > 0)
    {
        hitted -= 0.1;
        draw_set_alpha(hitted);
        draw_rectangle_color(view_xview[0] - 60, view_yview[0] - 60, view_xview[0] + view_wview[0] + 60, view_yview[0] + view_hview[0] + 60, choose(color1, color2), choose(color1, color2), choose(color1, color2), choose(color1, color2), 0);
        draw_set_alpha(1);
    }
}
draw_set_blend_mode(bm_subtract);
draw_rectangle_colour(view_xview[0] - 60, view_yview[0] - 60, view_xview[0] + view_wview[0] + 60, view_yview[0] + view_hview[0] + 60, merge_color(c_black, c_white, clamp(lengthdir_x(global.chargeSkippy, (global.flickerCharge / 2) - 100), 0, 1)), merge_color(c_black, c_white, clamp(lengthdir_x(global.chargeSkippy, (global.flickerCharge / 2) - 200), 0, 1)), merge_color(c_black, c_white, clamp(lengthdir_x(global.chargeSkippy, (global.flickerCharge / 2) - 300), 0, 1)), merge_color(c_black, c_white, clamp(lengthdir_x(global.chargeSkippy, (global.flickerCharge / 2) - 400), 0, 1)), 0);
draw_set_blend_mode(bm_normal);
