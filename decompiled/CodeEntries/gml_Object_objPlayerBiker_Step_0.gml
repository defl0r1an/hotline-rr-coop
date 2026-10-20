global.maskindex = 0;
global.maskon = 0;
if (place_meeting(x, y, objBloodPool))
{
    bloodsled = 1;
}
if (myxspeed != 0 || myyspeed != 0)
{
    if (bloodstep > 0)
    {
        bloodstep -= 1;
    }
    else if (bloodsled > 0)
    {
        my_id = instance_create(x, y, objLegSled);
        my_id.image_speed = 0;
        my_id.sprite_index = sprLegSleds;
        if (bloodscale == 1)
        {
            my_id.image_index = 0;
        }
        else
        {
            my_id.image_index = 1;
        }
        my_id.image_angle = legdir;
        my_id.image_alpha = bloodsled;
        bloodsled -= random_range(0.05, 0.1);
        bloodstep = 10;
        bloodscale = -bloodscale;
    }
}
if (global.xbox == 1)
{
    scrXboxBikerMouse();
}
if (room == rmTrainstationDownstairs || room == rmPoliceHQFloor3 || instance_exists(objVan))
{
    clear = 1;
}
if ((instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objECrawl) + instance_number(objMiscEnemy) + instance_number(objBoss)) == 0)
{
    test = 1;
    if (test == 1)
    {
        if (clear == 0 && global.done == 0)
        {
            clear = 1;
            my_id = instance_create(x, y, objCheckpoint);
            my_id.text = "STAGE CLEAR";
        }
    }
}
else
{
    clear = 0;
}
global.test = 0;
with (objWeapon)
{
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 32)
    {
        global.test = 2;
    }
}
if (place_meeting(x, y, objKnockedOut))
{
    global.test = 1;
}
objEffector.action = global.test;
if (global.xbox == 0)
{
    aimfar = keyboard_check_direct(vk_shift);
}
else
{
    aimfar = checkbutton(0, getid(9));
}
if (global.ShiftLook == 1)
{
    aimfar = 1;
}
factor = 1;
if (aimfar)
{
    if (global.xbox == 1)
    {
        viewx = objPlayer.x + (rightthumb_x(0) * 0.0045);
        viewy = objPlayer.y - (rightthumb_y(0) * 0.003);
    }
    else if (global.hardmode == 0)
    {
        viewx = objPlayer.x + ((((display_mouse_get_x() - (display_get_width() * 0.5)) * view_wview[0]) / display_get_width()) * factor);
        viewy = objPlayer.y + ((((display_mouse_get_y() - (display_get_height() * 0.5)) * view_hview[0]) / display_get_height()) * factor);
    }
    else
    {
        viewx = objPlayer.x - ((((display_mouse_get_x() - (display_get_width() * 0.5)) * view_wview[0]) / display_get_width()) * factor);
        viewy = objPlayer.y - ((((display_mouse_get_y() - (display_get_height() * 0.5)) * view_hview[0]) / display_get_height()) * factor);
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
    viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(24, dir), y + lengthdir_y(24, dir)) * 0.1;
    viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + lengthdir_x(24, dir), y + lengthdir_y(24, dir));
    view_xview[0] += lengthdir_x(viewspeed, viewdir);
    view_yview[0] += lengthdir_y(viewspeed, viewdir);
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
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
if (global.impact == 1)
{
    impact = lerp(impact, 0, 0.25);
    impx = lengthdir_x(impside, dir) + x;
    impy = lengthdir_y(impside, dir) + y;
    if (place_meeting(impx, impy, objShootThrough) || place_meeting(impx, impy, objElevator) || place_meeting(impx, impy, objTeleporter) || place_meeting(impx, impy, objElevator) || place_meeting(impx, impy, objTransitioner) || place_meeting(impx, impy, objCorner) || place_meeting(impx, impy, objSolid) || place_meeting(impx, impy, objFurniture) || (place_meeting(impx, impy, objHorBarrier) && objHorBarrier.solid == 1) || (place_meeting(impx, impy, objVertBarrier) && objVertBarrier.solid == 1) || place_meeting(impx, impy, objShootThrough) || place_meeting(x, y, objEffector) || place_meeting(impx, impy, objGlassPanelVBroken) || place_meeting(impx, impy, objGlassPanelHBroken))
    {
        impx = x;
        impy = y;
        impact = 0;
    }
    move_towards_point(impx, impy, impact);
}
scrPlayerMoveKeyboard();
scrPlayerIsAttacking();
