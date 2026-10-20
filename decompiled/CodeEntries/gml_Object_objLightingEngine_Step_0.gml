surface_set_target(global.surf1);
draw_clear(make_color_hsv(155, 5 - random(5), 250 + random(5)));
draw_set_blend_mode(bm_subtract);
with (objLight)
{
    draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, radius * (1 + random(0.1)), merge_color(c_black, color, strength * (0.9 + random(0.1))), c_black, 0);
}
with (objPlayer)
{
    draw_circle_color((x - view_xview[0]) + 16, (y - view_yview[0]) + 16, 32 + random(4), c_gray, c_black, 0);
}
draw_set_blend_mode(bm_add);
i = 0;
repeat (29)
{
    draw_circle_color(global.myx[i], global.myy[i], size[i] + random(0.5), c_white, c_black, 0);
    global.myx[i] += lengthdir_x(myspeed[i], mydir[i]);
    global.myy[i] += lengthdir_y(myspeed[i], mydir[i]);
    mydir[i] += diradd[i];
    if (round(random(30)) == 2)
    {
        diradd[i] = -4 + random(8);
    }
    if (global.myx[i] < -16)
    {
        global.myx[i] += 432;
    }
    if (global.myy[i] < -16)
    {
        global.myy[i] += 288;
    }
    if (global.myy[i] > 272)
    {
        global.myy[i] -= 288;
    }
    if (global.myx[i] > 416)
    {
        global.myx[i] -= 432;
    }
    i += 1;
}
draw_set_blend_mode(bm_normal);
surface_reset_target();
if (!on)
{
    exit;
}
if (room == rmDream1 || room == rmDream2 || room == rmDream3)
{
    if (objPlayer.y < 148)
    {
        objPlayer.active = 0;
        if (global.igelcutscenes == -2)
        {
            if (!instance_exists(objPlayerCarTroll))
            {
                my_id = instance_create(256, -120, objPlayerCarTroll);
                my_id.image_angle = -90;
                my_id.stage = "MegaTroll";
                my_id.depth = -13;
            }
            exit;
        }
        if (!instance_exists(objPhoneConversation))
        {
            if (reload > 0)
            {
                reload -= 1;
            }
            else
            {
                reload = 20;
                if (talk < talks)
                {
                    scrGetMessage(talk);
                    talk += 1;
                }
                else
                {
                    if (room == rmDream1)
                    {
                        objEffector.nextroom = 44;
                    }
                    if (room == rmDream2)
                    {
                        objEffector.nextroom = 52;
                    }
                    if (room == rmDream3)
                    {
                        objEffector.nextroom = 73;
                    }
                    objEffector.next = 1;
                    objEffector.fade = 1;
                    objEffector.newsong = 1;
                    objEffector.song = global.DeepCover;
                }
            }
        }
    }
}
