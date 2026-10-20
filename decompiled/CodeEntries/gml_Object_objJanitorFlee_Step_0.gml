if (hspeed > -3)
{
    hspeed -= 0.2;
}
if (wait > 0)
{
    wait -= 1;
    addx = 0;
    viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + addx, y) * 0.1;
    viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + addx, y);
    view_xview[0] += lengthdir_x(viewspeed, viewdir);
    view_yview[0] += lengthdir_y(viewspeed, viewdir);
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
    scrHardMode();
}
else
{
    if (wait > -16)
    {
        wait -= 1;
    }
    else
    {
        instance_destroy();
        objPlayerBikerHouse.active = 1;
    }
    with (objPlayerBikerHouse)
    {
        addx = 0;
        viewspeed = point_distance(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + addx, y) * 0.1;
        viewdir = point_direction(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), x + addx, y);
        view_xview[0] += lengthdir_x(viewspeed, viewdir);
        view_yview[0] += lengthdir_y(viewspeed, viewdir);
        vdist = point_distance(x, y, room_width / 2, room_height / 2);
        vdir = point_direction(room_width / 2, room_height / 2, x, y);
        view_angle[0] = lengthdir_y(vdist * 0.00625, vdir * 2);
        scrHardMode();
    }
}
