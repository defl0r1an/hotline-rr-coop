if (spawned == 1)
{
    exit;
}
visible = false;
if (x < (room_width / 2))
{
    visible = global.done;
    if (visible && spawned == 0)
    {
        spawned = 1;
        global.done = 0;
        with (objSubwayDoor)
        {
            visible = true;
            alarm[0] = 90;
        }
        alarm[0] = 40;
        with (objDeadBody)
        {
            deadlined = 1;
        }
        with (objBloodPool)
        {
            train = 1;
        }
        with (objPlayer)
        {
            vdist = point_distance(x, y, room_width / 2, room_height / 2);
            vdir = point_direction(room_width / 2, room_height / 2, x, y);
            view_xview[0] = (x + lengthdir_x(vdist * 0.2, vdir - 180)) - (view_wview[0] * 0.5);
            view_yview[0] = (y + lengthdir_y(vdist * 0.2, vdir - 180)) - (view_hview[0] * 0.5);
            view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        }
        scrSetRasmusEvent(choose("Another one?", "Enough already"), 8, 75);
        test = objPlayer.persistent;
        objPlayer.persistent = false;
        global.loaded = 1;
        global.loaded = 0;
        global.opensound = 0;
        objPlayer.persistent = test;
    }
}
