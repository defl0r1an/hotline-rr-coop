if (instance_exists(objPlayerHospital) || instance_exists(objPlayerMouse) || instance_exists(objPlayerMouseHouse) || instance_exists(objPlayerShieldMouse))
{
    with (objPlayer)
    {
        if (persistent == true)
        {
            if (global.hardmode == 1)
            {
                d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 180);
            }
            else
            {
                d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
            }
            if (object_index == objPlayerHospital)
            {
                draw_set_blend_mode(bm_add);
                draw_circle_color(x, y, 48 + random(6) + light, make_color_hsv(0, 0, 30 + (light * 2)), c_black, 0);
                draw_set_blend_mode(bm_normal);
                legsprite = 173;
                draw_sprite_ext(legsprite, legindex, x + 1, y + 1, image_xscale, image_yscale, legdir, c_black, 0.5);
                draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale * left, dir, c_black, 0.5);
                draw_sprite_ext(legsprite, legindex, x, y, image_xscale, image_yscale, legdir, image_blend, image_alpha);
                if (sprite_index == sprPWalkHospital || sprite_index == sprPWalkHospitalScalpelBlood)
                {
                    dir = point_direction(x, y, global.mousex, global.mousey);
                }
                draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale * left, dir, image_blend, image_alpha);
                if (reload > 0)
                {
                    reload -= 1;
                }
                if (light > 3)
                {
                    light -= 3;
                }
            }
            else
            {
                x -= view_xview[0];
                y -= view_yview[0];
                if (sprite_index == last_sprite)
                {
                    nothing = 1;
                }
                else
                {
                    scrUpdateMaskPos(sprite_index);
                    last_sprite = sprite_index;
                }
                draw_set_blend_mode(bm_add);
                draw_circle_color(x, y, 48 + random(6) + light, make_color_hsv(0, 0, 30 + (light * 2)), c_black, 0);
                draw_set_blend_mode(bm_normal);
                if (myspeed == 2.25)
                {
                    legsprite = 43;
                }
                else
                {
                    legsprite = 42;
                }
                if (sprite_index == sprPWalkHospital)
                {
                    legsprite = 172;
                }
                if (sprite_index == sprPWalkHospitalScalpelBlood)
                {
                    legsprite = 2946;
                }
                dir = point_direction(x + view_xview[0], y + view_yview[0], global.mousex, global.mousey);
                if (sprite_index == sprPUnlockDoor)
                {
                    dir = 90;
                }
                draw_sprite_ext(legsprite, legindex, x + 1, y + 1, image_xscale, image_yscale, legdir, c_black, 0.5);
                draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale * left, dir, c_black, 0.5);
                draw_sprite_ext(legsprite, legindex, x, y, image_xscale, image_yscale, legdir, image_blend, image_alpha);
                draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale * left, dir, image_blend, image_alpha);
                if (reload > 0)
                {
                    reload -= 1;
                }
                if (light > 3)
                {
                    light -= 3;
                }
                draw_set_blend_mode(bm_add);
                draw_sprite_ext(HotWeapon, image_index, x, y, image_xscale, image_yscale * left, dir, merge_color(c_red, c_orange, 0.5), HotWeaponAlpha);
                draw_sprite_ext(HotWeapon, image_index, x, y, image_xscale, image_yscale * left, dir, merge_color(c_white, c_ltgray, 0.5), HotWeaponAlpha / 7);
                draw_set_blend_mode(bm_normal);
                if (sprite_exists(asset_get_index(sprite_get_name(sprite_index) + "Glow")))
                {
                    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x, y, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(merge_color(merge_color(c_lime, c_green, 0.75), c_lime, 0.5 + lengthdir_x(0.5, global.flicker * 8)), merge_color(merge_color(c_red, c_maroon, 0.75), c_red, 0.5 + lengthdir_x(0.5, global.flicker * 8)), global.GlowSkippy), 1);
                    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x, y, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(c_purple, c_fuchsia, clamp(global.GlowDebuff, 0, 1)), global.GlowDebuff);
                    draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x, y, image_xscale, image_yscale * left, dir + global.PShaking, c_white, global.GlowCharge);
                    draw_set_blend_mode(bm_add);
                    i = 0;
                    repeat (8)
                    {
                        draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x + clamp(lengthdir_x(global.chargeSkippy, global.flickerCharge), 0, 1) + i, y, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(c_black, c_white, global.GlowCharge), 0.35 - (i / 4));
                        draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x - clamp(lengthdir_x(global.chargeSkippy, global.flickerCharge), 0, 1) - i, y, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(c_black, c_white, global.GlowCharge), 0.35 - (i / 4));
                        draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x, y + clamp(lengthdir_x(global.chargeSkippy, global.flickerCharge), 0, 1) + i, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(c_black, c_white, global.GlowCharge), 0.35 - (i / 4));
                        draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index) + "Glow"), image_index, x, y - clamp(lengthdir_x(global.chargeSkippy, global.flickerCharge), 0, 1) - i, image_xscale, image_yscale * left, dir + global.PShaking, merge_color(c_black, c_white, global.GlowCharge), 0.35 - (i / 4));
                        i += 0.5;
                    }
                    draw_set_blend_mode(bm_normal);
                }
                if (sprite_index == sprPWalkThrow)
                {
                    left = 1;
                    draw_sprite_ext(sprThrowWeapons, throwindex, x + lengthdir_x(throwadd[floor(image_index)], dir) + lengthdir_x(8, dir - 90) + 1, y + 1 + lengthdir_y(throwadd[floor(image_index)], dir) + lengthdir_y(8, dir - 90), image_xscale, image_yscale, dir + ((image_index - 3) * 5), c_black, 0.5);
                    draw_sprite_ext(sprThrowWeapons, throwindex, x + lengthdir_x(throwadd[floor(image_index)], dir) + lengthdir_x(8, dir - 90), y + lengthdir_y(throwadd[floor(image_index)], dir) + lengthdir_y(8, dir - 90), image_xscale, image_yscale, dir + lengthdir_x(20, 360 * image_index * 0.125), image_blend, image_alpha);
                }
                if (maskon == 1)
                {
                    scrDrawMask(0);
                }
                draw_set_blend_mode_ext(bm_inv_dest_color, bm_inv_src_color);
                if (global.maskindex == 27 && sprite_get_name(scrGetMaskSkin(global.maskindex, global.selectskin[27], "Mask")) == "sprMasksHard" && global.maskon == 1)
                {
                    draw_circle_color(x + maddx, y + maddy, global.PhotoNegativeCircle, c_white, c_black, 0);
                }
                draw_set_blend_mode(bm_normal);
                x += view_xview[0];
                y += view_yview[0];
            }
        }
    }
}
with (objPlayerBiker)
{
    if (persistent == true)
    {
        if (global.hardmode == 1)
        {
            d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 180);
        }
        else
        {
            d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
        }
        x -= view_xview[0];
        y -= view_yview[0];
        if (myspeed == 2.25)
        {
            legsprite = 257;
        }
        else
        {
            legsprite = 256;
        }
        draw_set_blend_mode(bm_add);
        draw_circle_color(x, y, 48 + random(6) + light, make_color_hsv(0, 0, 30 + (light * 2)), c_black, 0);
        draw_set_blend_mode(bm_normal);
        draw_sprite_ext(legsprite, legindex, x + 1, y + 1, image_xscale, image_yscale, legdir, c_black, 0.5);
        draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale * left, dir, c_black, 0.5);
        draw_sprite_ext(legsprite, legindex, x, y, image_xscale, image_yscale, legdir, image_blend, image_alpha);
        dir = point_direction(x + view_xview[0], y + view_yview[0], global.mousex, global.mousey);
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale * left, dir, image_blend, image_alpha);
        if (reload > 0)
        {
            reload -= 1;
        }
        if (light > 3)
        {
            light -= 3;
        }
        x += view_xview[0];
        y += view_yview[0];
    }
}
with (objPlayerBikerHouse)
{
    if (persistent == true)
    {
        if (global.hardmode == 1)
        {
            d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 180);
        }
        else
        {
            d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
        }
        x -= view_xview[0];
        y -= view_yview[0];
        if (myspeed == 2.25)
        {
            legsprite = 257;
        }
        else
        {
            legsprite = 256;
        }
        draw_set_blend_mode(bm_add);
        draw_circle_color(x, y, 48 + random(6) + light, make_color_hsv(0, 0, 30 + (light * 2)), c_black, 0);
        draw_set_blend_mode(bm_normal);
        draw_sprite_ext(legsprite, legindex, x + 1, y + 1, image_xscale, image_yscale, legdir, c_black, 0.5);
        draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale * left, dir, c_black, 0.5);
        draw_sprite_ext(legsprite, legindex, x, y, image_xscale, image_yscale, legdir, image_blend, image_alpha);
        if (aimon == 1)
        {
            dir = point_direction(x + view_xview[0], y + view_yview[0], global.mousex, global.mousey);
        }
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale * left, dir, image_blend, image_alpha);
        if (reload > 0)
        {
            reload -= 1;
        }
        if (light > 3)
        {
            light -= 3;
        }
        x += view_xview[0];
        y += view_yview[0];
    }
}
with (objPlayerGriffin)
{
    if (persistent == true)
    {
        if (global.hardmode == 1)
        {
            d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 180);
        }
        else
        {
            d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
        }
        x -= view_xview[0];
        y -= view_yview[0];
        if (myspeed == 2.25)
        {
            legsprite = 548;
        }
        else
        {
            legsprite = 548;
        }
        draw_set_blend_mode(bm_add);
        draw_circle_color(x, y, 48 + random(6) + light, make_color_hsv(0, 0, 30 + (light * 2)), c_black, 0);
        draw_set_blend_mode(bm_normal);
        draw_sprite_ext(legsprite, legindex, x + 1, y + 1, image_xscale, image_yscale, legdir, c_black, 0.5);
        draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale * left, dir, c_black, 0.5);
        draw_sprite_ext(legsprite, legindex, x, y, image_xscale, image_yscale, legdir, image_blend, image_alpha);
        dir = point_direction(x + view_xview[0], y + view_yview[0], global.mousex, global.mousey);
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale * left, dir, image_blend, image_alpha);
        if (reload > 0)
        {
            reload -= 1;
        }
        if (light > 3)
        {
            light -= 3;
        }
        x += view_xview[0];
        y += view_yview[0];
    }
}
