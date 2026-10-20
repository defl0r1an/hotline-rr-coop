if (global.xbox == 1)
{
    scrXboxPlayerShieldMove();
    scrXboxPlayerShieldMouse();
}
else if (!mouse_check_button(mb_right))
{
    reset = 0;
}
if (sprite_index == sprShieldSnapUzi || sprite_index == sprShieldSnapMP5 || sprite_index == sprShieldSnapDoubleBarrel || sprite_index == sprShieldSnapSilencer || sprite_index == sprShieldSnapScorpion || sprite_index == sprShieldSnapMagnum || sprite_index == sprPSnapHumanShieldSilencedUzi || sprite_index == sprPShieldSnapAks || sprite_index == sprPShieldSnapNailgun || sprite_index == sprPHumanShieldSnap9mm)
{
    if (image_index >= 3 && snap == 0)
    {
        my_id = instance_create(x, y - 12, objScore);
        my_id.text = "+200pts";
        global.myscore += 200;
        global.killscore += 200;
        global.boldscore += (50 * global.factor);
        global.combotime = 240;
        global.combo += 1;
        global.killx[global.kills] = x;
        global.killy[global.kills] = y;
        global.kills += 1;
        global.blink = 1;
        ds_list_add(global.bonuslist, "Execution");
        if (global.combotime < 12)
        {
            global.combotime = 12;
        }
        snap = 1;
        audio_play_sound(sndNeck, 0, false);
    }
}
global.test = 0;
objEffector.action = global.test;
scrPlayerMoveKeyboard();
if (global.xbox == 1)
{
    aim = checkbutton(0, getid(9));
}
else
{
    aim = keyboard_check(vk_shift);
}
if (global.maskindex != 7)
{
    if (aim)
    {
        if (global.xbox == 1)
        {
            viewx = objPlayer.x + (rightthumb_x(0) * 0.0045);
            viewy = objPlayer.y - (rightthumb_y(0) * 0.003);
        }
        else if (global.hardmode == 1)
        {
            viewx = objPlayer.x - ((((display_mouse_get_x() - (display_get_width() * 0.5)) * view_wview[0]) / display_get_width()) * factor);
            viewy = objPlayer.y - ((((display_mouse_get_y() - (display_get_height() * 0.5)) * view_hview[0]) / display_get_height()) * factor);
        }
        else
        {
            viewx = objPlayer.x + (((display_mouse_get_x() - (display_get_width() * 0.5)) * view_wview[0]) / display_get_width());
            viewy = objPlayer.y + (((display_mouse_get_y() - (display_get_height() * 0.5)) * view_hview[0]) / display_get_height());
        }
        viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), viewx, viewy) * 0.1;
        viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), viewx, viewy);
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        vdist = point_distance(x, y, room_width / 2, room_height / 2);
        vdir = point_direction(room_width / 2, room_height / 2, x, y);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
    }
    else
    {
        vdist = point_distance(x, y, room_width / 2, room_height / 2);
        vdir = point_direction(room_width / 2, room_height / 2, x, y);
        viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
        viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
    }
}
else
{
    vdist = 0;
    vdir = 0;
}
scrHardMode();
xview = view_xview[0];
yview = view_yview[0];
if (persistent == true && objEffector.fade == 1)
{
    if (place_free(x + addx, y))
    {
        x += addx;
    }
    if (place_free(x, y + addy))
    {
        y += addy;
    }
    if (image_speed == 0)
    {
        image_index += 0.15;
    }
    legindex += 0.4;
    exit;
}
if (instance_exists(objLevelComplete) || (!instance_exists(objEnemy) && !instance_exists(objWaiter)))
{
    scrPlayerDropShield();
}
if (global.maskindex == 13 && global.hardmode == 1 && global.done == 0 && instance_exists(objPlayer) && !instance_exists(objVan))
{
    if (global.killscoresave < global.killscore && global.killscored == 0)
    {
        global.killscored = 1;
    }
    if (global.combo == 0 && global.combotime == 0 && global.killscored != 0 && instance_number(objEnemy) > 0)
    {
        if (instance_exists(objClubOwner))
        {
            if (objClubOwner.state < 1)
            {
                instance_destroy();
                instance_create(x, y, objPlayerDead);
                objPlayerDead.sprite_index = sprPJacketHeadBlow;
                objPlayerDead.image_speed = 0.2;
                objPlayerDead.image_angle = dir;
                my_id = instance_create(x + lengthdir_x(2, (dir - 40) + random(80)), y + lengthdir_y(2, (dir - 40) + random(80)), objMaskDrop);
                my_id.image_index = global.maskindex;
                my_id.direction = (dir - 40) + random(80);
                my_id.speed = 1.5 + random(0.5);
            }
        }
        else
        {
            instance_destroy();
            instance_create(x, y, objPlayerDead);
            objPlayerDead.sprite_index = sprPJacketHeadBlow;
            objPlayerDead.image_speed = 0.2;
            objPlayerDead.image_angle = dir;
            my_id = instance_create(x + lengthdir_x(2, (dir - 40) + random(80)), y + lengthdir_y(2, (dir - 40) + random(80)), objMaskDrop);
            my_id.image_index = global.maskindex;
            my_id.direction = (dir - 40) + random(80);
            my_id.speed = 1.5 + random(0.5);
        }
    }
}
