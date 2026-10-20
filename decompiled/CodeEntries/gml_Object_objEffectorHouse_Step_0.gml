SteamRunCallbacks();
if (global.loaded == 1)
{
    with (objSurfacer)
    {
        scrSurfaceTiles();
    }
    with (objWeapon)
    {
        if (object_index == objSpecificWeapon)
        {
            nothing = 1;
        }
        else
        {
            instance_create(x, y, objWeapon);
            instance_destroy();
        }
    }
    global.loaded = 0;
    scrSaveTiles();
}
if (global.xbox == 1)
{
    if (checkbutton(0, getid(6)))
    {
        if (pressback == 0)
        {
            pressback = 1;
            scrXboxEffectorHousePause();
        }
    }
    else
    {
        pressback = 0;
    }
}
if (save == 1)
{
    save = 0;
    test = objPlayer.persistent;
    objPlayer.persistent = false;
    global.loaded = 1;
    global.loaded = 0;
    objPlayer.persistent = test;
}
if (global.xbox == 1)
{
    setrumble(0, 0, global.shake * (1/15) * 65535);
}
view_xview[0] += (-global.shake * 0.33) + random(global.shake * 0.66);
view_yview[0] += (-global.shake * 0.33) + random(global.shake * 0.66);
if (global.shakeoption == 1)
{
    global.angleshake = (global.shake / angleswitch) + random_range(global.shake / 8, -global.shake / 8);
    global.zoomwview -= (global.shake / 4);
    global.zoomhview -= (global.shake / 4);
    global.angleshake /= 2;
}
if (global.shake > 0)
{
    global.shake -= 0.5;
}
else
{
    angleswitch = choose(2, -2);
    global.shake = 0;
}
if (instance_exists(objPlayer))
{
    vdist = point_distance(objPlayer.x, objPlayer.y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, objPlayer.x, objPlayer.y);
    view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2) + global.angleshake;
    scrHardMode();
}
if (global.maskindex != 7)
{
    view_wview[0] = global.wview - global.zoomwview;
    view_hview[0] = global.hview - global.zoomhview;
}
if (global.igelcutscenes == -2 && room == rmBar1)
{
    global.zoomwview = global.wview / 3;
    global.zoomhview = global.hview / 3;
    exit;
}
global.zoomwview = lerp(global.zoomwview, 0, 0.15);
global.zoomhview = lerp(global.zoomhview, 0, 0.15);
scrSkippy();
scrIgelEmotions();
